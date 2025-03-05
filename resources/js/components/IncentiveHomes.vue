<template>
    <Master>
        <div
            class="top-section"
            :style="{ backgroundImage: `url('/images/incentive-main.jpg')` }"
        >
            <div class="info-overlay">
                <div class="d-flex justify-content-center container">
                    <div>
                        <h2 class="title uppercase">Current Incentives</h2>
                        <span class="uppercase">
                            Inventory Closeout Specials On Quick Delivery Homes
                        </span>
                    </div>
                </div>
            </div>
        </div>

        <div class="c-section-main-details container">
            <div class="row mx-4 d-flex justify-content-end p-3">
                <div class="col-md-4">
                    <b>Incentive Sort By</b>
                    <div class="dropdown">
                        <Multiselect
                            v-model="sort_by"
                            :options="sortingOptions"
                            :placeholder="translate('Sort by')"
                            :searchable="true"
                            @select="incentivesFetch(sort_by)"
                        />
                    </div>
                </div>
            </div>

            <div v-if="incentives && incentives.length">
                <div class="mx-4 pt-3">
                    <div class="row g-3 mb-3">
                        <div
                            class="col-md-4"
                            v-for="incentive in incentives"
                            :key="incentive.id"
                        >
                            <div class="card c-border-design image-cover">
                                <a
                                    class="text-decoration-none"
                                    :href="
                                        '/detailed-incentive/' + incentive.id
                                    "
                                >
                                    <img
                                        :src="
                                            incentive.incentive_banner ??
                                            'error.png'
                                        "
                                        class="card-img-top c-card-img-border"
                                        height="150"
                                        :alt="incentive.title"
                                        @error="setAltImg"
                                    />
                                </a>
                                <div class="card-body text-start">
                                    <a
                                        class="text-decoration-none"
                                        :href="
                                            '/detailed-incentive/' +
                                            incentive.id
                                        "
                                    >
                                        <h4>{{ incentive.title }}</h4>
                                    </a>
                                    <div class="content ql-editor">
                                        <span
                                            v-html="
                                                getTruncatedDescription(
                                                    incentive
                                                )
                                            "
                                        ></span>
                                        <span
                                            v-if="
                                                incentive.description.length >
                                                200
                                            "
                                            class="read-more"
                                            @click="
                                                toggleDescription(incentive.id)
                                            "
                                        >
                                            {{
                                                showFullDescription[
                                                    incentive.id
                                                ]
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
            <div v-else>
                <div class="text-center p-4">
                    <h4>No incentives found</h4>
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

    created() {
        this.incentivesFetch("Name");
    },

    data() {
        return {
            incentives: [],
            showFullDescription: {}, // Initialize the object to track description visibility
            sortingOptions: [
                "Name",
                "Interest rate",
                "Low to Hight",
                "Hight to Low",
            ],
            sorty_by: "",
        };
    },

    methods: {
        incentivesFetch(sorting_option) {
            axios
                .get("/api/fetch-sorted-incentives/" + sorting_option)
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
.top-section {
    position: relative;
    height: 300px; /* Adjust height as needed */
    background-size: cover;
    background-position: center;
    color: white;
    display: flex;
    justify-content: center; /* Center the overlay content */
    align-items: flex-end;
    width: 100%;
    overflow: hidden; /* Ensures no overflow from children */
}

.uppercase {
    text-transform: uppercase;
}

.info-overlay {
    background: rgba(1, 6, 13, 0.8); /* Using RGBA for transparency */
    padding: 20px; /* Increased padding for a better look */
    width: 100%;
    border-radius: 0px !important;
    display: flex; /* Flexbox for alignment */
    flex-direction: column; /* Stack items vertically */
    align-items: center; /* Center align items */
    text-align: center; /* Center align text */
}

.title {
    font-size: 24px;
    margin: 0;
}
.ql-editor {
    padding: 0px !important;
}
.image-cover {
    position: relative;
    overflow: hidden;
    display: flex; /* Use Flexbox for card layout */
    flex-direction: column; /* Stack items vertically */
    height: 100%; /* Ensure the card takes full height */
    transition: height 0.3s; /* Smooth transition for height change */
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

.card-body h4 {
    margin: 0; /* Remove default margin for consistency */
}

.card-body .content {
    flex-grow: 1; /* Allow content area to grow and fill the space */
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
    color: #e58b15;
    line-height: 1.55rem;
    font-weight: bold;
}
</style>
