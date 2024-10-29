<template>
    <div id="map" style="width: 100%; height: 500px;"></div>
  </template>
  
  <script>
  import L from 'leaflet';
  import 'leaflet/dist/leaflet.css';
  import 'leaflet.markercluster';
  import 'leaflet.markercluster/dist/MarkerCluster.css';
  import 'leaflet.markercluster/dist/MarkerCluster.Default.css';
  
  export default {
    name: 'MapComponent',
    mounted() {
      // Set the map's initial view
      const map = L.map('map').setView([40.7128, -74.0060], 8); // Centered near New York
  
      // Add OpenStreetMap tiles
      L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 19,
        attribution: '© OpenStreetMap contributors'
      }).addTo(map);
  
      // Initialize the marker cluster group
      const markers = L.markerClusterGroup();
  
      // Sample data with images and information
      const properties = [
        {
          lat: 40.7128,
          lng: -74.0060,
          price: "$230,000",
          title: "Real House Luxury Villa",
          address: "Est St, 77 - Central Park South, NYC",
          image: '/images/sample-property-image.png', // Example image path
          iconType: 'home',
        },
        {
          lat: 40.7306,
          lng: -73.9352,
          price: "$150,000",
          title: "Downtown Condo",
          address: "5th Ave, Manhattan, NYC",
          image: '/images/sample-property-image-2.png',
          iconType: 'building',
        },
        // Add more property objects as needed
      ];
  
      // Custom icon with blue border
      const customIcon = new L.Icon({
        iconUrl: '/images/marker-icon.png', // Your custom marker icon path
        iconSize: [38, 38], // Adjust the size as needed
        iconAnchor: [19, 38], // Anchor point to position marker correctly
        popupAnchor: [0, -38], // Position popup above the icon
      });
  
      // Loop through properties and add markers with popups
      properties.forEach(property => {
        const marker = L.marker([property.lat, property.lng], { icon: customIcon });
  
        // Custom HTML content for the popup
        const popupContent = `
          <div style="width: 200px;">
            <div style="position: relative;">
              <span style="position: absolute; top: 10px; left: 10px; background-color: #2A5A9D; color: #fff; padding: 5px; font-weight: bold;">${property.price}</span>
              <img src="${property.image}" alt="${property.title}" style="width: 100%; height: auto; border-radius: 5px;">
            </div>
            <h4 style="margin: 10px 0 5px;">${property.title}</h4>
            <p style="font-size: 0.9em; color: #555;">${property.address}</p>
          </div>
        `;
  
        marker.bindPopup(popupContent);
        markers.addLayer(marker);
      });
  
      // Add the markers to the map
      map.addLayer(markers);
    },
  };
  </script>
  
  <style>
  #map {
    width: 100%;
    height: 500px;
  }
  </style>
  