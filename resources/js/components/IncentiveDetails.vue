<template>
    <Master>
        <div class="top-section" :style="{ backgroundImage: `url(${incentive_banner})` }">
            <div class="info-overlay">
                <div class="container text-center">
                    <h2 class="title uppercase">{{ incentive.title }}</h2>
                </div>
            </div>
        </div>  

        <div class="content-section container">
            <div class="incentive-card">
               
                <h3 class="sub-title">{{ incentive.title }}</h3>
                <p class="incentive-description" v-html="incentive.description"></p>

                <div >
                    From Date <strong>{{ formatDate(incentive.start_date) }}</strong>
                    To Date <span><strong>{{ formatDate(incentive.end_date) }}</strong> </span>
                </div>

                <div v-if="incentive.interest_rate_first_year">
                    <p><strong>First Year Interest Rate:</strong> {{ incentive.interest_rate_first_year }}%</p>
                </div>
            </div>
        </div>
        <div class="container-fluid interactive-banner mt-3">
                <h1>MORE INCENTIVES</h1>
            </div>
        <div class="c-section-main-details container">
            <div v-if="incentives && incentives.length">
                <div class="mx-4 pt-3">
                    <div class="row g-3 mb-3">
                        <div
                        class="col-md-3"
                            v-for="incentive in incentives"
                            :key="incentive.id"
                        >
                        <div class="card c-border-design image-cover">
                                <a
                                        class="text-decoration-none"
                                        :href="'/detailed-incentive/' + incentive.id"
                                    >
                                <img
                                    :src="incentive.incentive_banner ?? 'error.png'"
                                    class="card-img-top c-card-img-border"
                                    height="150"
                                    :alt="incentive.title"
                                    @error="setAltImg"
                                />
                            </a>

                                <div class="card-body text-start">
                                    <a
                                        class="text-decoration-none"
                                        :href="'/detailed-incentive/' + incentive.id"
                                    >
                                        <h4>{{ incentive.title }}</h4> 
                                    </a>
                                        <div class="content ql-editor" >
                                            <span v-html="getTruncatedDescription(incentive)"></span>
                                            <span
                                                v-if="incentive.description.length > 200"
                                                class="read-more"
                                                @click="toggleDescription(incentive.id)"
                                            >
                                                {{ showFullDescription[incentive.id] ? "Show Less" : "Read More" }}
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
import axios from "axios";

export default {
    components: {
        Master,
    },
    props: ["incentive_id"],
    created() {
        this.fetchIncentiveDetails();
        this.incentivesFetch();
    },
    data() {
        return {
            incentive: {},
            incentive_banner: '',
            incentives: [],
            showFullDescription: {},    
        };
    },
    methods: {
        fetchIncentiveDetails() {
            axios
                .get("/api/incentive-details-fetch/" + this.incentive_id)
                .then((response) => {
                    this.incentive = response.data.incentive;
                    this.incentive_banner = response.data.incentive_banner;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        incentivesFetch() {
            axios
                .get("/api/fetch-sorted-incentives/" + "Name")
                .then((response) => {
                    this.incentives = response.data;

                    // Initialize showFullDescription for each incentive
                    this.incentives.forEach((incentive) => {
                        this.$set(
                            this.showFullDescription,
                            incentive.id,
                            false
                        );
                    });
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },

        setAltImg(event) {
            event.target.src = "/images/default.jpg";
        },

        formatDate(date) {
            const options = { year: 'numeric', month: 'long', day: 'numeric' };
            return new Date(date).toLocaleDateString(undefined, options);
        }
,
        toggleDescription(eventId) {
            // Toggle full description visibility
            this.showFullDescription[eventId] = !this.showFullDescription[eventId];
        },

        getTruncatedDescription(incentive) {
            // Display full description if toggled, otherwise truncate
            return this.showFullDescription[incentive.id]
                ? incentive.description
                : incentive.description.slice(0, 200) + "...";
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
    display: flex;
    align-items: flex-end;
    width: 100%;
    overflow: hidden;
}

.info-overlay {
    background: rgba(0, 0, 0, 0.6);
    padding: 20px;
    width: 100%;
    text-align: center;
    color: white;
}

.title {
    font-size: 28px;
    margin: 0;
    font-family: 'Raleway', sans-serif;
}

.uppercase {
    text-transform: uppercase;
}

.content-section {
    padding: 40px 0;
    display: flex;
    justify-content: center;
}

.incentive-card {
    max-width: 1100px;
    padding: 30px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
    text-align: center;
}

.sub-title {
    font-size: 24px;
    color: #E58B15;
    margin-bottom: 20px;
    font-family: 'Raleway', sans-serif;
}

.incentive-description {
    font-size: 16px;
    line-height: 1.8;
    color: #555;
    margin-bottom: 20px;
}

 
@media (max-width: 768px) {
    .top-section {
        height: 200px;
    }

    .title {
        font-size: 24px;
    }

    .incentive-card {
        padding: 20px;
    }

    .sub-title {
        font-size: 20px;
    }
}

.read-more {
    color: #002855;
    cursor: pointer;
    margin-left: 5px;
}
h2, h3, h4, h5 {
    font-family: 'Raleway', sans-serif;
    color: #E58B15;
    line-height: 1.55rem; 
    font-weight: bold;
    
}

.card {
    display: flex;
    flex-direction: column; /* Stack items vertically */
    height: 100%; /* Make card take full height */
}
.card-body {
    display: flex;
    flex-direction: column; /* Stack content vertically */
    justify-content: space-between; /* Space out content */
    flex: 1; /* Make card body take the remaining space */
}

.image-cover img {
    width: 100%;
    height: 150px; /* Fixed height for the image */
    object-fit: cover;
    object-position: center;
    transition: height 0.3s; /* Ensure image transition is smooth */
}

</style>
