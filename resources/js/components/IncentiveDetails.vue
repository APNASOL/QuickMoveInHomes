<template>
    <Master>
        <section class="p-3 bg-white">
            <!-- Removed container for full width -->
            <!-- Hero Section -->
            <div class="row align-items-center p-3">
                <div class="col-md-12 text-center">
                    <h1 class="uppercase c-main-title">
                        Exclusive Incentives for You!
                    </h1>
                    <h4 class="c-tags">
                        Discover amazing deals and financial benefits tailored
                        just for you.
                    </h4>
                </div>
            </div>
        </section>

        <!-- Incentive Details Section with Image and Text -->
        <div class="container my-5">
    <div class="row align-items-center bg-white shadow-sm rounded-4 p-4">
        <!-- Left Content -->
        <div class="col-lg-6 d-flex flex-column justify-content-center p-4">
            <h2 class="c-main-title mb-3">{{ incentive.title }}</h2>
            <p class="incentive-description text-muted" v-html="incentive.description"></p>

            <div class="mt-3">
                <p class="mb-1">
                    <strong>From:</strong> {{ formatDate(incentive.start_date) }}
                </p>
                <p class="mb-3">
                    <strong>To:</strong> {{ formatDate(incentive.end_date) }}
                </p>
                <div v-if="incentive.interest_rate_first_year">
                    <p class="badge bg-success fs-6 p-2">
                        1st Year Interest Rate: {{ incentive.interest_rate_first_year }}%
                    </p>
                </div>
            </div>
        </div>

        <!-- Right Image -->
        <div class="col-lg-6 text-center p-4">
            <img
                :src="incentive_banner || '/images/default_image.png'"
                class="img-fluid rounded-4 incentive-img shadow-sm"
                :alt="incentive.title"
                style="max-height: 400px; object-fit: cover;"
                @error="setAltImg"
            />
        </div>
    </div>
</div>

        <div class="container-fluid interactive-banner mt-3">
            <h1>MORE INCENTIVES</h1>
        </div>
        <div class="c-section-main-details container">
            <div v-if="incentives && incentives.length" class="mt-4 container">
                <div class="row g-4 mb-3">
                    <div
                        class="col-md-4 d-flex align-items-stretch"
                         v-for="single_incentive in incentives.filter(i => i.id !== incentive.id)"
                        :key="single_incentive.id"
                    >
                        <div class="card shadow-sm p-3 rounded-4 flex-fill" >
                            <a
                                class="text-decoration-none"
                                :href="'/detailed-incentive/' + single_incentive.id"
                            >
                                <img
                                    :src="
                                        single_incentive.incentive_banner ??
                                        '/images/default_image.png'
                                    "
                                    class="card-img-top img-fluid rounded-3"
                                    :alt="single_incentive.title"
                                    height="220"
                                    @error="setAltImg"
                                />
                            </a>

                            <div
                                class="card-body d-flex flex-column justify-content-between"
                            >
                                <a
                                    class="text-decoration-none"
                                    :href="
                                        '/detailed-incentive/' + single_incentive.id
                                    "
                                >
                                    <h5
                                        class="card-title text-center text-dark fw-bold"
                                    >
                                        {{ single_incentive.title }}
                                    </h5>
                                </a>
                                <div class="content ql-editor my-2">
                                    <span
                                        v-html="
                                            getTruncatedDescription(single_incentive)
                                        "
                                    ></span>
                                    <span
                                        v-if="
                                            single_incentive.description.length > 200
                                        "
                                        class="read-more"
                                        @click="toggleDescription(single_incentive.id)"
                                    >
                                        {{
                                            showFullDescription[single_incentive.id]
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
            incentive_banner: "",
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
            const options = { year: "numeric", month: "long", day: "numeric" };
            return new Date(date).toLocaleDateString(undefined, options);
        },
        toggleDescription(eventId) {
            // Toggle full description visibility
            this.showFullDescription[eventId] =
                !this.showFullDescription[eventId];
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
.card {
    background: #fff;
    border: 1px solid #e0e0e0;
    border-radius: 1rem; /* Rounded corners */
    overflow: hidden;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    transition: box-shadow 0.3s ease-in-out;
    height: 100%;
}

.card:hover {
    box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
}

.card-img-top {
    object-fit: cover;
    height: 220px;
    width: 100%;
}

.card-title {
    font-family: "Inter", sans-serif;
    font-size: 1.25rem;
    margin-bottom: 0.5rem;
}

.content {
    font-size: 0.95rem;
    color: #4a4a4a;
}

.read-more {
    color: #0056b3;
    cursor: pointer;
    font-weight: bold;
    margin-top: 5px;
    display: inline-block;
}
</style>
