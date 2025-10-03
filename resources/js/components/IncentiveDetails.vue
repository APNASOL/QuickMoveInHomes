<template>
    <Master>
        <!-- Hero Section -->
        <section class="incentives-hero-section">
            <div class="container position-relative" style="z-index: 1">
                <div class="hero-content">
                    <h1 class="page-title">Exclusive Incentives for You!</h1>
                    <p class="page-subtitle">
                        Discover amazing deals and financial benefits tailored just for you.
                    </p>
                </div>
            </div>

            <!-- Decorative Elements -->
            <div class="section-decoration decoration-1"></div>
            <div class="section-decoration decoration-2"></div>
        </section>

        <!-- Incentive Details Section -->
        <section class="content-section">
            <div class="container">
                <div class="content-card">
                    <div class="incentive-detail-section">
                        <div class="row align-items-center">
                            <!-- Left Content -->
                            <div class="col-lg-6">
                                <div class="incentive-content">
                                    <h2 class="section-title mb-4">{{ incentive.title }}</h2>
                                    <div class="incentive-description ql-editor" v-html="incentive.description"></div>

                                    <div class="incentive-meta">
                                        <div class="meta-grid">
                                            <div class="meta-item">
                                                <div class="meta-icon">
                                                    <i class="bi bi-calendar-check"></i>
                                                </div>
                                                <div class="meta-content">
                                                    <span class="meta-label">Starts</span>
                                                    <span class="meta-value">{{ formatDate(incentive.start_date) }}</span>
                                                </div>
                                            </div>
                                            <div class="meta-item">
                                                <div class="meta-icon">
                                                    <i class="bi bi-calendar-x"></i>
                                                </div>
                                                <div class="meta-content">
                                                    <span class="meta-label">Ends</span>
                                                    <span class="meta-value">{{ formatDate(incentive.end_date) }}</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div v-if="incentive.interest_rate_first_year" class="rate-badge">
                                            <div class="rate-icon">
                                                <i class="bi bi-percent"></i>
                                            </div>
                                            <div class="rate-content">
                                                <span class="rate-label">1st Year Interest Rate</span>
                                                <span class="rate-value">{{ incentive.interest_rate_first_year }}%</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Right Image -->
                            <div class="col-lg-6">
                                <div class="incentive-image-wrapper">
                                    <img
                                        :src="incentive_banner || '/images/default_image.png'"
                                        class="incentive-image"
                                        :alt="incentive.title"
                                        @error="setAltImg"
                                    />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- More Incentives Section -->
        <section class="content-section pt-0">
            <div class="container">
                <div class="content-card">
                    <div class="section-header">
                        <div class="section-icon">
                            <i class="bi bi-stars"></i>
                        </div>
                        <h2 class="section-title">More Exclusive Incentives</h2>
                    </div>

                    <div v-if="incentives && incentives.length" class="incentives-grid">
                        <div
                            class="incentive-card"
                            v-for="single_incentive in incentives.filter(i => i.id !== incentive.id)"
                            :key="single_incentive.id"
                        >
                            <div class="card-image">
                                <a :href="'/detailed-incentive/' + single_incentive.id">
                                    <img
                                        :src="single_incentive.incentive_banner ?? '/images/default_image.png'"
                                        :alt="single_incentive.title"
                                        @error="setAltImg"
                                    />
                                </a>
                            </div>

                            <div class="card-content">
                                <a :href="'/detailed-incentive/' + single_incentive.id" class="card-title-link">
                                    <h3 class="card-title">{{ single_incentive.title }}</h3>
                                </a>

                                <div class="card-description ql-editor">
                                    <span v-html="getTruncatedDescription(single_incentive)"></span>
                                    <span
                                        v-if="single_incentive.description.length > 200"
                                        class="read-more"
                                        @click="toggleDescription(single_incentive.id)"
                                    >
                                        {{
                                            showFullDescription[single_incentive.id]
                                                ? "Show Less"
                                                : "Read More"
                                        }}
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </Master>
</template>

<script>
import Master from "@components/layout/Master.vue";
import axios from "axios";

export default {
    components: {
        Master,
    },
    props: ["incentive_id"],
    created() {
        this.fetchIncentiveDetails();
        this.incentivesFetch();
    },
    data() {
        return {
            incentive: {},
            incentive_banner: "",
            incentives: [],
            showFullDescription: {},
        };
    },
    methods: {
        fetchIncentiveDetails() {
            axios
                .get("/api/incentive-details-fetch/" + this.incentive_id)
                .then((response) => {
                    this.incentive = response.data.incentive;
                    this.incentive_banner = response.data.incentive_banner;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        incentivesFetch() {
            axios
                .get("/api/fetch-sorted-incentives/" + "Name")
                .then((response) => {
                    this.incentives = response.data;

                    // Initialize showFullDescription for each incentive
                    this.incentives.forEach((incentive) => {
                        this.$set(
                            this.showFullDescription,
                            incentive.id,
                            false
                        );
                    });
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },

        setAltImg(event) {
            event.target.src = "/images/default_image.png";
        },

        formatDate(date) {
            const options = { year: "numeric", month: "long", day: "numeric" };
            return new Date(date).toLocaleDateString(undefined, options);
        },
        toggleDescription(eventId) {
            // Toggle full description visibility
            this.showFullDescription[eventId] =
                !this.showFullDescription[eventId];
        },

        getTruncatedDescription(incentive) {
            // Display full description if toggled, otherwise truncate
            return this.showFullDescription[incentive.id]
                ? incentive.description
                : incentive.description.slice(0, 200) + "...";
        },
    },
};
</script>

<style scoped>
/* Hero Section */
.incentives-hero-section {
    background: linear-gradient(
        135deg,
        rgba(26, 54, 93, 0.85) 0%,
        rgba(45, 55, 72, 0.75) 100%
    );
    padding: 4rem 0;
    position: relative;
    overflow: hidden;
}

.incentives-hero-section::before {
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
    background: linear-gradient(
        to right,
        hsl(213 71% 45%),
        hsl(213 71% 30%)
    );
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

/* Incentive Detail Section */
.incentive-detail-section {
    padding: 2rem 0;
}

.incentive-content {
    padding-right: 3rem;
}

.section-title {
    font-size: 2.2rem;
    font-weight: 700;
    color: #1a365d;
    margin-bottom: 1.5rem;
}

.incentive-description {
    color: #64748b;
    line-height: 1.7;
    font-size: 1.1rem;
    margin-bottom: 2.5rem;
}

.incentive-meta {
    display: flex;
    flex-direction: column;
    gap: 1.5rem;
}

.meta-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 1rem;
}

.meta-item {
    display: flex;
    align-items: center;
    gap: 1rem;
    padding: 1.5rem;
    background: #f8fafc;
    border-radius: 12px;
    border: 1px solid #e2e8f0;
    transition: all 0.3s ease;
}

.meta-item:hover {
    border-color: hsl(213 71% 45%);
    transform: translateY(-2px);
}

.meta-icon {
    width: 48px;
    height: 48px;
    background: linear-gradient(
        to right,
        hsl(213 71% 45%),
        hsl(213 71% 30%)
    );
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-size: 1.2rem;
    flex-shrink: 0;
}

.meta-content {
    display: flex;
    flex-direction: column;
}

.meta-label {
    font-size: 0.9rem;
    color: #64748b;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.meta-value {
    font-size: 1.1rem;
    color: #1a365d;
    font-weight: 600;
}

.rate-badge {
    display: flex;
    align-items: center;
    gap: 1rem;
    padding: 1.5rem;
    background: linear-gradient(135deg, #f0f9ff, #e0f2fe);
    border-radius: 12px;
    border: 1px solid #bae6fd;
}

.rate-icon {
    width: 48px;
    height: 48px;
    background: linear-gradient(
        to right,
        hsl(213 71% 45%),
        hsl(213 71% 30%)
    );
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-size: 1.2rem;
    flex-shrink: 0;
}

.rate-content {
    display: flex;
    flex-direction: column;
}

.rate-label {
    font-size: 0.9rem;
    color: #0369a1;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.rate-value {
    font-size: 1.5rem;
    color: #0369a1;
    font-weight: 700;
}

/* Incentive Image */
.incentive-image-wrapper {
    position: relative;
    border-radius: 20px;
    overflow: hidden;
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
}

.incentive-image {
    width: 100%;
    height: 400px;
    object-fit: cover;
    transition: transform 0.3s ease;
}

.incentive-image:hover {
    transform: scale(1.02);
}

/* More Incentives Section */
.section-header {
    display: flex;
    align-items: flex-start;
    gap: 1rem;
    margin-bottom: 3rem;
}

.section-icon {
    width: 48px;
    height: 48px;
    background: linear-gradient(
        to right,
        hsl(213 71% 45%),
        hsl(213 71% 30%)
    );
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-size: 1.5rem;
    flex-shrink: 0;
}

/* Incentives Grid */
.incentives-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
    gap: 2rem;
}

.incentive-card {
    background: #f8fafc;
    border-radius: 16px;
    padding: 1.5rem;
    border: 1px solid #e2e8f0;
    transition: all 0.3s ease;
    position: relative;
    overflow: hidden;
}

.incentive-card:hover {
    border-color: hsl(213 71% 45%);
    transform: translateY(-5px);
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
}

.incentive-card::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 4px;
    height: 100%;
    background: linear-gradient(
        to right,
        hsl(213 71% 45%),
        hsl(213 71% 30%)
    );
    border-radius: 2px 0 0 2px;
}

.card-image {
    border-radius: 12px;
    overflow: hidden;
    margin-bottom: 1.5rem;
}

.card-image img {
    width: 100%;
    height: 200px;
    object-fit: cover;
    transition: transform 0.3s ease;
}

.card-image:hover img {
    transform: scale(1.05);
}

.card-title-link {
    text-decoration: none;
}

.card-title {
    font-size: 1.3rem;
    font-weight: 700;
    color: #1a365d;
    margin-bottom: 1rem;
    line-height: 1.3;
    transition: color 0.3s ease;
}

.card-title:hover {
    color: hsl(213 71% 45%);
}

.card-description {
    color: #64748b;
    line-height: 1.6;
    font-size: 0.95rem;
}

.read-more {
    color: hsl(213 71% 45%);
    cursor: pointer;
    font-weight: 600;
    margin-top: 0.5rem;
    display: inline-block;
    transition: color 0.3s ease;
}

.read-more:hover {
    color: hsl(213 71% 30%);
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

.incentive-card {
    animation: fadeInUp 0.6s ease-out;
}

.incentive-card:nth-child(1) { animation-delay: 0.1s; }
.incentive-card:nth-child(2) { animation-delay: 0.2s; }
.incentive-card:nth-child(3) { animation-delay: 0.3s; }

/* Responsive Design */
@media (max-width: 768px) {
    .incentives-hero-section {
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

    .incentive-content {
        padding-right: 0;
        margin-bottom: 2rem;
    }

    .meta-grid {
        grid-template-columns: 1fr;
    }

    .section-header {
        flex-direction: column;
        gap: 1rem;
    }

    .section-title {
        font-size: 1.8rem;
    }

    .incentives-grid {
        grid-template-columns: 1fr;
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

    .incentive-image {
        height: 300px;
    }
}
</style>
