<template>
    <div v-if="videos && videos.length > 0">
        <div class="mx-4 pb-2 pt-2 mt-3">
            <div>
                <h2 class="c-theme-color">Testimonials</h2>
                <p class="c-theme-color">
                    Welcome to your premier digital gateway with Yvonne Khoo,
                    offering comprehensive real estate solutions in the Las
                    Vegas community. Stay informed with live updates on property
                    listings and gain insights into the market with up-to-date
                    statistics, ensuring you have all the essential information
                    at your fingertips for making informed buying or selling
                    decisions.
                </p>
            </div>

            <Carousel
                :autoplay="2000"
                :settings="settings"
                :wrapAround="true"
                :breakpoints="breakpoints"
                :pauseAutoplayOnHover="true"
            >
                <Slide v-for="(video, index) in videos" :key="index">
                    <div class="carousel__item">
                        <div
                            class="text-decoration-none"
                            @click="openModal(video.id)"
                        >
                            <div class="card c-border-design">
                                <div class="thumbnail-wrapper">
                                    <img
                                        :src="'https://img.youtube.com/vi/' + video.id + '/hqdefault.jpg'"
                                        class="card-img-top c-card-img-border"
                                        alt="Video Thumbnail"
                                    />
                                    <div class="play-button-overlay">
                                        ▶
                                    </div>
                                </div>
                                <div class="card-body text-start">
                                    <h5 class="card-title">
                                        {{ video.title || 'Loading title...' }}
                                    </h5>
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

        <!-- Video Modal -->
        <div
            v-if="showModal"
            class="video-modal"
            @click.self="closeModal"
        >
            <div class="video-modal-content">
                <iframe
                    :src="'https://www.youtube.com/embed/' + currentVideoId + '?autoplay=1'"
                    frameborder="0"
                    allow="autoplay; encrypted-media"
                    allowfullscreen
                ></iframe>
                <button class="modal-close" @click="closeModal">✖</button>
            </div>
        </div>
    </div>
</template>

<script>
import { defineComponent } from "vue";
import { Carousel, Slide, Navigation } from "vue3-carousel";
import "vue3-carousel/dist/carousel.css";

export default defineComponent({
    created() {
        this.fetchDestinations();
    },
    components: {
        Carousel,
        Slide,
        Navigation,
    },
    data() {
        return {
            videos: [
                { id: "UsO2VQrg3N4", title: "Review from a long distance client,he bought his first home" },
                { id: "5FAUuoQLkFQ", title: "Why Hire Yvonne's team!" },
                { id: "2mVU4ZKhZQA", title: "You Can not get a better realtor then Yvonne, end of story" },
                { id: "PhNU4BTn1TQ", title: "Review Video ,Closed Dec 2021 " },
                { id: "hJxpO6uyonI", title: "Recommendation from past client - closed Jan 2020" },
                { id: "9A7qMoLLb4E", title: "Clients Thanking a friend, for referring Yvonne!" },
                { id: "8CtUrJIIuXo", title: "We got the keys! Moving in 10 days early! Feb 2020!" },
                { id: "UdIPX-K-5-k", title: "Happy Buyers doing a final walk thru Jan 2020" },
                { id: "ImSNcfNCPvk", title: "Recommended by Diogo Piacentini" },
            ],
            showModal: false,
            currentVideoId: null,
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
                576: {
                    itemsToShow: 2.5,
                    snapAlign: "center",
                    transition: "500",
                },
                992: {
                    itemsToShow: 4,
                    snapAlign: "center",
                    transition: "500",
                },
                1200: {
                    itemsToShow: 4.5,
                    snapAlign: "center",
                    transition: "500",
                },
            },
        };
    },
    methods: {
        fetchDestinations() {
            // Placeholder for fetching additional data if needed
        },
        openModal(videoId) {
            this.currentVideoId = videoId;
            this.showModal = true;
        },
        closeModal() {
            this.showModal = false;
            this.currentVideoId = null;
        },
    },
});
</script>

<style scoped>
.thumbnail-wrapper {
    position: relative;
}
.play-button-overlay {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-size: 3rem;
    color: white;
    opacity: 0.8;
}
.video-modal {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.8);
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 9999; /* Ensure modal is on top */
}
.video-modal-content {
    position: relative;
    width: 80%;
    max-width: 800px;
    background: white;
    padding: 0;
    z-index: 10000; /* Higher z-index to keep content on top */
}
.video-modal-content iframe {
    width: 100%;
    height: 450px;
}
.modal-close {
    position: absolute;
    top: 10px;
    right: 10px;
    background: transparent;
    border: none;
    font-size: 1.5rem;
    color: white;
    cursor: pointer;
    z-index: 10001; /* Keep close button above iframe */
}
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
</style>
