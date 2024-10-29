<template>
    <div>
        <div class="mx-4 py-3">
            <p class="h1">Where to next?</p>
            <p>Destination inspiration from our travel experts:</p>

            <div class="row g-4 pt-1 row-cols-2 row-cols-lg-5 justify-content-center">
                <div
                    class="col"
                    v-for="(destination, index) in destinations"
                    :key="destination.id"
                >
                
                    <a class="text-decoration-none" :href="'/tour-country-tours-list/' +destination.country_id">
                        <div class="card border-0 c-border-design c-overflow-hidden">
                            <img
                                :src="destination.image ?? 'empty.png'"
                                class="c-destination-cards"
                                :class="{ 'hovered': hoverIndex === index }"
                                @error="setAltImg"
                            />
                            <div
                                class="card-img-overlay d-flex align-items-center justify-content-center"
                                @mouseover="hoverIndex = index" @mouseleave="hoverIndex = null"
                            >
                                <div class="text-center">
                                    <h3 class="card-title text-light">
                                        {{ destination.country }}
                                    </h3>
                                    <span
                                        class="badge rounded-pill bg-white text-dark"
                                        >{{
                                            destination.tours_count
                                        }}
                                        Trips</span
                                    >
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
export default {
    created() {
        this.fetchDestinations();
    },
    data() {
        return {
            destinations: "",
            hoverIndex: null,
        };
    },
    methods: {
        fetchDestinations() {
            axios
                .get("/api/get-tour-destinations")
                .then((response) => {
                    this.destinations = response.data;
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
.c-overflow-hidden{
    overflow: hidden !important;;
}
.c-destination-cards {
    border-radius: 25px;
    filter: brightness(60%);
    transition: transform .5s ease;
}

.c-destination-cards.hovered{
    transform: scale(1.3);
}

</style>
