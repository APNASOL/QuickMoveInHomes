<template>
    <section class="py-5 c-bg-color" v-if="Communities && Communities.length > 0">
        <div class="container">
            <!-- Title -->
            <div class="text-center mb-4">
                 
                 <h1 class="c-main-title fw-bold c-title">
                    Find Your Place in Our Communities!
                </h1>
                <p class="text-muted c-sub-title">
                    Explore our vibrant communities and discover your next home.
                </p>
            </div>

            <!-- Cards -->
            <div class="row row-cols-1 row-cols-md-3 g-4">
                <div v-for="(community, index) in Communities" :key="community.id" class="col">
                    <div class="card border-0 shadow-lg h-100 rounded-4 overflow-hidden">
                        <!-- Image + Badge -->
                        <div class="position-relative overflow-hidden">
                            <img
                                :src="community.main_image ?? 'empty.png'"
                                class="card-img-top transition-img"
                                :alt="community.name"
                                @error="setAltImg"
                            />
                            <span
                                class="position-absolute top-0 end-0 m-2 px-3 py-1 rounded-pill fw-semibold text-white shadow-sm"
                                style="background: linear-gradient(135deg, #023F86, #035bb8); font-size: 0.85rem;"
                            >
                                {{ community.homes_count }} Homes
                            </span>
                        </div>

                        <!-- Body -->
                        <div class="card-body d-flex flex-column px-4 py-3">
                            <h2 class="c-main-title text-dark mb-1 c-title">
                                {{ community.name }}
                            </h2>
                            <p class="c-sub-title text-muted mb-3">
                                Discover the charm of {{ community.name }} with
                                beautiful homes and thriving communities.
                            </p>

                            <a
                                :href="'/detailed/community/' + community.id"
                                class="btn rounded-pill text-white w-100 mt-auto fw-semibold"
                                style="background-color: #023F86; border: 1px solid #023F86;"
                            >
                                Explore
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Bottom Button -->
            <div class="text-center mt-4">
                <a
                    :href="'/all/communities/'"
                    class="btn rounded-pill text-white px-4 py-2 fw-semibold"
                    style="background-color: #023F86; border: 1px solid #023F86;"
                >
                    Explore More Communities
                </a>
            </div>
        </div>
    </section>
</template>

<script>
import { defineComponent } from "vue";

export default defineComponent({
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
                .get("/api/get-communities")
                .then((response) => {
                    this.Communities = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response?.data?.message || "Something went wrong.");
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
    height: 220px;
    object-fit: cover;
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
</style>
