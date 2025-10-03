<style scoped>
/* New Home Communities Page */
.communities-hero-section {
    background: linear-gradient(
        135deg,
        rgba(26, 54, 93, 0.85) 0%,
        rgba(45, 55, 72, 0.75) 100%
    );
    padding: 4rem 0;
    position: relative;
    overflow: hidden;
}

.communities-hero-section::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 1px;
    background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
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
    text-transform: uppercase;
    letter-spacing: 1px;
}

.page-subtitle {
    font-size: 1.3rem;
    color: rgba(255, 255, 255, 0.8);
    line-height: 1.6;
    margin: 0 auto;
}

/* Communities Grid Section */
.communities-grid-section {
    background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);
    padding: 5rem 0;
    position: relative;
}

.communities-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
    gap: 2rem;
}

.community-card {
    background: white;
    border-radius: 20px;
    overflow: hidden;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
    transition: all 0.3s ease;
    border: 1px solid #f1f5f9;
    display: flex;
    flex-direction: column;
    height: 100%;
}

.community-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
    border-color: hsl(213 71% 30%);
}

.community-image-container {
    position: relative;
    width: 100%;
    height: 240px;
    overflow: hidden;
}

.community-image {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.5s ease;
}

.community-card:hover .community-image {
    transform: scale(1.1);
}

.community-badge {
    position: absolute;
    top: 1rem;
    right: 1rem;
    background: linear-gradient(
  to right,
  hsl(213 71% 45%),  /* lighter */
  hsl(213 71% 30%)   /* darker */
);
    color: white;
    padding: 0.5rem 1rem;
    border-radius: 20px;
    font-size: 0.8rem;
    font-weight: 600;
    backdrop-filter: blur(10px);
    border: 1px solid rgba(255, 255, 255, 0.2);
}

.community-content {
    padding: 1.5rem;
    flex-grow: 1;
    display: flex;
    flex-direction: column;
}

.community-name {
    font-size: 1.4rem;
    font-weight: 700;
    color: #1a365d;
    margin-bottom: 0.5rem;
    line-height: 1.3;
    font-family: "Playfair Display", serif;
}

.community-location {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    color: #2d6a9f;
    font-size: 0.9rem;
    font-weight: 500;
    margin-bottom: 1rem;
}

.community-location i {
    font-size: 1rem;
}

.community-description {
    color: #64748b;
    line-height: 1.5;
    margin-bottom: 1.5rem;
    flex-grow: 1;
    font-size: 0.95rem;
}

.community-cta {
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
    margin-top: auto;
}

.community-cta:hover {
    background: linear-gradient(
  to right,
  hsl(213 71% 45%),  /* lighter */
  hsl(213 71% 30%)   /* darker */
);
    transform: translateY(-2px);
    box-shadow: 0 8px 20px hsl(213 71% 45%);
    color: white;
}

/* Loading State */
.communities-loading {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
    gap: 2rem;
}

.community-card-loading {
    background: white;
    border-radius: 20px;
    overflow: hidden;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
    border: 1px solid #f1f5f9;
    height: 400px;
    position: relative;
    overflow: hidden;
}

.community-card-loading::after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, rgba(255,255,255,0.4), transparent);
    animation: loading 1.5s infinite;
}

@keyframes loading {
    0% { transform: translateX(-100%); }
    100% { transform: translateX(100%); }
}

/* Empty State */
.empty-state {
    text-align: center;
    padding: 4rem 2rem;
    background: white;
    border-radius: 20px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
    margin: 2rem 0;
}

.empty-state-icon {
    font-size: 4rem;
    color: #cbd5e0;
    margin-bottom: 1.5rem;
}

.empty-state-title {
    font-size: 1.5rem;
    color: #64748b;
    margin-bottom: 1rem;
}

.empty-state-text {
    color: #94a3b8;
    max-width: 400px;
    margin: 0 auto;
}

/* Decorative Elements */
.section-decoration {
    position: absolute;
    width: 200px;
    height: 200px;
    background: linear-gradient(135deg, rgba(229, 62, 62, 0.1), rgba(26, 54, 93, 0.1));
    border-radius: 50%;
    filter: blur(40px);
    z-index: 0;
}

.decoration-1 {
    top: -50px;
    right: -50px;
}

.decoration-2 {
    bottom: -50px;
    left: -50px;
}

/* Responsive Design */
@media (max-width: 768px) {
    .communities-hero-section {
        padding: 3rem 0;
    }

    .page-title {
        font-size: 2.2rem;
    }

    .page-subtitle {
        font-size: 1.1rem;
    }

    .communities-grid-section {
        padding: 3rem 0;
    }

    .communities-grid {
        grid-template-columns: 1fr;
        gap: 1.5rem;
    }

    .community-content {
        padding: 1.25rem;
    }
}

@media (max-width: 576px) {
    .page-title {
        font-size: 1.8rem;
    }

    .communities-grid {
        grid-template-columns: 1fr;
    }

    .community-name {
        font-size: 1.2rem;
    }

    .community-badge {
        top: 0.75rem;
        right: 0.75rem;
        padding: 0.4rem 0.8rem;
        font-size: 0.75rem;
    }

    .community-image-container {
        height: 200px;
    }
}

/* Filter and Search Styles (if added in future) */
.communities-filters {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 2rem;
    gap: 1rem;
    flex-wrap: wrap;
}

.search-box {
    flex: 1;
    max-width: 400px;
}

.search-input {
    width: 100%;
    padding: 0.75rem 1rem;
    border: 2px solid #e2e8f0;
    border-radius: 12px;
    font-size: 1rem;
    transition: all 0.3s ease;
}

.search-input:focus {
    border-color: hsl(213 71% 55%);
    box-shadow: 0 0 0 3px rgba(229, 62, 62, 0.1);
    outline: none;
}
</style>

<template>
    <Master>
        <!-- Hero Section -->
        <section class="communities-hero-section">
            <div class="container position-relative" style="z-index: 1;">
                <div class="hero-content">
                    <h1 class="page-title">New Home Communities!</h1>
                    <p class="page-subtitle">
                        Explore master-planned communities in the Las Vegas area
                    </p>
                </div>
            </div>

            <!-- Decorative Elements -->
            <div class="section-decoration decoration-1"></div>
            <div class="section-decoration decoration-2"></div>
        </section>

        <!-- Communities Grid Section -->
        <section class="communities-grid-section">
            <div class="container">
                <!-- Communities Grid -->
                <div v-if="Communities && Communities.length > 0" class="communities-grid">
                    <div
                        v-for="community in Communities"
                        :key="community.id"
                        class="community-card"
                    >
                        <!-- Image + Badge -->
                        <div class="community-image-container">
                            <img
                                :src="community.main_image ?? '/images/default_image.png'"
                                class="community-image"
                                :alt="community.name"
                                @error="setAltImg"
                            />
                            <span class="community-badge">
                                {{ community.homes_count }} Homes
                            </span>
                        </div>

                        <!-- Content -->
                        <div class="community-content">
                            <h2 class="community-name">{{ community.name }}</h2>

                            <div class="community-location" v-if="community.location">
                                <i class="bi bi-geo-alt"></i>
                                <span>{{ community.location }}</span>
                            </div>

                            <p class="community-description">
                                {{ community.description || `Discover the charm of ${community.name} with beautiful homes, thriving communities, and exceptional amenities in the heart of Las Vegas.` }}
                            </p>

                            <a
                                :href="'/detailed/community/' + community.id"
                                class="community-cta"
                            >
                                View Community
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Loading State -->
                <div v-else-if="!Communities" class="communities-loading">
                    <div v-for="n in 6" :key="n" class="community-card-loading"></div>
                </div>

                <!-- Empty State -->
                <div v-else class="empty-state">
                    <div class="empty-state-icon">
                        <i class="bi bi-building"></i>
                    </div>
                    <h3 class="empty-state-title">No Communities Available</h3>
                    <p class="empty-state-text">
                        We're currently updating our community listings. Please check back soon for the latest new home communities in Las Vegas.
                    </p>
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
