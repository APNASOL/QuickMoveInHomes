<template>
    <Master>
        <!-- Hero Section -->
        <section class="open-houses-hero-section">
            <div class="container position-relative" style="z-index: 1">
                <div class="hero-content">
                    <h1 class="page-title">Open Houses!</h1>
                    <p class="page-subtitle">
                        Explore available open houses in the Las Vegas area
                    </p>
                </div>
            </div>

            <!-- Decorative Elements -->
            <div class="section-decoration decoration-1"></div>
            <div class="section-decoration decoration-2"></div>
        </section>

        <!-- Open Houses Section -->
        <section
            class="content-section"
            v-if="OpenHouses && OpenHouses.length > 0"
        >
            <div class="container">
                <div class="content-card">
                    <div class="section-header">
                        <div class="section-icon">
                            <i class="bi bi-calendar-event"></i>
                        </div>
                        <h2 class="section-title">Available Open Houses</h2>
                    </div>

                    <div class="homes-grid">
                        <div
                            v-for="home in OpenHouses"
                            :key="home.id"
                            class="home-card"
                        >
                            <div class="home-card-inner">
                                <!-- Badge -->
                                <div class="home-badge open-house">
                                    OPEN HOUSE
                                </div>

                                <!-- Image -->
                                <div class="home-image">
                                    <img
                                        :src="
                                            home.main_image ??
                                            '/images/default_image.png'
                                        "
                                        :alt="home.title"
                                        @error="setAltImg"
                                    />
                                    <div
                                        v-if="home.incentive"
                                        class="incentive-badge"
                                    >
                                        Incentive Home
                                    </div>
                                </div>

                                <!-- Content -->
                                <div class="home-content">
                                    <!-- Price -->
                                    <div class="home-price">
                                        ${{ formatPrice(home.price) }}
                                    </div>

                                    <!-- Title -->
                                    <h3 class="home-title">{{ home.title }}</h3>

                                    <!-- Address -->
                                    <p class="home-address">
                                        {{ home.address }}
                                    </p>

                                    <!-- Features -->
                                    <div class="home-features">
                                        <div class="feature">
                                            <i class="bi bi-house-door"></i>
                                            <span class="feature-value">{{
                                                home.bedrooms || 0
                                            }}</span>
                                            <span class="feature-label"
                                                >bd</span
                                            >
                                        </div>
                                        <div class="feature">
                                            <i class="bi bi-droplet"></i>
                                            <span class="feature-value">{{
                                                home.bathrooms || 0
                                            }}</span>
                                            <span class="feature-label"
                                                >ba</span
                                            >
                                        </div>
                                        <div class="feature">
                                            <i class="bi bi-aspect-ratio"></i>
                                            <span class="feature-value">{{
                                                home.square_feet || 0
                                            }}</span>
                                            <span class="feature-label"
                                                >sqft</span
                                            >
                                        </div>
                                        <div class="feature">
                                            <i class="bi bi-car-front"></i>
                                            <span class="feature-value">{{
                                                home.garages || 0
                                            }}</span>
                                            <span class="feature-label"
                                                >garage</span
                                            >
                                        </div>
                                    </div>

                                    <!-- View Details Button -->
                                    <a
                                        :href="
                                            '/home-details/' + home.property_id
                                        "
                                        class="view-details-btn"
                                    >
                                        View Property Details
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- No Results Section -->
        <section class="content-section" v-else>
            <div class="container">
                <div class="content-card">
                    <div class="no-results">
                        <div class="no-results-icon">
                            <i class="bi bi-house-x"></i>
                        </div>
                        <h3 class="no-results-title">
                            No Open Houses Available
                        </h3>
                        <p class="no-results-text">
                            There are currently no open houses scheduled. Please
                            check back later or explore our available homes.
                        </p>
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
            OpenHouses: [],
        };
    },
    created() {
        this.fetchOpenHouses();
    },
    methods: {
        fetchOpenHouses() {
            axios
                .get("/api/get-all-open-houses")
                .then((response) => {
                    this.OpenHouses = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        setAltImg(event) {
            event.target.src = "/images/default_image.png";
        },
        formatPrice(price) {
            return Math.floor(price).toLocaleString();
        },
    },
});
</script>

<style scoped>
/* Hero Section */
.open-houses-hero-section {
    background: linear-gradient(
        135deg,
        rgba(26, 54, 93, 0.85) 0%,
        rgba(45, 55, 72, 0.75) 100%
    );
    padding: 4rem 0;
    position: relative;
    overflow: hidden;
}

.open-houses-hero-section::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 1px;
    background: linear-gradient(
        90deg,
        transparent,
        rgba(255, 255, 255, 0.3),
        transparent
    );
}

.hero-content {
    text-align: center;
    max-width: 800px;
    margin: 0 auto;
}

.page-title {
    font-size: 3rem;
    font-weight: 700;
    color: white;
    margin-bottom: 1.5rem;
    position: relative;
}

.page-title::after {
    content: "";
    position: absolute;
    bottom: -10px;
    left: 50%;
    transform: translateX(-50%);
    width: 60px;
    height: 4px;
    background: linear-gradient(to right, hsl(213 71% 45%), hsl(213 71% 30%));
    border-radius: 2px;
}

.page-subtitle {
    font-size: 1.3rem;
    color: rgba(255, 255, 255, 0.8);
    line-height: 1.6;
    margin: 0 auto;
}

/* Content Section */
.content-section {
    padding: 5rem 0;
}

.content-card {
    background: white;
    border-radius: 24px;
    padding: 3rem;
    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.08);
    border: 1px solid #f1f5f9;
}

/* Section Header */
.section-header {
    display: flex;
    align-items: flex-start;
    gap: 1rem;
    margin-bottom: 3rem;
}

.section-icon {
    width: 48px;
    height: 48px;
    background: linear-gradient(to right, hsl(213 71% 45%), hsl(213 71% 30%));
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-size: 1.5rem;
    flex-shrink: 0;
}

.section-title {
    font-size: 1.6rem;
    font-weight: 700;
    color: #1a365d;
    margin: 0;
    line-height: 1.2;
}

/* Homes Grid */
.homes-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
    gap: 2rem;
}

.home-card {
    background: white;
    border-radius: 16px;
    overflow: hidden;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
    border: 1px solid #f1f5f9;
    transition: all 0.3s ease;
    position: relative;
}

.home-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 30px rgba(0, 0, 0, 0.12);
    border-color: hsl(213 71% 45%);
}

.home-card-inner {
    display: flex;
    flex-direction: column;
    height: 100%;
}

/* Badge */
.home-badge {
    position: absolute;
    top: 1rem;
    left: 1rem;
    color: white;
    padding: 0.5rem 1rem;
    border-radius: 6px;
    font-size: 0.8rem;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    z-index: 2;
}

.home-badge.open-house {
    background: linear-gradient(135deg, #059669, #047857);
}

/* Image */
.home-image {
    position: relative;
    height: 200px;
    overflow: hidden;
}

.home-image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.3s ease;
}

.home-card:hover .home-image img {
    transform: scale(1.05);
}

.incentive-badge {
    position: absolute;
    bottom: 1rem;
    left: 1rem;
    background: linear-gradient(135deg, #dc2626, #b91c1c);
    color: white;
    padding: 0.4rem 0.8rem;
    border-radius: 4px;
    font-size: 0.75rem;
    font-weight: 600;
}

/* Content */
.home-content {
    padding: 1.5rem;
    flex-grow: 1;
    display: flex;
    flex-direction: column;
}

.home-price {
    font-size: 1.5rem;
    font-weight: 700;
    color: #1a365d;
    margin-bottom: 0.5rem;
}

.home-title {
    font-size: 1.1rem;
    font-weight: 600;
    color: #1a365d;
    margin-bottom: 0.5rem;
    line-height: 1.3;
}

.home-address {
    color: #64748b;
    font-size: 0.9rem;
    margin-bottom: 1rem;
    line-height: 1.4;
}

/* Features */
.home-features {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 1rem;
    margin-bottom: 1.5rem;
    padding: 1rem 0;
    border-top: 1px solid #e2e8f0;
    border-bottom: 1px solid #e2e8f0;
}

.feature {
    display: flex;
    align-items: center;
    gap: 0.5rem;
}

.feature i {
    color: hsl(213 71% 45%);
    font-size: 1.1rem;
    width: 20px;
    text-align: center;
}

.feature-value {
    font-size: 1rem;
    font-weight: 600;
    color: #1a365d;
}

.feature-label {
    font-size: 0.8rem;
    color: #64748b;
    text-transform: lowercase;
    margin-left: 0.25rem;
}

/* View Details Button */
.view-details-btn {
    display: inline-block;
    background: linear-gradient(to right, hsl(213 71% 45%), hsl(213 71% 30%));
    color: white;
    text-align: center;
    padding: 0.75rem 1.5rem;
    border-radius: 8px;
    text-decoration: none;
    font-weight: 600;
    font-size: 0.9rem;
    transition: all 0.3s ease;
    margin-top: auto;
    border: none;
    cursor: pointer;
}

.view-details-btn:hover {
    background: linear-gradient(to right, hsl(213 71% 45%), hsl(213 71% 30%));
    transform: translateY(-2px);
    box-shadow: 0 8px 20px rgba(59, 130, 246, 0.3);
    color: white;
    text-decoration: none;
}

/* No Results */
.no-results {
    text-align: center;
    padding: 3rem 2rem;
}

.no-results-icon {
    font-size: 4rem;
    color: #cbd5e1;
    margin-bottom: 1.5rem;
}

.no-results-title {
    font-size: 1.5rem;
    font-weight: 600;
    color: #1a365d;
    margin-bottom: 1rem;
}

.no-results-text {
    color: #64748b;
    font-size: 1.1rem;
    line-height: 1.6;
    margin-bottom: 2rem;
    max-width: 500px;
    margin-left: auto;
    margin-right: auto;
}

/* Decorative Elements */
.section-decoration {
    position: absolute;
    width: 150px;
    height: 150px;
    background: linear-gradient(
        135deg,
        rgba(229, 62, 62, 0.1),
        rgba(255, 255, 255, 0.05)
    );
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

/* Animations */
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

.content-card {
    animation: fadeInUp 0.6s ease-out;
}

.home-card {
    animation: fadeInUp 0.6s ease-out;
}

.home-card:nth-child(1) {
    animation-delay: 0.1s;
}
.home-card:nth-child(2) {
    animation-delay: 0.2s;
}
.home-card:nth-child(3) {
    animation-delay: 0.3s;
}

/* Responsive Design */
@media (max-width: 768px) {
    .open-houses-hero-section {
        padding: 3rem 0;
    }

    .page-title {
        font-size: 2.2rem;
    }

    .page-subtitle {
        font-size: 1.1rem;
    }

    .content-section {
        padding: 3rem 0;
    }

    .content-card {
        padding: 2rem;
        border-radius: 20px;
    }

    .section-header {
        flex-direction: column;
        gap: 1rem;
    }

    .section-title {
        font-size: 1.4rem;
    }

    .homes-grid {
        grid-template-columns: 1fr;
        gap: 1.5rem;
    }

    .home-features {
        grid-template-columns: repeat(4, 1fr);
    }

    .home-content {
        padding: 1.25rem;
    }

    .feature {
        flex-direction: column;
        text-align: center;
        gap: 0.25rem;
    }

    .feature i {
        margin-bottom: 0.25rem;
    }
}

@media (max-width: 576px) {
    .page-title {
        font-size: 1.8rem;
    }

    .content-card {
        padding: 1.5rem;
    }

    .section-icon {
        width: 40px;
        height: 40px;
        font-size: 1.2rem;
    }

    .home-features {
        grid-template-columns: repeat(2, 1fr);
    }

    .feature {
        flex-direction: row;
        text-align: left;
    }
}
</style>
