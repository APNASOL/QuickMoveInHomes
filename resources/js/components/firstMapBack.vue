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
import { shallowRef, onMounted, onUnmounted, markRaw } from "vue";
import "@maptiler/sdk/dist/maptiler-sdk.css";

const props = defineProps(["homes"]); // Assuming homes is a reactive prop
const mapContainer = shallowRef(null);
const map = shallowRef(null);
const clusterIndex = shallowRef(null); // Supercluster instance

const homeIconUrl = "https://uxwing.com/wp-content/themes/uxwing/download/location-travel-map/home-map-location-icon.png"; // Home icon URL

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

    // Load homes data into Supercluster
    const points = props.homes.map((home) => ({
        type: "Feature",
        properties: { home },
        geometry: {
            type: "Point",
            coordinates: [home.longitude, home.latitude],
        },
    }));
    clusterIndex.value.load(points);

    // Function to render clusters and markers
    function renderClusters() {
        const bounds = map.value.getBounds().toArray().flat();
        const zoom = map.value.getZoom();
        const clusters = clusterIndex.value.getClusters(bounds, Math.floor(zoom));

        // Clear existing markers
        map.value.clearMarkers();

        clusters.forEach((cluster) => {
            const [longitude, latitude] = cluster.geometry.coordinates;
            const { cluster: isCluster, point_count: pointCount } = cluster.properties;

            if (isCluster) {
                // Create a cluster marker
                const clusterMarker = new Marker()
                    .setLngLat([longitude, latitude])
                    .setPopup(new Popup().setHTML(`<div>${pointCount} homes</div>`))
                    .addTo(map.value);

                // Zoom in on cluster click
                clusterMarker.getElement().addEventListener("click", () => {
                    map.value.zoomIn({ around: [longitude, latitude] });
                });
            } else {
                // Individual home marker
                const { home } = cluster.properties;
                const popup = new Popup({ offset: 25 }).setHTML(`
                    <div>
                        <p><strong>${home.title}</strong></p>
                        <p>Price: ${home.price}</p>
                        <p>Bedrooms: ${home.bedrooms}</p>
                        <img src="${home.home_data.main_image ? home.home_data.main_image : '/images/default-home-image.png'}" style="width:100%; height:auto;">
                    </div>
                `);

                const iconElement = document.createElement("img");
                iconElement.src = homeIconUrl;
                iconElement.style.width = "30px";
                iconElement.style.height = "30px";

                const marker = new Marker({ element: iconElement })
                    .setLngLat([longitude, latitude])
                    .setPopup(popup)
                    .addTo(map.value);

                // Show popup on hover
                iconElement.addEventListener("mouseenter", () => {
                    popup.setLngLat([longitude, latitude]).addTo(map.value);
                });

                // Hide popup on mouse leave
                iconElement.addEventListener("mouseleave", () => {
                    popup.remove();
                });

                // Navigate to home details on click
                iconElement.addEventListener("click", () => {
                    window.location.href = `home-details/${home.property_id}`;
                });
            }
        });
    }

    // Initial render and update clusters on map move
    renderClusters();
    map.value.on("move", renderClusters);
});

onUnmounted(() => {
    map.value?.remove();
});
</script>

<style scoped>
.map-wrap {
    position: relative; 
    width: 100%;
    height: 500px; /* Set a fixed height for the map */
}

.map {
    position: absolute;
    width: 100%;
    height: 100%;
}

.maplibregl-ctrl {
    display: none !important; /* Hide MapTiler controls */
}
</style>
