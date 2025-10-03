<style scoped>
/* Incentives Page Styles */
.incentives-hero {
    background: linear-gradient(
        135deg,
        rgba(26, 54, 93, 0.85) 0%,
        rgba(45, 55, 72, 0.75) 100%
    );
    padding: 4rem 0;
    position: relative;
    overflow: hidden;
}

.incentives-hero::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 1px;
    background: linear-gradient(90deg, transparent, #e2e8f0, transparent);
}

.hero-title {
    font-size: 3rem;
    font-weight: 700;
    background: white;
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    margin-bottom: 1.5rem;
    line-height: 1.1;
}

.hero-subtitle {
    font-size: 1.3rem;
    color: white;
    line-height: 1.6;
    margin-bottom: 0;
}

/* Incentives Content Section */
.incentives-content {
    padding: 4rem 0;
    background: white;
}

.section-title {
    font-size: 2.5rem;
    font-weight: 700;
    color: #1a365d;
    margin-bottom: 1rem;
    text-align: center;
}

.section-subtitle {
    font-size: 1.1rem;
    color: #64748b;
    text-align: center;
    margin-bottom: 3rem;
    line-height: 1.6;
}

/* Sort By Section */
.sort-section {
    display: flex;
    justify-content: flex-end;
    align-items: center;
    margin-bottom: 3rem;
    padding: 1.5rem;
    background: #f8fafc;
    border-radius: 12px;
    border: 1px solid #e2e8f0;
}

.sort-label {
    font-weight: 600;
    color: #1a365d;
    margin-right: 1rem;
    margin-bottom: 0;
}

/* Multiselect Customization */
.multiselect {
    min-width: 200px;
}

:deep(.multiselect) {
    border: 2px solid #e2e8f0;
    border-radius: 8px;
    transition: all 0.3s ease;
}

:deep(.multiselect:focus) {
    border-color: #1a365d;
    box-shadow: 0 0 0 3px rgba(26, 54, 93, 0.1);
}

:deep(.multiselect-option) {
    padding: 0.75rem 1rem;
}

:deep(.multiselect-option.is-selected) {
    background: #1a365d;
    color: white;
}

/* Incentives Grid */
.incentives-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(380px, 1fr));
    gap: 2rem;
    margin-bottom: 3rem;
}

.incentive-card {
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

.incentive-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
    border-color: hsl(213 71% 45%);
}

.incentive-image {
    width: 100%;
    height: 240px;
    object-fit: cover;
    transition: transform 0.5s ease;
}

.incentive-card:hover .incentive-image {
    transform: scale(1.05);
}

.incentive-content {
    padding: 1.5rem;
    flex-grow: 1;
    display: flex;
    flex-direction: column;
}

.incentive-title {
    font-size: 1.4rem;
    font-weight: 700;
    color: #1a365d;
    margin-bottom: 1rem;
    text-align: center;
    line-height: 1.3;
    text-decoration: none;
    transition: color 0.3s ease;
}

.incentive-title:hover {
    color: hsl(213 71% 45%);
}

.incentive-description {
    color: #64748b;
    line-height: 1.6;
    flex-grow: 1;
    margin-bottom: 1rem;
}

/* Read More/Less Button */
.read-more {
    color: hsl(213 71% 45%);
    cursor: pointer;
    font-weight: 600;
    font-size: 0.9rem;
    transition: all 0.3s ease;
    display: inline-block;
    margin-top: 0.5rem;
}

.read-more:hover {
    color: hsl(213 71% 45%);
    transform: translateX(2px);
}

/* No Results State */
.no-results {
    text-align: center;
    padding: 4rem 2rem;
    background: #f8fafc;
    border-radius: 16px;
    border: 2px dashed #e2e8f0;
}

.no-results h4 {
    color: #64748b;
    font-size: 1.5rem;
    margin-bottom: 1rem;
}

.no-results p {
    color: #94a3b8;
    margin-bottom: 0;
}

/* Decorative Elements */
.decoration {
    position: absolute;
    width: 200px;
    height: 200px;
    background: linear-gradient(135deg, rgba(229, 62, 62, 0.1), rgba(26, 54, 93, 0.05));
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
    .incentives-hero {
        padding: 3rem 0;
    }

    .hero-title {
        font-size: 2.2rem;
    }

    .hero-subtitle {
        font-size: 1.1rem;
        padding: 0 1rem;
    }

    .incentives-content {
        padding: 3rem 0;
    }

    .section-title {
        font-size: 2rem;
    }

    .section-subtitle {
        font-size: 1rem;
        padding: 0 1rem;
    }

    .sort-section {
        flex-direction: column;
        align-items: stretch;
        gap: 1rem;
    }

    .sort-label {
        margin-right: 0;
        text-align: center;
    }

    .incentives-grid {
        grid-template-columns: 1fr;
        gap: 1.5rem;
    }

    .incentive-content {
        padding: 1.25rem;
    }
}

@media (max-width: 576px) {
    .hero-title {
        font-size: 1.8rem;
    }

    .section-title {
        font-size: 1.8rem;
    }

    .incentives-grid {
        grid-template-columns: 1fr;
    }

    .incentive-title {
        font-size: 1.2rem;
    }

    .incentive-image {
        height: 200px;
    }
}

/* Loading State */
.incentive-card.loading {
    opacity: 0.7;
    pointer-events: none;
}

.incentive-card.loading::after {
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

/* QL Editor Content Styling */
:deep(.ql-editor) {
    padding: 0 !important;
    font-family: inherit !important;
}

:deep(.ql-editor p) {
    margin-bottom: 1rem;
}

:deep(.ql-editor p:last-child) {
    margin-bottom: 0;
}
</style>

<template>
    <Master>
        <!-- Hero Section -->
        <section class="incentives-hero">
            <div class="decoration decoration-1"></div>
            <div class="decoration decoration-2"></div>

            <div class="container position-relative" style="z-index: 1;">
                <div class="row align-items-center">
                    <div class="col-12 text-center">
                        <h1 class="hero-title">
                            Builder Incentives for Your Dream Home
                        </h1>
                        <p class="hero-subtitle">
                            Discover how builder incentives make your move-in ready home
                            more affordable and feature-rich
                        </p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Incentives Content -->
        <section class="incentives-content">
            <div class="container">
                <!-- Sort Section -->
                <div class="sort-section">
                    <p class="sort-label">Incentive Sort By</p>
                    <div class="multiselect-container">
                        <Multiselect
                            v-model="sort_by"
                            :options="sortingOptions"
                            :placeholder="translate('Sort by')"
                            :searchable="true"
                            @select="incentivesFetch(sort_by)"
                            class="multiselect"
                        />
                    </div>
                </div>

                <!-- Section Header -->
                <div class="section-header">
                    <h2 class="section-title">
                        Valuable Incentives Available Now
                    </h2>
                    <p class="section-subtitle">
                        Builders offer these incentives on quick move-in homes to
                        make your homebuying experience more rewarding and affordable
                    </p>
                </div>

                <!-- Incentives Grid -->
                <div v-if="incentives && incentives.length" class="incentives-grid">
                    <div
                        class="incentive-card"
                        v-for="incentive in incentives"
                        :key="incentive.id"
                    >
                        <a
                            :href="'/detailed-incentive/' + incentive.id"
                            class="text-decoration-none"
                        >
                            <img
                                :src="incentive.incentive_banner ?? '/images/default_image.png'"
                                class="incentive-image"
                                :alt="incentive.title"
                                @error="setAltImg"
                            />
                        </a>

                        <div class="incentive-content">
                            <a
                                :href="'/detailed-incentive/' + incentive.id"
                                class="incentive-title text-decoration-none"
                            >
                                {{ incentive.title }}
                            </a>

                            <div class="incentive-description ql-editor">
                                <span v-html="getTruncatedDescription(incentive)"></span>
                                <span
                                    v-if="incentive.description.length > 200"
                                    class="read-more"
                                    @click="toggleDescription(incentive.id)"
                                >
                                    {{
                                        showFullDescription[incentive.id]
                                            ? "Show Less"
                                            : "Read More"
                                    }}
                                </span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- No Results -->
                <div v-else class="no-results">
                    <h4>No incentives found</h4>
                    <p>Try adjusting your sort criteria or check back later for new incentives.</p>
                </div>
            </div>
        </section>
    </Master>
</template>

<script>
import Master from "@components/layout/Master.vue";
import Multiselect from "@vueform/multiselect";
import axios from "axios";

export default {
    components: {
        Master,
        Multiselect,
    },

    created() {
        this.incentivesFetch("Name");
    },

    data() {
        return {
            incentives: [],
            showFullDescription: {},
            sortingOptions: [
                "Name",
                "Interest rate",
                "Low to High",
                "High to Low",
            ],
            sort_by: "",
        };
    },

    methods: {
        incentivesFetch(sorting_option) {
            axios
                .get("/api/fetch-sorted-incentives/" + sorting_option)
                .then((response) => {
                    this.incentives = response.data;
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

        toggleDescription(eventId) {
            this.showFullDescription[eventId] =
                !this.showFullDescription[eventId];
        },

        getTruncatedDescription(incentive) {
            return this.showFullDescription[incentive.id]
                ? incentive.description
                : incentive.description.slice(0, 200) + "...";
        },
    },
};
</script>
