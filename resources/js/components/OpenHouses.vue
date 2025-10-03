<style scoped>
/* Open Houses Section */
.open-houses-section {
    background: linear-gradient(
        135deg,
        rgba(26, 54, 93, 0.85) 0%,
        rgba(45, 55, 72, 0.75) 100%
    );
    padding: 4rem 0;
    position: relative;
    overflow: hidden;
}

.open-houses-section::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 1px;
    background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
}

.section-header {
    text-align: center;
    margin-bottom: 3rem;
}

.section-title {
    color: white;
    font-size: 2.5rem;
    font-weight: 700;
    margin-bottom: 1rem;
    position: relative;
}

.section-title::after {
    content: '';
    position: absolute;
    bottom: -10px;
    left: 50%;
    transform: translateX(-50%);
    width: 60px;
    height: 4px;
    background: linear-gradient(
  to right,
  hsl(213 71% 45%),  /* lighter */
  hsl(213 71% 30%)   /* darker */
);
    border-radius: 2px;
}

.section-subtitle {
    color: rgba(255, 255, 255, 0.8);
    font-size: 1.1rem;
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
    scrollbar-color: rgba(255,255,255,0.3) transparent;
    margin-bottom: 2rem;
}

.properties-container::-webkit-scrollbar {
    height: 8px;
}

.properties-container::-webkit-scrollbar-track {
    background: transparent;
    border-radius: 4px;
}

.properties-container::-webkit-scrollbar-thumb {
    background: rgba(255, 255, 255, 0.3);
    border-radius: 4px;
}

.properties-container::-webkit-scrollbar-thumb:hover {
    background: rgba(255, 255, 255, 0.5);
}

/* Property Card - Similar to Quick Move-in Style */
.property-card {
    min-width: 320px;
    background: rgba(255, 255, 255, 0.05);
    border-radius: 16px;
    overflow: hidden;
    transition: all 0.3s ease;
    border: 1px solid rgba(255, 255, 255, 0.1);
    backdrop-filter: blur(10px);
    height: 100%;
}

.property-card:hover {
    transform: translateY(-8px);
    background: rgba(255, 255, 255, 0.1);
    border-color: hsl(213 71% 45%),;
    box-shadow: 0 15px 40px rgba(0, 0, 0, 0.3);
}

.property-image {
    width: 100%;
    height: 200px;
    object-fit: cover;
    transition: transform 0.5s ease;
}

.property-card:hover .property-image {
    transform: scale(1.05);
}

.property-content {
    padding: 1.5rem;
}

.property-badges {
    display: flex;
    gap: 0.5rem;
    margin-bottom: 1rem;
    flex-wrap: wrap;
}

.property-badge {
    display: inline-block;
    padding: 0.4rem 0.8rem;
    border-radius: 20px;
    font-size: 0.75rem;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.badge-primary {
    background: linear-gradient(
  to right,
  hsl(213 71% 45%),  /* lighter */
  hsl(213 71% 30%)   /* darker */
);
    color: white;
}

.badge-secondary {
    background: linear-gradient(135deg, #0ea5e9, #0284c7);
    color: white;
}

.badge-info {
    background: linear-gradient(135deg, #10b981, #059669);
    color: white;
}

.property-price {
    font-size: 1.5rem;
    font-weight: 700;
    color: white;
    margin-bottom: 0.5rem;
}

.property-title {
    font-size: 1.1rem;
    font-weight: 600;
    color: white;
    margin-bottom: 0.5rem;
    line-height: 1.3;
}

.property-address {
    color: rgba(255, 255, 255, 0.7);
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
    color: hsl(213 71% 45%),;
}

.feature-text {
    font-size: 0.9rem;
    color: rgba(255, 255, 255, 0.8);
}

.feature-value {
    font-weight: 600;
    color: white;
}

.property-cta {
    background: linear-gradient(
  to right,
  hsl(213 71% 45%),  /* lighter */
  hsl(213 71% 30%)   /* darker */
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
  hsl(213 71% 45%),  /* lighter */
  hsl(213 71% 30%)   /* darker */
);
    transform: translateY(-2px);
    box-shadow: 0 8px 20px hsl(213 71% 45%),;
    color: white;
}

/* Navigation Arrows */
.section-navigation {
    display: flex;
    justify-content: center;
    gap: 1rem;
    margin-bottom: 2rem;
}

.nav-arrow {
    width: 48px;
    height: 48px;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.1);
    border: 2px solid rgba(255, 255, 255, 0.2);
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    transition: all 0.3s ease;
    color: white;
    backdrop-filter: blur(10px);
}

.nav-arrow:hover {
    background: hsl(213 71% 30%),;
    border-color: hsl(213 71% 45%);
    transform: scale(1.1);
}

/* View All Button */
.view-all-container {
    text-align: center;
}

.view-all-btn {
    background: linear-gradient(
  to right,
  hsl(213 71% 45%),  /* lighter */
  hsl(213 71% 30%)   /* darker */
);
    border: none;
    border-radius: 12px;
    padding: 1rem 2.5rem;
    color: white;
    font-weight: 600;
    font-size: 1.1rem;
    text-decoration: none;
    transition: all 0.3s ease;
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    box-shadow: 0 4px 15px hsl(213 71% 45%),;
}

.view-all-btn:hover {
    background: linear-gradient(
  to right,
  hsl(213 71% 45%),  /* lighter */
  hsl(213 71% 30%)   /* darker */
);
    transform: translateY(-3px);
    box-shadow: 0 8px 25px hsl(213 71% 45%),;
    color: white;
}

/* Section Decoration */
.section-decoration {
    position: absolute;
    width: 150px;
    height: 150px;
    background: linear-gradient(135deg, rgba(229, 62, 62, 0.1), rgba(255, 255, 255, 0.05));
    border-radius: 50%;
    filter: blur(30px);
    z-index: 0;
}

.decoration-1 {
    top: -30px;
    right: -30px;
}

.decoration-2 {
    bottom: -30px;
    left: -30px;
}

/* Responsive Design */
@media (max-width: 768px) {
    .open-houses-section {
        padding: 3rem 0;
    }

    .section-title {
        font-size: 2rem;
    }

    .section-subtitle {
        font-size: 1rem;
        padding: 0 1rem;
    }

    .property-card {
        min-width: 280px;
    }

    .properties-container {
        gap: 1.5rem;
        padding: 0.5rem;
    }

    .property-content {
        padding: 1.25rem;
    }
}

@media (max-width: 576px) {
    .section-title {
        font-size: 1.8rem;
    }

    .property-card {
        min-width: 260px;
    }

    .property-features {
        grid-template-columns: 1fr;
        gap: 0.75rem;
    }

    .nav-arrow {
        width: 40px;
        height: 40px;
    }
}
</style>

<template>
    <div class="open-houses-section" v-if="properties && properties.length">
        <!-- Decorative Elements -->
        <div class="section-decoration decoration-1"></div>
        <div class="section-decoration decoration-2"></div>

        <div class="container position-relative" style="z-index: 1;">
            <!-- Section Header -->
            <div class="section-header">
                <h2 class="section-title">Visit Our Open Houses</h2>
                <p class="section-subtitle">
                    Explore our exclusive open house events and discover your dream home in Las Vegas's most desirable communities.
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
                        :src="property.main_image ?? '/images/default_image.png'"
                        class="property-image"
                        :alt="property.title"
                        @error="setAltImg"
                    />

                    <div class="property-content">
                        <!-- Badges -->
                        <div class="property-badges">
                            <span
                                class="property-badge"
                                :class="property.is_open_house == 1 ? 'badge-primary' : 'badge-secondary'"
                            >
                                {{ property.is_open_house == 1 ? "Open House" : "Quick Move In" }}
                            </span>
                            <span
                                v-if="property.incentive"
                                class="property-badge badge-info"
                            >
                                Incentive Home
                            </span>
                        </div>

                        <!-- Price -->
                        <div class="property-price">${{ formatPrice(property.price) }}</div>

                        <!-- Title -->
                        <h3 class="property-title">{{ property.title }}</h3>

                        <!-- Address -->
                        <p class="property-address">{{ property.address }}</p>

                        <!-- Features -->
                        <div class="property-features">
                            <div
                                class="feature"
                            >
                                <i class="bi bi-house-door feature-icon"></i>
                                <span class="feature-text">
                                    <span class="feature-value">{{ property.bedrooms }}</span> bd
                                </span>
                            </div>

                            <div
                                class="feature"
                            >
                                <i class="bi bi-droplet feature-icon"></i>
                                <span class="feature-text">
                                    <span class="feature-value">{{ property.bathrooms }}</span> ba
                                </span>
                            </div>

                            <div
                                class="feature"
                            >
                                <i class="bi bi-fullscreen feature-icon"></i>
                                <span class="feature-text">
                                    <span class="feature-value">{{ formatSqFt(property.square_feet) }}</span> sqft
                                </span>
                            </div>

                            <div
                                class="feature"
                            >
                                <i class="bi bi-car-front feature-icon"></i>
                                <span class="feature-text">
                                    <span class="feature-value">{{ property.parking_enclosure }}</span> garage
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

            <!-- View All Button -->
            <div class="view-all-container">
                <a href="/all/open/houses/" class="view-all-btn">
                    View All Open Houses
                    <i class="bi bi-arrow-right"></i>
                </a>
            </div>
        </div>
    </div>

    <!-- Loading State -->
    <div class="open-houses-section" v-else>
        <div class="container">
            <div class="section-header">
                <h2 class="section-title">Visit Our Open Houses</h2>
                <p class="section-subtitle">
                    Explore our exclusive open house events and discover your dream home.
                </p>
            </div>

            <!-- Loading skeleton can be added here -->
        </div>
    </div>
</template>

<script>
import { defineComponent } from "vue";

export default defineComponent({
    name: "OpenHouses",
    data() {
        return {
            properties: [],
        };
    },
    created() {
        this.getHomes();
    },
    methods: {
        async getHomes() {
            await axios
                .get("/api/front-homes/open_houses")
                .then((response) => {
                    this.properties = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },

        formatPrice(price) {
            if (!price) return '0';
            return parseInt(price).toLocaleString();
        },

        formatSqFt(sqft) {
            if (!sqft) return '0';
            return parseInt(sqft).toLocaleString();
        },

        setAltImg(event) {
            event.target.src = "/images/default_image.png";
        },

        scrollLeft() {
            const container = this.$refs.propertiesContainer;
            container.scrollBy({ left: -320, behavior: 'smooth' });
        },

        scrollRight() {
            const container = this.$refs.propertiesContainer;
            container.scrollBy({ left: 320, behavior: 'smooth' });
        }
    },
});
</script>
