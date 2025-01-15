<template>
    <div>
        <div ref="mapContainer" class="map"></div>
    </div>
</template>

<script setup>
import { ref, onMounted, watch, defineProps } from "vue";
import { Loader } from "@googlemaps/js-api-loader";
import { MarkerClusterer } from "@googlemaps/markerclusterer";

const mapContainer = ref(null);
const map = ref(null);
const markers = [];
let markerClusterer = null; // Track the MarkerClusterer instance
let currentInfoWindow = null; // Variable to track the current InfoWindow

// Define props to accept homes from the parent component
const props = defineProps({
    homes: {
        type: Array,
        required: true,
    },
});

onMounted(async () => {
    const loader = new Loader({
        apiKey: "AIzaSyCsAFTWVWD88hq9sOtqnYT2pNOTnAJW1R0",
    });

    await loader.load();
    initializeMap();
    addMarkers(); // Add markers for the initial homes data
});

// Function to initialize the map
function initializeMap() {
    map.value = new google.maps.Map(mapContainer.value, {
        center: { lat: 36.1699, lng: -115.1398 },
        zoom: 11,
        mapTypeId: "roadmap",
        mapTypeControl: true,
        zoomControl: true,
        streetViewControl: true,
    });

    // Handle zoom change for satellite view
    map.value.addListener("zoom_changed", () => {
        const zoomLevel = map.value.getZoom();
        map.value.setMapTypeId(zoomLevel > 15 ? "satellite" : "roadmap");

        // Close the InfoWindow if the map is clicked
        map.value.addListener("click", () => {
            if (currentInfoWindow) {
                currentInfoWindow.close();
                currentInfoWindow = null; // Reset the current InfoWindow
            }
        });
    });
}

// Function to add markers to the map based on homes data

function addMarkers() {
    // Clear previous markers and clusters
    markers.forEach((marker) => marker.setMap(null));
    markers.length = 0; // Clear the markers array
    // Check if the markerClusterer exists before attempting to clear it
    if (markerClusterer) {
        markerClusterer.clearMarkers(); // Clear markers from the clusterer
    }

    // Ensure homes prop is an array and contains valid home data
    if (Array.isArray(props.homes) && props.homes.length > 0) {
        props.homes.forEach((home) => {
            // Validate home properties
            if (home.latitude && home.longitude) {
                const marker = new google.maps.Marker({
                    position: {
                        lat: parseFloat(home.latitude),
                        lng: parseFloat(home.longitude),
                    },
                    map: map.value,
                    label: {
                        text: `$${(parseFloat(home.price) / 1000).toFixed(0)}K`,
                        className: "price-tag",
                    },
                });

                const infoWindowContent = `
    <a href="/home-details/${home.property_id}" style="text-decoration: none; color: inherit;">
        <div style="width:150px; cursor: pointer;">
            <img src="${home.main_image ? home.main_image : '/images/default-home-image.png'}" 
                 alt="Image" 
                 style="width:100%; height:auto; border-radius:6px;">
            <p style="margin-top:10px; font-weight:bold;">
                <strong>${home.title || ''}</strong><br>
                ${home.price ? `<b>$${parseFloat(home.price).toLocaleString()}</b><br>` : ''}
                ${home.bedrooms ? `${home.bedrooms} bds | ` : ''}
                ${home.square_feet ? `${parseFloat(home.square_feet).toLocaleString()} sqft<br>` : ''}
                ${home.property_type || ''}
            </p>
        </div>
    </a>
`;


                const infoWindow = new google.maps.InfoWindow({
                    content: infoWindowContent,
                });

                // Listen for clicks on the marker to open the info window
                marker.addListener("click", () => {
                    if (currentInfoWindow) {
                        currentInfoWindow.close();
                    }

                    infoWindow.open(map.value, marker);
                    currentInfoWindow = infoWindow; // Set the current InfoWindow to the newly opened one
                });

                markers.push(marker); // Store marker in markers array
            } else {
                console.error("Invalid home data:", home); // Log invalid home data
            }
        });

        // Initialize clustering for markers only if there are valid markers
        if (markers.length > 0) {
            // Clear the previous clusterer if it exists
            if (markerClusterer) {
                markerClusterer.clearMarkers(); // Clear previous markers from the clusterer
            }
            markerClusterer = new MarkerClusterer({ markers, map: map.value });
        }
    } else {
        console.warn("No homes available for clustering.");
    }
}

// Watch for changes to the homes prop and update markers accordingly
watch(
    () => props.homes,
    (newHomes) => {
        addMarkers(); // Call function to add markers when homes data changes
    }
);
</script>

<style>
.map {
    width: 100%;
    height: 550px;
}

.price-tag {
    background-color: #ea4335 !important;
    color: white !important;
    padding: 2px 6px;
    border-radius: 8px;
    font-weight: bold;
    font-size: 10px !important;
}

.price-tag {
    background-color: #ea4335 !important;
    color: white;

    font-weight: bold;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    padding: 2px;
    cursor: pointer;
    transition: transform 0.3s ease, background-color 0.3s ease,
        box-shadow 0.3s ease;
    white-space: nowrap;
    position: relative;
}

.price-tag::after {
    content: "";
    position: absolute;
    bottom: -6px;
    left: 50%;
    transform: translateX(-50%);
    width: 0;
    height: 0;
    border-left: 6px solid transparent;
    border-right: 6px solid transparent;
    border-top: 6px solid #ea4335;
    transition: border-top-color 0.3s ease;
}
</style>
