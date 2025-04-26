<template>
    <Master>
        <section class="p-3 bg-white">
            <!-- Hero Section -->
            <div class="row align-items-center p-3">
                <div class="col-md-12 text-center">
                    <h1 class="uppercase c-main-title">Open Houses!</h1>
                    <h4 class="c-tags">
                        Explore available open houses in the Las Vegas area
                    </h4>
                </div>
            </div>
        </section>

        <section class="c-bg-color p-5" v-if="OpenHouses && OpenHouses.length > 0">
            <div class="container">
                <div class="row row-cols-1 row-cols-md-3 g-4">
                    <div
                        v-for="home in OpenHouses"
                        :key="home.id"
                        class="col-md-3 mb-3"
                    >
                        <a
                            class="text-decoration-none"
                            :href="'/home-details/' + home.property_id"
                        >
                            <GlobalCard
                                :badge="
                                    home.is_open_house == 1
                                        ? 'Open House'
                                        : 'Quick Move In'
                                "
                                :badge2="home.incentive ? 'Incentive Home' : ''"
                                :main_image="
                                    home.main_image ??
                                    '/images/default_image.png'
                                "
                                :title="home.title"
                                :address="home.address"
                                :property_id="home.property_id"
                                :bedrooms="home.bedrooms"
                                :price="home.price"
                                :bathrooms="home.bathrooms"
                                :square_feet="home.square_feet"
                                :garages="home.garages"
                            />
                        </a>
                    </div>
                </div>
            </div>
        </section>
    </Master>
</template>

<script>
import { defineComponent } from "vue";
import Master from "@components/layout/Master.vue";

export default defineComponent({
    components: {
        Master,
    },
    data() {
        return {
            OpenHouses: [],
        };
    },
    created() {
        this.fetchOpenHouses();
    },
    methods: {
        fetchOpenHouses() {
            axios
                .get("/api/get-all-open-houses")
                .then((response) => {
                    this.OpenHouses = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        setAltImg(event) {
            event.target.src = "/images/default_image.png";
        },
    },
    
});
</script>

<style scoped>
.card-img-top {
    height: 200px;
    object-fit: cover;
    transition: transform 0.5s ease;
}
.card-img-top:hover {
    transform: scale(1.1);
}
.card {
    overflow: hidden;
    transition: box-shadow 0.3s ease;
}
.card:hover {
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
}

.c-location {
    font-family: Inter, sans-serif !important;
    font-weight: 400 !important;
    line-height: 32px !important;
    color: #2d6a9f !important;
}
.c-description {
    font-family: Inter, sans-serif;
    font-size: 16px;
    font-weight: 400;
    line-height: 24px;
    color: rgb(61, 102, 143);
}
.c-title {
    font-family: "Playfair Display", serif !important;
    font-weight: bold;
    z-index: 3 !important;
    width: 100% !important;
}
.c-bg-color {
    background-color: #f7fafc;
}
</style>
