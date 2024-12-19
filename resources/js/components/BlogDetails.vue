<template>
    <Master>
        <div
            class="top-section"
            :style="{ backgroundImage: `url(${blog_post_details.image})` }"
        >
            <div class="info-overlay">
                <div class="container text-center">
                 
                    <h2 class="title uppercase">{{ blog_post_details.title }}</h2>
                     
                </div>
            </div>
        </div>

        <div class="c-section-main-details container my-4">
            <div class="blog-post">
                <h1 class="my-4">{{ blog_post_details.title }}</h1>
                <div class="content ql-editor" v-html="blog_post_details.content"></div>
            </div>
        </div>
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
                const response = await axios.get(`/api/blog-details-fetch/${this.blog_id}`);
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

.info-overlay {
    background: rgba(0, 0, 0, 0.6); /* More opaque overlay for better text visibility */
    padding: 20px;
    width: 100%;
    text-align: center;
}

.title {
    font-size: 28px;
    margin: 0;
    font-family: 'Raleway', sans-serif; /* Consistent font styling */
}

.uppercase {
    text-transform: uppercase; 
    margin-top: 10px;
}

.c-section-main-details {
    margin-top: -40px; /* To overlap with the top section for a seamless look */
    padding: 20px;
    background-color: #f9f9f9f3; /* Light background for content area */
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
}

h1 {
    font-size: 32px;
    font-weight: bold;
    margin-bottom: 20px;
    color: #333; /* Darker color for the title */
}

.content {
    font-size: 16px;
    line-height: 1.6;
    color: #555; /* Softer text color for content */
}

h2, h3, h4, h5 {
    font-family: 'Raleway', sans-serif;
    color: #E58B15;
    line-height: 1.55rem; 
    font-weight: bold;
    
}

@media (max-width: 768px) {
    .top-section {
        height: 200px; /* Responsive height adjustment */
    }

    .title {
        font-size: 24px; /* Adjust title size for mobile */
    }

    h1 {
        font-size: 28px; /* Adjust h1 for mobile */
    }
}
</style>
