<template>
    <Master>
        <div class="property-detail-section">
            <div>
                <div class="info-overlay">
                    <div class="d-flex justify-content-between container">
                        <div>
                            <h1 class="uppercase c-main-title">
                                {{ community_details.name }}
                            </h1>
                            <h4>
                                {{ community_details.location }}
                            </h4>
                        </div>
                    </div>
                </div>

                <div class="container">
                    <!-- 2+ images: carousel -->
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
                                :alt="
                                    file.file_original_name ||
                                    'Image ' + (idx + 1)
                                "
                                class="img-fluid c-img-filter c-images-border-design w-100"
                                style="height: 500px; object-fit: cover"
                                @error="setAltImg($event)"
                            />
                        </Slide>
                        <template #addons>
                            <Navigation />
                            <!-- <Pagination /> -->
                        </template>
                    </Carousel>

                    <!-- exactly 1 image -->
                    <div v-else-if="communityImages.length === 1">
                        <img
                            :src="communityImages[0].file_name"
                            :alt="
                                communityImages[0].file_original_name || 'Image'
                            "
                            class="img-fluid c-img-filter c-images-border-design w-100"
                            style="height: 500px; object-fit: cover"
                            @error="setAltImg($event)"
                        />
                    </div>

                    <!-- none -->
                    <!-- <div
                        v-else
                        class="d-flex align-items-center justify-content-center bg-light"
                        style="height: 500px; border-radius: 12px"
                    >
                        <span class="text-muted">No images available</span>
                    </div> -->
                </div>

                <div class="interactive-open-house-banner mb-2 rounded-lg shadow-lg bg-white p-4 border border-gray-300">
                    <div class="container">
                        <div class="row g-4">
                            <!-- Left Column (Main Content) -->
                            <div :class="hasSidebar ? 'col-md-8' : 'col-md-12'">
                                <div
                                    class="card border-0 shadow-lg rounded-4 p-4 h-100"
                                >
                                    <h2 class="fw-bold text-dark mb-3">
                                        About {{ community_details.name }}
                                    </h2>
                                    <p class="text-muted">
                                        {{ community_details.description }}
                                    </p>

                                    <!-- Tabs -->
                                    <ul
                                        class="nav nav-tabs mt-4 border-bottom"
                                        id="communityTabs"
                                        role="tablist"
                                    >
                                        <li
                                            class="nav-item"
                                            role="presentation"
                                        >
                                            <button
                                                class="nav-link active fw-semibold"
                                                id="location-tab"
                                                data-bs-toggle="tab"
                                                data-bs-target="#location"
                                                type="button"
                                                role="tab"
                                            >
                                                Location and Info
                                            </button>
                                        </li>
                                        <li
                                            class="nav-item"
                                            role="presentation"
                                        >
                                            <button
                                                class="nav-link fw-semibold"
                                                id="hoa-tab"
                                                data-bs-toggle="tab"
                                                data-bs-target="#hoa"
                                                type="button"
                                                role="tab"
                                            >
                                                HOA and Fees
                                            </button>
                                        </li>
                                        <li
                                            class="nav-item"
                                            role="presentation"
                                        >
                                            <button
                                                class="nav-link fw-semibold"
                                                id="proximity-tab"
                                                data-bs-toggle="tab"
                                                data-bs-target="#proximity"
                                                type="button"
                                                role="tab"
                                            >
                                                Proximity
                                            </button>
                                        </li>
                                    </ul>

                                    <!-- Tabs Content -->
                                    <div class="tab-content mt-4">
                                        <!-- Location and Info -->
                                        <div
                                            class="tab-pane fade show active"
                                            id="location"
                                            role="tabpanel"
                                        >
                                            <h5
                                                class="mb-3 text-primary fw-semibold c-title"
                                            >
                                                Location and Info
                                            </h5>
                                            <div class="row">
                                                <div class="col-md-6 mb-2">
                                                    <strong>Map:</strong>
                                                    {{
                                                        community_details.map_location ??
                                                        "Nil"
                                                    }}
                                                </div>
                                                <div class="col-md-6 mb-2">
                                                    <strong
                                                        >Legal
                                                        Subdivision:</strong
                                                    >
                                                    {{
                                                        community_details.legal_subdivision ??
                                                        "Nil"
                                                    }}
                                                </div>
                                                <div class="col-md-6 mb-2">
                                                    <strong
                                                        >Nearby
                                                        Properties:</strong
                                                    >
                                                    {{
                                                        community_details.nearby_properties ??
                                                        "Nil"
                                                    }}
                                                </div>
                                                <div class="col-md-6 mb-2">
                                                    <strong>Masterplan:</strong>
                                                    {{
                                                        community_details.masterplan ??
                                                        "Nil"
                                                    }}
                                                </div>
                                                <div class="col-md-6 mb-2">
                                                    <strong
                                                        >Sub
                                                        Association:</strong
                                                    >
                                                    {{
                                                        community_details.sub_association
                                                            ? "Yes"
                                                            : "No"
                                                    }}
                                                </div>
                                            </div>
                                        </div>

                                        <!-- HOA and Fees -->
                                        <div
                                            class="tab-pane fade"
                                            id="hoa"
                                            role="tabpanel"
                                        >
                                            <h5
                                                class="mb-3 text-primary fw-semibold c-title"
                                            >
                                                HOA and Fees
                                            </h5>
                                            <div class="row">
                                                <div class="col-md-6 mb-2">
                                                    <strong>HOA:</strong>
                                                    {{
                                                        community_details.hoa ??
                                                        "Nil"
                                                    }}
                                                </div>
                                                <div class="col-md-6 mb-2">
                                                    <strong
                                                        >SID/LID Fee:</strong
                                                    >
                                                    ${{
                                                        community_details.sid_lid_fee ??
                                                        "Nil"
                                                    }}
                                                </div>
                                                <div class="col-md-6 mb-2">
                                                    <strong
                                                        >Payment
                                                        Frequency:</strong
                                                    >
                                                    {{
                                                        community_details.sid_lid_payment_frequency ??
                                                        "Nil"
                                                    }}
                                                </div>
                                                <div class="col-md-6 mb-2">
                                                    <strong>CIC:</strong>
                                                    {{
                                                        community_details.cic
                                                            ? "Yes"
                                                            : "No"
                                                    }}
                                                </div>
                                                <div class="col-md-6 mb-2">
                                                    <strong>LID:</strong>
                                                    {{
                                                        community_details.lid
                                                            ? "Yes"
                                                            : "No"
                                                    }}
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Proximity -->
                                        <div
                                            class="tab-pane fade"
                                            id="proximity"
                                            role="tabpanel"
                                        >
                                            <h5
                                                class="mb-3 text-primary fw-semibold c-title"
                                            >
                                                Proximity
                                            </h5>
                                            <div class="row">
                                                <div class="col-md-6 mb-2">
                                                    <strong>To Strip:</strong>
                                                    {{
                                                        community_details.proximity_to_strip ??
                                                        "Nil"
                                                    }}
                                                    miles
                                                </div>
                                                <div class="col-md-6 mb-2">
                                                    <strong>To Airport:</strong>
                                                    {{
                                                        community_details.proximity_to_airport ??
                                                        "Nil"
                                                    }}
                                                    miles
                                                </div>
                                                <div class="col-md-12 mb-2">
                                                    <strong
                                                        >Nearby
                                                        Attractions:</strong
                                                    >
                                                    {{
                                                        community_details.nearby_attractions ??
                                                        "Nil"
                                                    }}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Right Column (Sidebar) -->
                            <div v-if="hasSidebar" class="col-md-4">
                                <div
                                    class="card border-0 shadow-lg rounded-4 p-4 h-100"
                                >
                                    <div
                                        v-if="
                                            community_details.amenities?.length
                                        "
                                    >
                                        <h6 class="fw-bold text-muted">
                                            Amenities
                                        </h6>
                                        <ul class="list-unstyled small">
                                            <li
                                                v-for="(
                                                    item, index
                                                ) in community_details.amenities"
                                                :key="index"
                                            >
                                                {{ item }}
                                            </li>
                                        </ul>
                                        <hr />
                                    </div>

                                    <div
                                        v-if="
                                            community_details.neighborhoods
                                                ?.length
                                        "
                                    >
                                        <h6 class="fw-bold text-muted">
                                            Neighborhoods
                                        </h6>
                                        <ul class="list-unstyled small">
                                            <li
                                                v-for="(
                                                    item, index
                                                ) in community_details.neighborhoods"
                                                :key="index"
                                            >
                                                {{ item }}
                                            </li>
                                        </ul>
                                        <hr />
                                    </div>

                                    <div v-if="community_details.hoa">
                                        <h6 class="fw-bold text-muted">HOA</h6>
                                        <p class="mb-0 small">
                                            {{ community_details.hoa }}
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid interactive-banner mt-3">
                <h1>HOMES IN COMMUNITY</h1>
            </div>

            <div class="container pt-3">
                <div class="row">
                    <div
                        v-for="home in community_homes"
                        :key="home.id"
                        class="col-md-3 mb-3"
                    >
                        <a
                            class="text-decoration-none"
                            :href="'/home-details/' + home.property_id"
                        >
                            <GlobalCard
                                :badge="
                                    home.is_open_house == 1
                                        ? 'Open House'
                                        : 'Quick Move In'
                                "
                                :badge2="home.incentive ? 'Incentive Home' : ''"
                                :main_image="
                                    home.main_image ??
                                    '/images/default_image.png'
                                "
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
                </div>
            </div>
        </div>
    </Master>
</template>

<script>
import Master from "@components/layout/Master.vue";
import Multiselect from "@vueform/multiselect";
import { addMonths, startOfMonth, endOfMonth } from "date-fns";

import { Carousel, Slide, Pagination, Navigation } from "vue3-carousel";
import ProceedComponent from "@components/ProceedComponent.vue";

import "vue3-carousel/dist/carousel.css";
export default {
    components: {
        Master,
        Carousel,
        Slide,
        Pagination,
        Navigation,
        Multiselect,

        ProceedComponent,
    },
    props: ["community_id"],
    created() {
        this.fetchCommunityDetails();
        this.backgroundImage = this.community_details.property_main_image;
    },
    mounted() {
        this.getThisCommunityAllHomes(); // Fetch community homes data
    },
    //     mounted() {
    //     this.initMap();
    //   },
    data() {
        return {
            map: null,
            markers: [],
            logo: external_website.white_logo,
            name: external_website.name,
            logged_in_user: logged_in_user,
            settings: {
                itemsToShow: 1,
                autoplay: 3500,
                wrapAround: true,
                dir: "rtl",
                // snapAlign: 'center',
            },

            backgroundImage: "",
            maxWords: 50,

            community_details: [],

            community_homes: [],

            formErrors: [],
            currentSlide: 0,
        };
    },
    computed: {
        communityImages() {
            const files = Array.isArray(this.community_details?.files)
                ? this.community_details.files
                : [];
            return files
                .filter((f) => f && f.file_name) // must have a src
                .map((f) => ({
                    id: f.id ?? null,
                    file_name: f.file_name, // ensure full URL from API
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
        initMap() {
            const mapOptions = {
                center: { lat: 36.1699, lng: -115.1398 }, // Center the map to a default location or use first home's coordinates
                zoom: 10,
            };

            // Initialize the Google Map
            this.map = new google.maps.Map(this.$refs.map, mapOptions);

            // Add markers to the map after fetching community homes
            this.addMarkers();
        },

        addMarkers() {
            // Check if community_homes have data
            if (this.community_homes.length === 0) {
                console.warn("No community homes available to add markers.");
                return;
            }

            this.community_homes.forEach((home) => {
                const markerData = {
                    lat: parseFloat(home.latitude), // Assuming latitude is part of the home object
                    lng: parseFloat(home.longitude), // Assuming longitude is part of the home object
                    title: home.title,
                    description: home.description,
                    url: "/home-details/" + home.property_id || "#", // Default to "#" if no URL is provided
                };

                const marker = new google.maps.Marker({
                    position: { lat: markerData.lat, lng: markerData.lng },
                    map: this.map,
                    title: markerData.title,
                    icon: {
                        url: "https://img.icons8.com/3d-fluency/94/home.png",
                        scaledSize: new google.maps.Size(50, 50),
                    },
                });

                const infoWindow = new google.maps.InfoWindow({
                    content: `<div><h4>${markerData.title}</h4>
                    <p>${markerData.description}</p></div>`,
                });

                marker.addListener("mouseover", () => {
                    infoWindow.open(this.map, marker);
                });

                marker.addListener("mouseout", () => {
                    infoWindow.close();
                });

                marker.addListener("click", () => {
                    window.location.href = markerData.url; // Redirect to the URL
                });
            });
        },
        // Method to set the current image based on thumbnail click
        setCurrentSlide(index) {
            this.currentIndex = index;
        },
        // Go to the previous image
        prevSlide() {
            if (this.currentIndex > 0) {
                this.currentIndex--;
            }
        },
        // Go to the next image
        nextSlide() {
            if (this.currentIndex < this.community_details.files.length - 1) {
                this.currentIndex++;
            }
        },
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
                    this.community_homes = response.data; // Update community homes data
                    this.initMap(); // Initialize map after fetching homes
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },

        setAltImg(event) {
            event.target.src = "/images/default_image.png";
        },
        formatPrice(price) {
            return Math.floor(price).toLocaleString(); // Removes the decimal portion
        },
    },
};
</script>

<style scoped>
@import "@vueform/multiselect/themes/default.css";

.title {
    font-size: 24px;
    margin: 0;
}
</style>

<style scoped>
.uppercase {
    text-transform: uppercase;
}
.top-section {
    position: relative;
    height: 300px; /* Adjust height as needed */
    background-size: cover;
    background-position: center;
    color: white;
    display: flex;
    width: 100%;
    align-items: flex-end;
}

.info-overlay {
    background: #f7fafc;
    padding: 10px;
    width: 100%;
    border-radius: 0px !important;
    font-family: "Playfair Display", serif;
    font-size: 30px;
    font-weight: 700;
    line-height: 36px;
    color: rgb(23, 38, 54);
}
.info-card-overlay {
    background: #01060d9d;
    padding: 10px;
    width: 100%;
    border-radius: 0px !important;
}

.master_plan {
    font-size: 20px;
    margin: 5px 0;
}

.property-detail-section {
    background-color: #f1f1f1 !important;
}

.feature-title {
    font-size: 2.25rem;
    color: #002856 !important;
    font-weight: 300 !important;
}
.c-feature-title {
    color: #002856 !important;
    font-weight: 300 !important;
    font-size: 1.25rem;
    margin-top: 4px;
}
.text-justify {
    text-align: justify;
}

.carousel {
    overflow: hidden;
}
.c-slide-div {
    position: absolute;
    top: 35%;
    left: 5%;
    text-align: left;
    color: white;
    display: flex;
    flex-direction: column;
    gap: 5px !important;
}
.c-slide-div > button {
    width: fit-content;
}

.c-carousel-text {
    position: absolute;
    padding: 70px;
    color: white;
    font-size: 50px;
    font-weight: bold;
}

.interactive-banner {
    background-color: #023F86;
    color: white;
    text-align: center;
    padding: 20px 0;
}
.interactive-banner h1 {
    letter-spacing: 0.15em;
}
.feature-title {
    font-size: 2.25rem;
    color: #002856 !important;
    font-weight: 300 !important;
}
.c-card-img-overlay-name {
    top: unset;
    bottom: 120px;
    text-align: left;
    color: white;
}
.info-card-overlay {
    background: #bcd6f5b2;
    padding: 10px;
    width: 100%;
    border-radius: 0px !important;
}
.open-house-tag {
    background-color: #023F86;
    color: white;
    padding: 5px 10px;
    font-size: 14px;
    font-weight: bold;
    border-radius: 10px;
}
.blurred-content {
    filter: blur(4px);
    color: rgba(0, 0, 0, 0.3);
    background-color: #f0f0f0;
    padding: 10px;
    border-radius: 5px;
}
.blurred-box {
    margin-top: 10px;
    padding: 15px;
    background-color: #e0e0e0;
    text-align: center;
    font-size: 14px;
    color: rgba(0, 0, 0, 0.5);
    border-radius: 5px;
}
.placeholder-title {
    font-weight: bold;
    font-size: 18px;
    color: #333;
    margin-bottom: 10px;
}
.card-img-top {
    height: 240px;
    object-fit: cover;
}
.c-description {
    font-family: Inter, sans-serif;
    font-size: 16px;
    font-weight: 400;
    line-height: 24px;
    color: #023F86;
}
.card {
    border: none;
}
.card-body {
    padding: 0;
}

.section-title {
    font-size: 1.75rem;
    font-weight: 700;
    color: #2d6a9f;
    border-bottom: 3px solid #2d6a9f;
    padding-bottom: 0.5rem;
    margin-bottom: 1.5rem;
}

.sub-section-title {
    font-family: "Playfair Display", serif;
    font-size: 20px;
    font-weight: 600;
    line-height: 28px;
    color: rgb(23, 38, 54);
}

.list-group-item {
    border: none;
    font-family: Inter, sans-serif;
    font-size: 16px;
    font-weight: 400;
    line-height: 24px;
    color: #023F86;
    margin: 0 !important;
}

.c-tab-title {
    font-family: "Playfair Display", serif;
    font-size: 20px;
    font-weight: 600;
    line-height: 28px;
    color: rgb(23, 38, 54);
}
.bi-check2-circle {
    color: #023F86;
}
.c-card-main {
    font-family: "Playfair Display", serif;
    font-size: 30px;
    font-weight: 700;
    line-height: 36px;
    color: rgb(45, 106, 159) !important ;
}

.nav-tabs .nav-link {
    color: #023F86 !important;
    font-weight: bold !important;
}
.nav-tabs {
    background-color: #ffffff !important;
}
.card {
    display: flex;
    flex-direction: column;
    height: 100%;
}

.card-body {
    flex-grow: 1;
}
</style>
