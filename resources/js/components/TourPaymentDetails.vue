<template>
    <Master>
        <div class="c-tour-details px-5">
            <div class="">
                <div class="row">
                    <div class="col-12 col-md-8 mt-5">
                        <h1 class="c-tour-name">{{ tour.title }}</h1>
                        <tr
                            v-if="tour.tourTags"
                            class="d-flex justify-content-center"
                        >
                            
                        </tr>

                        <div class="mt-2 mb-2">
                            <h2>{{ translate("Details") }}</h2>

                            <div class="card-body">
                                <div
                                    class="content ql-editor"
                                    v-html="tour.description"
                                ></div>

                                <div
                                    class="content ql-editor"
                                    v-html="tour.important_notes"
                                ></div>
                            </div>
                        </div>
                        <div class="mt-2 mb-2">
                            <h2>{{ translate("Payement details") }}</h2>

                            <b>{{ translate("Start date") }}</b> :
                            {{ dates.start_date }} ,
                            <b>{{ translate("End date") }}</b> :
                            {{ dates.end_date }}<br />
                            <b>{{ translate("Price") }} </b> : {{ dates.price }}
                            <br />
                            <b>{{ translate("Discount") }}</b> :
                            {{ dates.discounted_price }}
                            <br />
                            <b>{{ translate("Code ") }}</b> :
                            {{ booking_code }}
                            <br />
                            <b>{{ translate("Infants") }}</b> :
                            {{ infants }}
                            <br />
                            <b>{{ translate("Children") }}</b> :
                            {{ children }}
                            <br />
                            <b>{{ translate("Adults") }}</b> :
                            {{ adults }}
                        </div>
                    </div>
                    <div class="col-12 col-md-4 mt-5">
                        <image-zooming-component
                            :file="tour.image ?? 'empty.png'"
                            :width="350"
                            :custom_class="'img-fluid img-thumbnail rounded'"
                        />
                    </div>
                </div>
                <!-- <a
                    class="text-decoration-none"
                    :href="'/make-booking/' + tour_id"
                >
                    {{ translate("Make booking") }}
                </a> -->
                <a
                    class="text-decoration-none btn c-btn-theme-yellow text-white"
                    :href="
                        '/make-booking/' +
                        tour_id +
                        '/' +
                        dates_id +
                        '/' +
                        booking_code +
                        '/' +
                        infants +
                        '/' +
                        children +
                        '/' +
                        adults+'/'+dates.price+'/'+dates.discounted_price
                    "
                >
                    {{ translate("Proceed booking") }}
                </a>

                 
            </div>
        </div>
    </Master>
</template>

<script>
import { defineComponent } from "vue";
import Master from "@components/layout/Master.vue";
import { Carousel, Slide, Pagination, Navigation } from "vue3-carousel";
import Datepicker from "@vuepic/vue-datepicker";
import "@vuepic/vue-datepicker/dist/main.css";
import Multiselect from "@vueform/multiselect";
export default {
    components: {
        Master,
        Carousel,
        Slide,
        Pagination,
        Navigation,
        Datepicker,
        Multiselect,
    },
    props: [
        "tour_id",
        "dates_id",
        "booking_code",
        "infants",
        "children",
        "adults",
    ],
    created() {
        this.fetchTourDetails();
        this.fetchTourDates();
    },
    data() {
        return {
            formStatus: 1,
            tour: [],
            dates: [],
            form: {
                departure_city: "",
                passengers: "",
            },
            formErrors: [],
        };
    },
    methods: {
        async fetchTourDetails() {
            await axios
                .get("/api/front-end-tour-details/" + this.tour_id)

                .then((response) => {
                    this.tour = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
         
        fetchTourDates() {
            axios
                .get("/api/front-end-tour-payment-dates/" + this.dates_id)

                .then((response) => {
                    this.dates = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
    },
};
</script>

<style scoped>
@import "@vueform/multiselect/themes/default.css";
.c-slide-div {
    position: absolute;
    top: 35%;
    left: 5%;
    text-align: left;
    color: white;
    display: flex;
    flex-direction: column;
    gap: 10px;
}
.c-slide-div > button {
    width: fit-content;
}

section {
    /* padding: 0px !important; */
    background-color: black;
}
.c-carousel-text {
    position: absolute;
    padding: 70px;
    color: white;
    font-size: 50px;
    font-weight: bold;
}
.carousel {
    padding: 0px !important;
}

.c-tour-details {
    font-family: "Oakes Grotesk", sans-serif;
}
.c-tour-name {
    font-family: "Oakes Grotesk", sans-serif;
    font-size: 32px;
    font-weight: 400;
    line-height: 40px;
    color: rgb(18, 18, 18);
}
.c-itinerary-image {
    display: flex;
    justify-content: center;
    align-items: center;
    object-fit: cover;
    border-radius: 4px;
}
.expanded-card {
    height: auto; /* Set height to auto when the card is expanded */
}
.underline-text {
    text-decoration: underline;
    cursor: pointer;
    color: blue; /* Change the color as needed */
}
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
</style>
<style>
.fc-title {
    white-space: normal;
    overflow: visible;
    text-overflow: clip;
    background-color: #ed2124;
    color: black;
}
</style>
