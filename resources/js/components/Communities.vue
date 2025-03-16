<template>
    <section class="py-5 c-bg-color"  v-if="Communities && Communities.length > 0">
        <div class="container">
            <div class="text-center mb-4">
                <h1 class="fw-bold c-main-title text-black">Find Your Place in Our Communities!</h1>
                <p class="text-muted c-sub-title">Explore our vibrant communities and discover your next home.</p>
            </div>
            
            <div class="row row-cols-1 row-cols-md-3 g-4">
                <div v-for="(community, index) in Communities" :key="community.id" class="col">
                    <div class="card border-0 shadow-sm h-100">
                        <div class="overflow-hidden position-relative">
                            <img :src="community.main_image ?? 'empty.png'" class="card-img-top" :alt="community.name" @error="setAltImg">
                            <div class="card-img-overlay d-flex align-items-end p-2 bg-dark bg-opacity-50">
                                <div>
                                    <h2 class="c-main-title  text-white">{{ community.name }}</h2>
                                    <p class="c-sub-title text-white">{{ community.homes_count }} Homes</p>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <p class="card-text">Discover the charm of {{ community.name }} with beautiful homes and thriving communities.</p>
                            <a :href="'/detailed/community/' + community.id" class="btn btn-light c-custom-btn px-4 py-2 fw-semibold w-100">Explore</a>
                        </div>
                    </div>
                </div>
            </div>
 
            <!-- Bottom Button -->
            <div class="text-center mt-4">
                <a :href="'/all/communities/'" class="btn btn-light c-custom-btn px-4 py-2 fw-semibold">Explore More Communities</a>
            </div>
        </div>
    </section>
</template>

<script>
import { defineComponent } from "vue";
export default defineComponent({
    data() {
        return {
            Communities: [],
        };
    },
    created() {
        this.fetchDestinations();
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

</style>
