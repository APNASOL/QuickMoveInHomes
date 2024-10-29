<template>
    <div v-if="tours.length">
        <div class="mx-5">
            <h5 class="text-center">More trips to discover</h5>

            <div class="row">
                <div class="col-md-12 mt-2" v-for="tour in tours" :key="tour.id">
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
                                class="card-img-top c-card-img-border"
                                :alt="tour.title"
                                @error="setAltImg"
                                height="200"
                            />
                            <div
                                class="card-img-overlay c-card-img-overlay-name"
                            >
                                <h3>{{ tour.title }}</h3>
                                <h5>8 Days</h5>
                            </div>
                            <div class="card-body text-start">
                                <h5 class="card-title">{{ tour.title }}</h5>
                                <div
                                    v-if="
                                        tour.minimum_price &&
                                        tour.discounted_price
                                    "
                                >
                                    <small>
                                        From
                                        <span
                                            class="text-decoration-line-through"
                                        >
                                            ${{ tour.minimum_price }}
                                        </span>
                                    </small>
                                </div>
                                <div
                                    v-if="
                                        tour.minimum_price &&
                                        tour.discounted_price
                                    "
                                >
                                    <h5>
                                        ${{
                                            calculateDiscountPercentage(
                                                tour.minimum_price,
                                                tour.discounted_price
                                            )
                                        }}

                                        <span
                                            class="badge rounded-pill text-bg-warning ms-1"
                                            >{{ tour.discounted_price }}%</span
                                        >
                                    </h5>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { defineComponent } from "vue";
export default defineComponent({
    components: {},
    data() {
        return {
            tours: [],
        };
    },
    props: ["tour_id"],
    created() {
        // this.getTours();
    },
    methods: {
        async getTours() {
            await axios
                .get("/api/more-tours-to-discover/" + this.tour_id)
                .then((response) => {
                    this.tours = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        calculateDiscountPercentage(originalPrice, discountPercentage) {
            const discountAmount = (discountPercentage / 100) * originalPrice;
            const discountedPrice = originalPrice - discountAmount;
            return Math.round(discountedPrice);
        },
    },
});
</script>
<style scoped>
.c-card-img-overlay-name {
    top: unset;
    bottom: 120px;
    text-align: left;
    color: white;
}
.c-card-img-overlay-flash-sale {
    left: unset;
}
#fa-icon {
    display: none; /* Hide the icon by default */
}
@media only screen and (max-width: 830px) {
    .btn {
        display: none;
    }
    #fa-icon {
        display: inline-block;
    }
}
.c-border-design {
    border-radius: 25px;
    border: none;
    box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 15px -3px,
        rgba(0, 0, 0, 0.05) 0px 4px 6px -2px;
}
.c-card-img-border {
    border-top-left-radius: 25px;
    border-top-right-radius: 25px;
}
</style>
