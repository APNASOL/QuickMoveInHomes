<template>
    <div v-if="properties && properties.length">
        <div class="container">
            <div class="d-flex justify-content-between c-theme-color">
                <div class="text-center">
                    <h1 class="mt-4 c-main-title">Quick Move-In Homes</h1>
                    <p class="c-sub-title">
                        Discover our selection of brand new, move-in ready homes
                        across Las Vegas Valley. These properties are complete
                        and ready for immediate or near-term move-in.
                    </p>
                </div>
            </div>
            <div class="mt-4">
                <Carousel
                    :settings="settings"
                    :wrapAround="true"
                    :breakpoints="breakpoints"
                    :pauseAutoplayOnHover="true"
                >
                    <!-- :autoplay="2000" -->
                    <Slide v-for="property in properties" :key="property.id">
                        <div class="carousel__item">
                            <GlobalCard
                                :badge2="
                                    property.is_open_house
                                        ? 'Open House'
                                        : property.incentive
                                        ? 'Incentive Home'
                                        : ''
                                "
                                :main_image="property.main_image"
                                :title="property.title"
                                :property_id="property.property_id"
                                :address="property.address"
                                :bedrooms="property.bedrooms"
                                :price="property.price"
                                :bathrooms="property.bathrooms"
                                :square_feet="property.square_feet"
                                :garages="property.parking_enclosure"
                            />
                        </div>
                    </Slide>

                    <template #addons>
                        <Navigation />
                    </template>
                </Carousel>
            </div>
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
                class="modal-content p-2"
                style="background-color: rgb(61, 102, 143); color: white"
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
                        class="modal-title text-center text-white c-main-title"
                        id="openIncentivesModal"
                    >
                        MOVE-IN-READY INCENTIVES
                    </h1>
                    <p class="text-white c-sub-title">
                        Available at ALL New Home Communities!
                    </p>
                    <a
                        href="/all-incentives"
                        class="btn btn-light c-custom-btn px-4 py-2 fw-semibold w-100 mt-2"
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
            event.target.src = "/images/default_image.png";
        },
        formatPrice(price) {
            return Math.floor(price).toLocaleString(); // Removes the decimal portion
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

.c-main-title {
    font-family: Inter, sans-serif;

    font-weight: 400;
    line-height: 32px;
}
</style>
