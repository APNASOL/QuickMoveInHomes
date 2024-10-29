<template>
    <div v-if="tours.length" class="bg-warning">
        <div class="mx-4 pt-3">
            <div class="d-flex justify-content-between">
                <div>
                    <h2>Multi-country tours</h2>
                    <p>
                        Explore our multi-country tours. Let yourself be
                        surprised by our extended version top sellers.
                    </p>
                </div>
                <div>
                    <button class="btn btn-outline-dark">Take me there</button>
                    <button id="fa-icon" class="btn btn-outline-dark">
                        <i class="bi bi-arrow-right"></i>
                    </button>
                </div>
            </div>
            <Carousel
                :autoplay="2000"
                :settings="settings"
                :wrapAround="true"
                :breakpoints="breakpoints"
                :pauseAutoplayOnHover="true"
            >
                <Slide v-for="tour in tours" :key="tour.id">
                    <div class="carousel__item">
                        <a
                            class="text-decoration-none"
                            :href="
                                '/tour-details/' +
                                tour.id +
                                '/' +
                                tour.title.replace(/\s+/g, '-')
                            "
                        >
                            <div class="card c-border-design">
                                <img
                                    :src="tour.image"
                                    class="card-img-top c-card-img-border"
                                    :alt="tour.title"
                                    @error="setAltImg"
                                />
                                <div
                                    class="card-img-overlay c-card-img-overlay-name"
                                >
                                    <h3>{{ tour.title }}</h3>
                                    <h5>8 Days</h5>
                                </div>
                                <div class="card-body text-start">
                                    <h5 class="card-title">{{ tour.title }}</h5>
                                    <div
                                        v-if="
                                            tour.minimum_price &&
                                            tour.discounted_price
                                        "
                                    >
                                        <small>
                                            From
                                            <span
                                                class="text-decoration-line-through"
                                            >
                                                ${{ tour.minimum_price }}
                                            </span>
                                        </small>
                                    </div>
                                    <div
                                        v-if="
                                            tour.minimum_price &&
                                            tour.discounted_price
                                        "
                                    >
                                        <h5>
                                            ${{
                                                calculateDiscountPercentage(
                                                    tour.minimum_price,
                                                    tour.discounted_price
                                                )
                                            }}

                                            <span
                                                class="badge rounded-pill text-bg-warning ms-1"
                                                >{{
                                                    tour.discounted_price
                                                }}%</span
                                            >
                                        </h5>
                                    </div>
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
    name: "Multi Country",
    components: {
        Carousel,
        Slide,
        Navigation,
    },
    data() {
        return {
            tours: [],

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
        // this.getTours();
    },
    methods: {
        async getTours() {
            await axios
                .get("/api/front-tours/multi_country")
                .then((response) => {
                    this.tours = response.data;
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
