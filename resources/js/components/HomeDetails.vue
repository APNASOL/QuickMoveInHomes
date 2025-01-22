<template>
    <div>
      <!-- Carousel -->
      <b-carousel
        id="carousel"
        controls
        indicators
        background="#ddd"
        style="max-width: 100%; height: 500px;"
      >
        <b-carousel-slide
          v-for="(image, index) in images"
          :key="index"
          :img-src="image.src"
          :img-alt="`Slide ${index + 1}`"
          style="background-size: cover; background-position: center;"
        ></b-carousel-slide>
      </b-carousel>
  
      <!-- Details Section -->
      <div class="mt-3 text-center">
        <h2>Central Park Tower</h2>
        <p>
          By
          <a href="#" class="text-decoration-none">Extell Development Company</a>
          and
          <a href="#" class="text-decoration-none">SMI USA</a>
        </p>
        <div class="d-flex justify-content-center gap-3 mt-3">
          <button class="btn btn-outline-secondary">Get updates</button>
          <button class="btn btn-outline-primary">Save</button>
          <button class="btn btn-warning text-white">Request info</button>
        </div>
      </div>
  
      <!-- Navigation -->
      <nav class="mt-4">
        <ul class="nav justify-content-center">
          <li class="nav-item">
            <a class="nav-link" href="#">New York</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Overview</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Pricing</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Plans & Homes</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Amenities</a>
          </li>
        </ul>
      </nav>
    </div>
  </template>
  
  <script>
  import Master from "@components/layout/Master.vue";
  export default {
    components: {
        Master,},
    data() {
      return {
        images: [
          { src: 'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg' },
           
        ],
      };
    },
  };
  </script>
  
  <style scoped>
  h2 {
    font-family: 'Arial', sans-serif;
    font-weight: bold;
  }
  .nav-link {
    color: #000;
    font-weight: 600;
  }
  .nav-link:hover {
    text-decoration: underline;
  }
  </style>
  