<template>
    <div class="c-bg-color" v-if="homes && homes.length">
        
        <div class="mx-4">
            <div class="d-flex justify-content-between">
                <div>
                    <h2 class="mt-4">
                        {{ translate("Discover Your Dream Home") }}
                        |
                        {{ translate("Quick Move In") }}
                    </h2>
                </div>
                <!-- <div>
                    <a
                        class="searchHome"
                        href="/search/homes"
                        id="navbarDropdownDeals"
                        role="button"
                    >
                        <img src="/images/map-icon.png" height="70" />
                    </a>
                </div> -->
            </div>

            <Carousel
                :settings="settings"
                :wrapAround="true"
                :breakpoints="breakpoints"
                :pauseAutoplayOnHover="true"
            >
                <Slide v-for="home in homes" :key="home.id">
                    <div class="carousel__item">
                        <a
                            class="text-decoration-none"
                            :href="
                                '/home-details/' +
                                home.property_record.property_id
                            "
                        >
                            <div class="card c-border-design">
                                <img
                                    :src="home.main_image"
                                    class="card-img-top c-card-img-border"
                                    :alt="home.title"
                                    @error="setAltImg"
                                />

                                <div
                                    class="card-img-overlay c-card-img-overlay-flash-sale"
                                >
                                    <span
                                        class="badge rounded-pill bg-white text-dark"
                                        >Quick Move In</span
                                    >
                                </div>

                                <!-- <div
                                    class="card-img-overlay c-card-img-overlay-name info-card-overlay text-center"
                                >
                                    <p>
                                        AREA (SQFT)
                                        <b
                                            >{{
                                                home.property_record.square_feet
                                            }} </b
                                        ><br />
                                        Bedrooms
                                        <b>
                                            {{ home.property_record.bedrooms }}
                                        </b>
                                        <br />
                                        Property type
                                        <b>{{
                                            home.property_record.property_type
                                        }}</b>
                                        <br />

                                        Price
                                        <b>${{ home.property_record.price }}</b>
                                    </p>
                                </div> -->
                                <div class="card-body text-start">
                                    <p>
                                        AREA (SQFT)
                                        <b
                                            >{{
                                                home.property_record.square_feet
                                            }} </b
                                        ><br />
                                        Bedrooms
                                        <b>
                                            {{ home.property_record.bedrooms }}
                                        </b>
                                        <br />
                                        Property type
                                        <b>{{
                                            home.property_record.property_type
                                        }}</b>
                                        <br />

                                        Price
                                        <b>${{ home.property_record.price }}</b>
                                    </p>
                                </div>
                            </div>
                        </a>
                    </div>
                </Slide>

                <template #addons>
                    <Navigation />
                </template>
            </Carousel>
        </div>
    </div>

    <!-- Button trigger modal -->
    <button
        hidden
        type="button"
        class="btn btn-primary"
        data-bs-toggle="modal"
        data-bs-target="#incentivesModal"
        ref="openIncentivesModal"
    ></button>

    <!-- Modal -->
    <div
        class="modal fade c-modal"
        id="incentivesModal"
        data-bs-backdrop="static"
        data-bs-keyboard="false"
        tabindex="-1"
        aria-labelledby="openIncentivesModal"
        aria-hidden="true"
    >
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div
                class="modal-content c-content-radius"
                style="background-color: #d29f6d; color: white"
            >
                <div class="modal-header">
                    <button
                        type="button"
                        class="btn-close"
                        style="color: white !important"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                    ></button>
                </div>
                <div class="modal-body text-center">
                    <h1
                        class="modal-title text-center"
                        id="openIncentivesModal"
                    >
                        MOVE-IN-READY INCENTIVES
                    </h1>
                    <p class="small-text">
                        Available at ALL New Home Communities!
                    </p>
                    <a
                        href="/all-incentives"
                        class="btn btn-incentives"
                        style="
                            background-color: #f0ad4e;
                            color: white;
                            font-weight: bold;
                        "
                        >View Current Incentives →</a
                    >
                </div>
            </div>
        </div>
    </div>

    <!-- Button trigger modal -->
</template>

<script>
import { defineComponent } from "vue";
// import { Carousel, Navigation, Slide } from "vue3-carousel";
import { Carousel, Slide, Pagination, Navigation } from "vue3-carousel";

import "vue3-carousel/dist/carousel.css";

export default defineComponent({
    name: "Flash Sale",
    data() {
        return {
            homes: [],
            incentives_homes: [],

            settings: {
                itemsToShow: 1,
                transition: "500",
                snapAlign: "center",
            },
            breakpoints: {
                1: {
                    itemsToShow: 1.5,
                    snapAlign: "center",
                    transition: "500",
                },
                // 700px and up
                576: {
                    itemsToShow: 2.5,
                    snapAlign: "center",
                    transition: "500",
                },
                992: {
                    itemsToShow: 3.5,
                    snapAlign: "center",
                    transition: "500",
                },
                // 1024 and up
                1200: {
                    itemsToShow: 4.5,
                    snapAlign: "center",
                    transition: "500",
                },
            },
        };
    },
    created() {
        this.getHomes();
    },
    components: {
        Carousel,
        Slide,
        Navigation,
    },
    mounted() {
        this.openModal();
    },
    methods: {
        openModal() {
            setTimeout(() => {
                this.$refs.openIncentivesModal.click();
            }, 2000);
        },
        async getHomes() {
            await axios
                .get("/api/front-homes/all")
                .then((response) => {
                    this.homes = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },

        calculateDiscountPercentage(originalPrice, discountPercentage) {
            const discountAmount = (discountPercentage / 100) * originalPrice;
            const discountedPrice = originalPrice - discountAmount;
            return Math.round(discountedPrice);
        },
        setAltImg(event) {
            event.target.src = "/images/default.jpg";
        },
    },
});
</script>
<style scoped>
.carousel__slide {
    padding: 5px;
}

.carousel__viewport {
    perspective: 2000px;
}

.carousel__track {
    transform-style: preserve-3d;
}

.carousel__slide--sliding {
    transition: 0.5s;
}

.carousel__slide {
    opacity: 0.9;
    transform: rotateY(-20deg) scale(0.9);
}

.carousel__slide--active ~ .carousel__slide {
    transform: rotateY(20deg) scale(0.9);
}

.carousel__slide--prev {
    opacity: 1;
    transform: rotateY(-10deg) scale(0.9) !important;
}

.carousel__slide--next {
    opacity: 1;
    transform: rotateY(10deg) scale(0.9) !important;
}

.carousel__slide--active {
    opacity: 1;
    transform: rotateY(0) scale(1);
}
.c-card-img-overlay-name {
    top: unset;
    bottom: 120px;
    text-align: left;
    color: white;
}
.c-card-img-overlay-flash-sale {
    left: unset;
}

.modal-content {
    background: linear-gradient(
        135deg,
        #002855,
        #005c99,
        #025079d8,
        #042d5c,
        #0a3a70,
        #1e5da6,
        #063d50
    ); /* Adjust background color */
    color: white; /* Text color */
    padding-bottom: 15px;
}
.modal-header {
    border: none; /* No border */
}
.modal-body {
    text-align: center; /* Center text */
}
.btn-incentives {
    background-color: white !important; /* Button background color */
    color: black !important; /* Button text color */
    font-weight: bold !important; /* Bold text */
    border: 1px solid black !important;
    border-radius: 0.25rem !important;
}
.btn-incentives:hover {
    background-color: rgb(
        255,
        255,
        255
    ) !important; /* Button background color */
    color: black !important; /* Button text color */
    font-weight: bold !important; /* Bold text */
    border: 1px solid black !important;
    border-radius: 0.25rem !important;
    margin-top: 4px !important;
}
.modal-title {
    text-align: center;
    font-size: 50px;
    font-family: "Arial Black";
    line-height: 1.1em;
    color: rgba(255, 255, 255, 1);
}
.small-text {
    font-size: 24px;
    font-family: "Cabin";
    line-height: 1.7em;
    font-weight: 700;
    color: rgba(255, 255, 255, 1);
}
/* Initial state */
.searchHome {
    overflow: hidden; /* Ensure content doesn’t overflow during zoom */
}

/* Image within .searchHome */
.searchHome img {
    transition: transform 0.3s ease; /* Smooth transition */
}

/* Hover state */
.searchHome:hover img {
    transform: scale(1.2); /* Zoom in the image */
}
</style>
