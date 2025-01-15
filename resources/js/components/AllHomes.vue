<template>
    <Master>
        
        <div
            class="container-fluid interactive-banner mt-3"
            v-if="homes && homes.length"
        >
            <h1>ALL MOVE IN HOMES</h1>
        </div>
        
        <div class="d-flex justify-content-between">
                <div>
                    
                </div>

                <div class="mt-3 p-1">
                   
                    <a
                        href="/search/homes"
                        class="btn btn-outline-dark"
                        title="Search"
                    >
                        <i class="bi bi-search"></i>
                    </a>
                </div>
            </div>
        <div class="c-section-main-details container">
            <div v-if="homes && homes.length">
                <div class="mx-4 pt-3">
                    <div class="row">
                        <div
                            v-for="home in homes"
                            :key="home.id"
                            class="col-md-3 mb-2"
                        >
                            <a
                                class="text-decoration-none"
                                :href="
                                    '/home-details/' +
                                    home.property_record.property_id
                                "
                            >
                                <div class="card c-border-design">
                                    <img
                                        :src="home.main_image"
                                        class="card-img-top c-card-img-border"
                                        :alt="home.property_record.title"
                                        @error="setAltImg"
                                    />

                                    <div
                                        v-if="
                                            home.property_record.is_open_house
                                        "
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
                                            <b
                                                >{{
                                                    home.property_record
                                                        .square_feet
                                                }} </b
                                            ><br />
                                            Bedrooms
                                            <b>
                                                {{
                                                    home.property_record
                                                        .bedrooms
                                                }}
                                            </b>
                                            <br />
                                            Property type
                                            <b>{{
                                                home.property_record
                                                    .property_type
                                            }}</b>
                                            <br />

                                            Price
                                            <b
                                                >${{
                                                    home.property_record.price
                                                }}</b
                                            >
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
    
    created() {
        this.getHomes();
    },
    

    data() {
        return {
         
            homes: [],
             
        };
    },

    methods: {
          
        async getHomes() {
            await axios
                .get("/api/front-homes/all")
                .then((response) => {
                    this.homes = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        setAltImg(event) {
            event.target.src = "/images/default-home-image.png";
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
</style>
