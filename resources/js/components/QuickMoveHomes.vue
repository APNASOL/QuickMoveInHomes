<template>
    <div class="c-bg-color" v-if="properties && properties.length" style="height: 465px;">
        <div class="mx-4">
            <div class="d-flex justify-content-between c-theme-color">
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
                        href="/search/properties"
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
                <!-- :autoplay="2000" -->
                <Slide v-for="property in properties" :key="property.id">
                    <div class="carousel__item">
                        <a
                            class="text-decoration-none"
                            :href="'/home-details/' + property.property_id"
                        >
                        <GlobalCard 
                            :badge="'Quick Move In'"
                            :main_image="property.main_image"
                            :title="property.title"
                            :address="property.address"
                            :bedrooms="property.bedrooms"
                            :price="property.price"
                            :bathrooms="property.bathrooms"
                            :square_feet="property.square_feet"
                            :garages="property.parking_enclosure"
                            />

                            <!-- <div class="">
                                <div class="property-card position-relative">
                                    <span class="badge sale"
                                        >Quick Move In</span
                                    >
                                    
                                    <div class="card-body">
                                        <h5 class="card-title">
                                            {{ property.title }}
                                        </h5>
                                        <p class="card-text">
                                            {{ property.address }}
                                        </p>
                                        <p class="price">
                                            ${{ formatPrice(property.price) }}
                                        </p>
                                        <div class="property-icons">
                                            <span>
                                                <svg
                                                    fill="#000000"
                                                    width="15px"
                                                    height="15px"
                                                    viewBox="0 0 50 50"
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    xmlns:xlink="http://www.w3.org/1999/xlink"
                                                >
                                                    <path
                                                        d="M5 10C3.347656 10 2 11.347656 2 13L2 26.8125C3.296875 25.6875 4.9375 24.777344 7 24.0625L7 20C7 17.339844 11.542969 17 15.5 17C19.457031 17 24 17.339844 24 20L24 22C24.335938 21.996094 24.65625 22 25 22C25.34375 22 25.664063 21.996094 26 22L26 20C26 17.339844 30.542969 17 34.5 17C38.457031 17 43 17.339844 43 20L43 24.03125C45.058594 24.742188 46.691406 25.671875 48 26.8125L48 13C48 11.347656 46.652344 10 45 10 Z M 25 24C5.90625 24 -0.015625 27.53125 0 37L50 37C50.015625 27.46875 44.09375 24 25 24 Z M 0 39L0 50L7 50L7 46C7 44.5625 7.5625 44 9 44L41 44C42.4375 44 43 44.5625 43 46L43 50L50 50L50 39Z"
                                                    />
                                                    
                                                </svg>
                                                
                                                <b class="fs-6 mt-1">3</b>
                                            </span>
                                            <span
                                                ><i class="bi bi-bathtub"></i
                                                ><svg
                                                    fill="#000000"
                                                    width="15px"
                                                    height="15px"
                                                    viewBox="0 0 24 24"
                                                    id="bathroom"
                                                    data-name="Flat Line"
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    class="icon flat-line"
                                                >
                                                    <path
                                                        id="secondary"
                                                        d="M11,10H5V9A3,3,0,0,1,8,6H8a3,3,0,0,1,3,3Z"
                                                        style="
                                                            fill: rgb(
                                                                44,
                                                                169,
                                                                188
                                                            );
                                                            stroke-width: 2;
                                                        "
                                                    ></path>
                                                    <path
                                                        id="primary"
                                                        d="M17,21V5a2,2,0,0,0-2-2H10A2,2,0,0,0,8,5V6"
                                                        style="
                                                            fill: none;
                                                            stroke: rgb(
                                                                0,
                                                                0,
                                                                0
                                                            );
                                                            stroke-linecap: round;
                                                            stroke-linejoin: round;
                                                            stroke-width: 2;
                                                        "
                                                    ></path>
                                                    <path
                                                        id="primary-2"
                                                        data-name="primary"
                                                        d="M11,10H5V9A3,3,0,0,1,8,6H8a3,3,0,0,1,3,3Zm4,11h4M6,14v2m4-2v2"
                                                        style="
                                                            fill: none;
                                                            stroke: rgb(
                                                                0,
                                                                0,
                                                                0
                                                            );
                                                            stroke-linecap: round;
                                                            stroke-linejoin: round;
                                                            stroke-width: 2;
                                                        "
                                                    ></path>
                                                </svg>
                                                <b class="fs-6 mt-1">3</b>
                                            </span>
                                            <span
                                                ><svg
                                                    fill="#000000"
                                                    width="15px"
                                                    height="15px"
                                                    viewBox="0 0 32 32"
                                                    version="1.1"
                                                    xmlns="http://www.w3.org/2000/svg"
                                                >
                                                    <title>rulers</title>
                                                    <path
                                                        d="M0 32h4v-1.984h2.016v-2.016h-2.016v-1.984h2.016v-2.016h-4v-1.984h4v-2.016h-2.016v-1.984h2.016v-2.016h-2.016v-1.984h2.016v-2.016h-2.016v-1.984h2.016v-2.016h-6.016v24zM0 6.016h6.016v-6.016h-6.016v6.016zM8 30.016v1.984h24v-24h-1.984v22.016h-22.016zM8 6.016h2.016v-2.016h1.984v2.016h2.016v-2.016h1.984v2.016h2.016v-2.016h1.984v2.016h2.016v-4h1.984v4h2.016v-2.016h1.984v2.016h2.016v-2.016h1.984v-4h-24v6.016z"
                                                    ></path>
                                                </svg>
                                             
                                                <b class="fs-6 mt-1">{{ property.square_feet }} sq.ft</b>
                                            </span>
                                            <span
                                                ><i class="bi bi-garage"></i
                                                ><svg
                                                    fill="#000000"
                                                    version="1.1"
                                                    id="Capa_1"
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    xmlns:xlink="http://www.w3.org/1999/xlink"
                                                    width="15px"
                                                    height="15px"
                                                    viewBox="0 0 45.393 45.393"
                                                    xml:space="preserve"
                                                >
                                                    <g>
                                                        <g>
                                                            <path
                                                                d="M43.518,12.709L25.178,0.728c-1.511-0.978-3.458-0.968-4.96,0.021L1.859,12.719c-1.14,0.751-1.455,2.284-0.705,3.424
			c0.751,1.14,2.283,1.456,3.424,0.704L22.715,5.021L40.83,16.857c0.416,0.269,0.881,0.396,1.341,0.396
			c0.812,0,1.604-0.397,2.077-1.127C44.99,14.98,44.662,13.452,43.518,12.709z"
                                                            />
                                                            <path
                                                                d="M38.879,27.616c-0.151-0.865-0.903-1.505-1.78-1.505h-1.008l-0.383-3.987c-0.409-4.264-3.948-7.49-8.232-7.49H17.92
			c-4.285,0-7.823,3.227-8.233,7.49l-0.382,3.987H8.296c-0.878,0-1.629,0.64-1.782,1.505l-1.5,8.504
			c-0.186,1.054,0.112,2.139,0.8,2.957c0.662,0.788,1.637,1.258,2.657,1.293v1.412c0,1.999,1.602,3.61,3.603,3.61h1.138
			c1.999,0,3.625-1.611,3.625-3.61v-1.389h11.732v1.386c0,2,1.613,3.613,3.612,3.613h1.139c1.999,0,3.614-1.613,3.614-3.613V40.37
			c1.02-0.035,1.989-0.501,2.649-1.288c0.688-0.82,0.982-1.899,0.798-2.955L38.879,27.616z M11.642,37.113
			c-1.687,0-3.055-1.367-3.055-3.056c0-1.689,1.368-3.057,3.055-3.057c1.688,0,3.057,1.367,3.057,3.057
			C14.699,35.746,13.33,37.113,11.642,37.113z M12.404,26.111l0.353-3.678c0.257-2.674,2.476-4.688,5.163-4.688h0.551v1.156
			c0,1.003,0.797,1.802,1.799,1.802h4.856c1.002,0,1.813-0.799,1.813-1.802v-1.155h0.537c2.687,0,4.906,2.014,5.162,4.688
			l0.354,3.678L12.404,26.111L12.404,26.111z M33.75,37.113c-1.687,0-3.055-1.367-3.055-3.056c0-1.689,1.368-3.057,3.055-3.057
			c1.688,0,3.057,1.367,3.057,3.057C36.807,35.746,35.438,37.113,33.75,37.113z"
                                                            />
                                                        </g>
                                                    </g>
                                                </svg>
                                                <b class="fs-6 mt-1">3</b>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div> -->

                            <!-- <div class="card c-border-design">
                                <img
                                    :src="property.main_image ?? '/images/default-home-image.png'"
                                    class="card-img-top c-card-img-border"
                                    :alt="property.title"
                                   
                                />

                                <div
                                    class="card-img-overlay c-card-img-overlay-flash-sale"
                                >
                                    <span
                                        class="badge rounded-pill bg-white text-dark"
                                        >Quick Move In</span
                                    >
                                </div>

                                 
                                <div class="card-body text-start">
                                    <p>
                                        <span v-if="property.title"> 
                                            
                                            <b>{{ property.title }} </b><br />
                                        </span>
                                        <span v-if="property.square_feet"> 
                                            AREA (SQFT)
                                            <b>{{ property.square_feet }} </b><br />
                                        </span>
                                        <span v-if="property.bedrooms">
                                            Bedrooms
                                            <b>
                                                {{ property.bedrooms }}
                                            </b>
                                            <br />
                                        </span>
                                        <span v-if="property.property_type">
                                            Property type
                                            <b>{{ property.property_type }}</b>
                                            <br />
                                        </span>

                                        From
                                        <b>${{ formatPrice(property.price) }}</b>
                                    </p>
                                     
                                </div>
                            </div> -->
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
            properties: [],
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
                // 1024px and up
                1200: {
                    itemsToShow: 4,
                    snapAlign: "center",
                    transition: "500",
                },
                // 1400px and up
                1400: {
                    itemsToShow: 5,
                    snapAlign: "center",
                    transition: "500",
                },
                // 1600px and up
                1600: {
                    itemsToShow: 6,
                    snapAlign: "center",
                    transition: "500",
                },
                // 1800px and up
                1800: {
                    itemsToShow: 6,
                    snapAlign: "center",
                    transition: "500",
                },
            },

            incentiveAvailable: null,
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
        this.checkIncentives();
    },
    methods: {
        openModal() {
            setTimeout(() => {
                this.$refs.openIncentivesModal.click();
            }, 1000);
        },
        async getHomes() {
            await axios
                .get("/api/front-homes/all")
                .then((response) => {
                    this.properties = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        async checkIncentives() {
            await axios
                .get("/api/check-incentives")
                .then((response) => {
                    this.incentiveAvailable = response.data;
                    if (this.incentiveAvailable == 1) {
                        this.openModal();
                    }
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
            event.target.src = "/images/default-home-image.png";
        },
        formatPrice(price) {
            return Math.floor(price); // Removes the decimal portion
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
.property-card {
    text-align: left !important;
    border: 1px solid #eaeaea;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    transition: transform 0.2s;
}
.property-card:hover {
    transform: scale(1.02);
}
.property-card img {
    width: 100%;
    height: 180px;
    object-fit: cover;
}
.property-card .badge {
    position: absolute;
    top: 15px;
    left: 15px;
    font-size: 14px;
    padding: 5px 10px;
    border-radius: 5px;
}
.property-card .badge.sale {
    background-color: #163259;
    color: white;
}
.property-card .badge.rent {
    background-color: #6f42c1;
    color: white;
}
.property-card .card-body {
    padding: 15px;
    background-color: white;
}
.property-card .card-title {
    font-weight: bold;
    margin-bottom: 5px;
    font-size: 16px;
}
.property-card .card-text {
    color: #6c757d !important;
    font-size: 14px;
    margin-bottom: 5px;
}
.property-card .price {
    font-weight: bold;
    font-size: 18px;
    margin-bottom: 5px;
    color: black !important;
}
.property-card .property-icons {
    font-size: 14px;
    display: flex;
    justify-content: space-between;
    color: black !important;
}
.property-card .property-icons span {
    display: flex;
    align-items: center;
    gap: 5px;
}
.property-card .property-icons i {
    color: #6c757d !important;
}
</style>
