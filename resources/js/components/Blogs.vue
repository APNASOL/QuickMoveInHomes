<style scoped>
/* Blogs Page Styles */
.blogs-hero-section {
    background: linear-gradient(
        135deg,
        rgba(26, 54, 93, 0.85) 0%,
        rgba(45, 55, 72, 0.75) 100%
    );
    padding: 4rem 0;
    position: relative;
    overflow: hidden;
}

.blogs-hero-section::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 1px;
    background: linear-gradient(90deg, transparent, #e2e8f0, transparent);
}

.hero-content {
    text-align: center;
    max-width: 800px;
    margin: 0 auto;
}

.page-title {
    font-size: 3rem;
    font-weight: 700;
    background: white;
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    margin-bottom: 1.5rem;
    text-transform: uppercase;
    letter-spacing: 1px;
}

.page-subtitle {
    font-size: 1.3rem;
    color: white;
    line-height: 1.6;
    margin: 0 auto;
}

/* Blogs Grid Section */
.blogs-section {
    padding: 5rem 0;
    background: white;
}

.blogs-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
    gap: 2rem;
    margin-top: 3rem;
}

.blog-card {
    background: white;
    border-radius: 20px;
    overflow: hidden;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
    transition: all 0.3s ease;
    border: 1px solid #f1f5f9;
    display: flex;
    flex-direction: column;
    height: 100%;
    text-decoration: none;
    color: inherit;
}

.blog-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
    border-color: hsl(213 71% 45%);
    text-decoration: none;
    color: inherit;
}

.blog-image-wrapper {
    position: relative;
    width: 100%;
    height: 240px;
    overflow: hidden;
}

.blog-image {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.5s ease;
}

.blog-card:hover .blog-image {
    transform: scale(1.1);
}

.blog-overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(135deg, hsl(213 71% 45%), rgba(26, 54, 93, 0.7));
    opacity: 0;
    transition: opacity 0.3s ease;
    display: flex;
    align-items: center;
    justify-content: center;
}

.blog-card:hover .blog-overlay {
    opacity: 1;
}

.read-more-text {
    color: white;
    font-weight: 600;
    font-size: 1.1rem;
    transform: translateY(20px);
    transition: transform 0.3s ease;
}

.blog-card:hover .read-more-text {
    transform: translateY(0);
}

.blog-content {
    padding: 1.5rem;
    flex-grow: 1;
    display: flex;
    flex-direction: column;
}

.blog-title {
    font-size: 1.3rem;
    font-weight: 700;
    color: #1a365d;
    line-height: 1.3;
    margin-bottom: 1rem;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-align: center;
}

.blog-excerpt {
    color: #64748b;
    line-height: 1.5;
    margin-bottom: 1.5rem;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
    overflow: hidden;
    flex-grow: 1;
}

.blog-meta {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding-top: 1rem;
    border-top: 1px solid #f1f5f9;
}

.blog-date {
    font-size: 0.9rem;
    color: #94a3b8;
    font-weight: 500;
}

.blog-cta {
    color: hsl(213 71% 45%);
    font-weight: 600;
    font-size: 0.9rem;
    transition: color 0.3s ease;
}

.blog-card:hover .blog-cta {
    color: hsl(213 71% 45%);
}

/* Loading State */
.blogs-loading {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
    gap: 2rem;
    margin-top: 3rem;
}

.blog-card-loading {
    background: white;
    border-radius: 20px;
    overflow: hidden;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
    border: 1px solid #f1f5f9;
    height: 400px;
    position: relative;
    overflow: hidden;
}

.blog-card-loading::after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, rgba(255,255,255,0.4), transparent);
    animation: loading 1.5s infinite;
}

@keyframes loading {
    0% { transform: translateX(-100%); }
    100% { transform: translateX(100%); }
}

/* Empty State */
.empty-state {
    text-align: center;
    padding: 4rem 2rem;
    background: #f8fafc;
    border-radius: 20px;
    margin: 2rem 0;
}

.empty-state-icon {
    font-size: 4rem;
    color: #cbd5e0;
    margin-bottom: 1.5rem;
}

.empty-state-title {
    font-size: 1.5rem;
    color: #64748b;
    margin-bottom: 1rem;
}

.empty-state-text {
    color: #94a3b8;
    max-width: 400px;
    margin: 0 auto;
}

/* Decorative Elements */
.section-decoration {
    position: absolute;
    width: 200px;
    height: 200px;
    background: linear-gradient(135deg, rgba(229, 62, 62, 0.1), rgba(26, 54, 93, 0.1));
    border-radius: 50%;
    filter: blur(40px);
    z-index: 0;
}

.decoration-1 {
    top: -50px;
    right: -50px;
}

.decoration-2 {
    bottom: -50px;
    left: -50px;
}

/* Responsive Design */
@media (max-width: 768px) {
    .blogs-hero-section {
        padding: 3rem 0;
    }

    .page-title {
        font-size: 2.2rem;
    }

    .page-subtitle {
        font-size: 1.1rem;
    }

    .blogs-section {
        padding: 3rem 0;
    }

    .blogs-grid {
        grid-template-columns: 1fr;
        gap: 1.5rem;
    }

    .blog-image-wrapper {
        height: 200px;
    }
}

@media (max-width: 576px) {
    .page-title {
        font-size: 1.8rem;
    }

    .blog-content {
        padding: 1.25rem;
    }

    .blog-title {
        font-size: 1.1rem;
    }

    .blogs-grid {
        grid-template-columns: 1fr;
    }
}

/* Filter and Search Styles (if added in future) */
.blogs-filter {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 2rem;
    gap: 1rem;
    flex-wrap: wrap;
}

.search-box {
    flex: 1;
    max-width: 400px;
}

.search-input {
    width: 100%;
    padding: 0.75rem 1rem;
    border: 2px solid #e2e8f0;
    border-radius: 12px;
    font-size: 1rem;
    transition: all 0.3s ease;
}

.search-input:focus {
    border-color: hsl(213 71% 45%);
    box-shadow: 0 0 0 3px rgba(229, 62, 62, 0.1);
    outline: none;
}
</style>

<template>
    <Master>
        <!-- Hero Section -->
        <section class="blogs-hero-section">
            <div class="container position-relative" style="z-index: 1;">
                <div class="hero-content">
                    <h1 class="page-title">Blogs</h1>
                    <p class="page-subtitle">
                        Explore our insightful blogs featuring the latest trends, tips, and exclusive deals in real estate.
                    </p>
                </div>
            </div>

            <!-- Decorative Elements -->
            <div class="section-decoration decoration-1"></div>
            <div class="section-decoration decoration-2"></div>
        </section>

        <!-- Blogs Grid Section -->
        <section class="blogs-section">
            <div class="container">
                <!-- Blogs Grid -->
                <div v-if="blog_posts && blog_posts.length" class="blogs-grid">
                    <a
                        v-for="post in blog_posts"
                        :key="post.id"
                        :href="'/blog-details/' + post.id"
                        class="blog-card"
                    >
                        <div class="blog-image-wrapper">
                            <img
                                :src="post.image"
                                class="blog-image"
                                :alt="post.title"
                                @error="setAltImg"
                            />
                            <div class="blog-overlay">
                                <span class="read-more-text">Read More</span>
                            </div>
                        </div>
                        <div class="blog-content">
                            <h3 class="blog-title">{{ post.title }}</h3>
                            <p class="blog-excerpt" v-if="post.excerpt">
                                {{ post.excerpt }}
                            </p>
                            <p class="blog-excerpt" v-else>
                                Discover valuable insights and expert advice in this comprehensive blog post...
                            </p>
                            <div class="blog-meta">
                                <span class="blog-date" v-if="post.created_at">
                                    {{ formatDate(post.created_at) }}
                                </span>
                                <span class="blog-date" v-else>
                                    Recent Post
                                </span>
                                <span class="blog-cta">
                                    Read Article →
                                </span>
                            </div>
                        </div>
                    </a>
                </div>

                <!-- Loading State -->
                <div v-else-if="!blog_posts" class="blogs-loading">
                    <div v-for="n in 6" :key="n" class="blog-card-loading"></div>
                </div>

                <!-- Empty State -->
                <div v-else class="empty-state">
                    <div class="empty-state-icon">
                        <i class="bi bi-file-earmark-text"></i>
                    </div>
                    <h3 class="empty-state-title">No Blog Posts Yet</h3>
                    <p class="empty-state-text">
                        We're working on creating valuable content for you. Check back soon for the latest real estate insights and tips.
                    </p>
                </div>
            </div>
        </section>
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

        formatDate(dateString) {
            if (!dateString) return 'Recent Post';
            const date = new Date(dateString);
            return date.toLocaleDateString('en-US', {
                year: 'numeric',
                month: 'long',
                day: 'numeric'
            });
        }
    },
};
</script>
