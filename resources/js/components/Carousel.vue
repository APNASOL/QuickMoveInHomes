<template>
    <!-- Search Bar Component -->

    <div>
        <Carousel
            ref="carousel"
            :autoplay="3500"
            :wrapAround="true"
            :transition="500"
            :pauseAutoplayOnHover="true"
            v-if="Carousels && Carousels.length > 0"
            @slide-start="onSlideStart"
        >
            <Slide v-for="(carousel, i) in Carousels" :key="i">
                <img
                    v-if="
                        carousel.image &&
                        carousel.image.type &&
                        carousel.image.type.match('image')
                    "
                    :src="carousel.image.url"
                    :alt="carousel.value"
                    class="img-fluid c-img-filter"
                    @error="setAltImg"
                />
                <video
                    v-if="
                        carousel.image &&
                        carousel.image.type &&
                        carousel.image.type.match('video')
                    "
                    ref="videoPlayer"
                    class="video-js img-fluid"
                    preload="auto"
                    data-setup="{}"
                    @load="fileLoaded"
                    @ready="onPlayerReady"
                    muted
                >
                    <source
                        :src="carousel.image.url"
                        :type="carousel.image.type"
                    />
                </video>
                <div class="c-carousel-text row">
                    <div class="col-md-12">
                        {{ carousel.description }}
                    </div>
                </div>
            </Slide>

            <template v-if="Carousels && Carousels.length > 1" #addons>
                <navigation />
                <!-- <pagination /> -->
            </template>
        </Carousel>

        <div
            class="container-fluid c-bg-color d-flex justify-content-center search"
        >
            <div
                class="card p-4 c-card-w-responsive c-search-mt c-border-design"
            >
                <div class="tab-content" id="pills-tabContent">
                    <div
                        class="tab-pane fade show active"
                        id="pills-tour"
                        role="tabpanel"
                        aria-labelledby="pills-tour-tab"
                    >
                        <div>
                            <div class="d-flex justify-content-center">
                                <div class="col-9">
                                    <label for="location">{{
                                        translate(
                                            "Enter an address, city or ZIP code"
                                        )
                                    }}</label>
                                    <input
                                        type="text"
                                        class="form-control"
                                        id="searching_location  "
                                        :class="{
                                            'invalid-bg':
                                                formErrors.searching_location,
                                        }"
                                        v-model="searching_location"
                                    />
                                </div>

                                <span class="ms-2 mt-4">
                                    <a
                                        v-if="formStatus"
                                        :href="
                                            '/homes-list/' + searching_location
                                        "
                                        type="submit"
                                        class="btn c-btn-theme-primary"
                                        @click="activeSpinner"
                                    >
                                        {{ translate("Search") }}
                                    </a>
                                    <a
                                        class="btn c-btn-theme-primary"
                                        type="button"
                                        disabled
                                        v-else
                                    >
                                        {{ translate("Searching") }}
                                        <span
                                            class="spinner-border spinner-border-sm"
                                            role="status"
                                            aria-hidden="true"
                                        ></span>
                                    </a>
                                </span>
                            </div>
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.searching_location"
                            >
                                {{ formErrors.searching_location[0] }}
                            </div>
                        </div>
                    </div>
                    <div
                        class="tab-pane fade"
                        id="pills-hotel"
                        role="tabpanel"
                        aria-labelledby="pills-hotel-tab"
                    >
                        This service is coming soon.
                    </div>
                    <div
                        class="tab-pane fade"
                        id="pills-flight"
                        role="tabpanel"
                        aria-labelledby="pills-flight-tab"
                    >
                        This service is coming soon.
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import Master from "@components/layout/Master.vue";
import { defineComponent } from "vue";
import { Carousel, Slide, Pagination, Navigation } from "vue3-carousel";
import "vue3-carousel/dist/carousel.css";
import Multiselect from "@vueform/multiselect";

export default defineComponent({
    components: {
        Master,
        Carousel,
        Slide,
        Pagination,
        Navigation,
        Multiselect,
    },
    created() {
        this.fatchCarousel();
        // this.fetchCountries();
    },
    data() {
        return {
            settings: {
                itemsToShow: 1,
                autoplay: 3500,
                wrapAround: true,
                dir: "rtl",
                // snapAlign: 'center',
            },
            Carousels: [],
            formErrors: [],
            currentSlideIndex: 0,
            searching_location: [],
            countriesList: [],
            formStatus: true,
        };
    },
    methods: {
        // pauseVideo() {
        //     const videoPlayers = this.$refs.videoPlayer;
        //     if (videoPlayers) {
        //         if (Array.isArray(videoPlayers)) {
        //             videoPlayers.forEach((player) => {
        //                 if (player && player.pause) {
        //                     player.pause();
        //                 }
        //             });
        //         } else {
        //             if (videoPlayers.pause) {
        //                 videoPlayers.pause();
        //             }
        //         }
        //     }
        // },
        pauseVideo() {
            const videoPlayers = this.$refs.videoPlayer;
            if (videoPlayers) {
                if (Array.isArray(videoPlayers)) {
                    videoPlayers.forEach((player) => {
                        if (player && player.pause) {
                            player.pause();
                        }
                    });
                } else {
                    if (videoPlayers.pause) {
                        videoPlayers.pause();
                    }
                }
            }
        },

        playVideo() {
            const videoPlayers = this.$refs.videoPlayer;
            if (videoPlayers) {
                if (Array.isArray(videoPlayers)) {
                    videoPlayers.forEach((player) => {
                        if (player && player.play) {
                            player.play();
                        }
                    });
                } else {
                    if (videoPlayers.play) {
                        videoPlayers.play();
                    }
                }
            }
        },
        onSlideStart() {
            // Ensure that event and event.detail are defined
            this.pauseVideo();
            // Play the video of the current slide
            this.playVideo();
        },
        // onSlideStart() {
        //     this.pauseVideo();
        // },
        async fatchCarousel() {
            await axios
                .get("/api/front-end-fetch-carousel")
                .then((response) => {
                    this.Carousels = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        fetchCountries() {
            axios
                .get("/api/tours-countries-pluck")
                .then((response) => {
                    this.countriesList = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },

        activeSpinner() {
            this.formStatus = false;
        },
    },
});
</script>
<style scoped>
@import "@vueform/multiselect/themes/default.css";
.c-slide-div {
    position: absolute;
    top: 35%;
    left: 5%;
    text-align: left;
    color: white;
    display: flex;
    flex-direction: column;
    gap: 10px;
}
.c-slide-div > button {
    width: fit-content;
}
</style>

<style scoped>
section {
    /* padding: 0px !important; */
    background-color: black;
}
/* Default font size */
.c-carousel-text {
    position: absolute;
    padding: 70px;
    color: white;
    font-size: 36px; /* Default font size */
}

.carousel {
    padding: 0px !important;
}

/* Media query for screens below 400px */
@media only screen and (max-width: 400px) {
    .c-carousel-text {
        font-size: 12px;
    }
}

/* Media query for screens up to 768px */
@media only screen and (max-width: 768px) {
    .c-carousel-text {
        font-size: 40px;
    }
}

/* Media query for screens up to 600px */
@media only screen and (max-width: 600px) {
    .c-carousel-text {
        font-size: 14px;
    }
}
.c-search-mt {
    transform: translate(0%, -40%);
}

.c-card-w-responsive {
    width: 95%;
}
@media only screen and (min-width: 768px) {
    .c-card-w-responsive {
        width: 70%;
    }
}

@media only screen and (min-width: 1200px) {
    .c-card-w-responsive {
        width: 50%;
    }
}
.c-img-filter {
    filter: brightness(60%);
}

.search .multiselect-option .is-selected {
    background-color: #e58b15 !important;
    color: white !important;
}
</style>
