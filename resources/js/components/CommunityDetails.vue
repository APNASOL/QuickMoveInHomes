<style scoped>
/* Community Details Page */
.community-details-page {
    background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);
    min-height: 100vh;
}

/* Hero Section */
.community-hero-section {
    background: linear-gradient(
        135deg,
        rgba(26, 54, 93, 0.85) 0%,
        rgba(45, 55, 72, 0.75) 100%
    );
    padding: 3rem 0 0 0;
    position: relative;
    overflow: hidden;
}

.community-hero-section::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 1px;
    background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
}

.hero-content {
    padding: 2rem 0;
}

.community-name {
    font-size: 3rem;
    font-weight: 700;
    color: white;
    margin-bottom: 0.5rem;
    text-transform: uppercase;
    letter-spacing: 1px;
}

.community-location {
    font-size: 1.3rem;
    color: rgba(255, 255, 255, 0.8);
    margin-bottom: 0;
}

/* Image Gallery */
.image-gallery-section {
    margin-top: 0;
}

.carousel-container {
    border-radius: 0 0 20px 20px;
    overflow: hidden;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
}

.community-image {
    width: 100%;
    height: 500px;
    object-fit: cover;
}

.no-image-placeholder {
    height: 500px;
    background: linear-gradient(135deg, #e2e8f0, #cbd5e0);
    display: flex;
    align-items: center;
    justify-content: center;
    color: #64748b;
    font-size: 1.2rem;
    border-radius: 0 0 20px 20px;
}

/* Main Content Section */
.main-content-section {
    padding: 4rem 0;
}

.content-card {
    background: white;
    border-radius: 20px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
    border: 1px solid #f1f5f9;
    overflow: hidden;
}

.content-header {
    padding: 2.5rem 2.5rem 0 2.5rem;
}

.section-title {
    font-size: 2.2rem;
    font-weight: 700;
    color: #1a365d;
    margin-bottom: 1rem;
    position: relative;
}

.section-title::after {
    content: '';
    position: absolute;
    bottom: -8px;
    left: 0;
    width: 50px;
    height: 3px;
    background: linear-gradient(
  to right,
  hsl(213 71% 45%),  /* lighter */
  hsl(213 71% 30%)   /* darker */
);
    border-radius: 2px;
}

.community-description {
    font-size: 1.1rem;
    color: #64748b;
    line-height: 1.7;
    margin-bottom: 2rem;
}

/* Tabs Styling */
.community-tabs {
    padding: 0 2.5rem;
}

.nav-tabs {
    border-bottom: 2px solid #e2e8f0;
    gap: 1rem;
}

.nav-tabs .nav-link {
    border: none;
    background: transparent;
    color: #64748b;
    font-weight: 600;
    font-size: 1rem;
    padding: 1rem 1.5rem;
    border-radius: 12px 12px 0 0;
    transition: all 0.3s ease;
    position: relative;
}

.nav-tabs .nav-link:hover {
    color: #1a365d;
    background: #f8fafc;
}

.nav-tabs .nav-link.active {
    color: hsl(213 71% 30%);
    background: white;
    border-bottom: 3px solid hsl(213 71% 30%);
}

.tab-content {
    padding: 2.5rem;
    background: #fafbfc;
    border-radius: 0 0 20px 20px;
}

.tab-pane {
    animation: fadeIn 0.5s ease-in;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(10px); }
    to { opacity: 1; transform: translateY(0); }
}

/* Info Grid */
.info-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 1.5rem;
}

.info-item {
    background: white;
    padding: 1.5rem;
    border-radius: 12px;
    border: 1px solid #f1f5f9;
    transition: all 0.3s ease;
}

.info-item:hover {
    border-color: hsl(213 71% 30%);
    transform: translateY(-2px);
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
}

.info-label {
    font-weight: 600;
    color: #1a365d;
    margin-bottom: 0.5rem;
    font-size: 0.9rem;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.info-value {
    color: #64748b;
    font-size: 1rem;
    line-height: 1.4;
}

/* Sidebar */
.sidebar-card {
    background: white;
    border-radius: 20px;
    padding: 2rem;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
    border: 1px solid #f1f5f9;
    height: fit-content;
    position: sticky;
    top: 2rem;
}

.sidebar-title {
    font-size: 1.3rem;
    font-weight: 700;
    color: #1a365d;
    margin-bottom: 1.5rem;
    position: relative;
}

.sidebar-title::after {
    content: '';
    position: absolute;
    bottom: -8px;
    left: 0;
    width: 30px;
    height: 2px;
    background: linear-gradient(
  to right,
  hsl(213 71% 45%),  /* lighter */
  hsl(213 71% 30%)   /* darker */
);
    border-radius: 2px;
}

.amenities-list, .neighborhoods-list {
    list-style: none;
    padding: 0;
    margin: 0;
}

.amenities-list li, .neighborhoods-list li {
    padding: 0.75rem 0;
    border-bottom: 1px solid #f1f5f9;
    color: #64748b;
    display: flex;
    align-items: center;
    gap: 0.5rem;
}

.amenities-list li:last-child, .neighborhoods-list li:last-child {
    border-bottom: none;
}

.amenities-list li::before {
    content: '✓';
    color: hsl(213 71% 30%);
    font-weight: bold;
}

/* Homes Section */
.homes-section {
    background: white;
    padding: 4rem 0;
    margin-top: 2rem;
}

.section-header {
    text-align: center;
    margin-bottom: 3rem;
}

.homes-title {
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
    text-transform: uppercase;
    letter-spacing: 2px;
}

.homes-subtitle {
    font-size: 1.1rem;
    color: #64748b;
    max-width: 600px;
    margin: 0 auto;
}

.homes-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 2rem;
}

/* Carousel Customization */
.carousel__prev,
.carousel__next {
    background: rgba(255, 255, 255, 0.2) !important;
    border: 2px solid rgba(255, 255, 255, 0.3) !important;
    border-radius: 50% !important;
    width: 50px !important;
    height: 50px !important;
    backdrop-filter: blur(10px);
    transition: all 0.3s ease !important;
}

.carousel__prev:hover,
.carousel__next:hover {
    background: hsl(213 71% 30%) !important;
    border-color: hsl(213 71% 45%) !important;
    transform: scale(1.1);
}

.carousel__icon {
    fill: white !important;
}

/* Decorative Elements */
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
    .community-hero-section {
        padding: 2rem 0 0 0;
    }

    .community-name {
        font-size: 2.2rem;
    }

    .community-location {
        font-size: 1.1rem;
    }

    .community-image {
        height: 300px;
    }

    .no-image-placeholder {
        height: 300px;
    }

    .main-content-section {
        padding: 2rem 0;
    }

    .content-header,
    .community-tabs,
    .tab-content {
        padding: 1.5rem;
    }

    .section-title {
        font-size: 1.8rem;
    }

    .homes-section {
        padding: 2rem 0;
    }

    .homes-title {
        font-size: 2rem;
    }

    .nav-tabs .nav-link {
        padding: 0.75rem 1rem;
        font-size: 0.9rem;
    }
}

@media (max-width: 576px) {
    .community-name {
        font-size: 1.8rem;
    }

    .info-grid {
        grid-template-columns: 1fr;
    }

    .homes-grid {
        grid-template-columns: 1fr;
    }

    .sidebar-card {
        padding: 1.5rem;
    }
}

/* Loading States */
.skeleton-loading {
    background: linear-gradient(90deg, #f0f0f0 25%, #e0e0e0 50%, #f0f0f0 75%);
    background-size: 200% 100%;
    animation: loading 1.5s infinite;
}

@keyframes loading {
    0% { background-position: 200% 0; }
    100% { background-position: -200% 0; }
}
</style>

<template>
    <Master>
        <div class="community-details-page">
            <!-- Hero Section -->
            <section class="community-hero-section">
                <div class="container position-relative" style="z-index: 1;">
                    <div class="hero-content">
                        <h1 class="community-name">{{ community_details.name }}</h1>
                        <p class="community-location">{{ community_details.location }}</p>
                    </div>
                </div>

                <!-- Decorative Elements -->
                <div class="section-decoration decoration-1"></div>
                <div class="section-decoration decoration-2"></div>
            </section>

            <!-- Image Gallery -->
            <section class="image-gallery-section">
                <div class="container">
                    <div class="carousel-container">
                        <Carousel
                            v-if="communityImages.length > 1"
                            v-model="currentSlide"
                            :items-to-show="1"
                            :wrap-around="true"
                            :transition="500"
                            id="gallery"
                        >
                            <Slide
                                v-for="(file, idx) in communityImages"
                                :key="file.id || idx"
                            >
                                <img
                                    :src="file.file_name"
                                    :alt="file.file_original_name || 'Image ' + (idx + 1)"
                                    class="community-image"
                                    @error="setAltImg($event)"
                                />
                            </Slide>
                            <template #addons>
                                <Navigation />
                            </template>
                        </Carousel>

                        <!-- Single Image -->
                        <div v-else-if="communityImages.length === 1">
                            <img
                                :src="communityImages[0].file_name"
                                :alt="communityImages[0].file_original_name || 'Image'"
                                class="community-image"
                                @error="setAltImg($event)"
                            />
                        </div>

                        <!-- No Images -->
                        <div v-else class="no-image-placeholder">
                            <div class="text-center">
                                <i class="bi bi-image" style="font-size: 3rem; margin-bottom: 1rem;"></i>
                                <p>No images available for this community</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Main Content -->
            <section class="main-content-section">
                <div class="container">
                    <div class="row g-4">
                        <!-- Left Column - Main Content -->
                        <div :class="hasSidebar ? 'col-lg-8' : 'col-12'">
                            <div class="content-card">
                                <div class="content-header">
                                    <h2 class="section-title">About {{ community_details.name }}</h2>
                                    <p class="community-description">
                                        {{ community_details.description }}
                                    </p>
                                </div>

                                <!-- Tabs -->
                                <div class="community-tabs">
                                    <ul class="nav nav-tabs" id="communityTabs" role="tablist">
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link active" id="location-tab" data-bs-toggle="tab" data-bs-target="#location" type="button" role="tab">
                                                Location and Info
                                            </button>
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link" id="hoa-tab" data-bs-toggle="tab" data-bs-target="#hoa" type="button" role="tab">
                                                HOA and Fees
                                            </button>
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link" id="proximity-tab" data-bs-toggle="tab" data-bs-target="#proximity" type="button" role="tab">
                                                Proximity
                                            </button>
                                        </li>
                                    </ul>
                                </div>

                                <!-- Tabs Content -->
                                <div class="tab-content">
                                    <!-- Location and Info -->
                                    <div class="tab-pane fade show active" id="location" role="tabpanel">
                                        <h5 class="mb-4">Location and Community Information</h5>
                                        <div class="info-grid">
                                            <div class="info-item">
                                                <div class="info-label">Map Location</div>
                                                <div class="info-value">{{ community_details.map_location ?? "Not specified" }}</div>
                                            </div>
                                            <div class="info-item">
                                                <div class="info-label">Legal Subdivision</div>
                                                <div class="info-value">{{ community_details.legal_subdivision ?? "Not specified" }}</div>
                                            </div>
                                            <div class="info-item">
                                                <div class="info-label">Nearby Properties</div>
                                                <div class="info-value">{{ community_details.nearby_properties ?? "Not specified" }}</div>
                                            </div>
                                            <div class="info-item">
                                                <div class="info-label">Masterplan</div>
                                                <div class="info-value">{{ community_details.masterplan ?? "Not specified" }}</div>
                                            </div>
                                            <div class="info-item">
                                                <div class="info-label">Sub Association</div>
                                                <div class="info-value">{{ community_details.sub_association ? "Yes" : "No" }}</div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- HOA and Fees -->
                                    <div class="tab-pane fade" id="hoa" role="tabpanel">
                                        <h5 class="mb-4">HOA and Community Fees</h5>
                                        <div class="info-grid">
                                            <div class="info-item">
                                                <div class="info-label">HOA</div>
                                                <div class="info-value">{{ community_details.hoa ?? "Not specified" }}</div>
                                            </div>
                                            <div class="info-item">
                                                <div class="info-label">SID/LID Fee</div>
                                                <div class="info-value">${{ community_details.sid_lid_fee ?? "Not specified" }}</div>
                                            </div>
                                            <div class="info-item">
                                                <div class="info-label">Payment Frequency</div>
                                                <div class="info-value">{{ community_details.sid_lid_payment_frequency ?? "Not specified" }}</div>
                                            </div>
                                            <div class="info-item">
                                                <div class="info-label">CIC</div>
                                                <div class="info-value">{{ community_details.cic ? "Yes" : "No" }}</div>
                                            </div>
                                            <div class="info-item">
                                                <div class="info-label">LID</div>
                                                <div class="info-value">{{ community_details.lid ? "Yes" : "No" }}</div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Proximity -->
                                    <div class="tab-pane fade" id="proximity" role="tabpanel">
                                        <h5 class="mb-4">Location Proximity</h5>
                                        <div class="info-grid">
                                            <div class="info-item">
                                                <div class="info-label">To Las Vegas Strip</div>
                                                <div class="info-value">{{ community_details.proximity_to_strip ?? "Not specified" }} miles</div>
                                            </div>
                                            <div class="info-item">
                                                <div class="info-label">To Airport</div>
                                                <div class="info-value">{{ community_details.proximity_to_airport ?? "Not specified" }} miles</div>
                                            </div>
                                            <div class="info-item" style="grid-column: 1 / -1;">
                                                <div class="info-label">Nearby Attractions</div>
                                                <div class="info-value">{{ community_details.nearby_attractions ?? "Not specified" }}</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Right Column - Sidebar -->
                        <div v-if="hasSidebar" class="col-lg-4">
                            <div class="sidebar-card">
                                <!-- Amenities -->
                                <div v-if="community_details.amenities?.length" class="mb-4">
                                    <h6 class="sidebar-title">Community Amenities</h6>
                                    <ul class="amenities-list">
                                        <li v-for="(item, index) in community_details.amenities" :key="index">
                                            {{ item }}
                                        </li>
                                    </ul>
                                </div>

                                <!-- Neighborhoods -->
                                <div v-if="community_details.neighborhoods?.length" class="mb-4">
                                    <h6 class="sidebar-title">Neighborhoods</h6>
                                    <ul class="neighborhoods-list">
                                        <li v-for="(item, index) in community_details.neighborhoods" :key="index">
                                            {{ item }}
                                        </li>
                                    </ul>
                                </div>

                                <!-- HOA Info -->
                                <div v-if="community_details.hoa">
                                    <h6 class="sidebar-title">HOA Information</h6>
                                    <p class="info-value">{{ community_details.hoa }}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Homes in Community -->
            <section class="homes-section">
                <div class="container">
                    <div class="section-header">
                        <h2 class="homes-title">HOMES IN COMMUNITY</h2>
                        <p class="homes-subtitle">
                            Discover available properties in {{ community_details.name }}
                        </p>
                    </div>

                    <div class="homes-grid">
                        <a
                            v-for="home in community_homes"
                            :key="home.id"
                            :href="'/home-details/' + home.property_id"
                            class="text-decoration-none"
                        >
                            <GlobalCard
                                :badge="home.is_open_house == 1 ? 'Open House' : 'Quick Move In'"
                                :badge2="home.incentive ? 'Incentive Home' : ''"
                                :main_image="home.main_image ?? '/images/default_image.png'"
                                :title="home.title"
                                :address="home.address"
                                :property_id="home.property_id"
                                :bedrooms="home.bedrooms"
                                :price="home.price"
                                :bathrooms="home.bathrooms"
                                :square_feet="home.square_feet"
                                :garages="home.garages"
                            />
                        </a>
                    </div>

                    <!-- Empty State for Homes -->
                    <div v-if="community_homes.length === 0" class="text-center py-5">
                        <div class="no-image-placeholder" style="height: 200px; border-radius: 20px;">
                            <div>
                                <i class="bi bi-house" style="font-size: 3rem; margin-bottom: 1rem;"></i>
                                <p>No homes currently available in this community</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </Master>
</template>

<script>
import Master from "@components/layout/Master.vue";
import Multiselect from "@vueform/multiselect";
import { Carousel, Slide, Pagination, Navigation } from "vue3-carousel";
import "vue3-carousel/dist/carousel.css";

export default {
    components: {
        Master,
        Carousel,
        Slide,
        Pagination,
        Navigation,
        Multiselect,
    },
    props: ["community_id"],
    created() {
        this.fetchCommunityDetails();
    },
    mounted() {
        this.getThisCommunityAllHomes();
    },
    data() {
        return {
            logo: external_website.white_logo,
            name: external_website.name,
            logged_in_user: logged_in_user,
            currentSlide: 0,
            community_details: [],
            community_homes: [],
            formErrors: [],
        };
    },
    computed: {
        communityImages() {
            const files = Array.isArray(this.community_details?.files)
                ? this.community_details.files
                : [];
            return files
                .filter((f) => f && f.file_name)
                .map((f) => ({
                    id: f.id ?? null,
                    file_name: f.file_name,
                    file_original_name: f.file_original_name || "",
                }));
        },
        hasSidebar() {
            return (
                (this.community_details.amenities && this.community_details.amenities.length > 0) ||
                (this.community_details.neighborhoods && this.community_details.neighborhoods.length > 0) ||
                (this.community_details.hoa && this.community_details.hoa !== 'Nil')
            );
        }
    },
    methods: {
        fetchCommunityDetails() {
            axios
                .get(`/api/get-community-details/${this.community_id}`)
                .then((response) => {
                    this.community_details = response.data;
                    this.getThisCommunityAllHomes();
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        getThisCommunityAllHomes() {
            axios
                .get(`/api/fetch-community-all-homes/${this.community_id}`)
                .then((response) => {
                    this.community_homes = response.data;
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
};
</script>
