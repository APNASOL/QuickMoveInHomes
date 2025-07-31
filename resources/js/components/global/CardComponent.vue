<template>
  <div class="card border-0 shadow-lg rounded-4 overflow-hidden h-100">
    <!-- Image + Badges -->
    <div class="position-relative overflow-hidden">
      <img
        :src="main_image ?? '/images/default_image.png'"
        class="card-img-top transition-img"
        :alt="title"
        style="height: 220px; object-fit: cover"
        @error="setAltImg"
      />
      <div class="position-absolute top-0 start-0 m-2 d-flex flex-column gap-1">
        <span
          class="badge rounded-pill text-white px-3 py-1"
          style="background-color: #023f86; border: 1px solid #023f86"
        >
          {{ badge || 'Quick Move In' }}
        </span>
        <span
          v-if="badge2"
          class="badge rounded-pill bg-info text-white px-3 py-1"
        >
          {{ badge2 }}
        </span>
      </div>
    </div>

    <!-- Icon Row -->
    <div class="px-4 py-2 border-bottom text-muted d-flex justify-content-between small">
      <span title="Bedrooms"><i class="bi bi-house-door me-1"></i>{{ bedrooms }}</span>
      <span title="Bathrooms"><i class="bi bi-droplet me-1"></i>{{ bathrooms }}</span>
      <span title="Sq Ft"><i class="bi bi-fullscreen me-1"></i>{{ square_feet }}</span>
      <span title="Garage"><i class="bi bi-car-front me-1"></i>{{ garages || '—' }}</span>
    </div>

    <!-- Content -->
    <div class="card-body d-flex flex-column px-4 py-3">
      <h5 class="fw-bold text-dark mb-1 c-title">{{ title }}</h5>
      <p class="text-muted small mb-2">{{ address }}</p>
      <div class="text-dark mb-4" style="font-size: 0.95rem">
        <span class="text-muted me-1">
          <i class="bi bi-currency-dollar"></i> <strong>Price:</strong>
        </span>
        ${{ formatPrice(price) }}
      </div>
      <a
        :href="'/home-detail/' + property_id"
        class="btn btn-primary rounded-pill text-white fw-semibold w-100 mt-auto"
        style="background-color: #023f86; border: 1px solid #023f86"
      >
        View Property
      </a>
    </div>
  </div>
</template>

<script>
export default {
  name: "PropertyCard",
  props: [
    "badge",
    "badge2",
    "main_image",
    "title",
    "address",
    "bedrooms",
    "bathrooms",
    "square_feet",
    "garages",
    "price",
    "property_id"
  ],
  methods: {
    setAltImg(e) {
      e.target.src = "/images/default_image.png";
    },
    formatPrice(price) {
      return Math.floor(price).toLocaleString();
    }
  }
};
</script>

<style scoped>
.card-img-top {
  transition: transform 0.5s ease;
}
.transition-img:hover {
  transform: scale(1.05);
}
.card {
  transition: box-shadow 0.3s ease;
}
.card:hover {
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
}
.btn:hover {
  background-color: #035bb8 !important;
  border-color: #035bb8 !important;
}
.card-body span,
.border-bottom span {
  display: inline-flex;
  align-items: center;
  font-size: 0.875rem;
}
</style>
