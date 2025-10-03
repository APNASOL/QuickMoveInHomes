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
/* Hero Section Styles */
.hero-section {
    position: relative;
    height: 85vh;
    min-height: 600px;
    overflow: hidden;
    background: linear-gradient(
        135deg,
        rgba(26, 54, 93, 0.85) 0%,
        rgba(45, 55, 72, 0.75) 100%
    );
}

.hero-image {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
    object-position: center;
    transition: transform 0.8s ease;
}

.hero-section:hover .hero-image {
    transform: scale(1.05);
}

.overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(
        135deg,
        rgba(26, 54, 93, 0.85) 0%,
        rgba(45, 55, 72, 0.78) 50%,
        rgba(229, 62, 62, 0.15) 100%
    );
}

.content {
    z-index: 2;
    max-width: 800px;
    width: 90%;
}

.hero-heading {
    font-size: 3.5rem;
    font-weight: 700;
    line-height: 1.1;
    margin-bottom: 1.5rem;
    text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
    background: linear-gradient(135deg, #fff 0%, #f7fafc 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
}

.hero-subheading {
    font-size: 1.3rem;
    font-weight: 300;
    line-height: 1.6;
    margin-bottom: 2.5rem;
    opacity: 0.95;
    max-width: 600px;
    margin-left: auto;
    margin-right: auto;
}

/* Search Wrapper */
.search-wrapper {
    max-width: 600px;
    width: 100%;
    border-radius: 50px;
    overflow: hidden;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
}

.search-wrapper .form-control {
    border: none;
    border-radius: 0;
    padding: 1.25rem 1.5rem;
    font-size: 1.1rem;
    background: rgba(255, 255, 255, 0.95);
    backdrop-filter: blur(10px);
    transition: all 0.3s ease;
}

.search-wrapper .form-control:focus {
    background: white;
    box-shadow: none;
    outline: none;
}

.search-wrapper .form-control::placeholder {
    color: #718096;
    font-weight: 400;
}

.btn-search {
    background: linear-gradient(
  to right,
  hsl(213 71% 45%),  /* lighter */
  hsl(213 71% 30%)   /* darker */
);
    border: none;
    border-radius: 0;
    padding: 0 2rem;
    color: white;
    font-weight: 600;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
    justify-content: center;
    min-width: 60px;
}

.btn-search:hover {
    background: linear-gradient(
  to right,
  hsl(213 71% 45%),  /* lighter */
  hsl(213 71% 30%)   /* darker */
);
}

.btn-search:active {
    transform: translateX(0);
}

.btn-search.disabled {
    background: #a0aec0;
    cursor: not-allowed;
}

.btn-search.disabled:hover {
    transform: none;
}

/* Map Button */
.map-icon-btn {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 60px;
    height: 60px;
    background: rgba(255, 255, 255, 0.95);
    backdrop-filter: blur(10px);
    border-radius: 12px;
    transition: all 0.3s ease;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
    border: 2px solid transparent;
}

.map-icon-btn:hover {
    background: white;
    box-shadow: 0 15px 40px rgba(0, 0, 0, 0.25);
    border-color: hsl(213 71% 45%);
}

.map-icon-btn img {
    transition: transform 0.3s ease;
}

.map-icon-btn:hover img {
    transform: scale(1.1);
}

/* Search Container */
.search-container {
    display: flex;
    gap: 1rem;
    align-items: center;
    justify-content: center;
    flex-wrap: wrap;
}

/* Spinner Animation */
.spinner-border-sm {
    width: 1.25rem;
    height: 1.25rem;
    border-width: 0.15em;
}

/* Responsive Design */
@media (max-width: 768px) {
    .hero-section {
        height: 70vh;
        min-height: 500px;
    }

    .hero-heading {
        font-size: 2.5rem;
        margin-bottom: 1rem;
    }

    .hero-subheading {
        font-size: 1.1rem;
        margin-bottom: 2rem;
    }

    .search-container {
        flex-direction: column;
        width: 100%;
    }

    .search-wrapper {
        width: 100%;
    }

    .map-icon-btn {
        width: 100%;
        height: 55px;
        margin-top: 0.5rem;
    }

    .search-wrapper .form-control {
        padding: 1rem 1.25rem;
        font-size: 1rem;
    }
}

@media (max-width: 576px) {
    .hero-heading {
        font-size: 2rem;
    }

    .hero-subheading {
        font-size: 1rem;
    }

    .content {
        width: 95%;
        padding: 0 1rem;
    }
}

/* Animation for content */
@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(30px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.content {
    animation: fadeInUp 0.8s ease-out;
}

/* Additional decorative elements */
.hero-section::before {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 100px;
    background: linear-gradient(transparent, rgba(255, 255, 255, 0.1));
    z-index: 1;
}
</style>
