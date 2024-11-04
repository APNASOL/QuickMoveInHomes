<template>
    <Master>
        <div class="property-detail-section">
            <div class="property-detail-section" v-if="Home">
                <div
                    class="top-section"
                    :style="{
                        backgroundImage: `url(${Home.property_main_image})`,
                    }"
                >
                    <div class="info-overlay">
                        <div class="d-flex justify-content-between container">
                            <div>
                                <h2 class="title uppercase">
                                    {{ Home.title }}
                                </h2>
                                <span class="uppercase">
                                    {{ Home.property_type }}
                                </span>
                            </div>
                            <div class="uppercase">
                                <b>Starting at</b>

                                <span
                                    v-if="Home.new_price_after_incentive"
                                    class="price ms-2 text-danger mt-3"
                                >
                                    <del>${{ Home.price }}</del>
                                </span>
                                <span class="price ms-2 mt-3" v-else>
                                    <br />
                                    ${{ Home.price }}
                                </span>
                                <b v-if="Home.new_price_after_incentive">
                                    <br />
                                    after incentive</b
                                >
                                <span
                                    class="price ms-2"
                                    v-if="Home.new_price_after_incentive"
                                >
                                    ${{ Home.new_price_after_incentive }}
                                </span>
                            </div>
                        </div>
                    </div>
                </div>

                <div
                    class="container-fluid interactive-open-house-banner mt-3"
                    v-if="Home.is_open_house && Home.is_open_house != 0"
                >
                    <div class="banner-content p-2">
                        <div class="open-house-tag mb-2">OPEN HOUSE</div>
                        <p class="open_house_desc">
                            {{ Home.open_house_description }}
                        </p>
                        <p class="time">
                            <span class="icon"
                                ><i class="far fa-clock"></i
                            ></span>
                            {{ formatTime(Home.open_house_start_time) }} -
                            {{ formatTime(Home.open_house_end_time) }}
                        </p>
                        <p class="date">
                            <span class="icon"
                                ><i class="far fa-calendar-alt"></i
                            ></span>
                            {{ formatDate(Home.open_house_date) }}
                        </p>
                    </div>
                </div>

                <div class="container">
                    <!-- Property Details Section at the top -->
                    <div class="row">
                        <div class="col-md-8 p-5">
                            <div class="details-section">
                                <div
                                    class="details d-flex justify-content-between text-center"
                                >
                                    <div v-if="Home.square_feet">
                                        <strong class="feature-state">{{
                                            Home.square_feet
                                        }}</strong>
                                        <br />
                                        <i class="bi bi-input-cursor"></i> AREA
                                        (SQFT)
                                    </div>
                                    <div v-if="Home.bedrooms">
                                        <strong class="feature-state">{{
                                            Home.bedrooms
                                        }}</strong>
                                        <br />Bedrooms
                                    </div>

                                    <div
                                        v-if="
                                            Home.feature &&
                                            Home.feature.private_bath
                                        "
                                    >
                                        <strong class="feature-state">{{
                                            Home.feature.private_bath
                                        }}</strong>
                                        <br />Private Bathrooms
                                    </div>

                                    <div
                                        v-if="
                                            Home.feature &&
                                            Home.feature.parking_enclosure
                                        "
                                    >
                                        <strong class="feature-state">{{
                                            Home.feature.parking_enclosure
                                        }}</strong>
                                        <br />Parking enclosures
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4 p-2">
                            <div
                                v-if="
                                    logged_in_user &&
                                    logged_in_user.role === 'customer'
                                "
                            >
                                <h5
                                    class="mt-3 c-theme-color"
                                    v-if="
                                        logged_in_user &&
                                        !logged_in_user.agreement
                                    "
                                >
                                    To access all information, please sign a
                                    contract first while selecting your home.
                                </h5>
                                <ProceedComponent
                                    :home_id="home_id"
                                    :user_status="'logedin'"
                                    :user_name="logged_in_user.name"
                                />
                            </div>
                            <div v-else>
                                <ProceedComponent />
                            </div>
                        </div>
                    </div>

                    <!-- Middle Section: Image Carousel and Highlights in Two Columns -->
                    <div class="middle-section row">
                        <!-- Image Carousel in col-8 -->
                        <div class="col-8 col-md-8">
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
                                        v-for="(file, index) in Home.files"
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
                                        v-for="(file, index) in Home.files"
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
                        <div class="col-4 col-md-4">
                            <div class="highlights">
                                <h4 class="feature-title">HIGHLIGHTS</h4>

                                <!-- Show actual data if user is logged in and not a customer -->
                                <div
                                    v-if="
                                        logged_in_user &&
                                        logged_in_user.agreement
                                    "
                                >
                                    <div v-if="Home.incentive">
                                        <div class="banner-content">
                                            <div class="open-house-tag mb-2">
                                                AVAILABLE INCENTIVE
                                            </div>
                                            <div>
                                                <i
                                                    class="bi bi-check-lg text-warning fs-5 "
                                                ></i>
                                                <a
                                                    class="text-decoration-none c-anchor-style"
                                                    :href="
                                                        '/detailed-incentive/' +
                                                        incentive.id
                                                    "
                                                >
                                                    {{ incentive.title }}</a
                                                >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mt-2">
                                        <div class="open-house-tag mb-2">
                                            COMMUNITY
                                        </div>
                                        <i
                                            class="bi bi-check-lg text-warning fs-5"
                                        ></i>
                                        {{ Community.name }}<br />
                                        <i
                                            class="bi bi-list text-warning fs-5"
                                        ></i>
                                        {{ Community.description }}<br />
                                        <i
                                            class="bi bi-geo-alt-fill text-warning fs-5"
                                        ></i>
                                        {{ Community.location }}
                                    </div>
                                    <div class="highlights mt-2">
                                        <div>
                                            <div class="open-house-tag mb-2">
                                                LOCATION
                                            </div>
                                            <i
                                                class="bi bi-geo-alt-fill text-warning fs-5"
                                            ></i>
                                            {{ Home.address }}, {{ Home.city }},
                                            {{ Home.state }} {{ Home.zip_code }}
                                        </div>
                                    </div>
                                    <div class="highlights mt-2">
                                        <div>
                                            <div class="open-house-tag mb-2">
                                                SCHOOL
                                            </div>
                                            <i
                                                class="bi bi-buildings-fill text-warning fs-5"
                                            ></i>
                                            {{ Home.school_name }}
                                        </div>
                                    </div>
                                    <div class="highlights mt-2">
                                        <div>
                                            <div class="open-house-tag mb-2">
                                                HOA
                                            </div>
                                            <i
                                                class="bi bi-house text-warning fs-5"
                                            ></i>
                                            {{ Home.hoa_name }}
                                        </div>
                                    </div>
                                </div>

                                <!-- Blurred placeholder when user is a customer or not logged in -->
                                <div v-else>
                                    <div class="open-house-tag mb-2">
                                        Information is available upon request.
                                        Please login first.
                                    </div>
                                    <div class="blurred-content">
                                        <div class="blurred-box">
                                            Information is available upon
                                            request.
                                        </div>
                                        <div class="blurred-box">
                                            Details are available upon request.
                                        </div>
                                        <div class="blurred-box">
                                            Information is available upon
                                            request.
                                        </div>
                                        <div class="blurred-box">
                                            Information is available upon
                                            request.
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div
                        class="middle-section row mt-2"
                        v-if="logged_in_user && logged_in_user.agreement"
                    >
                        <h2 class="feature-state">SUMMARY</h2>
                        <p>
                            {{ Home.description }}
                        </p>
                    </div>

                    <div
                        class="accordion mt-2"
                        id="accordionExample"
                        v-if="logged_in_user && logged_in_user.agreement"
                    >
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button
                                    class="accordion-button collapsed"
                                    type="button"
                                    data-bs-toggle="collapse"
                                    data-bs-target="#collapseOne"
                                    aria-expanded="true"
                                    aria-controls="collapseOne"
                                >
                                    <h2 class="feature-state">FEATURES</h2>
                                </button>
                            </h2>
                            <div
                                id="collapseOne"
                                class="accordion-collapse collapse hide"
                                data-bs-parent="#accordionExample"
                            >
                                <div class="accordion-body">
                                    <div class="row">
                                        <!-- Closet Section -->
                                        <div class="col-4">
                                            <h5 class="c-feature-title">
                                                Closets
                                            </h5>
                                            <p>
                                                <strong
                                                    >Reach-In Closet:</strong
                                                >
                                                {{
                                                    Home.feature.reach_in
                                                        ? "Yes"
                                                        : "No"
                                                }}
                                            </p>
                                            <p>
                                                <strong>Walk-In Closet:</strong>
                                                {{
                                                    Home.feature.walk_in
                                                        ? "Yes"
                                                        : "No"
                                                }}
                                            </p>
                                            <p>
                                                <strong>Laundry Closet:</strong>
                                                {{
                                                    Home.feature.laundry_closet
                                                        ? "Yes"
                                                        : "No"
                                                }}
                                            </p>
                                            <p>
                                                <strong>Location:</strong>
                                                {{
                                                    Home.feature
                                                        .closet_location ||
                                                    "N/A"
                                                }}
                                            </p>
                                        </div>

                                        <!-- Bathroom Section -->
                                        <div class="col-4">
                                            <h5 class="c-feature-title">
                                                Bathroom
                                            </h5>
                                            <p>
                                                <strong>Type:</strong>
                                                {{
                                                    Home.feature
                                                        .bathroom_type || "N/A"
                                                }}
                                            </p>
                                            <p>
                                                <strong>Status:</strong>
                                                {{
                                                    Home.feature
                                                        .bathroom_status ||
                                                    "N/A"
                                                }}
                                            </p>
                                            <p>
                                                <strong>Private Bath:</strong>
                                                {{
                                                    Home.feature.private_bath
                                                        ? "Yes"
                                                        : "No"
                                                }}
                                            </p>
                                            <p>
                                                <strong>Outdoor Shower:</strong>
                                                {{
                                                    Home.feature.outdoor_shower
                                                        ? "Yes"
                                                        : "No"
                                                }}
                                            </p>
                                        </div>

                                        <!-- Pool Section -->
                                        <div class="col-4">
                                            <h5 class="c-feature-title">
                                                Pool
                                            </h5>
                                            <p>
                                                <strong>Shape:</strong>
                                                {{
                                                    Home.feature.pool_shape ||
                                                    "N/A"
                                                }}
                                            </p>
                                            <p>
                                                <strong>Water Features:</strong>
                                                {{
                                                    Home.feature
                                                        .water_features || "N/A"
                                                }}
                                            </p>
                                            <p>
                                                <strong>Status:</strong>
                                                {{
                                                    Home.feature.pool_status ||
                                                    "N/A"
                                                }}
                                            </p>
                                            <p>
                                                <strong>Spa:</strong>
                                                {{
                                                    Home.feature.spa
                                                        ? "Yes"
                                                        : "No"
                                                }}
                                            </p>
                                        </div>

                                        <!-- Fencing Section -->
                                        <div class="col-4">
                                            <h5 class="c-feature-title">
                                                Fencing
                                            </h5>
                                            <p>
                                                <strong>Material:</strong>
                                                {{
                                                    Home.feature
                                                        .fencing_material ||
                                                    "N/A"
                                                }}
                                            </p>
                                            <p>
                                                <strong>Status:</strong>
                                                {{
                                                    Home.feature
                                                        .fencing_status || "N/A"
                                                }}
                                            </p>
                                        </div>

                                        <!-- Bedroom Section -->
                                        <div class="col-4">
                                            <h5 class="c-feature-title">
                                                Bedroom
                                            </h5>
                                            <p>
                                                <strong>Location:</strong>
                                                {{
                                                    Home.feature
                                                        .bedroom_location ||
                                                    "N/A"
                                                }}
                                            </p>
                                        </div>

                                        <!-- Fireplace Section -->
                                        <div class="col-4">
                                            <h5 class="c-feature-title">
                                                Fireplace
                                            </h5>
                                            <p>
                                                <strong>Type:</strong>
                                                {{
                                                    Home.feature
                                                        .fireplace_type || "N/A"
                                                }}
                                            </p>
                                        </div>

                                        <!-- Kitchen Section -->
                                        <div class="col-4">
                                            <h5 class="c-feature-title">
                                                Kitchen
                                            </h5>
                                            <p>
                                                <strong>Pantry Type:</strong>
                                                {{
                                                    Home.feature
                                                        .kitchen_pantry_type ||
                                                    "N/A"
                                                }}
                                            </p>
                                        </div>

                                        <!-- Parking Section -->
                                        <div class="col-4">
                                            <h5 class="c-feature-title">
                                                Parking
                                            </h5>
                                            <p>
                                                <strong>Enclosed:</strong>
                                                {{
                                                    Home.feature
                                                        .parking_enclosure
                                                        ? "Yes"
                                                        : "No"
                                                }}
                                            </p>
                                        </div>

                                        <!-- Landscape Section -->
                                        <div class="col-4">
                                            <h5 class="c-feature-title">
                                                Landscape Maintenance
                                            </h5>
                                            <p>
                                                {{
                                                    Home.feature
                                                        .landscape_maintenance
                                                        ? "Yes"
                                                        : "No"
                                                }}
                                            </p>
                                        </div>

                                        <!-- Foundation Section -->
                                        <div class="col-4">
                                            <h5 class="c-feature-title">
                                                Foundation
                                            </h5>
                                            <p>
                                                <strong>Condition:</strong>
                                                {{
                                                    Home.feature
                                                        .foundation_conditions ||
                                                    "N/A"
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
                            Information is available upon request. Please login
                            first.
                        </div>
                        <div class="blurred-content">
                            <div class="blurred-box">
                                Information is available upon request.
                            </div>
                        </div>
                    </div>
                </div>

                <div class="container-fluid interactive-banner mt-3">
                    <h1>RELATED COMMUNITY MOVE IN HOMES</h1>
                </div>

                <div class="mx-4 pt-3">
                    <div class="container row">
                        <div
                            v-for="home in community_homes"
                            :key="home.id"
                            class="col-md-3 mb-2"
                        >
                            <a
                                class="text-decoration-none"
                                :href="'/home-details/' + home.property_id"
                            >
                                <div class="card c-border-design">
                                    <img
                                        :src="home.home_data.main_image"
                                        class="card-img-top"
                                        :alt="home.title"
                                        @error="setAltImg"
                                    />

                                    <div
                                        v-if="home.is_open_house"
                                        class="card-img-overlay c-card-img-overlay-flash-sale"
                                    >
                                        <span
                                            class="badge rounded-pill bg-white text-dark"
                                            >Open House</span
                                        >
                                    </div>

                                    <div class="card-body text-start">
                                        <p>
                                            AREA (SQFT)
                                            <b>{{ home.square_feet }} </b><br />
                                            Bedrooms
                                            <b>
                                                {{ home.bedrooms }}
                                            </b>
                                            <br />
                                            Property type
                                            <b>{{ home.property_type }}</b>
                                            <br />

                                            Price
                                            <b>${{ home.price }}</b>
                                        </p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </Master>
</template>

<script>
import Master from "@components/layout/Master.vue";
import ProceedComponent from "@components/ProceedComponent.vue";
import Multiselect from "@vueform/multiselect";
import { addMonths, startOfMonth, endOfMonth } from "date-fns";
import MoreTripsToDiscover from "@components/MoreTripsToDiscover.vue";
import { Carousel, Slide, Pagination, Navigation } from "vue3-carousel";

import "vue3-carousel/dist/carousel.css";
export default {
    components: {
        Master,
        ProceedComponent,
        Carousel,
        Slide,
        Pagination,
        Navigation,
        Multiselect,
        MoreTripsToDiscover,
    },
    props: ["home_id"],

    created() {
        this.fetchHomeDetails();
        this.backgroundImage = this.Home.property_main_image;
    },

    data() {
        return {
            Home: [],

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

            Community: [],
            community_homes: [],
            incentive: [],

            formErrors: [],
            currentSlide: 0,
        };
    },

    methods: {
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
            if (this.currentIndex < this.Home.files.length - 1) {
                this.currentIndex++;
            }
        },
        fetchHomeDetails() {
            axios
                .get("/api/fetch-home-details/" + this.home_id)

                .then((response) => {
                    this.Home = response.data.property_info;

                    this.Community = response.data.community_info;
                    this.incentive = response.data.incentive;
                    this.getThisCommunityAllHomes();
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        getThisCommunityAllHomes() {
            axios
                .get(`/api/fetch-community-all-homes/${this.Community.id}`)
                .then((response) => {
                    this.community_homes = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },

        setAltImg(event) {
            event.target.src = "/images/default.jpg";
        },
        formatDate(date) {
            const options = { year: "numeric", month: "long", day: "numeric" };
            return new Date(date).toLocaleDateString(undefined, options);
        },
        formatTime(time) {
            const [hours, minutes, seconds] = time.split(":");
            let formattedHours = parseInt(hours, 10);
            const period = formattedHours >= 12 ? "PM" : "AM";

            // Convert hours to 12-hour format
            formattedHours = formattedHours % 12 || 12;

            // Return the formatted time with AM/PM
            return `${formattedHours}:${minutes}:${seconds} ${period}`;
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

.price {
    font-size: 20px;
    margin: 5px 0;
}

.property-detail-section {
    background-color: #f1f1f1 !important;
}
.feature-state {
    font-size: 2.25rem;
    color: #002856 !important;
    font-weight: 300 !important;
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
    background-color: #002855;
    color: white;
    text-align: center;
    padding: 20px 0;
}
.interactive-banner h1 {
    letter-spacing: 0.15em;
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

.interactive-open-house-banner {
    background: #fba638;
    color: white;
    text-align: center;
    box-shadow: 0 4px 8px #bcd6f5b2; 
    letter-spacing: 0.15em;
}

.banner-content h3 {
    font-size: 18px;
    font-weight: bold;
}

.banner-content .time,
.banner-content .date {
    font-size: 18px;
    text-align: right;
    margin: 10px 0;
    font-weight: bold;
}

.icon {
    margin-right: 10px;
}
.open-house-tag {
    background-color: #002855;
    color: white;
    padding: 5px 10px;
    font-size: 14px;
    font-weight: bold;
    border-radius: 10px;
}
@media (max-width: 768px) {
    .banner-content h3 {
        font-size: 20px;
    }

    .banner-content .time,
    .banner-content .date {
        font-size: 16px;
    }
    .open-house-tag {
        font-size: 12px;
    }
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
.open_house_desc {
    text-align: left !important;
}
.c-anchor-style { 
    text-decoration: none;
    color: #002855;      
}  
.c-anchor-style:hover {
    cursor: pointer;
    font-weight: bold;
}

</style>
