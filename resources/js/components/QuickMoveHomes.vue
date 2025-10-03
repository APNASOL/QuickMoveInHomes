<template>
    <section
        id="quick-move-homes"
        class="quick-move-section"
        v-if="properties && properties.length"
    >
        <div class="container">
            <!-- Section Header -->
            <div class="section-header">
                <h1 class="section-title-QMH">Quick Move-in Homes</h1>
                <p class="section-subtitle-QMH">
                    Discover our selection of brand new, move-in ready homes
                    across Las Vegas Valley. These properties are complete and
                    ready for immediate or near-term move-in.
                </p>
            </div>

            <!-- Properties Container -->
            <div class="properties-container" ref="propertiesContainer">
                <!-- Dynamic Property Cards -->
                <div
                    class="property-card"
                    v-for="property in properties"
                    :key="property.id"
                >
                    <!-- Property Image -->
                    <img
                        :src="
                            property.main_image ?? '/images/default_image.png'
                        "
                        class="property-image"
                        :alt="property.title"
                        @error="setAltImg"
                    />

                    <div class="property-content">
                        <!-- Badges -->
                        <div class="property-badges">
                            <span
                                class="property-badge"
                                :class="
                                    property.is_open_house == 1
                                        ? 'badge-open-house'
                                        : ''
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
                                class="property-badge badge-incentive"
                            >
                                Incentive Home
                            </span>
                        </div>

                        <!-- Price -->
                        <div class="property-price">
                            ${{ formatPrice(property.price) }}
                        </div>

                        <!-- Title -->
                        <h3 class="property-title">{{ property.title }}</h3>

                        <!-- Address -->
                        <p class="property-address">{{ property.address }}</p>

                        <!-- Features -->
                        <div class="property-features">
                            <div
                                class="feature"
                                v-if="
                                    property.bedrooms &&
                                    property.bedrooms
                                        .toString()
                                        .trim()
                                        .toLowerCase() !== 'nil'
                                "
                            >
                                <i class="bi bi-house-door feature-icon"></i>
                                <span class="feature-text">
                                    <span class="feature-value">{{
                                        property.bedrooms
                                    }}</span>
                                    bd
                                </span>
                            </div>

                            <div
                                class="feature"
                                v-if="
                                    property.bathrooms &&
                                    property.bathrooms
                                        .toString()
                                        .trim()
                                        .toLowerCase() !== 'nil'
                                "
                            >
                                <i class="bi bi-droplet feature-icon"></i>
                                <span class="feature-text">
                                    <span class="feature-value">{{
                                        property.bathrooms
                                    }}</span>
                                    ba
                                </span>
                            </div>

                            <div
                                class="feature"
                                v-if="
                                    property.square_feet &&
                                    property.square_feet
                                        .toString()
                                        .trim()
                                        .toLowerCase() !== 'nil'
                                "
                            >
                                <i class="bi bi-fullscreen feature-icon"></i>
                                <span class="feature-text">
                                    <span class="feature-value">{{
                                        formatSqFt(property.square_feet)
                                    }}</span>
                                    sqft
                                </span>
                            </div>

                            <div
                                class="feature"
                                v-if="
                                    property.parking_enclosure &&
                                    property.parking_enclosure
                                        .toString()
                                        .trim()
                                        .toLowerCase() !== 'nil'
                                "
                            >
                                <i class="bi bi-car-front feature-icon"></i>
                                <span class="feature-text">
                                    <span class="feature-value">{{
                                        property.parking_enclosure
                                    }}</span>
                                    garage
                                </span>
                            </div>
                        </div>

                        <!-- CTA Button -->
                        <a
                            :href="'/home-details/' + property.property_id"
                            class="property-cta"
                        >
                            View Property Details
                        </a>
                    </div>
                </div>
            </div>

            <!-- Navigation Arrows -->
            <div class="section-navigation">
                <button class="nav-arrow" @click="scrollLeft">
                    <i class="bi bi-chevron-left"></i>
                </button>
                <button class="nav-arrow" @click="scrollRight">
                    <i class="bi bi-chevron-right"></i>
                </button>
            </div>

            <!-- Incentive Modal -->
            <div
                v-if="showIncentive"
                class="vue-modal-overlay"
                @click.self="closeModal"
            >
                <div class="vue-modal-content">
                    <div
                        class="d-flex justify-content-between align-items-center mb-3"
                    >
                        <h5 class="fw-bold mb-0">
                            🎁 MOVE-IN-READY INCENTIVES
                        </h5>
                        <button class="btn-close" @click="closeModal"></button>
                    </div>
                    <p class="text-muted mb-4">
                        Available at <strong>ALL</strong> New Home Communities!
                    </p>
                    <div class="text-center">
                        <a href="/all-incentives" class="property-cta">
                            View Current Incentives
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
        scrollLeft() {
            const container = this.$refs.propertiesContainer;
            container.scrollBy({ left: -350, behavior: "smooth" });
        },

        scrollRight() {
            const container = this.$refs.propertiesContainer;
            container.scrollBy({ left: 350, behavior: "smooth" });
        },

        formatPrice(price) {
            // Your existing price formatting logic
            if (!price) return "0";
            return parseInt(price).toLocaleString();
        },

        formatSqFt(sqft) {
            if (!sqft) return "0";
            return parseInt(sqft).toLocaleString();
        },

        setAltImg(event) {
            event.target.src = "/images/default_image.png";
        },

        closeModal() {
            this.showIncentive = false;
        },
    },
});
</script>

<style scoped>
/* Quick Move-In Homes Section */
.quick-move-section {
    background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);
    padding: 4rem 0;
    position: relative;
}

.section-header {
    text-align: center;
    margin-bottom: 3rem;
}

.section-title-QMH {
    font-size: 2.5rem;
    font-weight: 700;
    color: #1a365d;
    margin-bottom: 1rem;
    position: relative;
}

.section-title-QMH::after {
    content: "";
    position: absolute;
    bottom: -10px;
    left: 50%;
    transform: translateX(-50%);
    width: 60px;
    height: 4px;
    background: linear-gradient(
        to right,
        hsl(213 71% 45%),
        /* lighter */ hsl(213 71% 30%) /* darker */
    );
    border-radius: 2px;
}

.section-subtitle-QMH {
    font-size: 1.1rem;
    color: #64748b;
    max-width: 600px;
    margin: 0 auto;
    line-height: 1.6;
}

/* Properties Container */
.properties-container {
    display: flex;
    gap: 2rem;
    overflow-x: auto;
    padding: 1rem 0.5rem;
    scrollbar-width: thin;
    scrollbar-color: #cbd5e0 #f1f5f9;
}

.properties-container::-webkit-scrollbar {
    height: 8px;
}

.properties-container::-webkit-scrollbar-track {
    background: #f1f5f9;
    border-radius: 4px;
}

.properties-container::-webkit-scrollbar-thumb {
    background: #cbd5e0;
    border-radius: 4px;
}

.properties-container::-webkit-scrollbar-thumb:hover {
    background: #94a3b8;
}

/* Property Card */
.property-card {
    min-width: 350px;
    background: white;
    border-radius: 16px;
    overflow: hidden;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
    transition: all 0.3s ease;
    border: 1px solid #e2e8f0;
}

.property-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15);
}

.property-image {
    width: 100%;
    height: 200px;
    object-fit: cover;
}

.property-content {
    padding: 1.5rem;
}

.property-badge {
    display: inline-block;
    background: rgb(22 163 74 / var(--tw-bg-opacity, 1));
    color: white;
    padding: 0.25rem 0.75rem;
    border-radius: 20px;
    font-size: 0.75rem;
    font-weight: 600;
    margin-bottom: 1rem;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.badge-open-house {
    background: linear-gradient(135deg, #0ea5e9, #0284c7);
}

.badge-incentive {
    background: linear-gradient(135deg, #10b981, #059669);
}

.property-price {
    font-size: 1.5rem;
    font-weight: 700;
    color: #1a365d;
    margin-bottom: 0.5rem;
}

.property-title {
    font-size: 1.1rem;
    font-weight: 600;
    color: #1e293b;
    margin-bottom: 0.5rem;
    line-height: 1.3;
}

.property-address {
    color: #64748b;
    font-size: 0.9rem;
    margin-bottom: 1.5rem;
    line-height: 1.4;
}

.property-features {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 1rem;
    margin-bottom: 1.5rem;
    border-top: 1px solid #e2e8f0;
    border-bottom: 1px solid #e2e8f0;
    padding: 1rem 0;
}

.feature {
    display: flex;
    align-items: center;
    gap: 0.5rem;
}

.feature-icon {
    width: 20px;
    height: 20px;
    color: hsl(213 71% 45%);
}

.feature-text {
    font-size: 0.9rem;
    color: #475569;
}

.feature-value {
    font-weight: 600;
    color: #1e293b;
}

.property-cta {
    background: linear-gradient(
        to right,
        hsl(213 71% 45%),
        /* lighter */ hsl(213 71% 30%) /* darker */
    );
    border: none;
    border-radius: 12px;
    padding: 0.75rem 1.5rem;
    color: white;
    font-weight: 600;
    text-decoration: none;
    text-align: center;
    transition: all 0.3s ease;
    display: block;
    width: 100%;
}

.property-cta:hover {
    background: linear-gradient(
        to right,
        hsl(213 71% 45%),
        /* lighter */ hsl(213 71% 30%) /* darker */
    );
    transform: translateY(-2px);
    box-shadow: 0 8px 20px hsl(213 71% 45%);
    color: white;
}

/* Navigation Arrows */
.section-navigation {
    display: flex;
    justify-content: center;
    gap: 1rem;
    margin-top: 2rem;
}

.nav-arrow {
    width: 48px;
    height: 48px;
    border-radius: 50%;
    background: white;
    border: 2px solid #e2e8f0;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    transition: all 0.3s ease;
    color: #64748b;
}

.nav-arrow:hover {
    background: hsl(213 71% 45%);
    border-color: hsl(213 71% 30%);
    color: white;
    transform: scale(1.1);
}

/* Responsive Design */
@media (max-width: 768px) {
    .quick-move-section {
        padding: 3rem 0;
    }

    .section-title-QMH {
        font-size: 2rem;
    }

    .section-subtitle-QMH {
        font-size: 1rem;
        padding: 0 1rem;
    }

    .property-card {
        min-width: 300px;
    }

    .properties-container {
        gap: 1.5rem;
        padding: 0.5rem;
    }
}

@media (max-width: 576px) {
    .section-title-QMH {
        font-size: 1.8rem;
    }

    .property-card {
        min-width: 280px;
    }

    .property-content {
        padding: 1.25rem;
    }

    .property-features {
        grid-template-columns: 1fr;
        gap: 0.75rem;
    }
}

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
</style>
