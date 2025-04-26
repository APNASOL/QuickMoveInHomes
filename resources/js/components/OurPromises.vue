<template>
    <div class="interactive-banner">
        <div class="container py-5">
            <div class="row align-items-center">
                <!-- Left Side: Heading, Paragraph, Buttons -->
                <div
                    class="col-12 col-lg-6 text-center text-lg-start mb-4 mb-lg-0"
                >
                    <h2 class="fw-bold mb-3 c-theme-color">
                        Ready to Begin Your Real Estate Journey?
                    </h2>
                    <p class="mb-4">
                        Whether you're looking to buy, sell, or rent, we're here
                        to help you every step of the way. Join thousands of
                        satisfied users today.
                    </p>
                    <div>
                        <!-- <button class="btn btn-primary me-2">Create an Account</button> -->
                        <a href="/contact" class="btn btn-light">Contact Us</a>
                    </div>
                </div>

                <!-- Right Side: Promises Cards -->
                <div class="col-12 col-lg-6 ">
                    <div class="row g-3">
                        <div
                            v-for="(promise, index) in Promises"
                            :key="index"
                            class="col-6"
                        >
                            <div
                                class="card card-body text-start h-100 c-border-pr n shadow-sm c-hover-effect"
                            >
                                <div class="t mb-2">
                                    <!-- ICON/LOGO here -->
                                    <img
                                        :src="promise.icon"
                                        alt="Icon"
                                        class="me-2"
                                        style="width: 40px"
                                        @error="setAltImg"
                                    />
                                    <h6
                                        class="fw-bold mb-0"
                                        style="color: rgb(61, 102, 143)"
                                    >
                                        {{ promise.title }}
                                    </h6>
                                </div>
                                <p class="small text-muted">
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
            Promises: "",
            hoverIndex: null,
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
                    toastr.error(error.response.data.message);
                });
        },
        setAltImg(event) {
            event.target.src = "/images/default_image.png";
        },
    },
};
</script>
<style scoped>
.c-overflow-hidden {
    overflow: hidden !important;
}
.c-destination-cards {
    filter: brightness(60%);
    transition: transform 0.5s ease;
}

.c-destination-cards.hovered {
    transform: scale(1.3);
}
.icon-box {
    position: relative;
}

.icon-box .icon {
    position: absolute;
    top: 0;
    right: 0;
}
.c-border-promis-design {
    border-radius: 0.25rem;
}
.c-h-fix {
    min-height: 50px;
}
.c-border-promis-design {
    border-radius: 0.5rem;
    background-color: #f8f9fa; /* Light gray background for card */
}

.c-theme-color {
    color: #ffffff; /* If you want white color or change accordingly */
}

/* Button adjustments if needed */
/* .btn-primary {
  background-color: rgb(61, 102, 143);
  border-color: #0d6efd;
} */

.shadow-sm {
    box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
}
  /* Smooth transition */
.c-hover-effect {
  transition: transform 0.3s ease-in-out, background-color 0.3s, box-shadow 0.3s;
}

/* Zoom effect on hover */
.c-hover-effect:hover {
  transform: scale(1.05); /* Zoom 5% */
  background-color: #eaf4fb; /* Light blue background */
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
}
</style>

