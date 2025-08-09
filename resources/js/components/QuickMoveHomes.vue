<template>
    <section
        id="quick-move-homes"
        class="py-5"
        v-if="properties && properties.length"
    >
        <div class="container">
            <!-- Section Header -->
            <div class="text-center mb-5">
                <h1 class="c-main-title fw-bold c-title">
                    Quick Move-In Homes
                </h1>
                <p class="c-sub-title text-muted">
                    Discover our selection of brand new, move-in ready homes
                    across Las Vegas Valley. These properties are complete and
                    ready for immediate or near-term move-in.
                </p>
            </div>

            <!-- Carousel -->
            <Carousel
                :settings="settings"
                :wrapAround="true"
                :breakpoints="breakpoints"
                :pauseAutoplayOnHover="true"
            >
                <Slide v-for="property in properties" :key="property.id">
                    <div class="carousel__slide-item">
                        <div
                            class="card border-0 shadow-lg rounded-4 overflow-hidden h-100"
                        >
                            <!-- Image + Badges -->
                            <div class="position-relative overflow-hidden">
                                <img
                                    :src="
                                        property.main_image ??
                                        '/images/default_image.png'
                                    "
                                    class="card-img-top transition-img"
                                    :alt="property.title"
                                    style="height: 220px; object-fit: cover"
                                    @error="setAltImg"
                                />
                                <div
                                    class="position-absolute top-0 start-0 m-2 d-flex flex-column gap-1"
                                >
                                    <span
                                        class="badge rounded-pill text-white px-3 py-1"
                                        style="
                                            background-color: #023f86;
                                            border: 1px solid #023f86;
                                        "
                                    >
                                        {{
                                            property.is_open_house == 1
                                                ? "Open House"
                                                : "Quick Move In"
                                        }}
                                    </span>
                                    <span
                                        v-if="property.incentive"
                                        class="badge rounded-pill bg-info text-white px-3 py-1"
                                    >
                                        Incentive Home
                                    </span>
                                </div>
                            </div>

                            <!-- Icon Row Below Image -->
                            <div
                                class="px-4 py-2 border-bottom text-muted d-flex justify-content-between small"
                            >
                                <span
                                    title="Bedrooms"
                                    v-if="
                                        property.bedrooms &&
                                        property.bedrooms
                                            .toString()
                                            .trim()
                                            .toLowerCase() !== 'nil'
                                    "
                                >
                                    <i class="bi bi-house-door me-1"></i
                                    >{{ property.bedrooms }}
                                </span>

                                <span
                                    title="Bathrooms"
                                    v-if="
                                        property.bathrooms &&
                                        property.bathrooms
                                            .toString()
                                            .trim()
                                            .toLowerCase() !== 'nil'
                                    "
                                >
                                    <i class="bi bi-droplet me-1"></i
                                    >{{ property.bathrooms }}
                                </span>

                                <span
                                    title="Sq Ft"
                                    v-if="
                                        property.square_feet &&
                                        property.square_feet
                                            .toString()
                                            .trim()
                                            .toLowerCase() !== 'nil'
                                    "
                                >
                                    <i class="bi bi-fullscreen me-1"></i
                                    >{{ property.square_feet }}
                                </span>

                                <span
                                    title="Garage"
                                    v-if="
                                        property.parking_enclosure &&
                                        property.parking_enclosure
                                            .toString()
                                            .trim()
                                            .toLowerCase() !== 'nil'
                                    "
                                >
                                    <i class="bi bi-car-front me-1"></i
                                    >{{ property.parking_enclosure }}
                                </span>
                            </div>

                            <!-- Card Body -->
                            <div class="card-body d-flex flex-column px-4 py-3">
                                <!-- Title -->
                                <h5 class="fw-bold text-dark mb-1 c-title">
                                    {{ property.title }}
                                </h5>

                                <!-- Address -->
                                <p class="text-muted small mb-2">
                                    {{ property.address }}
                                </p>

                                <!-- Price -->
                                <div
                                    class="text-dark mb-4"
                                    style="font-size: 0.95rem"
                                >
                                    <span class="text-muted me-1">
                                        <strong>Price:</strong></span
                                    >
                                    ${{ formatPrice(property.price) }}
                                </div>

                                <!-- CTA -->
                                <a
                                    :href="
                                        '/home-details/' + property.property_id
                                    "
                                    class="btn btn-primary rounded-pill text-white fw-semibold w-100 mt-auto"
                                    style="
                                        background-color: #023f86;
                                        border: 1px solid #023f86;
                                    "
                                >
                                    View Property
                                </a>
                            </div>
                        </div>
                    </div>
                </Slide>

                <template #addons>
                    <Navigation />
                </template>
            </Carousel>

            <!-- Incentive Modal -->
            <!-- Incentive Modal (Vue Controlled) -->
            <div
                v-if="showIncentive"
                class="vue-modal-overlay"
                @click.self="closeModal"
            >
                <div class="vue-modal-content">
                    <div
                        class="d-flex justify-content-between align-items-center mb-3"
                    >
                        <h5 class="text-primary fw-bold c-title mb-0">
                            🎁 MOVE-IN-READY INCENTIVES
                        </h5>
                        <button class="btn-close" @click="closeModal"></button>
                    </div>
                    <p class="text-muted mb-4 text-center">
                        Available at <strong>ALL</strong> New Home Communities!
                    </p>
                    <div class="text-center">
                        <a
                            href="/all-incentives"
                            class="btn btn-primary text-white fw-semibold px-4 py-2 rounded-pill"
                            style="
                                background-color: #023f86;
                                border: 1px solid #023f86;
                            "
                        >
                            View Current Incentives →
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
import { defineComponent } from "vue";
import { Carousel, Slide, Navigation } from "vue3-carousel";
import "vue3-carousel/dist/carousel.css";

export default defineComponent({
    name: "QuickMoveInHomes",
    components: { Carousel, Slide, Navigation },
    data() {
        return {
            properties: [],
            incentiveAvailable: null,
            showIncentive: false,
            settings: {
                itemsToShow: 1,
                transition: 500,
                snapAlign: "center",
            },
            breakpoints: {
                320: { itemsToShow: 1.2 },
                576: { itemsToShow: 2 },
                768: { itemsToShow: 2.5 },
                992: { itemsToShow: 3 },
                1200: { itemsToShow: 4 },
                1600: { itemsToShow: 4 },
            },
        };
    },
    created() {
        this.getHomes();
    },
    mounted() {
        this.checkIncentives();
    },
    methods: {
        openModal() {
            this.showIncentive = true;

            // Scroll to section
            const section = document.getElementById("quick-move-homes");
            if (section) {
                section.scrollIntoView({ behavior: "smooth" });
            }

            // Optional: lock scroll for modal
            document.body.style.overflow = "show";
        },

        closeModal() {
            this.showIncentive = false;

            // Scroll back to top
            window.scrollTo({ top: 0, behavior: "smooth" });

            // Restore scrolling
            document.body.style.overflow = "auto";
        },

        async getHomes() {
            try {
                const res = await axios.get("/api/front-homes/all");
                this.properties = res.data;
            } catch (err) {
                toastr.error(
                    err.response?.data?.message || "Failed to load homes."
                );
            }
        },
        async checkIncentives() {
            try {
                const res = await axios.get("/api/check-incentives");
                this.incentiveAvailable = res.data;
                if (this.incentiveAvailable === 1) {
                    this.openModal();
                }
            } catch (err) {
                toastr.error(
                    err.response?.data?.message || "Error checking incentives."
                );
            }
        },

        setAltImg(e) {
            e.target.src = "/images/default_image.png";
        },
        formatPrice(price) {
            return Math.floor(price).toLocaleString();
        },
    },
});
</script>

<style scoped>
.vue-modal-overlay {
    position: fixed;
    z-index: 9999; /* Ensure it's the top layer */
    top: 0;
    left: 0;
    width: 100vw;
    height: 100vh;
    background: rgba(0, 0, 0, 0.55);
    display: flex;
    align-items: center;
    justify-content: center;
    backdrop-filter: blur(2px);
}

.vue-modal-content {
    background-color: #fff;
    z-index: 10000; /* Make sure content sits above the overlay */
    max-width: 500px;
    width: 90%;
    padding: 2rem;
    border-radius: 1rem;
    box-shadow: 0 15px 45px rgba(0, 0, 0, 0.25);
    animation: fadeInUp 0.3s ease-in-out;
    position: relative;
}

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

.carousel__slide-item {
    padding: 12px;
    display: flex;
    justify-content: center;
}
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
