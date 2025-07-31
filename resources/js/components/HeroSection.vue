<template>
  <div class="hero-section text-white d-flex align-items-center justify-content-center text-center">
    <!-- Background -->
    <img
      src="https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?ixlib=rb-4.0.3&auto=format&fit=crop&w=2070&q=80"
      alt="Background"
      class="hero-image"
    />
    <div class="overlay"></div>

    <!-- Main Content -->
    <div class="content position-absolute text-center px-4">
      <h1 class="hero-heading">Find Your Dream Home in Las Vegas</h1>
      <p class="hero-subheading mb-5">Explore beautifully crafted, move-in ready new construction homes.</p>

      <!-- Search Area -->
      <div class="d-flex justify-content-center align-items-center flex-wrap gap-2">
        <div class="search-wrapper input-group shadow-sm">
          <input
            v-model="searching_location"
            type="text"
            class="form-control form-control-lg"
            placeholder="Search by address, city, or ZIP code"
          />
          <a
            v-if="formStatus"
            :href="'/homes-list/' + searching_location"
            class="btn btn-search"
            @click="activeSpinner"
          >
            <i class="bi bi-search fs-5"></i>
          </a>
          <a class="btn btn-search disabled" v-else>
            <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
          </a>
        </div>

        <!-- Map Button -->
        <a class="map-icon-btn ms-2" href="/search/homes" title="Map View">
          <img src="/images/map-icon.png" height="48" />
        </a>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "HeroSection",
  data() {
    return {
      searching_location: "",
      formStatus: true,
    };
  },
  methods: {
    activeSpinner() {
      this.formStatus = false;
      setTimeout(() => {
        this.formStatus = true;
      }, 2000);
    },
  },
};
</script>

<style scoped>
.hero-section {
  height: 50vh;
  position: relative;
  overflow: hidden;
}

.hero-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  position: absolute;
  top: 0;
  left: 0;
  z-index: 1;
}

.overlay {
  background: rgba(0, 0, 0, 0.6);
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 2;
}

.content {
  z-index: 3;
  max-width: 960px;
  width: 100%;
  animation: fadeInUp 0.8s ease;
}

.hero-heading {
  font-family: "Playfair Display", serif;
  font-size: 3.25rem;
  font-weight: 800;
  line-height: 1.3;
  margin-bottom: 0.75rem;
}

.hero-subheading {
  font-size: 1.25rem;
  font-family: "Inter", sans-serif;
  font-weight: 400;
  color: #f5f5f5;
}

.search-wrapper {
  max-width: 480px;
  width: 100%;
  border-radius: 999px;
  overflow: hidden;
  background: white;
}

.search-wrapper input {
  border: none;
  padding: 0.75rem 1rem;
  font-size: 1rem;
  height: 54px;
  border-radius: 0;
}

.btn-search {
  background-color: #023f86;
  color: white;
  width: 60px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.btn-search:hover {
  background-color: #035bb8;
}

.map-icon-btn {
  background: white;
  padding: 6px 10px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: transform 0.3s;
}

.map-icon-btn:hover img {
  transform: scale(1.1);
}

@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@media (max-width: 768px) {
  .hero-heading {
    font-size: 2rem;
  }

  .hero-subheading {
    font-size: 1rem;
  }

  .search-wrapper input {
    height: 50px;
    font-size: 0.95rem;
  }
}
</style>
