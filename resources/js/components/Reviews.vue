<template>
    <div v-if="tours.length">
        <div class="mx-4 pt-3">
            <div class="d-flex justify-content-between">
                <div>
                    <h2> Reviews</h2>
                    <p>
                        Creating unforgettable memories, one traveler at a time
                    </p>
                </div>
            </div>
            <Carousel
                :autoplay="2000"
                :settings="settings"
                :wrapAround="true"
                :pauseAutoplayOnHover="true"
            >
                <Slide v-for="tour in tours" :key="tour.id">
                    <div class="carousel__item">
                        <div class="mt-2">
                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-4">
                                    <img
                                        :src="tour.image ?? 'empty.png'"
                                        class="card-img-top mt-2 c-card-img-border"
                                        :alt="tour.name"
                                        @error="setAltImg"
                                    />
                                </div>
                                <div class="col-md-4 text-left">
                                    <small>
                                        <i class="bi bi-geo-alt"></i>
                                        {{ tour.location }}</small
                                    >
                                    <h2>{{ tour.title }}</h2>
                                    <p>{{ tour.description }}</p>
                                    <star-rating
                                        v-bind:max-rating="5"
                                        :rating="tour.rating"
                                        read-only
                                        :star-size="20"
                                        :show-rating="false"
                                    />
                                    <small>{{ tour.user_name }}</small>
                                </div>
                            </div>
                        </div>
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
import StarRating from "vue-star-rating";
export default defineComponent({
    name: "Multi Country",
    components: {
        Carousel,
        Slide,
        Navigation,
        StarRating,
    },
    data() {
        return {
            tours: [],

            settings: {
                itemsToShow: 1,
                transition: "500",
            },
        };
    },
    created() {
        // this.getTours();
    },
    methods: {
        async getTours() {
            await axios
                .get("/api/tour-reviews-fetch")
                .then((response) => {
                    this.tours = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        setAltImg(event) {
            event.target.src = "/images/default-home-image.png";
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
.c-card-img-border {
    border-radius: 25px;
}
.carousel__item {
    text-align: left;
}
</style>
