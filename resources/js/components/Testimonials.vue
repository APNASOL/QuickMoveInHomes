<template>
    <div class="c-bg-color" v-if="videos.length">
        <div class="container py-5">
            <!-- Section Title -->
            <div class="text-center mb-5">
                <h1 class="c-main-title text-primary fw-bold c-title">
                    What Our Users Say
                </h1>
                <p class="c-sub-title text-muted" style="">
                    Welcome to your premier digital gateway with Yvonne Khoo,
                    offering comprehensive real estate solutions in the Las
                    Vegas community. Stay informed with live updates on property
                    listings and gain insights into the market with up-to-date
                    statistics.
                </p>
            </div>

            <!-- Video Carousel -->
            <Carousel
                :autoplay="3000"
                :settings="settings"
                :wrapAround="true"
                :breakpoints="breakpoints"
                :pauseAutoplayOnHover="true"
            >
                <Slide v-for="(video, index) in videos" :key="index">
                    <div class="carousel__slide-item">
                        <div
                            class="video-card shadow-sm"
                            @click="openModal(video.id)"
                        >
                            <div class="video-thumbnail-wrapper">
                                <img
                                    :src="
                                        'https://img.youtube.com/vi/' +
                                        video.id +
                                        '/hqdefault.jpg'
                                    "
                                    class="video-thumbnail"
                                    alt="Video Thumbnail"
                                />
                                <div class="play-overlay">
                                    <i class="bi bi-play-fill"></i>
                                </div>
                            </div>
                            <div class="video-card-body">
                                <h6>{{ video.title }}</h6>
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
        <div v-if="showModal" class="video-modal" @click.self="closeModal">
            <div class="video-modal-content">
                <iframe
                    :src="
                        'https://www.youtube.com/embed/' +
                        currentVideoId +
                        '?autoplay=1'
                    "
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
    components: { Carousel, Slide, Navigation },
    data() {
        return {
            videos: [
                {
                    id: "UsO2VQrg3N4",
                    title: "Review from a long distance client,he bought his first home",
                },
                { id: "5FAUuoQLkFQ", title: "Why Hire Yvonne's team!" },
                {
                    id: "2mVU4ZKhZQA",
                    title: "You Can not get a better realtor then Yvonne, end of story",
                },
                { id: "PhNU4BTn1TQ", title: "Review Video ,Closed Dec 2021 " },
                {
                    id: "hJxpO6uyonI",
                    title: "Recommendation from past client - closed Jan 2020",
                },
                {
                    id: "9A7qMoLLb4E",
                    title: "Clients Thanking a friend, for referring Yvonne!",
                },
                {
                    id: "8CtUrJIIuXo",
                    title: "We got the keys! Moving in 10 days early! Feb 2020!",
                },
                {
                    id: "UdIPX-K-5-k",
                    title: "Happy Buyers doing a final walk thru Jan 2020",
                },
                { id: "ImSNcfNCPvk", title: "Recommended by Diogo Piacentini" },
            ],
            showModal: false,
            currentVideoId: null,
            settings: {
                itemsToShow: 1.2,
                transition: 500,
                snapAlign: "center",
            },
            breakpoints: {
                576: { itemsToShow: 2.5 },
                768: { itemsToShow: 3 },
                992: { itemsToShow: 4 },
                1200: { itemsToShow: 4.5 },
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
<style>
.carousel__slide-item {
    padding: 12px;
    display: flex;
    justify-content: center;
}

.video-card {
    width: 100%;
    max-width: 260px;
    border-radius: 12px;
    background: #fff;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.06);
    transition: all 0.3s ease-in-out;
    cursor: pointer;
    overflow: hidden;
}

.video-card:hover {
    transform: translateY(-4px);
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
}

.video-thumbnail-wrapper {
    position: relative;
    height: 160px;
    overflow: hidden;
}

.video-thumbnail {
    width: 100%;
    height: 100%;
    object-fit: cover;
    display: block;
}

.play-overlay {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: rgba(255, 255, 255, 0.85);
    border-radius: 50%;
    padding: 12px;
    font-size: 1.5rem;
    color: #023f86;
    display: flex;
    justify-content: center;
    align-items: center;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}

.video-card-body {
    padding: 12px;
    min-height: 60px;
}

.video-card-body h6 {
    font-size: 0.95rem;
    font-weight: 600;
    color: #343a40;
    line-height: 1.4;
    margin: 0;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
}
</style>
