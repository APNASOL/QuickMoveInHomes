<template>
    <Master>
        <div class="property-detail-section">
            <div class="property-detail-section">
                <div
                    class="top-section"
                    :style="{
                        backgroundImage: `url(${community_details.banner})`,
                    }"
                >
                    <div class="info-overlay">
                        <div class="d-flex justify-content-between container">
                            <div>
                                <h1 class="title">
                                    {{ community_details.name }}
                                </h1>
                                <span class="icon">📍</span
                                >{{ community_details.location }}
                                <!-- <a
                                    :href="`https://www.google.com/maps/search/?api=1&query=${encodeURIComponent(
                                        community_details.map_location
                                    )}`"
                                    class="map-link"
                                    target="_blank"
                                >
                                    Map & Directions
                                </a> -->
                            </div>
                            <div class="location">
                                <h3 class="master_plan">
                                    Master Plan <br />
                                    {{ community_details.masterplan }}
                                </h3>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <!-- Property Details Section at the top -->
                    <div class="row">
                        <div class="col-md-8 mt-4">
                            <p class=" ">
                                {{ community_details.description }}
                            </p>
                        </div>
                        <div
                            class="col-md-4 p-2"
                            v-if="logged_in_user && !logged_in_user.agreement"
                        >
                            <h5 class="mt-3 c-theme-color">
                                Access to full community information is
                                available once a contract is signed while
                                selecting your home.
                            </h5>
                        </div>
                        <!-- <div class="col-md-4 p-2">
                            <div
                                v-if="
                                    logged_in_user &&
                                    logged_in_user.role === 'customer'
                                "
                            >
                                <ProceedComponent
                                    :home_id="home_id"
                                    :user_status="'logedin'"
                                    :user_name="logged_in_user.name"
                                    :page="'community'"
                                />
                            </div>
                            <div v-else>
                                <ProceedComponent />
                            </div>
                        </div> -->
                    </div>

                    <!-- Middle Section: Image Carousel and Highlights in Two Columns -->
                    <div class="middle-section row mt-4">
                        <!-- Image Carousel in col-8 -->
                        <div class="col-12 col-md-8">
                            <div class="mt-2">
                                <!-- Main Carousel -->
                                <Carousel
                                    :wrapAround="true"
                                    :transition="500"
                                    id="gallery"
                                    :items-to-show="1"
                                    :wrap-around="false"
                                    v-model="currentSlide"
                                >
                                    <!-- Main Image Slides -->
                                    <Slide
                                        v-for="(
                                            file, index
                                        ) in community_details.files"
                                        :key="index"
                                    >
                                        <img
                                            :src="file.file_name"
                                            :alt="file.file_original_name"
                                            class="img-fluid c-img-filter c-images-border-design"
                                            style="
                                                max-width: 100%;
                                                height: 400px;
                                                object-fit: cover;
                                            "
                                            @error="setAltImg"
                                        />
                                    </Slide>
                                    <template #addons>
                                        <Navigation />
                                        <Pagination />
                                    </template>
                                </Carousel>

                                <!-- Thumbnails Carousel -->
                                <Carousel
                                    id="thumbnails"
                                    :items-to-show="4"
                                    :wrap-around="true"
                                    v-model="currentSlide"
                                    ref="carousel"
                                >
                                    <!-- Thumbnail Images -->
                                    <Slide
                                        v-for="(
                                            file, index
                                        ) in community_details.files"
                                        :key="index"
                                    >
                                        <div
                                            class="carousel__item"
                                            @click="slideTo(index)"
                                            style="cursor: pointer"
                                        >
                                            <img
                                                :src="file.file_name"
                                                :alt="file.file_original_name"
                                                class="img-fluid"
                                                style="
                                                    max-height: 100px;
                                                    object-fit: cover;
                                                "
                                            />
                                        </div>
                                    </Slide>
                                </Carousel>
                            </div>
                        </div>

                        <!-- Community Highlights and Sales Office in col-4 -->
                        <div class="col-12 col-md-4">
                            <!-- Community Highlights Section -->
                            <div class="highlights">
                                <h4 class="feature-title">HIGHLIGHTS</h4>

                                <!-- Show actual data if user is logged in and not a customer -->
                                <div
                                     
                                >
                                    <div
                                        v-if="
                                            community_details.amenities &&
                                            community_details.amenities.length >
                                                0
                                        "
                                    >
                                        <div class="open-house-tag mb-2">
                                            <i
                                                class="bi bi-wifi text-warning fs-5"
                                            ></i
                                            ><span class="ms-2">
                                                Amenities
                                            </span>
                                        </div>
                                        <ul type="none">
                                            <li
                                                v-for="(
                                                    amenity, index
                                                ) in community_details.amenities"
                                                :key="index"
                                            >
                                                {{ amenity }}
                                            </li>
                                        </ul>
                                    </div>
                                    <div
                                        v-if="
                                            community_details.neighborhoods &&
                                            community_details.neighborhoods
                                                .length > 0
                                        "
                                    >
                                        <div class="open-house-tag mb-2">
                                            <i
                                                class="bi bi-house-check-fill text-warning fs-5"
                                            ></i
                                            ><span class="ms-2">
                                                Neighborhoods
                                            </span>
                                        </div>
                                        <ul type="none">
                                            <li
                                                v-for="(
                                                    neighborhood, index
                                                ) in community_details.neighborhoods"
                                                :key="index"
                                            >
                                                {{ neighborhood }}
                                            </li>
                                        </ul>
                                    </div>
                                    <div
                                        v-if="
                                            community_details.regions &&
                                            community_details.regions.length > 0
                                        "
                                    >
                                        <div class="open-house-tag mb-2">
                                            <i
                                                class="bi bi-map text-warning fs-5"
                                            ></i
                                            ><span class="ms-2"> Regions </span>
                                        </div>
                                        <ul type="none">
                                            <li
                                                v-for="(
                                                    region, index
                                                ) in community_details.regions"
                                                :key="index"
                                            >
                                                {{ region }}
                                            </li>
                                        </ul>
                                    </div>
                                    <div>
                                        <div class="open-house-tag mb-2">
                                            <i
                                                class="bi bi-building text-warning fs-5"
                                            ></i
                                            ><span class="ms-2"> HOA </span>
                                        </div>
                                        <ul type="none">
                                            <li>{{ community_details.hoa }}</li>
                                        </ul>
                                    </div>
                                    <!-- <div>
                                        <div class="open-house-tag mb-2">
                                            <i
                                                class="bi bi-building text-warning fs-5"
                                            ></i
                                            ><span class="ms-2">
                                                Builder
                                            </span>
                                        </div>
                                        <ul style="list-style-type: none">
                                            
                                            <li
                                                v-for="builder in community_details.builders"
                                                :key="builder.id"
                                            >
                                                {{ builder }}
                                                 
                                            </li>
                                        </ul>
                                    </div> -->
                                </div>

                                <!-- Blurred placeholder when user is a customer or not logged in -->
                                <!-- <div v-else class="blurred-content">
                                    <div class="placeholder-title">
                                        HIGHLIGHTS
                                    </div>
                                    <div class="blurred-box">
                                        Amenities details are available upon
                                        request.
                                    </div>
                                    <div class="blurred-box">
                                        Neighborhoods details are available upon
                                        request.
                                    </div>
                                    <div class="blurred-box">
                                        Regions details are available upon
                                        request.
                                    </div>
                                    <div class="blurred-box">
                                        HOA information is available upon
                                        request.
                                    </div>
                                </div> -->
                            </div>
                        </div>
                    </div>

                    <div class="card mt-4">
                        <div class="card-body">
                            <h2 class="feature-title">
                                            Community Details
                                        </h2>
                            <div class="row">
                                            <!-- Basic Community Details Section -->
                                            <div class="col-6">
                                                <h5 class="c-feature-title">
                                                    Location & Info
                                                </h5>
                                                <p>
                                                    <strong
                                                        >Map Location:</strong
                                                    >
                                                    {{
                                                        community_details.map_location ||
                                                        "N/A"
                                                    }}
                                                </p>
                                                <p>
                                                    <strong
                                                        >Legal
                                                        Subdivision:</strong
                                                    >
                                                    {{
                                                        community_details.legal_subdivision ||
                                                        "N/A"
                                                    }}
                                                </p>
                                                <p>
                                                    <strong
                                                        >Nearby
                                                        Properties:</strong
                                                    >
                                                    {{
                                                        community_details.nearby_properties ||
                                                        "N/A"
                                                    }}
                                                </p>
                                                <p>
                                                    <strong>Masterplan:</strong>
                                                    {{
                                                        community_details.masterplan ||
                                                        "N/A"
                                                    }}
                                                </p>
                                                <p>
                                                    <strong
                                                        >Sub
                                                        Association:</strong
                                                    >
                                                    {{
                                                        community_details.sub_association
                                                            ? "Yes"
                                                            : "No"
                                                    }}
                                                </p>
                                            </div>

                                            <!-- HOA & Fees Section -->
                                            <div class="col-6">
                                                <h5 class="c-feature-title">
                                                    HOA & Fees
                                                </h5>
                                                <p>
                                                    <strong>HOA:</strong>
                                                    {{
                                                        community_details.hoa ||
                                                        "N/A"
                                                    }}
                                                </p>
                                                <p>
                                                    <strong
                                                        >SID/LID Fee:</strong
                                                    >
                                                    ${{
                                                        community_details.sid_lid_fee ||
                                                        "N/A"
                                                    }}
                                                </p>
                                                <p>
                                                    <strong
                                                        >Payment
                                                        Frequency:</strong
                                                    >
                                                    {{
                                                        community_details.sid_lid_payment_frequency ||
                                                        "N/A"
                                                    }}
                                                </p>
                                                <p>
                                                    <strong>CIC:</strong>
                                                    {{
                                                        community_details.cic
                                                            ? "Yes"
                                                            : "No"
                                                    }}
                                                </p>
                                                <p>
                                                    <strong>LID:</strong>
                                                    {{
                                                        community_details.lid
                                                            ? "Yes"
                                                            : "No"
                                                    }}
                                                </p>
                                            </div>

                                            <!-- Proximity Section -->
                                            <div class="col-6">
                                                <h5 class="c-feature-title">
                                                    Proximity
                                                </h5>
                                                <p>
                                                    <strong
                                                        >Proximity to
                                                        Strip:</strong
                                                    >
                                                    {{
                                                        community_details.proximity_to_strip ||
                                                        "N/A"
                                                    }}
                                                    miles
                                                </p>
                                                <p>
                                                    <strong
                                                        >Proximity to
                                                        Airport:</strong
                                                    >
                                                    {{
                                                        community_details.proximity_to_airport ||
                                                        "N/A"
                                                    }}
                                                    miles
                                                </p>
                                                <p>
                                                    <strong
                                                        >Nearby
                                                        Attractions:</strong
                                                    >
                                                    {{
                                                        community_details.nearby_attractions ||
                                                        "N/A"
                                                    }}
                                                </p>
                                            </div>

                                            <!-- Amenities Section -->
                                            <div class="col-6">
                                                <h5 class="c-feature-title">
                                                    Amenities
                                                </h5>
                                                <p>
                                                    <strong>Amenities:</strong>
                                                    {{
                                                        community_details.amenities
                                                            ? community_details.amenities.join(
                                                                  ", "
                                                              )
                                                            : "N/A"
                                                    }}
                                                </p>
                                            </div>

                                            <!-- Regions Section -->
                                            <div class="col-6">
                                                <h5 class="c-feature-title">
                                                    Regions
                                                </h5>
                                                <p>
                                                    {{
                                                        community_details.regions
                                                            ? community_details.regions.join(
                                                                  ", "
                                                              )
                                                            : "N/A"
                                                    }}
                                                </p>
                                            </div>

                                            <!-- Neighborhoods Section -->
                                            <div class="col-6">
                                                <h5 class="c-feature-title">
                                                    Neighborhoods
                                                </h5>
                                                <p>
                                                    {{
                                                        community_details.neighborhoods
                                                            ? community_details.neighborhoods.join(
                                                                  ", "
                                                              )
                                                            : "N/A"
                                                    }}
                                                </p>
                                            </div>
                                        </div>
                        </div>
                    </div>
                    <!-- <div class="middle-section row mt-2">
                        <div
                            class="accordion"
                            id="accordionExample"
                            v-if="logged_in_user && logged_in_user.agreement"
                        >
                            <div class="accordion-item">
                                <h2 class="accordion-header">
                                    <button
                                        class="accordion-button collapsed"
                                        type="button"
                                        data-bs-toggle="collapse"
                                        data-bs-target="#collapseCommunity"
                                        aria-expanded="true"
                                        aria-controls="collapseCommunity"
                                    >
                                        <h2 class="feature-title">
                                            Community Details
                                        </h2>
                                    </button>
                                </h2>
                                <div
                                    id="collapseCommunity"
                                    class="accordion-collapse collapse hide"
                                    data-bs-parent="#accordionExample"
                                >
                                    <div class="accordion-body">
                                        <div class="row">
                                             <div class="col-6">
                                                <h5 class="c-feature-title">
                                                    Location & Info
                                                </h5>
                                                <p>
                                                    <strong
                                                        >Map Location:</strong
                                                    >
                                                    {{
                                                        community_details.map_location ||
                                                        "N/A"
                                                    }}
                                                </p>
                                                <p>
                                                    <strong
                                                        >Legal
                                                        Subdivision:</strong
                                                    >
                                                    {{
                                                        community_details.legal_subdivision ||
                                                        "N/A"
                                                    }}
                                                </p>
                                                <p>
                                                    <strong
                                                        >Nearby
                                                        Properties:</strong
                                                    >
                                                    {{
                                                        community_details.nearby_properties ||
                                                        "N/A"
                                                    }}
                                                </p>
                                                <p>
                                                    <strong>Masterplan:</strong>
                                                    {{
                                                        community_details.masterplan ||
                                                        "N/A"
                                                    }}
                                                </p>
                                                <p>
                                                    <strong
                                                        >Sub
                                                        Association:</strong
                                                    >
                                                    {{
                                                        community_details.sub_association
                                                            ? "Yes"
                                                            : "No"
                                                    }}
                                                </p>
                                            </div>

                                             <div class="col-6">
                                                <h5 class="c-feature-title">
                                                    HOA & Fees
                                                </h5>
                                                <p>
                                                    <strong>HOA:</strong>
                                                    {{
                                                        community_details.hoa ||
                                                        "N/A"
                                                    }}
                                                </p>
                                                <p>
                                                    <strong
                                                        >SID/LID Fee:</strong
                                                    >
                                                    ${{
                                                        community_details.sid_lid_fee ||
                                                        "N/A"
                                                    }}
                                                </p>
                                                <p>
                                                    <strong
                                                        >Payment
                                                        Frequency:</strong
                                                    >
                                                    {{
                                                        community_details.sid_lid_payment_frequency ||
                                                        "N/A"
                                                    }}
                                                </p>
                                                <p>
                                                    <strong>CIC:</strong>
                                                    {{
                                                        community_details.cic
                                                            ? "Yes"
                                                            : "No"
                                                    }}
                                                </p>
                                                <p>
                                                    <strong>LID:</strong>
                                                    {{
                                                        community_details.lid
                                                            ? "Yes"
                                                            : "No"
                                                    }}
                                                </p>
                                            </div>

                                             <div class="col-6">
                                                <h5 class="c-feature-title">
                                                    Proximity
                                                </h5>
                                                <p>
                                                    <strong
                                                        >Proximity to
                                                        Strip:</strong
                                                    >
                                                    {{
                                                        community_details.proximity_to_strip ||
                                                        "N/A"
                                                    }}
                                                    miles
                                                </p>
                                                <p>
                                                    <strong
                                                        >Proximity to
                                                        Airport:</strong
                                                    >
                                                    {{
                                                        community_details.proximity_to_airport ||
                                                        "N/A"
                                                    }}
                                                    miles
                                                </p>
                                                <p>
                                                    <strong
                                                        >Nearby
                                                        Attractions:</strong
                                                    >
                                                    {{
                                                        community_details.nearby_attractions ||
                                                        "N/A"
                                                    }}
                                                </p>
                                            </div>

                                             <div class="col-6">
                                                <h5 class="c-feature-title">
                                                    Amenities
                                                </h5>
                                                <p>
                                                    <strong>Amenities:</strong>
                                                    {{
                                                        community_details.amenities
                                                            ? community_details.amenities.join(
                                                                  ", "
                                                              )
                                                            : "N/A"
                                                    }}
                                                </p>
                                            </div>

                                            <div class="col-6">
                                                <h5 class="c-feature-title">
                                                    Regions
                                                </h5>
                                                <p>
                                                    {{
                                                        community_details.regions
                                                            ? community_details.regions.join(
                                                                  ", "
                                                              )
                                                            : "N/A"
                                                    }}
                                                </p>
                                            </div>

                                             <div class="col-6">
                                                <h5 class="c-feature-title">
                                                    Neighborhoods
                                                </h5>
                                                <p>
                                                    {{
                                                        community_details.neighborhoods
                                                            ? community_details.neighborhoods.join(
                                                                  ", "
                                                              )
                                                            : "N/A"
                                                    }}
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div v-else>
                            <div class="open-house-tag mt-2">
                                Information is available upon request. Please
                                login first.
                            </div>
                            <div class="blurred-content">
                                <div class="blurred-box">
                                    Information is available upon request.
                                </div>
                            </div>
                        </div>
                    </div> -->
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
                                    home.is_open_house === 1
                                        ? 'Open House'
                                        : 'Quick Move In'
                                "
                                :main_image="
                                    home.main_image ?? '/images/default-home-image.png'
                                "
                                :title="home.title"
                                :address="home.address"
                                :bedrooms="home.bedrooms"
                                :price="home.price"
                                :bathrooms="home.bathrooms"
                                :square_feet="home.square_feet"
                                :garages="home.garages"
                            />
                            <!-- <div class="card c-border-design">
                                <img
                                    :src="
                                        home.main_image ?? '/images/default-home-image.png'
                                    "
                                    class="card-img-top c-card-img-border"
                                    :alt="home.title"
                                    @error="setAltImg"
                                />

                                <div
                                    v-if="home.is_open_house == 1"
                                    class="card-img-overlay c-card-img-overlay-flash-sale"
                                >
                                    <span
                                        class="badge rounded-pill bg-white text-dark"
                                        >Open House</span
                                    >
                                </div>

                                <div class="card-body text-start">
                                    <p>
                                        <span v-if="home.title"> 
                                            
                                            <b>{{ home.title }} </b><br />
                                        </span>
                                        
                                        <span v-if="home.square_feet"> 
                                            AREA (SQFT)
                                            <b>{{ home.square_feet }} </b><br />
                                        </span>
                                        <span v-if="home.bedrooms">
                                            Bedrooms
                                            <b>
                                                {{ home.bedrooms }}
                                            </b>
                                            <br />
                                        </span>
                                        <span v-if="home.property_type">
                                            Property type
                                            <b>{{ home.property_type }}</b>
                                            <br />
                                        </span>

                                        From
                                        <b>${{ formatPrice(home.price) }}</b>
                                    </p>
                                </div>
                            </div> -->
                        </a>
                    </div>
                </div>
            </div>
            <!-- <div
                class="container c-card-border-design mb-2"
                ref="map"
                style="height: 500px; width: 100%"
            ></div> -->
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
            event.target.src = "/images/default-home-image.png";
        },
        formatPrice(price) {
            return Math.floor(price); // Removes the decimal portion
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
    background: #01060d9d;
    padding: 10px;
    width: 100%;
    border-radius: 0px !important;
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
    border-radius: 25px;
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
    background-color: rgba(22, 50, 89, 255);
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
    background-color: rgba(22, 50, 89, 255);
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
</style>
