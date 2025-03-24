<template>
    <Master>
        <section class="p-3 bg-white">
            <!-- Removed container for full width -->
            <!-- Hero Section -->
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
                <div class="mx-4 pt-3">
                    <div class="row">
                        <div
                            v-for="event in events"
                            :key="event.id"
                            class="col-md-4 mb-3 d-flex"
                        >
                            <div
                                class="card c-border-design image-cover text-center"
                            >
                                <a
                                    :href="'http://' + event.registeration_link"
                                    target="_blank"
                                >
                                    <img
                                        :src="event.image"
                                        class="card-img-top c-card-img-border rounded-circle mt-2"
                                        :alt="event.title"
                                        @error="setAltImg"
                                    />
                                </a>
                                <div class="card-body text-start">
                                    <h4 class="c-main-title">
                                        {{ event.title }}
                                    </h4>

                                    <b>
                                        {{ event.date }}
                                    </b>

                                    <div class="content ql-editor">
                                        <span
                                            v-html="
                                                getTruncatedDescription(event)
                                            "
                                        ></span>
                                        <span
                                            v-if="
                                                event.description.length > 200
                                            "
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
.top-section {
    position: relative;
    height: 300px;
    background-size: cover;
    background-position: center;
    color: white;
    display: flex;
    justify-content: center;
    align-items: flex-end;
    width: 100%;
    overflow: hidden;
}

.uppercase {
    text-transform: uppercase;
}

.info-overlay {
    background: rgba(1, 6, 13, 0.8);
    padding: 20px;
    width: 100%;
    border-radius: 0px !important;
    display: flex;
    flex-direction: column;
    align-items: center;
}

.title {
    font-size: 24px;
    margin: 0;
}

.read-more {
    color: #002855;
    cursor: pointer;
    margin-left: 5px;
}

h2,
h3,
h4,
h5 {
    font-family: "Raleway", sans-serif;
    color: rgb(61, 102, 143);
    line-height: 1.55rem;
    font-weight: bold;
}

.card {
    display: flex;
    flex-direction: column;
    height: 100%;
    background-color: white;
}

.card-body {
    flex-grow: 1;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

.image-cover {
    position: relative;
    overflow: hidden;
    display: flex;
    justify-content: center;
}

.image-cover img {
    width: 150px;
    height: 150px;
    object-fit: cover;
    object-position: center;
    border-radius: 50%;
}

.ql-editor {
    padding: 0px !important;
}
</style>
