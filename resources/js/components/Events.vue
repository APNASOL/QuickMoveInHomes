<template>
    <Master>
        <div
            class="top-section"
            :style="{ backgroundImage: `url('/images/events-main.jpg')` }"
        >
            <div class="info-overlay">
                <div class="d-flex justify-content-center container">
                    <div>
                        <h2 class="title uppercase">
                            Upcoming & Ongoing Events
                        </h2>
                        <span class="uppercase">
                            Special Closeout Offers on Quick Delivery Homes
                            Events
                        </span>
                    </div>
                </div>
            </div>
        </div>

        <div class="c-tour-details container">
            <div v-if="events && events.length">
                <div class="mx-4 pt-3">
                    <div class="row">
                        <div
                            v-for="event in events"
                            :key="event.id"
                            class="col-md-3 mb-2 d-flex" 
                        >
                    
                            <div class="card c-border-design image-cover">
                                <a href="http://www.google.com" target="_blank">
                                <img
                                    :src="event.image"
                                    class="card-img-top c-card-img-border"
                                    :alt="event.title"
                                    @error="setAltImg"
                                />
                            </a>
                                <div class="card-body text-start">
                                    <div class="d-flex justify-content-between">
                                        <div>
                                            <b>{{ event.title }}</b>
                                        </div>
                                        <div>
                                            {{ event.date }}
                                        </div>
                                    </div>
                                    
                                        
                                      
                                    <div class="content ql-editor">
                                        <span v-html="getTruncatedDescription(event)"></span>
                                        <span
                                            v-if="event.description.length > 200"
                                            class="read-more"
                                            @click="toggleDescription(event.id)"
                                        >
                                            {{ showFullDescription[event.id] ? "Show Less" : "Read More" }}
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
            event.target.src = "/images/default.jpg";
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
    color: #007bff;
    cursor: pointer;
    margin-left: 5px;
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
}

.image-cover img {
    width: 100%; 
    height: 200px; 
    object-fit: cover;  
    object-position: center;  
}
</style>
