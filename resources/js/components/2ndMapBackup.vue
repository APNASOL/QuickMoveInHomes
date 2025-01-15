<template>
    <div>
        <div class="map-wrap">
            <div class="map" ref="mapContainer"></div>
        </div>
    </div>
</template>

<script setup>
import { Map, MapStyle, Marker, Popup, config } from "@maptiler/sdk";
import Supercluster from "supercluster";
import { shallowRef, onMounted, onUnmounted, markRaw, watch } from "vue";
import "@maptiler/sdk/dist/maptiler-sdk.css";

const props = defineProps(["homes"]); // Assuming homes is a reactive prop
const mapContainer = shallowRef(null);
const map = shallowRef(null);
const clusterIndex = shallowRef(null); // Supercluster instance
const markers = shallowRef([]); // Store markers to remove them on map update

onMounted(() => {
    config.apiKey = "Iajv8O5hYgd3gLoFZqAY"; // Replace with your MapTiler API key
    const initialState = { lng: -115.1728, lat: 36.1147, zoom: 16 }; // Example coordinates (Las Vegas)

    // Initialize the map
    map.value = markRaw(
        new Map({
            container: mapContainer.value,
            style: MapStyle.STREETS,
            center: [initialState.lng, initialState.lat],
            zoom: initialState.zoom,
        })
    );

    // Initialize Supercluster
    clusterIndex.value = new Supercluster({
        radius: 50,
        maxZoom: 16,
    });

    // Watch for homes prop and load into Supercluster
    watch(
        () => props.homes,
        (homes) => {
            if (homes && homes.length) {
                const points = homes.map((home) => ({
                    type: "Feature",
                    properties: { home },
                    geometry: {
                        type: "Point",
                        coordinates: [home.longitude, home.latitude],
                    },
                }));
                clusterIndex.value.load(points); // Load points into Supercluster
                renderClusters(); // Render clusters initially
            }
        },
        { immediate: true }
    );

    // Function to clear markers
    function clearMarkers() {
        markers.value.forEach((marker) => marker.remove());
        markers.value = [];
    }
// Function to format the price
function formatPrice(price) {
    if (price >= 1000000) {
        return (price / 1000000).toFixed(1).replace(/\.0$/, "") + "M";
    } else if (price >= 1000) {
        return (price / 1000).toFixed(1).replace(/\.0$/, "") + "K";
    }
    return price.toString(); // For prices less than 1000, show as is
}

    // Function to render clusters and markers
    function renderClusters() {
    clearMarkers(); // Clear existing markers

    const bounds = map.value.getBounds().toArray().flat();
    const zoom = map.value.getZoom();
    const clusters = clusterIndex.value.getClusters(
        bounds,
        Math.floor(zoom)
    );

    clusters.forEach((cluster) => {
        const [longitude, latitude] = cluster.geometry.coordinates;
        const { cluster: isCluster, point_count: pointCount } =
            cluster.properties;

        if (isCluster) {
            // Create a cluster marker with the count of homes
            const clusterElement = document.createElement("div");
            clusterElement.className = "cluster-marker";
            clusterElement.innerText = `${pointCount}`; // Display the number of homes

            const clusterMarker = new Marker({ element: clusterElement })
                .setLngLat([longitude, latitude])
                .addTo(map.value);

            markers.value.push(clusterMarker);

            // Zoom in on cluster click
            clusterElement.addEventListener("click", () => {
                map.value.zoomTo(map.value.getZoom() + 2, {
                    around: [longitude, latitude],
                });
            });
        } else {
            // Individual home marker displaying price in a tag
            const { home } = cluster.properties;
            const popup = new Popup({ offset: 25 }).setHTML(`
                <div>
                    <p><strong>${home.title}</strong></p>
                    <p>Price: ${home.price}</p>
                    <p>Bedrooms: ${home.bedrooms}</p>
                    <img src="${
                        home.home_data.main_image
                            ? home.home_data.main_image
                            : "/images/default-home-image.png"
                    }" style="width:100%; height:auto;">
                </div>
            `);

            const priceTag = document.createElement("div");
            priceTag.className = "price-tag";
            priceTag.innerText = `$${formatPrice(home.price)}`; // Use formatted price

            const marker = new Marker({ element: priceTag })
                .setLngLat([longitude, latitude])
                .setPopup(popup)
                .addTo(map.value);

            markers.value.push(marker);

            // Show popup on hover
            priceTag.addEventListener("mouseenter", () => {
                popup.setLngLat([longitude, latitude]).addTo(map.value);
            });

            // Hide popup on mouse leave
            priceTag.addEventListener("mouseleave", () => {
                popup.remove();
            });

            // Navigate to home details on click
            priceTag.addEventListener("click", () => {
                window.location.href = `home-details/${home.property_id}`;
            });
        }
    });
}


    // Update clusters on map move and zoom
    map.value.on("move", renderClusters);
    map.value.on("zoom", renderClusters);
});

onUnmounted(() => {
    map.value?.remove();
});
</script>

<style>
.map-wrap {
    position: relative;
    width: 100%;
    height: 500px;
}

.map {
    position: absolute;
    width: 100%;
    height: 100%;
}

/* Style for the cluster marker */
.cluster-marker {
    background-color: #002855 !important; /* Ensure color applies */
    color: white;
    border-radius: 50px;
    text-align: center;
    width: 20px;

    cursor: pointer;
}
.cluster-marker:hover{
    background-color:orange !important;
}

/* Style for the price tag marker */
 



.maplibregl-ctrl {
    display: none !important; /* Hide MapTiler controls */
}
/* Style for the price tag marker */
.price-tag {
    background-color: #002855 !important;
    color: white;
    border-radius: 12px; /* Rounded edges */
    padding: 4px 8px;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    font-size: 12px;
    cursor: pointer;
    transition: transform 0.3s ease, background-color 0.3s ease, box-shadow 0.3s ease;
    white-space: nowrap;
    position: relative; /* Needed for the nib */
}

/* Triangle nib pointing to the location */
.price-tag::after {
    content: "";
    position: absolute;
    bottom: -6px; /* Position the nib under the tag */
    left: 50%;
    transform: translateX(-50%);
    width: 0;
    height: 0;
    border-left: 6px solid transparent;
    border-right: 6px solid transparent;
    border-top: 6px solid #002855; /* Same color as tag */
    transition: border-top-color 0.3s ease;
}

/* Hover effect with bounce and color change */
.price-tag:hover {
    transform: scale(1.1) translateY(-3px); /* Scale and slightly lift the tag */
    background-color: orange !important;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3); /* Add shadow for bounce effect */
}

.price-tag:hover::after {
    border-top-color: orange; /* Change nib color on hover */
}


/* Style for the rectangular popup image outline */
.map-popup img {
    width: 100%;
    height: auto;
    border: 2px solid #002855;
    border-radius: 6px;
    box-sizing: border-box;
}

</style>
