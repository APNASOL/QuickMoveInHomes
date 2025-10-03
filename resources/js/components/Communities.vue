<style scoped>
/* Communities Section */
.communities-section {
    background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);
    padding: 5rem 0;
    position: relative;
    overflow: hidden;
}

.communities-section::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 1px;
    background: linear-gradient(90deg, transparent, #e2e8f0, transparent);
}

.section-header {
    text-align: center;
    margin-bottom: 3rem;
}

.section-title {
    font-size: 2.5rem;
    font-weight: 700;
    background: linear-gradient(
        135deg,
        rgba(26, 54, 93, 0.85) 0%,
        rgba(45, 55, 72, 0.75) 100%
    );
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
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
    font-size: 1.1rem;
    color: #64748b;
    max-width: 600px;
    margin: 0 auto;
    line-height: 1.6;
}

/* Communities Grid */
.communities-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
    gap: 2rem;
    margin-bottom: 3rem;
}

.community-card {
    background: white;
    border-radius: 20px;
    overflow: hidden;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
    transition: all 0.3s ease;
    border: 1px solid #f1f5f9;
    height: 100%;
    display: flex;
    flex-direction: column;
}

.community-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
    border-color: hsl(213 71% 30%);
}

.community-image {
    height: 240px;
    width: 100%;
    object-fit: cover;
    transition: transform 0.5s ease;
}

.community-card:hover .community-image {
    transform: scale(1.05);
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
}

.community-description {
    color: #64748b;
    line-height: 1.5;
    margin-bottom: 1.5rem;
    flex-grow: 1;
}

.community-cta {
    background: linear-gradient(135deg, #e53e3e, #c53030);background: linear-gradient(
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

/* Explore More Button */
.explore-more {
    text-align: center;
}

.explore-btn {
    background: linear-gradient(135deg, #1a365d, #2d3748);
    border: none;
    border-radius: 12px;
    padding: 1rem 2.5rem;
    color: white;
    font-weight: 600;
    font-size: 1.1rem;
    text-decoration: none;
    transition: all 0.3s ease;
    display: inline-block;
    box-shadow: 0 4px 15px rgba(26, 54, 93, 0.3);
}

.explore-btn:hover {
    background: linear-gradient(135deg, #2d3748, #1a365d);
    transform: translateY(-3px);
    box-shadow: 0 8px 25px rgba(26, 54, 93, 0.4);
    color: white;
}

/* Loading State */
.community-card.loading {
    opacity: 0.7;
    pointer-events: none;
}

.community-card.loading::after {
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

/* Responsive Design */
@media (max-width: 768px) {
    .communities-section {
        padding: 3rem 0;
    }

    .section-title {
        font-size: 2rem;
    }

    .section-subtitle {
        font-size: 1rem;
        padding: 0 1rem;
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
    .section-title {
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
}

/* Decorative Elements */
.communities-section::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 1px;
    background: linear-gradient(90deg, transparent, #e2e8f0, transparent);
}
</style>

<template>
    <section class="communities-section" v-if="Communities && Communities.length > 0">
        <div class="container">
            <!-- Section Header -->
            <div class="section-header">
                <h1 class="section-title">
                    Find Your Place in Our Communities!
                </h1>
                <p class="section-subtitle">
                    Explore our vibrant communities and discover your next home in Las Vegas's most desirable neighborhoods.
                </p>
            </div>

            <!-- Communities Grid -->
            <div class="communities-grid">
                <div
                    v-for="community in Communities"
                    :key="community.id"
                    class="community-card"
                >
                    <!-- Image + Badge -->
                    <div class="position-relative overflow-hidden">
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
                        <h2 class="community-name">
                            {{ community.name }}
                        </h2>
                        <p class="community-description">
                            Discover the charm of {{ community.name }} with beautiful homes,
                            thriving communities, and exceptional amenities in the heart of Las Vegas.
                        </p>
                        <a
                            :href="'/detailed/community/' + community.id"
                            class="community-cta"
                        >
                            Explore Community
                        </a>
                    </div>
                </div>
            </div>

            <!-- Explore More Button -->
            <div class="explore-more">
                <a
                    href="/all/communities/"
                    class="explore-btn"
                >
                    Explore All Communities
                </a>
            </div>
        </div>
    </section>

    <!-- Loading State -->
    <section class="communities-section" v-else>
        <div class="container">
            <div class="section-header">
                <h1 class="section-title">
                    Find Your Place in Our Communities!
                </h1>
                <p class="section-subtitle">
                    Explore our vibrant communities and discover your next home.
                </p>
            </div>

            <div class="communities-grid">
                <div v-for="n in 3" :key="n" class="community-card loading">
                    <div class="position-relative overflow-hidden">
                        <div class="community-image" style="background: #f1f5f9;"></div>
                        <span class="community-badge">Loading...</span>
                    </div>
                    <div class="community-content">
                        <h2 class="community-name">Community Name</h2>
                        <p class="community-description">Community description loading...</p>
                        <a href="#" class="community-cta">Explore</a>
                    </div>
                </div>
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
