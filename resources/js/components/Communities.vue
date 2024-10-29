<template>
    <div v-if="Communities && Communities.length > 0">
        <div class="mx-4 pb-5 pt-5">
            <div class="d-flex justify-content-between">
                <div>
                    <h2>Find Your Place in Our Communities!</h2>
                </div>

                <div>
                    <button class="btn btn-outline-light">Take me there</button>
                    <button id="fa-icon" class="btn btn-outline-light">
                        <i class="bi bi-arrow-right"></i>
                    </button>
                </div>
            </div>

            <div
                class="row g-4 pt-2 row-cols-2 row-cols-lg-5 justify-content-center"
            >
                <div
                    class="col"
                    v-for="(community, index) in Communities"
                    :key="community.id"
                >
                    <a
                        class="text-decoration-none"
                        :href="'/detailed/community/' + community.id"
                    >
                        <div
                            class="card border-0 c-border-design c-overflow-hidden"
                        >
                            <img
                                :src="community.main_image ?? 'empty.png'"
                                class="c-destination-cards"
                                :class="{ hovered: hoverIndex === index }"
                                @error="setAltImg"
                            />
                            <div
                                class="card-img-overlay d-flex align-items-center justify-content-center"
                                @mouseover="hoverIndex = index"
                                @mouseleave="hoverIndex = null"
                            >
                                <div class="text-center">
                                    <h3 class="text-light">
                                        {{ community.name }}
                                    </h3>
                                    <span
                                        class="badge rounded-pill bg-white text-dark"
                                        >{{ community.homes_count }} Homes</span
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
            Communities: "",
            hoverIndex: null,
        };
    },
    methods: {
        fetchDestinations() {
            axios
                .get("/api/get-communities")
                .then((response) => {
                    this.Communities = response.data;
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
.c-overflow-hidden {
    overflow: hidden !important;
}
.c-destination-cards {
    border-radius: 25px;
    filter: brightness(60%);
    transition: transform 0.5s ease;
}

.c-destination-cards.hovered {
    transform: scale(1.3);
}
</style>
