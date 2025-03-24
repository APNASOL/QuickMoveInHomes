<template>
    <Master>
        <section class="p-3 bg-white"> <!-- Removed container for full width -->
            <!-- Hero Section -->
            <div class="row align-items-center p-3">
                <div class="col-md-12 text-center">
                    <h1 class="uppercase c-main-title">Exclusive Incentives for You!</h1>
                    <h4 class="c-tags">
                        Discover amazing deals and financial benefits tailored just for you.
                    </h4>
                </div>
            </div>
        </section>

        <!-- Incentive Details Section with Image and Text -->
        <div class="container mt-4">
            <div class="row align-items-center">
                <div class="col-md-6 d-flex flex-column justify-content-center">
                    <h3 class="c-main-title">{{ incentive.title }} werwe</h3>
                    <p class="incentive-description" v-html="incentive.description"></p>
                    <div>
                        From Date: <strong>{{ formatDate(incentive.start_date) }}</strong>
                        To Date: <strong>{{ formatDate(incentive.end_date) }}</strong>
                    </div>
                    <div v-if="incentive.interest_rate_first_year">
                        <p><strong>First Year Interest Rate:</strong> {{ incentive.interest_rate_first_year }}%</p>
                    </div>
                </div>
                <div class="col-md-6 text-center">
                    <img
                        :src="incentive_banner || '/images/default_image.png'"
                        class="img-fluid incentive-img"
                        :alt="incentive.title"
                        @error="setAltImg"
                    />
                </div>
            </div>
        </div>
        <div class="container-fluid interactive-banner mt-3">
                <h1>MORE INCENTIVES</h1>
            </div>
        <div class="c-section-main-details container">
            <div v-if="incentives && incentives.length">
                <div class="mx-4 pt-3">
                    <div class="row g-2">
                        <div
                        class="col-md-4"
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
                                    class="card-img-top c-card-img-border rounded-circle mt-2"
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
                                        <h4 class="c-main-title text-center">{{ incentive.title }}</h4> 
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
            event.target.src = "/images/default_image.png";
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
.card img {
    display: block;
    margin: 0 auto;
    width: 120px;
    height: 120px;
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
</style>