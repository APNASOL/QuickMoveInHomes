<template>
    <Master>
        <div
            class="top-section"
            :style="{ backgroundImage: `url('/images/incentive-main.jpg')` }"
        >
            <div class="info-overlay">
                <div class="d-flex justify-content-center container">
                    <div>
                        <h2 class="title uppercase">Blog</h2>
                        <span class="uppercase">
                            {{ blog_post_details.title }}
                        </span>
                    </div>
                </div>
            </div>
        </div>

        <div class="c-tour-details container">
            <div class="blog-post">
    <!-- Full-width Image at the Top -->
    <div class="image-container">
        
        <img
            :src="blog_post_details.image"
            alt="Blog Post Image"
            class="img-fluid w-100 img-fluid img-thumbnail rounded mt-4"
            style="max-height: 400px; object-fit: cover;"
            @error="setAltImg"
        />
    </div>

    <!-- Title -->
    <h1 class="my-4">{{ blog_post_details.title }}</h1>

    <!-- Content -->
    <div class="content ql-editor" v-html="blog_post_details.content"></div>
</div>

        </div>

        <!-- Seraching Filter -->
    </Master>
</template>

<script>
import Master from "@components/layout/Master.vue";
import Multiselect from "@vueform/multiselect";
import axios from "axios";

export default {
    components: {
        Master,
        Multiselect,
    },
    props: ["blog_id"],
    created() {
        this.incentivesHomes();
    },

    data() {
        return {
            blog_post_details: [],
            backgroundImage: "",
        };
    },

    methods: {
        async incentivesHomes() {
            await axios
                .get("/api/blog-details-fetch/" + this.blog_id)
                .then((response) => {
                    this.blog_post_details = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        setAltImg(event) {
            event.target.src = "/images/default.jpg";
        },
    },
};
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
.c-accomodation-image {
    border-radius: 16px 0px 0px 16px;
}
@media (max-width: 1200px) {
    .c-accomodation-image {
        border-radius: 16px 16px 0px 0px;
    }
}

.beat {
    animation: beating 1s infinite;
}

@keyframes beating {
    0%,
    100% {
        transform: scale(1);
    }
    50% {
        transform: scale(1.1);
    }
}

.top-section {
    position: relative;
    height: 300px; /* Adjust height as needed */
    background-size: cover;
    background-position: center;
    color: white;
    display: flex;
    justify-content: center; /* Center the overlay content */
    align-items: flex-end;
    width: 100%;
    overflow: hidden; /* Ensures no overflow from children */
}

.uppercase {
    text-transform: uppercase;
}

.info-overlay {
    background: rgba(1, 6, 13, 0.8); /* Using RGBA for transparency */
    padding: 20px; /* Increased padding for a better look */
    width: 100%;
    border-radius: 0px !important;
    display: flex; /* Flexbox for alignment */
    flex-direction: column; /* Stack items vertically */
    align-items: center; /* Center align items */
    text-align: center; /* Center align text */
}

.title {
    font-size: 24px;
    margin: 0;
}
</style>
