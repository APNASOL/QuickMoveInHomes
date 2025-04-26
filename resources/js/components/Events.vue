<template>
    <Master>
        <section class="p-3 bg-white">
            <div class="row align-items-center p-3">
                <div class="col-md-12 text-center">
                    <h1 class="uppercase c-main-title">
                        Upcoming Events & Exclusive Incentives!
                    </h1>
                    <h4 class="c-sub-title text-black">
                        Explore special events and financial benefits curated
                        just for you.
                    </h4>
                </div>
            </div>
        </section>

        <div class="c-section-main-details container">
            <div v-if="events && events.length">
                <div class="row text-center g-2">
                    <div
                        v-for="event in events"
                        :key="event.id"
                        class="col-md-4 mb-3 d-flex align-items-stretch"
                    >
                        <div
                            class="card c-border-design image-cover flex-fill p-2"
                        >
                            <div class="card-img-wrapper">
                                <img
                                    :src="event.image"
                                    class="rounded-top"
                                    width="100%"
                                    height="200px"
                                    @error="setAltImg"
                                />
                            </div>
                            <div
                                class="card-body text-start d-flex flex-column"
                            >
                                <h4 class="c-main-title text-center">
                                    {{ event.title }}
                                </h4>
                                <b class="text-center">{{ event.date }}</b>
                                <div class="content ql-editor flex-grow-1 mt-2">
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
                                <div class="text-center mt-3">
                                    <a
                                        :href="
                                            'http://' + event.registeration_link
                                        "
                                        target="_blank"
                                        class="btn btn-primary"
                                    >
                                        Register
                                    </a>
                                </div>
                            </div>
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
    props: ["incentive_id"],

    created() {
        this.fetchEvents();
    },

    data() {
        return {
            events: [],
            showFullDescription: {},
        };
    },

    methods: {
        async fetchEvents() {
            await axios
                .get("/api/all-events")
                .then((response) => {
                    this.events = response.data;
                    // Initialize showFullDescription for each event
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
            // Toggle full description visibility
            this.showFullDescription[eventId] =
                !this.showFullDescription[eventId];
        },

        getTruncatedDescription(event) {
            // Display full description if toggled, otherwise truncate
            return this.showFullDescription[event.id]
                ? event.description
                : event.description.slice(0, 200) + "...";
        },
    },
};
</script>

<style scoped>
.uppercase {
    text-transform: uppercase;
}
.c-tags {
    font-family: Inter, sans-serif;
    font-size: 20px;
    font-weight: 400;
    line-height: 28px;
    color: rgb(61, 102, 143);
}
.c-info {
    font-family: Inter, sans-serif;
    font-size: 16px;
    font-weight: 400;
    line-height: 24px;
    color: rgb(23, 38, 54);
}
.team-member img {
    border-radius: 50%;
    object-fit: cover;
}

.card-body h4 {
    margin: 0;
}

.card {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    height: 100%; /* Ensures equal height */
}

.card img {
    width: 100%;
    height: 200px; /* Set fixed height for image */
    object-fit: cover; /* Make image cover the top of the card */
    border-radius: 10px; /* Optional: rounded corners */
}

.card-body {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    flex-grow: 1; /* Ensures body stretches to fill remaining space */
}
.read-more {
    color: #002855;
    cursor: pointer;
    font-weight: bold;
}
</style>
