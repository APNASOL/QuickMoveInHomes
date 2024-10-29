<template>
    <Master>
        <div
            class="top-section"
            :style="{ backgroundImage: `url('/images/incentive-main.jpg')` }"
        >
            <div class="info-overlay">
                <div class="d-flex justify-content-center container">
                    <div>
                        <h2 class="title uppercase" v-if="incentive_title">{{ incentive_title }} Incentive</h2>
                        <h2 class="title uppercase" v-else>Current Incentives</h2>
                        <span class="uppercase">
                            Inventory Closeout Specials On Quick Delivery Homes
                        </span>
                    </div>
                </div>
            </div>
        </div>
         
        <!-- <div
            class="container-fluid interactive-banner mt-3"
            v-if="incentives_homes && incentives_homes.length"
        >
        {{  }}
            <h1>Current Incentives</h1>
            <p>Inventory Closeout Specials On Quick Delivery Homes</p>
        </div> -->

         
        <div class="c-tour-details container">
            <div v-if="incentives_homes && incentives_homes.length">
                <div class="mx-4 pt-3">
                    <div class="row">
                        <div
                            v-for="home in incentives_homes"
                            :key="home.id"
                            class="col-md-3 mb-2"
                        >
                            <a
                                class="text-decoration-none"
                                :href="'/home-details/' + home.property_id"
                            >
                                <div class="card c-border-design">
                                    <img
                                        :src="home.main_image"
                                        class="card-img-top c-card-img-border"
                                        :alt="home.title"
                                        @error="setAltImg"
                                    />

                                    <div
                                        v-if="home.is_open_house"
                                        class="card-img-overlay c-card-img-overlay-flash-sale"
                                    >
                                        <span
                                            class="badge rounded-pill bg-white text-dark"
                                            >Open House</span
                                        >
                                    </div>
                                    

                                    <div class="card-body text-start">
                                        <p>
                                            AREA (SQFT)
                                            <b>{{ home.square_feet }} </b><br />
                                            Bedrooms
                                            <b>
                                                {{ home.bedrooms }}
                                            </b>
                                            <br />
                                            Property type
                                            <b>{{ home.property_type }}</b>
                                            <br />

                                            Price
                                            <b>${{ home.price }}</b>
                                        </p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Seraching Filter -->
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
    props:['incentive_id'],

    created() {
        if(this.incentive_id)
    {
        this.selectedIncentivesHomes();
    }else
    {
        this.incentivesHomes();
    }
    },

    data() {
        return {
            incentives_homes: [],
            backgroundImage: "",
            incentive_title: "",
        };
    },

    methods: {
        async incentivesHomes() {
            await axios
                .get("/api/incentives-homes")
                .then((response) => {
                    this.incentives_homes = response.data;
                    
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        async selectedIncentivesHomes() {
            await axios
                .get("/api/selected-incentives-homes/"+this.incentive_id)
                .then((response) => {
                    this.incentives_homes = response.data.properties_with_incentives;
                    this.incentive_title = response.data.incentive_title;
                   
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        setAltImg(event) {
            event.target.src = "/images/default.jpg";
        },
    },
};
</script>

<style scoped>
.carousel__slide {
    padding: 5px;
}

.carousel__viewport {
    perspective: 2000px;
}

.carousel__track {
    transform-style: preserve-3d;
}

.carousel__slide--sliding {
    transition: 0.5s;
}

.carousel__slide {
    opacity: 0.9;
    transform: rotateY(-20deg) scale(0.9);
}

.carousel__slide--active ~ .carousel__slide {
    transform: rotateY(20deg) scale(0.9);
}

.carousel__slide--prev {
    opacity: 1;
    transform: rotateY(-10deg) scale(0.9) !important;
}

.carousel__slide--next {
    opacity: 1;
    transform: rotateY(10deg) scale(0.9) !important;
}

.carousel__slide--active {
    opacity: 1;
    transform: rotateY(0) scale(1);
}
.c-card-img-overlay-name {
    top: unset;
    bottom: 120px;
    text-align: left;
    color: white;
}
.c-card-img-overlay-flash-sale {
    left: unset;
}
.c-accomodation-image {
    border-radius: 16px 0px 0px 16px;
}
@media (max-width: 1200px) {
    .c-accomodation-image {
        border-radius: 16px 16px 0px 0px;
    }
}

.beat {
    animation: beating 1s infinite;
}

@keyframes beating {
    0%,
    100% {
        transform: scale(1);
    }
    50% {
        transform: scale(1.1);
    }
}

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
</style>
