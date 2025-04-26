<template>
    <Master>
        <section class="p-3 bg-white">
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
                    <div class="row text-center g-2">
                        <div
                            v-for="post in blog_posts"
                            :key="post.id"
                             class="col-md-4 d-flex align-items-stretch"
                        >
                            <a
                                class="text-decoration-none w-100"
                                :href="'/blog-details/' + post.id"
                            >
                                <div class="card c-border-design image-cover flex-fill p-2">
                                    <div class="card-img-wrapper">
                                        <img
                                            :src="post.image"
                                            class="card-img-top"
                                            :alt="post.title"
                                            @error="setAltImg"
                                        />
                                    </div>
                                    <div class="card-body d-flex flex-column text-start">
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
    border: 1px solid #eee;
    border-radius: 8px;
    overflow: hidden;
    transition: box-shadow 0.3s ease;
}

.card:hover {
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
}

.card-img-wrapper {
    width: 100%;
    height: 200px;
    overflow: hidden;
}

.card-img-wrapper img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.card-body {
    flex-grow: 1;
    padding: 20px;
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.c-sub-title {
    font-family: "Raleway", sans-serif;
    font-size: 18px;
    font-weight: 600;
    color: rgb(61, 102, 143);
}

</style>