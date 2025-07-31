<template>
    <Master>
        <section class="p-3 bg-white">
            <!-- Removed container for full width -->
            <!-- Hero Section -->
            <div class="row align-items-center p-3">
                <div class="col-md-12 text-center">
                    <h1 class="uppercase c-main-title">
                        New Home Communities!
                    </h1>
                    <h4 class="c-tags">
                        Explore master-planned communities in the Las Vegas area
                    </h4>
                </div>
            </div>
        </section>

        <section
            class="c-bg-color p-5"
            v-if="Communities && Communities.length > 0"
        >
            <div class="container">
                <!-- <div class="text-center mb-4">
                    <h1 class="fw-bold c-main-title text-black">
                        New Home Communities
                    </h1>
                    <p class="text-muted c-sub-title">
                        Explore master-planned communities in the Las Vegas area
                    </p>
                </div> -->

               <div class="row row-cols-1 row-cols-md-3 g-4">
  <div
    v-for="(community, index) in Communities"
    :key="community.id"
    class="col"
  >
    <div class="card border-0 shadow-lg h-100 rounded-4 overflow-hidden">
      <div class="position-relative overflow-hidden">
        <!-- Image with zoom -->
        <img
          :src="community.main_image ?? 'empty.png'"
          class="card-img-top transition-img"
          :alt="community.name"
          style="object-fit: cover; height: 220px;"
          @error="setAltImg"
        />

        <!-- Badge with custom theme gradient -->
        <span
          class="position-absolute top-0 end-0 m-2 px-3 py-1 rounded-pill fw-semibold text-white shadow-sm"
          style="background: linear-gradient(135deg, #023F86, #035bb8); font-size: 0.85rem;"
        >
          {{ community.homes_count }} Homes
        </span>
      </div>

      <div class="card-body d-flex flex-column px-4 py-3">
        <h5 class="fw-bold text-dark mb-1 c-title">{{ community.name }}</h5>

        <small class="text-muted mb-2 c-location">
          <i class="bi bi-geo-alt me-1"></i>{{ community.location }}
        </small>

        <p class="text-secondary mb-3 c-description" style="font-size: 0.95rem;">
          {{ community.description }}
        </p>

        <!-- Button with custom theme color -->
        <a
          :href="'/detailed/community/' + community.id"
          class="btn rounded-pill mt-auto fw-semibold text-white"
          style="background-color: #023F86; border: 1px solid #023F86;"
        >
          View Community
        </a>
      </div>
    </div>
  </div>
</div>


            </div>
        </section>
    </Master>
</template>

<script>
import { defineComponent } from "vue";
import Master from "@components/layout/Master.vue";

export default defineComponent({
    components: {
        Master,
    },
    data() {
        return {
            Communities: [],
        };
    },
    created() {
        this.fetchDestinations();
    },
    methods: {
        fetchDestinations() {
            axios
                .get("/api/get-all-communities")
                .then((response) => {
                    this.Communities = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        setAltImg(event) {
            event.target.src = "/images/default_image.png";
        },
    },
});
</script>

<style scoped>
.card-img-top {
    height: 200px;
    object-fit: cover;
    transition: transform 0.5s ease;
}
.card-img-top:hover {
    transform: scale(1.1);
}
.card {
    overflow: hidden;
    transition: box-shadow 0.3s ease;
}
.card:hover {
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
}

.c-location {
    font-family: Inter, sans-serif !important;

    font-weight: 400 !important;
    line-height: 32px !important;
    color: #2d6a9f !important;
}
.c-description {
    font-family: Inter, sans-serif;
    font-size: 16px;
    font-weight: 400;
    line-height: 24px;
    color: rgb(61, 102, 143);
}
.c-title {
    font-family: "Playfair Display", serif !important;

    font-weight: bold;
    z-index: 3 !important;
    width: 100% !important;
}
.c-bg-color {
    background-color: #f7fafc;
}

.transition-img {
  transition: transform 0.3s ease-in-out;
}
.card:hover .transition-img {
  transform: scale(1.05);
}

.btn:hover {
  background-color: #035bb8 !important;
  border-color: #035bb8 !important;
}

</style>
