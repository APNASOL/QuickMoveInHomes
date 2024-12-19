<template>
    <Master>
        <div
            class="top-section"
            :style="{ backgroundImage: `url('/images/incentive-main.jpg')` }"
        >
            <div class="info-overlay">
                <div class="d-flex justify-content-center container">
                    <div>
                        <h2 class="title uppercase">Blogs</h2>
                        <span class="uppercase">
                            Explore our insightful blogs featuring the latest
                            trends, tips, and exclusive deals in real estate.
                        </span>
                    </div>
                </div>
            </div>
        </div>

        <div class="c-section-main-details container">
            <div v-if="blog_posts && blog_posts.length">
                <div class="mx-4 pt-3">
                    <div class="row">
                        <div
                            v-for="post in blog_posts"
                            :key="post.id"
                            class="col-md-3 mb-2"
                        >
                            <a
                                class="text-decoration-none"
                                :href="'/blog-details/' + post.id"
                            >
                                <div class="card c-border-design">
                                    <img
                                        :src="post.image"
                                        class="card-img-top c-card-img-border"
                                        :alt="post.title"
                                        @error="setAltImg"
                                    />

                                    <div class="card-body text-start">
                                        <h5 class="card-title">
                                            {{ post.title }}
                                        </h5>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
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

    created() {
        this.getBlogs();
    },

    data() {
        return {
            blog_posts: [],
            backgroundImage: "",
        };
    },

    methods: {
        async getBlogs() {
            await axios
                .get("/api/overall-blogs")
                .then((response) => {
                    this.blog_posts = response.data;
                    setTimeout(() => {
                        this.openModal();
                    }, 1000);
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

h2,
h3,
h4,
h5 {
    font-family: "Raleway", sans-serif;
    color: #e58b15;
    line-height: 1.55rem;
    font-weight: bold;
}

.card {
    height: 280px; /* Fixed height for the card */
    display: flex;
    flex-direction: column; /* Stack card content vertically */
    justify-content: space-between; /* Space out content evenly */

}

.card-body {
    flex: 1; /* Allow the card body to take remaining space */
    display: flex;
    flex-direction: column; /* Stack content vertically */
    justify-content: flex-start; /* Align items to the start */
    
}

.card-img-top {
    height: 150px; /* Fixed height for the image */
    object-fit: cover; /* Ensure image covers the area */
    object-position: center; /* Center the image */
}
</style>
