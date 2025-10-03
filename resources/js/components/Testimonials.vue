<template>
    <div class="video-testimonials-section" v-if="videos.length">
        <div class="container">
            <!-- Section Header -->
            <div class="section-header">
                <h1 class="section-title">What Our Users Say</h1>
                <p class="section-subtitle">
                    Welcome to your premier digital gateway with Yvonne Khoo,
                    offering comprehensive real estate solutions in the Las
                    Vegas community. Stay informed with live updates on property
                    listings and gain insights into the market with up-to-date
                    statistics.
                </p>
            </div>

            <!-- Vue3 Carousel -->
            <Carousel
                :autoplay="settings.autoplay"
                :wrap-around="settings.wrapAround"
                :pause-autoplay-on-hover="settings.pauseAutoplayOnHover"
                :breakpoints="breakpoints"
                :items-to-show="settings.itemsToShow"
                :transition="settings.transition"
                :snap-align="settings.snapAlign"
            >
                <Slide v-for="(video, index) in videos" :key="index">
                    <div class="carousel__slide">
                        <div class="video-card" @click="openModal(video.id)">
                            <div class="video-thumbnail-wrapper">
                                <img
                                    :src="
                                        'https://img.youtube.com/vi/' +
                                        video.id +
                                        '/hqdefault.jpg'
                                    "
                                    class="video-thumbnail"
                                    :alt="video.title"
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
                itemsToShow: 3,
                transition: 500,
                snapAlign: "center",
                autoplay: 3000, // Auto-slide every 3 seconds
                wrapAround: true,
                pauseAutoplayOnHover: true,
            },
            breakpoints: {
                576: { itemsToShow: 1.2 },
                768: { itemsToShow: 2 },
                992: { itemsToShow: 2.5 },
                1200: { itemsToShow: 3 },
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
/* Video Testimonials Section */
.video-testimonials-section {
    background: linear-gradient(
        135deg,
        rgba(26, 54, 93, 0.85) 0%,
        rgba(45, 55, 72, 0.75) 100%
    );
    padding: 4rem 0;
    position: relative;
    overflow: hidden;
}

.video-testimonials-section::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 1px;
    background: linear-gradient(
        90deg,
        transparent,
        rgba(255, 255, 255, 0.3),
        transparent
    );
}

.section-header {
    text-align: center;
    margin-bottom: 3rem;
}

.section-title {
    font-size: 2.5rem;
    font-weight: 700;
    color: white;
    margin-bottom: 1rem;
    position: relative;
}

.section-title::after {
    content: "";
    position: absolute;
    bottom: -10px;
    left: 50%;
    transform: translateX(-50%);
    width: 60px;
    height: 4px;
    background: linear-gradient(
        to right,
        hsl(213 71% 45%),
        /* lighter */ hsl(213 71% 30%) /* darker */
    );
    border-radius: 2px;
}

.section-subtitle {
    font-size: 1.1rem;
    color: rgba(255, 255, 255, 0.8);
    max-width: 600px;
    margin: 0 auto;
    line-height: 1.6;
}

/* Carousel Container */
.carousel-container {
    padding: 1rem 0;
}

/* Carousel Slide - Fixed Height Container */
.carousel__slide {
    padding: 0.5rem 0.75rem;
    height: 380px; /* Fixed height for all slides */
}

.carousel__slide > div {
    height: 90%;
}

/* Video Card - Fixed Height */
.video-card {
    background: rgba(255, 255, 255, 0.05);
    border-radius: 16px;
    overflow: hidden;
    transition: all 0.3s ease;
    border: 1px solid rgba(255, 255, 255, 0.1);
    backdrop-filter: blur(10px);
    cursor: pointer;
    height: 100%; /* Take full height of slide */
    margin: 0 0.75rem;
    display: flex;
    flex-direction: column; /* Enable flexbox for content distribution */
}

.video-card:hover {
    transform: translateY(-8px);
    background: rgba(255, 255, 255, 0.1);
    border-color: rgba(229, 62, 62, 0.3);
    box-shadow: 0 15px 40px rgba(0, 0, 0, 0.3);
}

/* Fixed Image Container */
.video-thumbnail-wrapper {
    position: relative;
    width: 100%;
    height: 200px; /* Fixed height for images */
    overflow: hidden;
    flex-shrink: 0; /* Prevent image container from shrinking */
}

.video-thumbnail {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.5s ease;
}

.video-card:hover .video-thumbnail {
    transform: scale(1.1);
}

.play-overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(229, 62, 62, 0.8);
    display: flex;
    align-items: center;
    justify-content: center;
    opacity: 0;
    transition: all 0.3s ease;
}

.video-card:hover .play-overlay {
    opacity: 1;
}

.play-overlay i {
    font-size: 3rem;
    color: white;
    transition: transform 0.3s ease;
}

.video-card:hover .play-overlay i {
    transform: scale(1.2);
}

/* Fixed Content Area */
.video-card-body {
    padding: 1.5rem;
    flex: 1; /* Take remaining space */
    display: flex;
    flex-direction: column;
    min-height: 0; /* Allow content to shrink properly */
}

.video-card-body h6 {
    color: white;
}

/* Fixed Title with Consistent Height */
.video-title {
    color: white;
    font-size: 1.1rem;
    font-weight: 600;
    line-height: 1.4;
    margin: 0;
    display: -webkit-box;
    -webkit-line-clamp: 3; /* Show max 3 lines */
    -webkit-box-orient: vertical;
    overflow: hidden;
    flex: 1; /* Take available space */
    min-height: 4.2em; /* Minimum height for 3 lines (1.4 * 3) */
    max-height: 4.2em; /* Maximum height for 3 lines */
}

/* Ensure consistent spacing even with short titles */
.video-card-body::after {
    content: "";
    flex: 1;
    min-height: 0;
}

/* Carousel Navigation Styles */
.carousel__prev,
.carousel__next {
    background: rgba(255, 255, 255, 0.1) !important;
    border: 2px solid rgba(255, 255, 255, 0.2) !important;
    border-radius: 50% !important;
    width: 48px !important;
    height: 48px !important;
    backdrop-filter: blur(10px);
    transition: all 0.3s ease !important;
}

.carousel__prev:hover,
.carousel__next:hover {
    background: hsl(213 71% 45%) !important;
    border-color: hsl(213 71% 30%) !important;
    transform: scale(1.1);
}

.carousel__icon {
    fill: white !important;
}

/* Carousel Track Compensation */
.carousel__track {
    margin: 0 -0.75rem;
    align-items: stretch; /* Ensure all slides have same height */
}

/* Video Modal */
.video-modal {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.9);
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 1050;
    backdrop-filter: blur(10px);
}

.video-modal-content {
    position: relative;
    width: 90%;
    max-width: 800px;
    border-radius: 16px;
    overflow: hidden;
    box-shadow: 0 25px 50px rgba(0, 0, 0, 0.5);
}

.video-modal-content iframe {
    width: 100%;
    height: 450px;
    border: none;
    border-radius: 16px;
}

.modal-close {
    position: absolute;
    top: -50px;
    right: 0;
    background: rgba(255, 255, 255, 0.2);
    border: none;
    color: white;
    font-size: 1.5rem;
    width: 40px;
    height: 40px;
    border-radius: 50%;
    cursor: pointer;
    transition: all 0.3s ease;
    backdrop-filter: blur(10px);
}

.modal-close:hover {
    background: #e53e3e;
    transform: scale(1.1);
}

/* Responsive Design */
@media (max-width: 768px) {
    .video-testimonials-section {
        padding: 3rem 0;
    }

    .section-title {
        font-size: 2rem;
    }

    .section-subtitle {
        font-size: 1rem;
        padding: 0 1rem;
    }

    .video-modal-content iframe {
        height: 300px;
    }

    .carousel__slide {
        padding: 0.5rem 0.5rem;
        height: 360px; /* Slightly reduced height for mobile */
    }

    .video-card {
        margin: 0 0.5rem;
    }

    .video-thumbnail-wrapper {
        height: 180px; /* Slightly reduced image height for mobile */
    }

    .video-title {
        font-size: 1rem;
        min-height: 3.6em; /* Adjusted for smaller font */
        max-height: 3.6em;
    }

    .carousel__track {
        margin: 0 -0.5rem;
    }
}

@media (max-width: 576px) {
    .section-title {
        font-size: 1.8rem;
    }

    .video-card-body {
        padding: 1.25rem;
    }

    .modal-close {
        top: -40px;
        right: 10px;
    }

    .carousel__slide {
        padding: 0.25rem 0.5rem;
        height: 340px; /* Further reduced for small screens */
    }

    .video-card {
        margin: 0 0.25rem;
    }

    .video-thumbnail-wrapper {
        height: 160px; /* Further reduced image height */
    }

    .video-title {
        font-size: 0.95rem;
        min-height: 3.4em;
        max-height: 3.4em;
    }

    .carousel__track {
        margin: 0 -0.25rem;
    }
}

/* Fallback for browsers that don't support line-clamp */
@supports not (-webkit-line-clamp: 3) {
    .video-title {
        max-height: 4.2em;
        overflow: hidden;
        position: relative;
    }

    .video-title::after {
        content: "...";
        position: absolute;
        bottom: 0;
        right: 0;
        background: linear-gradient(
            90deg,
            transparent,
            rgba(255, 255, 255, 0.05) 20%
        );
        padding-left: 1rem;
    }
}
</style>
