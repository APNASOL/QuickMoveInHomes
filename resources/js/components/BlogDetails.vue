<template>
    <Master>
        <!-- Hero Section -->
        <div
            class="top-section"
            :style="{
                backgroundImage: `url(${
                    blog_post_details.image || '/images/default_banner.jpg'
                })`,
            }"
        >
            <div class="info-overlay">
                <div class="container text-center">
                    <h2 class="title">{{ blog_post_details.title }}</h2>
                </div>
            </div>
        </div>

        <!-- Main Content Section -->
        <section class="blog-details container my-5">
            <div class="blog-post p-4 bg-white shadow-sm rounded-4">
                <h1 class="mb-4 c-main-title">{{ blog_post_details.title }}</h1>
                <div
                    class="content ql-editor"
                    v-html="blog_post_details.content"
                ></div>
            </div>
        </section>
    </Master>
</template>

<script>
import Master from "@components/layout/Master.vue";
import axios from "axios";

export default {
    components: {
        Master,
    },
    props: ["blog_id"],
    created() {
        this.fetchBlogDetails();
    },
    data() {
        return {
            blog_post_details: {},
        };
    },
    methods: {
        async fetchBlogDetails() {
            try {
                const response = await axios.get(
                    `/api/blog-details-fetch/${this.blog_id}`
                );
                this.blog_post_details = response.data;
            } catch (error) {
                toastr.error(error.response.data.message);
            }
        },
    },
};
</script>
<style scoped>
.top-section {
    position: relative;
    height: 400px;
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #fff;
}

.info-overlay {
    background: rgba(0, 0, 0, 0.5);
    padding: 60px 20px;
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
}

.title {
    font-size: 3rem;
    font-weight: 700;
    text-transform: uppercase;
    font-family: "Poppins", sans-serif;
    letter-spacing: 2px;
}

.blog-details {
    max-width: 900px;
    margin: auto;
}

.blog-post {
    background-color: #ffffff;
    border-radius: 16px;
    padding: 40px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
    animation: fadeInUp 0.6s ease forwards;
}

.post-title {
    font-size: 2.5rem;
    font-weight: bold;
    color: #222;
    font-family: "Poppins", sans-serif;
}

.content {
    font-size: 1.1rem;
    color: #555;
    line-height: 1.8;
    margin-top: 20px;
}

.content h2,
.content h3,
.content h4 {
    margin-top: 30px;
    color: #3b82f6;
    font-weight: 600;
}

.content p {
    margin-bottom: 1.5rem;
}

/* Simple animation */
@keyframes fadeInUp {
    0% {
        opacity: 0;
        transform: translateY(20px);
    }
    100% {
        opacity: 1;
        transform: translateY(0);
    }
}

/* Responsive */
@media (max-width: 768px) {
    .top-section {
        height: 250px;
    }
    .title {
        font-size: 2rem;
    }
    .post-title {
        font-size: 2rem;
    }
}
</style>
