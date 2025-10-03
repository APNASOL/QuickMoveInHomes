<template>
    <Master>
        <!-- Hero Section -->
        <section class="blog-hero-section">
            <div
                class="hero-background"
                :style="{
                    backgroundImage: `url(${
                        blog_post_details.image || '/images/default_banner.jpg'
                    })`,
                }"
            ></div>
            <div class="hero-overlay">
                <div class="container position-relative" style="z-index: 1">
                    <div class="hero-content">
                        <h1 class="page-title">{{ blog_post_details.title }}</h1>
                        <div class="hero-meta">
                            <span class="meta-item">
                                <i class="bi bi-calendar"></i>
                                {{ formatDate(blog_post_details.created_at) }}
                            </span>
                            <span class="meta-item">
                                <i class="bi bi-clock"></i>
                                {{ blog_post_details.read_time || '5 min' }} read
                            </span>
                        </div>
                    </div>
                </div>

                <!-- Decorative Elements -->
                <div class="section-decoration decoration-1"></div>
                <div class="section-decoration decoration-2"></div>
            </div>
        </section>

        <!-- Main Content Section -->
        <section class="content-section">
            <div class="container">
                <div class="content-card">
                    <!-- Blog Content -->
                    <article class="blog-article">
                        <div class="article-header">
                            <div class="category-badge">
                                <i class="bi bi-tag"></i>
                                {{ blog_post_details.category || 'General' }}
                            </div>
                        </div>

                        <div class="article-content ql-editor" v-html="blog_post_details.content"></div>

                        <!-- Article Footer -->
                        <div class="article-footer">
                            <div class="tags-section">
                                <span class="tags-label">
                                    <i class="bi bi-tags"></i>
                                    Tags:
                                </span>
                                <div class="tags-list">
                                    <span
                                        v-for="tag in blog_post_details.tags"
                                        :key="tag"
                                        class="tag"
                                    >
                                        {{ tag }}
                                    </span>
                                </div>
                            </div>

                            <div class="share-section">
                                <span class="share-label">Share this article:</span>
                                <div class="share-buttons">
                                    <a href="#" class="share-btn">
                                        <i class="bi bi-facebook"></i>
                                    </a>
                                    <a href="#" class="share-btn">
                                        <i class="bi bi-twitter"></i>
                                    </a>
                                    <a href="#" class="share-btn">
                                        <i class="bi bi-linkedin"></i>
                                    </a>
                                    <a href="#" class="share-btn">
                                        <i class="bi bi-link-45deg"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </article>

                    <!-- Related Posts Section -->
                    <div class="related-section">
                        <div class="section-header">
                            <div class="section-icon">
                                <i class="bi bi-journal-text"></i>
                            </div>
                            <h2 class="section-title">Related Articles</h2>
                        </div>
                        <div class="related-grid">
                            <!-- This would be populated with related posts data -->
                            <div class="related-placeholder">
                                <i class="bi bi-newspaper"></i>
                                <p>More insightful articles coming soon</p>
                            </div>
                        </div>
                    </div>
                </div>
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
        formatDate(dateString) {
            if (!dateString) return 'Recent';
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

<style scoped>
/* Blog Hero Section */
.blog-hero-section {
    position: relative;
    height: 500px;
    overflow: hidden;
}

.hero-background {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    transform: scale(1.1);
    transition: transform 0.8s ease;
}

.blog-hero-section:hover .hero-background {
    transform: scale(1.05);
}

.hero-overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(
        135deg,
        rgba(26, 54, 93, 0.85) 0%,
        rgba(45, 55, 72, 0.75) 100%
    );
    display: flex;
    align-items: center;
}

.hero-content {
    text-align: center;
    max-width: 800px;
    margin: 0 auto;
}

.page-title {
    font-size: 3rem;
    font-weight: 700;
    color: white;
    margin-bottom: 1.5rem;
    position: relative;
    line-height: 1.2;
}

.page-title::after {
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
        hsl(213 71% 30%)
    );
    border-radius: 2px;
}

.hero-meta {
    display: flex;
    gap: 2rem;
    justify-content: center;
    align-items: center;
    flex-wrap: wrap;
}

.meta-item {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    color: rgba(255, 255, 255, 0.8);
    font-size: 1rem;
}

.meta-item i {
    color: hsl(213 71% 45%);
}

/* Content Section */
.content-section {
    padding: 5rem 0;
}

.content-card {
    background: white;
    border-radius: 24px;
    padding: 3rem;
    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.08);
    border: 1px solid #f1f5f9;
}

/* Blog Article */
.blog-article {
    max-width: 800px;
    margin: 0 auto;
}

.article-header {
    margin-bottom: 2rem;
}

.category-badge {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    background: linear-gradient(
        to right,
        hsl(213 71% 45%),
        hsl(213 71% 30%)
    );
    color: white;
    padding: 0.5rem 1rem;
    border-radius: 20px;
    font-size: 0.9rem;
    font-weight: 600;
}

.article-content {
    font-size: 1.1rem;
    line-height: 1.8;
    color: #64748b;
}

.article-content :deep(h2) {
    font-size: 1.8rem;
    font-weight: 700;
    color: #1a365d;
    margin: 2.5rem 0 1rem 0;
    padding-bottom: 0.5rem;
    border-bottom: 3px solid hsl(213 71% 45%);
}

.article-content :deep(h3) {
    font-size: 1.5rem;
    font-weight: 600;
    color: #1a365d;
    margin: 2rem 0 1rem 0;
}

.article-content :deep(p) {
    margin-bottom: 1.5rem;
}

.article-content :deep(blockquote) {
    border-left: 4px solid hsl(213 71% 45%);
    padding-left: 1.5rem;
    margin: 2rem 0;
    font-style: italic;
    color: #64748b;
    background: #f8fafc;
    padding: 1.5rem;
    border-radius: 0 12px 12px 0;
}

.article-content :deep(ul),
.article-content :deep(ol) {
    margin: 1.5rem 0;
    padding-left: 2rem;
}

.article-content :deep(li) {
    margin-bottom: 0.5rem;
}

.article-content :deep(a) {
    color: hsl(213 71% 45%);
    text-decoration: none;
    font-weight: 600;
}

.article-content :deep(a:hover) {
    text-decoration: underline;
}

/* Article Footer */
.article-footer {
    margin-top: 3rem;
    padding-top: 2rem;
    border-top: 2px solid #f1f5f9;
}

.tags-section {
    display: flex;
    align-items: center;
    gap: 1rem;
    margin-bottom: 2rem;
    flex-wrap: wrap;
}

.tags-label {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    font-weight: 600;
    color: #1a365d;
}

.tags-list {
    display: flex;
    gap: 0.5rem;
    flex-wrap: wrap;
}

.tag {
    background: #f1f5f9;
    color: #64748b;
    padding: 0.4rem 1rem;
    border-radius: 15px;
    font-size: 0.9rem;
    transition: all 0.3s ease;
}

.tag:hover {
    background: hsl(213 71% 45%);
    color: white;
    transform: translateY(-2px);
}

.share-section {
    display: flex;
    align-items: center;
    gap: 1rem;
    flex-wrap: wrap;
}

.share-label {
    font-weight: 600;
    color: #1a365d;
}

.share-buttons {
    display: flex;
    gap: 0.75rem;
}

.share-btn {
    width: 40px;
    height: 40px;
    background: #f1f5f9;
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #64748b;
    text-decoration: none;
    transition: all 0.3s ease;
}

.share-btn:hover {
    background: hsl(213 71% 45%);
    color: white;
    transform: translateY(-2px);
}

/* Related Section */
.related-section {
    margin-top: 4rem;
    padding: 2.5rem;
    background: #f8fafc;
    border-radius: 16px;
    border: 1px solid #e2e8f0;
    position: relative;
    overflow: hidden;
}

.related-section::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 4px;
    height: 100%;
    background: linear-gradient(
        to right,
        hsl(213 71% 45%),
        hsl(213 71% 30%)
    );
    border-radius: 2px 0 0 2px;
}

.section-header {
    display: flex;
    align-items: flex-start;
    gap: 1rem;
    margin-bottom: 2rem;
}

.section-icon {
    width: 48px;
    height: 48px;
    background: linear-gradient(
        to right,
        hsl(213 71% 45%),
        hsl(213 71% 30%)
    );
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-size: 1.5rem;
    flex-shrink: 0;
}

.section-title {
    font-size: 1.6rem;
    font-weight: 700;
    color: #1a365d;
    margin: 0;
    line-height: 1.2;
}

.related-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 2rem;
}

.related-placeholder {
    grid-column: 1 / -1;
    text-align: center;
    padding: 3rem;
    background: white;
    border-radius: 12px;
    border: 2px dashed #e2e8f0;
    color: #64748b;
}

.related-placeholder i {
    font-size: 3rem;
    color: #cbd5e1;
    margin-bottom: 1rem;
}

/* Decorative Elements */
.section-decoration {
    position: absolute;
    width: 150px;
    height: 150px;
    background: linear-gradient(
        135deg,
        rgba(229, 62, 62, 0.1),
        rgba(255, 255, 255, 0.05)
    );
    border-radius: 50%;
    filter: blur(30px);
    z-index: 0;
}

.decoration-1 {
    top: -30px;
    right: -30px;
}

.decoration-2 {
    bottom: -30px;
    left: -30px;
}

/* Animations */
@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.content-card {
    animation: fadeInUp 0.6s ease-out;
}

.article-content {
    animation: fadeInUp 0.8s ease-out 0.2s both;
}

.article-footer {
    animation: fadeInUp 0.8s ease-out 0.4s both;
}

.related-section {
    animation: fadeInUp 0.8s ease-out 0.6s both;
}

/* Responsive Design */
@media (max-width: 768px) {
    .blog-hero-section {
        height: 400px;
    }

    .page-title {
        font-size: 2.2rem;
    }

    .content-section {
        padding: 3rem 0;
    }

    .content-card {
        padding: 2rem;
        border-radius: 20px;
    }

    .hero-meta {
        flex-direction: column;
        gap: 1rem;
    }

    .section-header {
        flex-direction: column;
        gap: 1rem;
    }

    .section-title {
        font-size: 1.4rem;
    }

    .tags-section,
    .share-section {
        flex-direction: column;
        align-items: flex-start;
    }

    .related-section {
        padding: 2rem;
    }
}

@media (max-width: 576px) {
    .page-title {
        font-size: 1.8rem;
    }

    .content-card {
        padding: 1.5rem;
    }

    .section-icon {
        width: 40px;
        height: 40px;
        font-size: 1.2rem;
    }

    .article-content :deep(h2) {
        font-size: 1.5rem;
    }

    .article-content :deep(h3) {
        font-size: 1.3rem;
    }
}
</style>
