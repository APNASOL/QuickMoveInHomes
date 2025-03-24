<template>
    <Master>
        <section class="p-3 bg-white"> <!-- Removed container for full width -->
            <!-- Hero Section -->
            <div class="row align-items-center p-3">
                <div class="col-md-12 text-center">
                    <h1 class="uppercase c-main-title">Blogs</h1>
                    <h4 class="c-tags">
                        Explore our insightful blogs featuring the latest trends, tips, and exclusive deals in real estate.
                    </h4>
                </div>
            </div>
        </section> 

        <div class="c-section-main-details container">
            <div v-if="blog_posts && blog_posts.length">
                <div class="mx-4 pt-3">
                    <div class="row g-2">
                        <div
                            v-for="post in blog_posts"
                            :key="post.id"
                            class="col-md-3"
                        >
                            <a
                                class="text-decoration-none"
                                :href="'/blog-details/' + post.id"
                            >
                                <div class="card c-border-design text-center">
                                    <img
                                        :src="post.image"
                                        class="card-img-top c-card-img-border rounded-circle mt-2"
                                        :alt="post.title"
                                        @error="setAltImg"
                                    />
                                    <div class="card-body text-start">
                                        <h5 class="c-sub-title text-center">
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
        };
    },

    methods: {
        async getBlogs() {
            await axios
                .get("/api/overall-blogs")
                .then((response) => {
                    this.blog_posts = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        setAltImg(event) {
            event.target.src = "/images/default_image.png";
        },
    },
};
</script>

<style scoped>
.uppercase {
    text-transform: uppercase;
}

.c-main-title {
    font-size: 28px;
    font-weight: bold;
    color: rgb(61, 102, 143);
}

.c-tags {
    font-size: 18px;
    color: #333;
}

.card {
    display: flex;
    flex-direction: column;
    height: 100%;
    background-color: white;
    align-items: center;
}

.card-body {
    flex-grow: 1;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

.card-img-top {
    width: 120px;
    height: 120px;
    object-fit: cover;
    object-position: center;
    border-radius: 50%;
}
</style>