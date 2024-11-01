<template>
    <Master>
        <div class="c-tour-details container">
            <div class="row" v-if="tour_country_details.banner">
                <div class="col-12 col-md-12 mt-5">
                    <img :src="tour_country_details.banner" width="100%" />
                </div>
            </div>

            <div v-if="tours.length">
                <h1 class="text-center mt-3 p-3" font-size="heading2">
                    Our recommendation to visit {{ country_name }}
                </h1>

                <div class="mx-4 pt-3">
                    <div class="row">
                        <div
                            v-for="tour in tours"
                            :key="tour.id"
                            class="col-md-3"
                        >
                            <a
                                class="text-decoration-none"
                                :href="
                                    '/tour-details/' +
                                    tour.id +
                                    '/' +
                                    tour.title.replace(/\s+/g, '-')
                                "
                            >
                                <div class="card c-border-design">
                                    <img
                                        :src="tour.image"
                                        class="card-img-top c-images-border-design"
                                        :alt="tour.title"
                                        @error="setAltImg"
                                    />

                                    <div
                                        class="card-img-overlay c-card-img-overlay-flash-sale"
                                    >
                                        <span
                                            class="badge rounded-pill bg-white text-dark"
                                            >Flash sale</span
                                        >
                                    </div>
                                    <div
                                        class="card-img-overlay c-card-img-overlay-name"
                                    >
                                        <h3>{{ tour.title }}</h3>
                                        <h5>{{ tour.days }} Days</h5>
                                    </div>
                                    <div class="card-body text-start">
                                        <h5 class="card-title">
                                            {{ tour.title }}
                                        </h5>
                                        <div
                                            v-if="
                                                tour.minimum_price &&
                                                tour.discounted_price
                                            "
                                        >
                                            From
                                            <span
                                                class="text-decoration-line-through"
                                            >
                                                ${{ tour.minimum_price }}
                                            </span>
                                        </div>
                                        <div
                                            v-if="
                                                tour.minimum_price &&
                                                tour.discounted_price
                                            "
                                        >
                                            ${{ tour.discounted_price }}
                                            <span
                                                class="badge rounded-pill text-bg-warning"
                                                >{{
                                                    calculateDiscountPercentage(
                                                        tour.minimum_price,
                                                        tour.discounted_price
                                                    )
                                                }}%</span
                                            >
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="mt-5" v-if="tour_country_details.description_details">
                <h1 class="text-center mt-3 p-3" font-size="heading2">
                    Extraordinary Vacation Packages & Tours to
                    {{ country_name }}
                </h1>

                <div
                    class="content ql-editor"
                    v-html="tour_country_details.description_details"
                ></div>
            </div>
            <div class="mt-5" v-if="faqs && faqs.length > 0">
                <h1 class="text-center mt-3 p-3" font-size="heading2">FAQ's</h1>

                <div class="accordion" id="countryToursAccordion">
                    <div
                        class="accordion-item"
                        v-for="(faq, index) in faqs"
                        :key="faq.id"
                    >
                        <h2 class="accordion-header">
                            <button
                                class="accordion-button collapsed"
                                type="button"
                                data-bs-toggle="collapse"
                                :data-bs-target="'#collapseItem' + index + 1"
                                aria-expanded="false"
                                :aria-controls="'collapseItem' + index + 1"
                            >
                                {{ faq.question }}
                            </button>
                        </h2>
                        <div
                            :id="'collapseItem' + index + 1"
                            class="accordion-collapse collapse"
                            data-bs-parent="#countryToursAccordion"
                        >
                            <div class="accordion-body">
                                {{ faq.answer }}
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

export default {
    components: {
        Master,
    },
    props: ["country_id"],
    created() {
        this.fetchToursCountryDetails();
        // this.getTours();
        this.fetchFaqs();
    },
    data() {
        return {
            tour_country_details: "",
            country_name: "",
            tours: [],
            faqs: "",
        };
    },

    methods: {
        fetchToursCountryDetails() {
            axios
                .get("/api/get-tour-country-tours-details/" + this.country_id)
                .then((response) => {
                    this.country_name = response.data.country_name;
                    this.tour_country_details =
                        response.data.tour_country_details;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        getTours() {
            axios
                .get("/api/get-tour-country-tours-list/" + this.country_id)

                .then((response) => {
                    this.country_name = response.data.country_name;
                    this.tour_country_details =
                        response.data.tour_country_details;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        getTours() {
            axios
                .get("/api/get-tour-country-tours-list/" + this.country_id)
                .then((response) => {
                    this.tours = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        calculateDiscountPercentage(originalPrice, discountedPrice) {
            const discount = originalPrice - discountedPrice;
            const percentage = (discount / originalPrice) * 100;
            return Math.round(percentage);
        },
        async fetchFaqs() {
            await axios
                .get("/api/get-tour-country-faqs/" + this.country_id)
                .then((response) => {
                    this.faqs = response.data;
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
 
</style>
