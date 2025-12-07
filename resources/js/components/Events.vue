<style scoped>
/* Events Hero Section */
.events-hero {
    background: linear-gradient(
        135deg,
        rgba(26, 54, 93, 0.85) 0%,
        rgba(45, 55, 72, 0.75) 100%
    );
    padding: 4rem 0;
    position: relative;
    overflow: hidden;
}

.events-hero::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 1px;
    background: linear-gradient(90deg, transparent, #e2e8f0, transparent);
}

.hero-title {
    font-size: 3rem;
    font-weight: 700;
    background: white;
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    margin-bottom: 1.5rem;
    line-height: 1.1;
}

.hero-subtitle {
    font-size: 1.3rem;
    color: white;
    line-height: 1.6;
    margin-bottom: 0;
}

/* Events Content Section */
.events-content {
    padding: 4rem 0;
    background: white;
}

.events-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(380px, 1fr));
    gap: 2rem;
    margin-top: 2rem;
}

.event-card {
    background: white;
    border-radius: 20px;
    overflow: hidden;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
    transition: all 0.3s ease;
    border: 1px solid #f1f5f9;
    display: flex;
    flex-direction: column;
    height: 100%;
}

.event-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
    border-color: hsl(213 71% 45%);
}

.event-image {
    width: 100%;
    height: 240px;
    object-fit: cover;
    transition: transform 0.5s ease;
}

.event-card:hover .event-image {
    transform: scale(1.05);
}

.event-content {
    padding: 1.5rem;
    flex-grow: 1;
    display: flex;
    flex-direction: column;
}

.event-title {
    font-size: 1.4rem;
    font-weight: 700;
    color: #1a365d;
    margin-bottom: 0.75rem;
    text-align: center;
    line-height: 1.3;
}

.event-date {
    font-size: 1rem;
    font-weight: 600;
    color: hsl(213 71% 45%);
    text-align: center;
    margin-bottom: 1rem;
    padding: 0.5rem;
    background: hsl(213 71% 90%);
    border-radius: 8px;
}

.event-description {
    color: #64748b;
    line-height: 1.6;
    flex-grow: 1;
    margin-bottom: 1.5rem;
}

/* Read More/Less Button */
.read-more {
    color: hsl(213 71% 45%);
    cursor: pointer;
    font-weight: 600;
    font-size: 0.9rem;
    transition: all 0.3s ease;
    display: inline-block;
    margin-top: 0.5rem;
}

.read-more:hover {
    color: hsl(213 71% 45%);
    transform: translateX(2px);
}

/* Registration Button */
.register-btn {
    background: linear-gradient(
        to right,
        hsl(213 71% 45%),
        /* lighter */ hsl(213 71% 30%) /* darker */
    );
    border: none;
    border-radius: 12px;
    padding: 0.75rem 1.5rem;
    color: white;
    font-weight: 600;
    text-decoration: none;
    text-align: center;
    transition: all 0.3s ease;
    margin-top: auto;
    width: 100%;
}

.register-btn:hover {
    background: linear-gradient(
        to right,
        hsl(213 71% 45%),
        /* lighter */ hsl(213 71% 30%) /* darker */
    );
    transform: translateY(-2px);
    box-shadow: 0 8px 20px hsl(213 71% 45%);
    color: white;
}

/* No Events State */
.no-events {
    text-align: center;
    padding: 4rem 2rem;
    background: #f8fafc;
    border-radius: 16px;
    border: 2px dashed #e2e8f0;
    grid-column: 1 / -1;
}

.no-events h4 {
    color: #64748b;
    font-size: 1.5rem;
    margin-bottom: 1rem;
}

.no-events p {
    color: #94a3b8;
    margin-bottom: 0;
}

/* Decorative Elements */
.decoration {
    position: absolute;
    width: 200px;
    height: 200px;
    background: linear-gradient(
        135deg,
        rgba(229, 62, 62, 0.1),
        rgba(26, 54, 93, 0.05)
    );
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
    .events-hero {
        padding: 3rem 0;
    }

    .hero-title {
        font-size: 2.2rem;
    }

    .hero-subtitle {
        font-size: 1.1rem;
        padding: 0 1rem;
    }

    .events-content {
        padding: 3rem 0;
    }

    .events-grid {
        grid-template-columns: 1fr;
        gap: 1.5rem;
    }

    .event-content {
        padding: 1.25rem;
    }

    .event-title {
        font-size: 1.2rem;
    }
}

@media (max-width: 576px) {
    .hero-title {
        font-size: 1.8rem;
    }

    .events-grid {
        grid-template-columns: 1fr;
    }

    .event-image {
        height: 200px;
    }

    .event-title {
        font-size: 1.1rem;
    }
}

/* Loading State */
.event-card.loading {
    opacity: 0.7;
    pointer-events: none;
}

.event-card.loading::after {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(
        90deg,
        transparent,
        rgba(255, 255, 255, 0.4),
        transparent
    );
    animation: loading 1.5s infinite;
}

@keyframes loading {
    0% {
        transform: translateX(-100%);
    }
    100% {
        transform: translateX(100%);
    }
}

/* QL Editor Content Styling */
:deep(.ql-editor) {
    padding: 0 !important;
    font-family: inherit !important;
}

:deep(.ql-editor p) {
    margin-bottom: 1rem;
}

:deep(.ql-editor p:last-child) {
    margin-bottom: 0;
}
.event-card.past {
    opacity: 0.6;
}
.action-btn {
    padding: 0.75rem 2rem;
    border-radius: 12px;
    font-weight: 600;
    text-decoration: none;
    transition: all 0.3s ease;
    border: 2px solid transparent;
    cursor: pointer;
    min-width: 120px;
}

.btn-primary {
    background: linear-gradient(to right, hsl(213 71% 45%), hsl(213 71% 30%));
    color: white;
    margin-bottom: 20px;
}

.btn-primary:hover:not(:disabled) {
    transform: translateY(-2px);
    box-shadow: 0 8px 20px rgba(59, 130, 246, 0.3);
}

.btn-primary:disabled {
    opacity: 0.7;
    cursor: not-allowed;
}
</style>

<template>
    <Master>
        <!-- Hero Section -->
        <section class="events-hero">
            <div class="decoration decoration-1"></div>
            <div class="decoration decoration-2"></div>

            <div class="container position-relative" style="z-index: 1">
                <div class="row align-items-center">
                    <div class="col-12 text-center">
                        <h1 class="hero-title">
                            Upcoming Events & Exclusive Incentives!
                        </h1>
                        <p class="hero-subtitle">
                            Explore special events and financial benefits
                            curated just for you.
                        </p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Events Content -->
        <section class="events-content">
            <div class="container">
                <!-- Upcoming Events Section -->
                <h2 class="section-title">Upcoming Events</h2>

                <div v-if="upcomingEvents.length" class="events-grid">
                    <div
                        class="event-card"
                        v-for="event in upcomingEvents"
                        :key="event.id"
                    >
                        <div class="event-image-wrapper">
                            <img
                                :src="
                                    event.image ?? '/images/default_image.png'
                                "
                                class="event-image"
                                :alt="event.title"
                                @error="setAltImg"
                            />
                        </div>

                        <div class="event-content">
                            <h3 class="event-title">{{ event.title }}</h3>
                            <div class="event-date">{{ event.date }}</div>

                            <div class="event-description ql-editor">
                                <span
                                    v-html="getTruncatedDescription(event)"
                                ></span>
                                <span
                                    v-if="event.description.length > 200"
                                    class="read-more"
                                    @click="toggleDescription(event.id)"
                                >
                                    {{
                                        showFullDescription[event.id]
                                            ? "Show Less"
                                            : "Read More"
                                    }}
                                </span>
                            </div>

                            <a
                                :href="'http://' + event.registeration_link"
                                target="_blank"
                                class="register-btn"
                            >
                                Details & Registration
                            </a>
                        </div>
                    </div>
                </div>

                <div v-else class="no-events">
                    <h4>No Upcoming Events</h4>
                    <p>
                        Check back soon for new events and exclusive
                        opportunities.
                    </p>
                </div>

                <hr />

                <!-- Toggle Button for Past Events -->
                <button
                    class="action-btn btn-primary toggle-btn"
                    @click="showPastEvents = !showPastEvents"
                >
                    {{
                        showPastEvents ? "Hide Past Events" : "Show Past Events"
                    }}
                </button>

                <!-- Past Events Section -->
                <div v-if="showPastEvents">
                    <h2 class="section-title">Past Events</h2>

                    <div v-if="pastEvents.length" class="events-grid">
                        <div
                            class="event-card past"
                            v-for="event in pastEvents"
                            :key="event.id"
                        >
                            <div class="event-image-wrapper">
                                <img
                                    :src="
                                        event.image ??
                                        '/images/default_image.png'
                                    "
                                    class="event-image"
                                    :alt="event.title"
                                    @error="setAltImg"
                                />
                            </div>

                            <div class="event-content">
                                <h3 class="event-title">{{ event.title }}</h3>
                                <div class="event-date">{{ event.date }}</div>

                                <div class="event-description ql-editor">
                                    <span
                                        v-html="getTruncatedDescription(event)"
                                    ></span>
                                    <span
                                        v-if="event.description.length > 200"
                                        class="read-more"
                                        @click="toggleDescription(event.id)"
                                    >
                                        {{
                                            showFullDescription[event.id]
                                                ? "Show Less"
                                                : "Read More"
                                        }}
                                    </span>
                                </div>

                                <a
                                    :href="'http://' + event.registeration_link"
                                    target="_blank"
                                    class="register-btn"
                                >
                                    Details & Registration
                                </a>
                            </div>
                        </div>
                    </div>

                    <div v-else class="no-events">
                        <p>No Past Events</p>
                    </div>
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
    props: ["incentive_id"],

    created() {
        this.fetchEvents();
    },

    data() {
        return {
            events: [],
            showFullDescription: {},
            showPastEvents: false,
        };
    },

    computed: {
        upcomingEvents() {
            const today = new Date();
            return this.events.filter((event) => new Date(event.date) >= today);
        },

        pastEvents() {
            const today = new Date();
            return this.events.filter((event) => new Date(event.date) < today);
        },
    },

    methods: {
        async fetchEvents() {
            await axios
                .get("/api/all-events")
                .then((response) => {
                    this.events = response.data;
                    this.events.forEach((event) => {
                        this.showFullDescription[event.id] = false;
                    });
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },

        setAltImg(event) {
            event.target.src = "/images/default_image.png";
        },

        toggleDescription(eventId) {
            this.showFullDescription[eventId] =
                !this.showFullDescription[eventId];
        },

        getTruncatedDescription(event) {
            return this.showFullDescription[event.id]
                ? event.description
                : event.description.slice(0, 200) + "...";
        },
    },
};
</script>
