<template>
    <div>
        <div class="map-wrap">
            <div class="map" ref="mapContainer"></div>
            <button @click="toggleMapStyle" class="satellite-toggle">
                {{
                    isSatellite
                        ? "Switch to Street View"
                        : "Switch to Satellite View"
                }}
            </button>
        </div>
    </div>
</template>

<script setup>
import {
    Map,
    MapStyle,
    Marker,
    Popup,
    NavigationControl,
    ScaleControl,
    config,
} from "@maptiler/sdk";
import Supercluster from "supercluster";
import { shallowRef, onMounted, onUnmounted, markRaw, watch, ref } from "vue";
import "@maptiler/sdk/dist/maptiler-sdk.css";

const props = defineProps(["homes"]);
const mapContainer = shallowRef(null);
const map = shallowRef(null);
const clusterIndex = shallowRef(null);
const markers = shallowRef([]);
const isSatellite = ref(false);
const satelliteThreshold = 16; // Zoom level to automatically switch to satellite view

onMounted(() => {
    config.apiKey = "Iajv8O5hYgd3gLoFZqAY"; // Replace with your MapTiler API key
    const initialState = { lng: -115.1728, lat: 36.1147, zoom: 14 };

    map.value = markRaw(
        new Map({
            container: mapContainer.value,
            style: MapStyle.STREETS,
            center: [initialState.lng, initialState.lat],
            zoom: initialState.zoom,
        })
    );

    map.value.addControl(new ScaleControl(), "bottom-left");

    clusterIndex.value = new Supercluster({
        radius: 50,
        maxZoom: 16,
    });

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
                clusterIndex.value.load(points);
                renderClusters();
            }
        },
        { immediate: true }
    );

    function clearMarkers() {
        markers.value.forEach((marker) => marker.remove());
        markers.value = [];
    }

    function formatPrice(price) {
        if (price >= 1000000) {
            return (price / 1000000).toFixed(1).replace(/\.0$/, "") + "M";
        } else if (price >= 1000) {
            return (price / 1000).toFixed(1).replace(/\.0$/, "") + "K";
        }
        return price.toString();
    }

    function renderClusters() {
        clearMarkers();

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
                const clusterElement = document.createElement("div");
                clusterElement.className = "cluster-marker";
                clusterElement.innerText = `${pointCount}`;

                const clusterMarker = new Marker({ element: clusterElement })
                    .setLngLat([longitude, latitude])
                    .addTo(map.value);

                markers.value.push(clusterMarker);

                clusterElement.addEventListener("click", () => {
                    map.value.zoomTo(map.value.getZoom() + 1, {
                        around: [longitude, latitude],
                    });
                });
            } else {
                const { home } = cluster.properties;
                const popup = new Popup({ offset: 25 }).setHTML(`
                    <div>
                        <p>
                                                    <b>${home.title}</b
                                                    ><br />
                                                    <b>$${formatPrice(
                                                        home.price
                                                    )}</b
                                                    ><br />
                                                    <b>${home.bedrooms}</b>
                                                    bds |
                                                    <b>${home.square_feet}</b>
                                                    sqft<br />
                                                    ${home.property_type}
                                                </p>
                         
                        <img src="${
                            home.home_data.main_image
                                ? home.home_data.main_image
                                : "/images/default.jpg"
                        }" style="width:100%; height:auto;">
                    </div>
                `);

                const priceTag = document.createElement("div");
                priceTag.className = "price-tag";
                priceTag.innerText = `$${formatPrice(home.price)}`;

                const marker = new Marker({ element: priceTag })
                    .setLngLat([longitude, latitude])
                    .setPopup(popup)
                    .addTo(map.value);

                markers.value.push(marker);

                priceTag.addEventListener("mouseenter", () => {
                    popup.setLngLat([longitude, latitude]).addTo(map.value);
                });

                priceTag.addEventListener("mouseleave", () => {
                    popup.remove();
                });

                priceTag.addEventListener("click", () => {
                    window.location.href = `/home-details/${home.property_id}`;
                });
            }
        });
    }

    map.value.on("move", renderClusters);
    map.value.on("zoom", () => {
        renderClusters();
        handleAutoSatelliteToggle();
    });
});

onUnmounted(() => {
    map.value?.remove();
});

function toggleMapStyle() {
    isSatellite.value = !isSatellite.value;
    map.value.setStyle(
        isSatellite.value ? MapStyle.SATELLITE : MapStyle.STREETS
    );
}

function handleAutoSatelliteToggle() {
    const zoom = map.value.getZoom();
    if (zoom >= satelliteThreshold && !isSatellite.value) {
        isSatellite.value = true;
        map.value.setStyle(MapStyle.SATELLITE);
    } else if (zoom < satelliteThreshold && isSatellite.value) {
        isSatellite.value = false;
        map.value.setStyle(MapStyle.STREETS);
    }
}
</script>

<style>
/* Same styles as before */
</style>

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

.satellite-toggle {
    position: absolute;
    top: 10px;
    right: 10px;
    z-index: 1;
    background-color: #ffffff;
    color: #000000;
    padding: 8px 12px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-weight: bold;
}

.satellite-toggle:hover {
    background-color: #f0f0f0;
}

.cluster-marker {
    background-color: red !important;
    color: white;
    border-radius: 50px;
    text-align: center;
    width: 20px;
    cursor: pointer;
}

.price-tag {
    background-color: red !important;
    color: white;
    border-radius: 12px;
    font-size: 9px !important;
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
    border-top: 6px solid red;
    transition: border-top-color 0.3s ease;
}

.price-tag:hover {
    transform: scale(1.1) translateY(-3px);
    background-color: orange !important;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
}

.price-tag:hover::after {
    border-top-color: orange;
}

.map-popup img {
    width: 100%;
    height: auto;
    border: 2px solid red;
    border-radius: 6px;
    box-sizing: border-box;
}
.maplibregl-ctrl-top-right {
    right: 0;
    top: 42px;
}
.maplibregl-ctrl-bottom-left {
    display: none !important;
}
.maplibregl-popup-content {
    background: #fff;
    border-radius: 3px;
    box-shadow: 0 1px 2px rgba(0, 0, 0, .1);
    padding: 15px 10px;
    pointer-events: auto;
    position: relative;
}
</style>
