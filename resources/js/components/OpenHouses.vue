<template>
    <div class="bg-theme" v-if="properties && properties.length">
        <div class="container">
            <div class="mx-4">
                <div class="d-flex justify-content-between text-white">
                    <div class="mt-4">
                        <h2>Visit Our Open Houses ...</h2>
                    </div>
 
                </div>
                <Carousel
                    :autoplay="2000"
                    :settings="settings"
                    :wrapAround="true"
                    :breakpoints="breakpoints"
                    :pauseAutoplayOnHover="true"
                >
                    <Slide v-for="property in properties" :key="property.id">
                        <div class="carousel__item">
                            <!-- <a
                                class="text-decoration-none"
                                :href="'/home-details/' + property.property_id"
                            > -->
                                <!--  <div class="card c-border-design">
                               <img
                                    :src="property.main_image ?? '/images/default_image.png'"
                                    class="card-img-top c-card-img-border"
                                    :alt="property.title"
                                    @error="setAltImg"
                                /> -->

                                <GlobalCard
                                    :badge="
                                        property.is_open_house == 1
                                            ? 'Open House'
                                            : 'Quick Move In'
                                    "
                                    :badge2="
                                        property.incentive
                                            ? 'Incentive Home'
                                            : ''
                                    "
                                    :property_id="property.property_id"
                                    :main_image="property.main_image"
                                    :title="property.title"
                                    :address="property.address"
                                    :bedrooms="property.bedrooms"
                                    :price="property.price"
                                    :bathrooms="property.bathrooms"
                                    :square_feet="property.square_feet"
                                    :garages="property.parking_enclosure"
                                />

                                <!-- <div
                                    class="card-img-overlay c-card-img-overlay-flash-sale"
                                >
                                    <span
                                        class="badge rounded-pill bg-white text-dark"
                                        >Open House</span
                                    >
                                </div> -->

                                <!-- <div class="card-body text-start">
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
                                        <b>${{ property.price }}</b>
                                    </p>
                                    <p>
                                            AREA (SQFT)
                                            <b
                                                >{{
                                                    property
                                                        .square_feet
                                                }} </b
                                            ><br />
                                            Bedrooms
                                            <b>
                                                {{
                                                    property
                                                        .bedrooms
                                                }}
                                            </b>
                                            <br />
                                            Property type
                                            <b>{{
                                                property
                                                    .property_type
                                            }}</b>
                                            <br />

                                            Price
                                            <b
                                                >${{
                                                    property.price
                                                }}</b
                                            >
                                        </p>
                                </div>
                            </div> -->
                            <!-- </a> -->
                        </div>
                    </Slide>

                    <template #addons>
                        <Navigation />
                    </template>
                </Carousel>
            </div>
        </div>
    </div>
</template>

<script>
import { defineComponent } from "vue";
import { Carousel, Navigation, Slide } from "vue3-carousel";

import "vue3-carousel/dist/carousel.css";

export default defineComponent({
    name: "Moments Sale",
    components: {
        Carousel,
        Slide,
        Navigation,
    },
    data() {
        return {
            properties: [],

            settings: {
                itemsToShow: 1,
                transition: 500,
                snapAlign: "center",
            },
            breakpoints: {
                320: {
                    // Smallest screens (mobile)
                    itemsToShow: 1.2,
                    snapAlign: "center",
                    transition: 500,
                },
                576: {
                    // Small phones & portrait tablets
                    itemsToShow: 2,
                    snapAlign: "center",
                    transition: 500,
                },
                768: {
                    // Tablets & small laptops
                    itemsToShow: 2.5,
                    snapAlign: "center",
                    transition: 500,
                },
                992: {
                    // Medium desktops
                    itemsToShow: 3,
                    snapAlign: "center",
                    transition: 500,
                },
                1200: {
                    // Large desktops
                    itemsToShow: 4,
                    snapAlign: "center",
                    transition: 500,
                },
                1400: {
                    // Extra large screens
                    itemsToShow: 4.5,
                    snapAlign: "center",
                    transition: 500,
                },
                1600: {
                    // Ultra-wide screens
                    itemsToShow: 5,
                    snapAlign: "center",
                    transition: 500,
                },
            },
        };
    },
    created() {
        this.getHomes();
    },
    methods: {
        async getHomes() {
            await axios
                .get("/api/front-homes/open_houses")
                .then((response) => {
                    this.properties = response.data;
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
            event.target.src = "/images/default_image.png";
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

#fa-icon {
    display: none; /* Hide the icon by default */
}
@media only screen and (max-width: 830px) {
    .btn {
        display: none;
    }
    #fa-icon {
        display: inline-block;
    }
}
.card-img-top {
    object-fit: cover;
    width: 100%;
    height: 240px; /* Fixed height for uniformity */
}
</style>
