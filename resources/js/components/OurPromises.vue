<style scoped>
/* Interactive Banner Section */
.interactive-banner {
    background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);
    padding: 5rem 0;
    position: relative;
    overflow: hidden;
}

.interactive-banner::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 1px;
    background: linear-gradient(90deg, transparent, #e2e8f0, transparent);
}

.banner-content {
    display: flex;
    align-items: center;
    gap: 4rem;
}

.banner-text {
    flex: 1;
}

.banner-title {
    font-size: 2.5rem;
    font-weight: 700;
    background: linear-gradient(
        135deg,
        rgba(26, 54, 93, 0.85) 0%,
        rgba(45, 55, 72, 0.75) 100%
    );
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    margin-bottom: 1.5rem;
    line-height: 1.2;
}

.banner-description {
    font-size: 1.1rem;
    color: #64748b;
    line-height: 1.6;
    margin-bottom: 2rem;
    max-width: 500px;
}

.banner-btn {
    background: linear-gradient(
  to right,
  hsl(213 71% 45%),  /* lighter */
  hsl(213 71% 30%)   /* darker */
);
    border: none;
    border-radius: 12px;
    padding: 1rem 2.5rem;
    color: white;
    font-weight: 600;
    font-size: 1.1rem;
    text-decoration: none;
    transition: all 0.3s ease;
    display: inline-block;
    box-shadow: 0 4px 15px hsl(213 71% 30%);
}

.banner-btn:hover {
    background: linear-gradient(
  to right,
  hsl(213 71% 45%),  /* lighter */
  hsl(213 71% 30%)   /* darker */
);
    transform: translateY(-3px);
    box-shadow: 0 8px 25px hsl(213 71% 45%);
    color: white;
}

/* Promises Grid */
.promises-grid {
    flex: 1;
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 1.5rem;
}

.promise-card {
    background: white;
    border-radius: 16px;
    padding: 1.5rem;
    transition: all 0.3s ease;
    border: 1px solid #f1f5f9;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
    height: 100%;
    display: flex;
    flex-direction: column;
}

.promise-card:hover {
    transform: translateY(-5px);
    border-color: hsl(213 71% 45%);
    box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15);
}

.promise-header {
    display: flex;
    align-items: center;
    gap: 1rem;
    margin-bottom: 1rem;
}

.promise-icon {
    width: 48px;
    height: 48px;
    border-radius: 12px;
    background: linear-gradient(
  to right,
  hsl(213 71% 45%),  /* lighter */
  hsl(213 71% 30%)   /* darker */
);
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
}

.promise-icon img {
    width: 24px;
    height: 24px;
    filter: brightness(0) invert(1);
}

.promise-title {
    font-size: 1.1rem;
    font-weight: 600;
    color: #1a365d;
    margin: 0;
    line-height: 1.3;
}

.promise-description {
    color: #64748b;
    font-size: 0.9rem;
    line-height: 1.5;
    margin: 0;
}

/* Decorative Elements */
.banner-decoration {
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
@media (max-width: 992px) {
    .banner-content {
        flex-direction: column;
        gap: 3rem;
        text-align: center;
    }

    .banner-title {
        font-size: 2.2rem;
    }

    .promises-grid {
        width: 100%;
        max-width: 500px;
        margin: 0 auto;
    }
}

@media (max-width: 768px) {
    .interactive-banner {
        padding: 3rem 0;
    }

    .banner-title {
        font-size: 2rem;
    }

    .banner-description {
        font-size: 1rem;
    }

    .promises-grid {
        grid-template-columns: 1fr;
        gap: 1rem;
    }

    .promise-card {
        padding: 1.25rem;
    }
}

@media (max-width: 576px) {
    .banner-title {
        font-size: 1.8rem;
    }

    .promise-header {
        flex-direction: column;
        text-align: center;
        gap: 0.75rem;
    }

    .promise-icon {
        width: 40px;
        height: 40px;
    }

    .promise-icon img {
        width: 20px;
        height: 20px;
    }
}

/* Loading State */
.promise-card.loading {
    opacity: 0.7;
    pointer-events: none;
}

.promise-card.loading::after {
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
</style>

<template>
    <div class="interactive-banner">
        <!-- Decorative Background Elements -->
        <div class="banner-decoration decoration-1"></div>
        <div class="banner-decoration decoration-2"></div>

        <div class="container position-relative" style="z-index: 1;">
            <div class="banner-content">
                <!-- Left Side - Text Content -->
                <div class="banner-text">
                    <h2 class="banner-title">
                        Ready to Begin Your Real Estate Journey?
                    </h2>
                    <p class="banner-description">
                        Whether you're looking to buy, sell, or rent, we're here to help
                        you every step of the way. Join thousands of satisfied users who've
                        found their dream homes in Las Vegas.
                    </p>
                    <a href="/contact" class="banner-btn">
                        Get Started Today
                    </a>
                </div>

                <!-- Right Side - Promises Grid -->
                <div class="promises-grid" v-if="Promises.length">
                    <div
                        v-for="(promise, index) in Promises"
                        :key="index"
                        class="promise-card"
                    >
                        <div class="promise-header">
                            <div class="promise-icon">
                                <img
                                    :src="promise.icon"
                                    :alt="promise.title"
                                    @error="setAltImg"
                                />
                            </div>
                            <h6 class="promise-title">{{ promise.title }}</h6>
                        </div>
                        <p class="promise-description">
                            {{ promise.description }}
                        </p>
                    </div>
                </div>

                <!-- Loading State -->
                <div class="promises-grid" v-else>
                    <div v-for="n in 4" :key="n" class="promise-card loading">
                        <div class="promise-header">
                            <div class="promise-icon"></div>
                            <h6 class="promise-title">Loading...</h6>
                        </div>
                        <p class="promise-description">Content is loading</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    created() {
        this.fetchPromises();
    },
    data() {
        return {
            Promises: [],
        };
    },
    methods: {
        fetchPromises() {
            axios
                .get("/api/get-promises")
                .then((response) => {
                    this.Promises = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response?.data?.message || "Something went wrong.");
                });
        },
        setAltImg(event) {
            event.target.src = "/images/default_image.png";
        },
    },
};
</script>
