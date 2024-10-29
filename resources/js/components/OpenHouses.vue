<template>
    <div class="bg-theme">
        <div class="mx-4 p-4">
            <div class="d-flex justify-content-between text-white">
                <div>
                    <h2>Visit Our Open Houses ...</h2>
                </div>

                <!-- <div>
                    <button class="btn btn-outline-light">Take me there</button>
                    <button id="fa-icon" class="btn btn-outline-light">
                        <i class="bi bi-arrow-right"></i>
                    </button>
                </div> -->
            </div>
            <Carousel
                :autoplay="2000"
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
                                        >Open House</span
                                    >
                                </div>

                                
                                <div class="card-body text-start">
                                    <p>
                                            AREA (SQFT)
                                            <b
                                                >{{
                                                    home.property_record
                                                        .square_feet
                                                }} </b
                                            ><br />
                                            Bedrooms
                                            <b>
                                                {{
                                                    home.property_record
                                                        .bedrooms
                                                }}
                                            </b>
                                            <br />
                                            Property type
                                            <b>{{
                                                home.property_record
                                                    .property_type
                                            }}</b>
                                            <br />

                                            Price
                                            <b
                                                >${{
                                                    home.property_record.price
                                                }}</b
                                            >
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
            homes: [],

            settings: {
                itemsToShow: 1.5,
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
    methods: {
        async getHomes() {
            await axios
                .get("/api/front-homes/open_houses")
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
</style>
