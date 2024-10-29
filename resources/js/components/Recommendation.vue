<template>
    <Master>
        <div class="c-tour-details container">
            <div class="row">
                <div class="col-12 col-md-12 mt-5">
                    <img
                        src="https://www.exoticca.com/_next/image?url=https%3A%2F%2Fres.cloudinary.com%2Fexoticca%2Fimage%2Fupload%2Fc_limit%2Cf_auto%2Cq_auto%3Aeco%2Cw_1560%2Fv1%2FCountry%2FITALIA%2FCP_Header%2FItalia_3840x480_hcblv9&w=2048&q=75"
                        width="100%"
                        :custom_class="'img-fluid img-thumbnail rounded'"
                    />
                </div>
            </div>

            <div>
                <h1 class="text-center mt-3 p-3" font-size="heading2">
                    Our recommendation to visit Italy
                </h1>

                <div class="row">
                    <div class="p-4">
                        <div>
                            <div class="row g-0 c-content-radius">
                                <div class="col-xl-6">
                                    <div>
                                        <img
                                            src="https://cdn1.parksmedia.wdprapps.disney.com/resize/mwImage/1/900/450/75/vision-dam/digital/parks-platform/parks-global-assets/disneyland/resorts/disneys-grand-californian-hotel-and-spa/spa/Relaxation-Lounge-16x9.jpg?2021-11-01T16:41:40+00:00"
                                            @error="setAltImg"
                                            class="d-block w-100 img-fluid c-accomodation-image"
                                        />
                                    </div>
                                </div>
                                <div
                                    class="col-xl-6 c-accomodation-right-side p-5"
                                >
                                    <div class="card-body text-start pb-0">
                                        <h4 class="card-title p-0">
                                            Escorted Eternal Cities
                                        </h4>

                                        <div class="row mt-2">
                                            <div class="col-md-4">
                                                <ul>
                                                    <li>Assisi</li>
                                                    <li>Bologna</li>
                                                    <li>Florence</li>
                                                    <li>Orvieto</li>
                                                    <li>+ 3 more</li>
                                                </ul>
                                            </div>
                                            <div class="col-md-6">
                                                <ul>
                                                    <li>Accommodation</li>
                                                    <li>All flights</li>
                                                    <li>Some transfers</li>
                                                    <li>Breakfast only</li>
                                                    <li>Activities</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container">
                <div class="main-section">
                    <!-- Overlay div with text -->
                    <div class="text-center c-design">
                        <p>
                            <span class="c-heading-1">

                                Live your dream  
                                trip then do it again!
                            </span>
                            <br>
                            Book by April 30th and get up to 500$
                            <br>    
                            <span class="badge rounded-pill text-bg-dark p-2 mt-2">Earn reward</span>
                        </p>
                        <!-- <p class="m-0">Live your dream trip then do it again!</p> -->
                    </div>
                </div>
            </div>

            <div>
                <h1 class="text-center mt-3 p-3" font-size="heading2">
                    Our recommendation to visit Italy and neighboring countries
                </h1>

                <div class="row">
                    <div class="p-4">
                        <div>
                            <div class="row g-0 c-content-radius">
                                <div class="col-xl-6">
                                    <div>
                                        <img
                                            src="https://www.livemint.com/lm-img/img/2024/02/15/600x338/Inner-Courtyard_Evening-Shot-4-1_1707965355524_1707965358412.jpg"
                                            @error="setAltImg"
                                            class="d-block w-100 img-fluid c-accomodation-image"
                                        />
                                    </div>
                                </div>
                                <div
                                    class="col-xl-6 c-accomodation-right-side p-5"
                                >
                                    <div class="card-body text-start pb-0">
                                        <h4 class="card-title p-0">
                                            Mediterranean Dreams: Italy & Spain
                                        </h4>

                                        <div class="row mt-2">
                                            <div class="col-md-4">
                                                <ul>
                                                    <li>Florence</li>
                                                    <li>Rome</li>
                                                    <li>Venice</li>
                                                    <li>Barcelona</li>
                                                    <li>+ 1 more</li>
                                                </ul>
                                            </div>
                                            <div class="col-md-6">
                                                <ul>
                                                    <li>Accommodation</li>
                                                    <li>All flights</li>
                                                    <li>Airport transfers</li>
                                                    <li>Breakfast only</li>
                                                    <li>Activities</li>
                                                </ul>
                                            </div>
                                        </div>
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
import { Carousel, Slide, Pagination, Navigation } from "vue3-carousel";
import Multiselect from "@vueform/multiselect";
import FullCalendar from "@fullcalendar/vue3";
import dayGridPlugin from "@fullcalendar/daygrid";
import multiMonthPlugin from "@fullcalendar/multimonth";
import { addMonths, startOfMonth, endOfMonth } from "date-fns";
export default {
    components: {
        Master,
        Carousel,
        Slide,
        Pagination,
        Navigation,
        Multiselect,
        FullCalendar,
    },
    props: ["tour_name", "tour_id"],
    created() {
        this.fetchTourDetails();
    },
    data() {
        return {
            passengerBaseSearch: {
                adults: 1,
                children: 0,
                infants: 0,
                id: this.tour_name,
            },
            initialDate: null,
            calendarOptions: {
                plugins: [multiMonthPlugin],
                initialView: "multiMonthTwoMonth",
                initialDate: startOfMonth(new Date()),
                weekends: false,
                events: this.getTourDates,
                eventClick: this.handleEventClick,
                views: {
                    multiMonthTwoMonth: {
                        type: "multiMonth",
                        duration: { months: 2 },
                        validRange: {
                            start: startOfMonth(new Date()),
                        },
                    },
                },
            },

            // the belwo settings and the breakpoints are for activities slider...
            settings: {
                itemsToShow: 3,

                snapAlign: "center",
            },
            breakpoints: {
                // 700px and up
                576: {
                    itemsToShow: 2.5,
                    snapAlign: "center",
                    transition: "500",
                },
                992: {
                    itemsToShow: 3.5,
                    snapAlign: "center",
                    transition: "500",
                },
                // 1024 and up
                1200: {
                    itemsToShow: 4.5,
                    snapAlign: "center",
                    transition: "500",
                },
            },
            maxWords: 50,

            tour: [],
            form: {
                departure_city: "",
                passengers: "",
            },
            formErrors: [],
            // passengers_options: ["New Your $2,300", "Chicago $5,400"],
            // darpartment_citites: ["Adults", "Children"],
            UsefullInformation: [],
            passenngerSearchTogglerStatus: true,
        };
    },

    methods: {
        increment(type) {
            if (type === "adult") {
                this.passengerBaseSearch.adults++;
            } else if (type === "child") {
                this.passengerBaseSearch.children++;
            } else if (type === "infant") {
                this.passengerBaseSearch.infants++;
            }
        },
        decrement(type) {
            if (
                type === "adult" &&
                this.passengerBaseSearch.adults > 0 &&
                this.passengerBaseSearch.adults != 1
            ) {
                this.passengerBaseSearch.adults--;
            } else if (
                type === "child" &&
                this.passengerBaseSearch.children > 0
            ) {
                this.passengerBaseSearch.children--;
            } else if (
                type === "infant" &&
                this.passengerBaseSearch.infants > 0
            ) {
                this.passengerBaseSearch.infants--;
            }
        },
        passengerApply() {
            this.passenngerSearchTogglerStatus = false;
            axios
                .post(
                    "/api/passenger-quantity-checking",
                    this.passengerBaseSearch
                )
                .then((response) => {
                    const tourDates = response.data;
                    if (tourDates.length > 0) {
                        this.$refs.dropdownToggler.click();
                    } else {
                        toastr.error("No tours found");
                    }
                    this.passenngerSearchTogglerStatus = true;

                    // Call getTourDates method with required parameters
                    this.searchedDates(tourDates, (eventDataFromDatabase) => {
                        // Update calendarOptions.events with the obtained event data
                        this.calendarOptions.events = eventDataFromDatabase;
                    });

                    // this.tour_dates = response.data;

                    this.getUsefullInformations();
                    const currentDate = new Date();
                    const formattedDate = this.formatDate(currentDate);

                    if (response.data.tour_first_date_in_current_month) {
                        this.initialDate =
                            response.data.tour_first_date_in_current_month;
                    } else {
                        this.initialDate = formattedDate;
                    }
                    this.calendarOptions.initialDate = this.initialDate;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        searchedDates(tourDates, successCallback) {
            let eventDataFromDatabase = tourDates.map((date) => {
                return {
                    title: "$" + date.price,
                    start: date.start_date,
                    end: date.end_date,
                    id: date.id,
                };
            });
            successCallback(eventDataFromDatabase);
        },

        async fetchTourDetails() {
            await axios
                .get("/api/front-end-tour-details/" + this.tour_id)

                .then((response) => {
                    this.tour = response.data;
                    this.getUsefullInformations();
                    const currentDate = new Date();
                    const formattedDate = this.formatDate(currentDate);

                    if (response.data.tour_first_date_in_current_month) {
                        this.initialDate =
                            response.data.tour_first_date_in_current_month;
                    } else {
                        this.initialDate = formattedDate;
                    }
                    // this.initialDate =
                    //     response.data.tour_first_date_in_current_month ??
                    //     formattedDate;
                    this.calendarOptions.initialDate = this.initialDate;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        formatDate(date) {
            const year = date.getFullYear();
            const month = String(date.getMonth() + 1).padStart(2, "0");
            const day = String(date.getDate()).padStart(2, "0");
            return `${year}-${month}-${day}`;
        },

        handleEventClick(info) {
            // eventId is the id of the date range...
            const clickedDate = info.event.start;
            const eventId = info.event.id;
            const adults = this.passengerBaseSearch.adults;
            const children = this.passengerBaseSearch.children;
            const infants = this.passengerBaseSearch.infants;

            // Construct the URL with event ID and tour ID and Quantities of Passengers...
            const url = `/tour-payment-details/${eventId}/${this.tour.id}/${adults}/${children}/${infants}`;
            // Redirect to the payment details page with the constructed URL
            window.location.href = url;
        },
        // getTourDates function is for default tour date range...
        getTourDates(info, successCallback) {
            let eventDataFromDatabase = this.tour.tour_dates.map((date) => {
                return {
                    title: "$" + date.price, // You may want to customize this based on requirements
                    start: date.start_date,
                    end: date.end_date,
                    id: date.id,
                };
            });
            successCallback(eventDataFromDatabase);
        },

        setAltImg(event) {
            event.target.src = "/images/default.jpg";
        },
        getUsefullInformations() {
            axios
                .get("/api/get-usefull-information/" + this.tour.id)
                .then((response) => {
                    this.UsefullInformation = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        pauseVideo() {
            const videoPlayers = this.$refs.videoPlayer;
            if (videoPlayers) {
                if (Array.isArray(videoPlayers)) {
                    videoPlayers.forEach((player) => {
                        if (player && player.pause) {
                            player.pause();
                        }
                    });
                } else {
                    if (videoPlayers.pause) {
                        videoPlayers.pause();
                    }
                }
            }
        },

        playVideo() {
            const videoPlayers = this.$refs.videoPlayer;
            if (videoPlayers) {
                if (Array.isArray(videoPlayers)) {
                    videoPlayers.forEach((player) => {
                        if (player && player.play) {
                            player.play();
                        }
                    });
                } else {
                    if (videoPlayers.play) {
                        videoPlayers.play();
                    }
                }
            }
        },
        onSlideStart() {
            // Ensure that event and event.detail are defined
            this.pauseVideo();
            // Play the video of the current slide
            this.playVideo();
        },

        // filterEvents(events, startDate, endDate) {
        //     return events
        //         .filter(
        //             (date) =>
        //                 new Date(date.start_date) >= startDate &&
        //                 new Date(date.end_date) <= endDate
        //         )
        //         .map((date) => ({
        //             title: "$" + date.price,
        //             start: date.start_date,
        //             end: date.end_date,
        //             id: date.id,
        //         }));
        // },
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
    /* background-color: black; */
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
.c-accomodation-image {
    border-radius: 16px 0px 0px 16px;
}
.c-content-radius {
    border: 1px solid grey;
    border-radius: 16px;
}
.c-accomodation-right-side {
    border: 1px solid grey;
    border-left: 0px;
    border-radius: 0px 16px 16px 0px;
}
@media (max-width: 1200px) {
    .c-accomodation-image {
        border-radius: 16px 16px 0px 0px;
    }
    .fc-toolbar-title {
        font-size: 18px !important;
    }

    .c-accomodation-right-side {
        border-radius: 0px 0px 16px 16px;
        border-top: 0px;
    }
}
.main-section {
    background-image: url("https://www.exoticca.com/_next/image?url=https%3A%2F%2Fassets.exoticca.com%2Fmedia%2Fimg%2Fpromo%2Fcashback%2FUK-ES-CA-US%2Fbanne_voucher-500_country_page_desktop_1440x400px.jpg&w=1920&q=75");
    background-size: cover;
    background-position: center;
     
    height: 300px;
    top: 30%;
    left: 0;
    right: 0;
    margin: auto;
    padding: 15px;
}
.c-heading-1{
    font-family: 'Oakes Grotesk", sans-serif';
    font-size:20px;
    font-weight: bold;
}
.c-design {
     
    background-color: rgb(242, 119, 59);
    width: 340px;
    border-radius: 30px;
    margin-left: 40px;
    margin-top:50px;
    opacity: 1; 
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    padding: 24px 16px;
    
}

/* Media query for screens smaller than 768px */
@media screen and (max-width: 767px) {
    .c-design {
        padding: 30px;
        font-size: 1rem;
        width: 100%;
        margin-left: 0px;
        margin-top:20px;
    }
}

/* Media query for screens smaller than 576px */
@media screen and (max-width: 575px) {
    .c-design {
        padding: 20px;
        font-size: 0.8rem;
        width: 100%;
        margin-left: 0px;
        margin-top:20px;
    }
}
</style>
