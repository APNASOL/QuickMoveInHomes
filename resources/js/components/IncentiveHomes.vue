<template>
    <Master>
        <section class="p-3 bg-white">
            <!-- Removed container for full width -->
            <!-- Hero Section -->
            <div class="row align-items-center p-3">
                <div class="col-md-12 text-center">
                    <h1 class="uppercase c-main-title">
                        Builder Incentives for Your <br />
                        Dream Home
                    </h1>
                    <h4 class="c-tags">
                        Discover how builder incentives make your move-in ready
                        home <br />
                        more affordable and feature-rich
                    </h4>
                </div>
            </div>
        </section>

        <section class="container p-3">
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

            <div class="col-md-12 text-center">
                <h3 class="uppercase c-main-title">
                    Valuable Incentives Available Now
                </h3>
                <h6 class="c-tags">
                    Builders offer these incentives on quick move-in homes to
                    make your <br />
                    homebuying experience more rewarding and affordable
                </h6>
            </div>
            <div v-if="incentives && incentives.length" class="mt-4">
                <div class="row text-center g-2">
                    <div
                        class="col-md-4 d-flex align-items-stretch"
                        v-for="incentive in incentives"
                        :key="incentive.id"
                    >
                        <div
                            class="card c-border-design image-cover flex-fill p-2"
                        >
                            <!-- Ensures equal height -->
                            <a
                                class="text-decoration-none"
                                :href="'/detailed-incentive/' + incentive.id"
                            >
                                <img
                                    :src="
                                        incentive.incentive_banner ??
                                        'error.png'
                                    "
                                    class="rounded-top"
                                    width="100%"
                                    height="200px"
                                    :alt="incentive.title"
                                    @error="setAltImg"
                                />
                            </a>
                            <div class="card-body text-start">
                                <a
                                    class="text-decoration-none"
                                    :href="
                                        '/detailed-incentive/' + incentive.id
                                    "
                                >
                                    <h4 class="c-main-title text-center">
                                        {{ incentive.title }}
                                    </h4>
                                </a>
                                <div class="content ql-editor">
                                    <span
                                        v-html="
                                            getTruncatedDescription(incentive)
                                        "
                                    ></span>
                                    <span
                                        v-if="
                                            incentive.description.length > 200
                                        "
                                        class="read-more"
                                        @click="toggleDescription(incentive.id)"
                                    >
                                        {{
                                            showFullDescription[incentive.id]
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
            <div v-else>
                <div class="text-center p-4">
                    <h4>No incentives found</h4>
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

    created() {
        this.incentivesFetch("Name");
    },

    data() {
        return {
            incentives: [],
            showFullDescription: {},
            sortingOptions: [
                "Name",
                "Interest rate",
                "Low to High",
                "High to Low",
            ],
            sort_by: "",
        };
    },

    methods: {
        incentivesFetch(sorting_option) {
            axios
                .get("/api/fetch-sorted-incentives/" + sorting_option)
                .then((response) => {
                    this.incentives = response.data;
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
            this.showFullDescription[eventId] =
                !this.showFullDescription[eventId];
        },

        getTruncatedDescription(incentive) {
            return this.showFullDescription[incentive.id]
                ? incentive.description
                : incentive.description.slice(0, 200) + "...";
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
    color: #023F86;
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
