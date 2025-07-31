<template>
    <div class="interactive-banner bg-light py-5">
        <div class="container">
            <div class="row align-items-center">
                <!-- Left Side -->
                <div class="col-12 col-lg-6 text-center text-lg-start mb-5 mb-lg-0">
                    <h2 class="fw-bold mb-3" style="color: #023F86;">
                        Ready to Begin Your Real Estate Journey?
                    </h2>
                    <p class="text-muted mb-4">
                        Whether you're looking to buy, sell, or rent, we're here to help
                        you every step of the way. Join thousands of satisfied users today.
                    </p>
                    <a href="/contact" class="btn text-white px-4 py-2 rounded-pill fw-semibold"
                       style="background-color: #023F86; border: 1px solid #023F86;">
                        Contact Us
                    </a>
                </div>

                <!-- Right Side Promises -->
                <div class="col-12 col-lg-6">
                    <div class="row g-3">
                        <div
                            v-for="(promise, index) in Promises"
                            :key="index"
                            class="col-6"
                        >
                            <div
                                class="card card-body text-start h-100 border-0 shadow-sm rounded-4 c-hover-effect"
                                style="background-color: #f9fbfd;"
                            >
                                <div class="d-flex align-items-center mb-2">
                                    <img
                                        :src="promise.icon"
                                        alt="Icon"
                                        class="me-2"
                                        style="width: 36px; height: 36px;"
                                        @error="setAltImg"
                                    />
                                    <h6 class="fw-bold mb-0" style="color: #023F86;">
                                        {{ promise.title }}
                                    </h6>
                                </div>
                                <p class="small text-muted mb-0">
                                    {{ promise.description }}
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    created() {
        this.fetchPromises();
    },
    data() {
        return {
            Promises: [],
        };
    },
    methods: {
        fetchPromises() {
            axios
                .get("/api/get-promises")
                .then((response) => {
                    this.Promises = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response?.data?.message || "Something went wrong.");
                });
        },
        setAltImg(event) {
            event.target.src = "/images/default_image.png";
        },
    },
};
</script>
<style scoped>
/* Hover effect */
.c-hover-effect {
    transition: transform 0.3s ease, background-color 0.3s, box-shadow 0.3s;
}
.c-hover-effect:hover {
    transform: scale(1.05);
    background-color: #eaf4fb;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.12);
}

/* Make sure images don't break layout */
img {
    object-fit: contain;
    max-width: 100%;
    height: auto;
}


.btn:hover {
  background-color: #035bb8 !important;
  border-color: #035bb8 !important;
}
</style>
