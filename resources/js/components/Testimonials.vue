<template>
    <div class="c-bg-color" v-if="videos.length">
        <div class="container pb-2 pt-2 mt-3">
            <div class="text-center c-theme-color">
                <h1 class="mt-4 c-main-title">What Our Users Say</h1>
                <p class="c-sub-title">
                    Welcome to your premier digital gateway with Yvonne Khoo,
                    offering comprehensive real estate solutions in the Las
                    Vegas community. Stay informed with live updates on property
                    listings and gain insights into the market with up-to-date
                    statistics.
                </p>
            </div>

            <Carousel :autoplay="2000" :settings="settings" :wrapAround="true" :breakpoints="breakpoints" :pauseAutoplayOnHover="true">
                <Slide v-for="(video, index) in videos" :key="index">
                    <div class="carousel__item">
                        <div class="card c-border-design" @click="openModal(video.id)">
                            <div class="thumbnail-wrapper">
                                <img :src="'https://img.youtube.com/vi/' + video.id + '/hqdefault.jpg'" class="card-img-top c-card-img-border" alt="Video Thumbnail" />
                                <div class="play-button-overlay">▶</div>
                            </div>
                            <div class="card-body text-start">
                                <h5 class="card-title">{{ video.title }}</h5>
                            </div>
                        </div>
                    </div>
                </Slide>
                <template #addons>
                    <Navigation />
                </template>
            </Carousel>
        </div>

        <div v-if="showModal" class="video-modal" @click.self="closeModal">
            <div class="video-modal-content">
                <iframe :src="'https://www.youtube.com/embed/' + currentVideoId + '?autoplay=1'" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
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
    components: { Carousel, Slide, Navigation },
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
            settings: { itemsToShow: 1.5, transition: 500, snapAlign: "center" },
            breakpoints: {
                576: { itemsToShow: 2.5, snapAlign: "center", transition: 500 },
                992: { itemsToShow: 4, snapAlign: "center", transition: 500 },
                1200: { itemsToShow: 4.5, snapAlign: "center", transition: 500 },
            },
        };
    },
    methods: {
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
    display: flex;
    justify-content: center;
    align-items: center;
}
.play-button-overlay {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-size: 2rem;
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
    z-index: 9999;
}
.video-modal-content {
    position: relative;
    width: 80%;
    max-width: 800px;
    background: white;
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
}
.carousel__slide {
    padding: 10px;
    display: flex;
    justify-content: center;
}
.card {
    width: 100%;
    max-width: 300px;
    display: flex;
    flex-direction: column;
}
.card-img-top {
    width: 100%;
    height: auto;
}
</style>