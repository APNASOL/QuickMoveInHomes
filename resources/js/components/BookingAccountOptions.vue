<template>
    <Master>
        <div class="c-tour-details px-5">
            <div class="">
                <div class="row">
                    <div class="col-12 col-md-12 mt-5">
                        <h1 class="c-tour-name">
                            PLEASE FIRST LOGIN OR ENTER YOU EMAIL TO PROCEED
                            FURTHER
                        </h1>

                        <div class="mt-2 mb-2">
                            <b>{{ translate("Tour") }}</b>
                            {{ tour.title }} ,
                        </div>

                        <div class="card c-global-radius">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="card c-global-radius">
                                            <div class="card-body">
                                                <div class="">
                                                    <h5 class="text-theme">
                                                        {{
                                                            translate(
                                                                "Proceed with email"
                                                            )
                                                        }}
                                                    </h5>
                                                </div>

                                                <form class="row g-3">
                                                    <div class="col-12">
                                                        <label
                                                            for="email"
                                                            class="form-label"
                                                            >{{
                                                                translate(
                                                                    "Email"
                                                                )
                                                            }}</label
                                                        >
                                                        <input
                                                            type="email"
                                                            class="form-control"
                                                            v-model="
                                                                email_process.email
                                                            "
                                                            autocomplete="current-email"
                                                        />
                                                        <div
                                                            v-if="
                                                                emailProcessFormErrors.email
                                                            "
                                                            class="invalid-feedback"
                                                        >
                                                            {{
                                                                emailProcessFormErrors
                                                                    .email[0]
                                                            }}
                                                        </div>
                                                    </div>

                                                    <div class="col-12">
                                                        <button
                                                            v-if="
                                                                bookingUsingEmailStatus ==
                                                                1
                                                            "
                                                            class="btn c-btn-theme-yellow text-white w-100"
                                                            type="button"
                                                            @click="
                                                                bookingUsingEmail
                                                            "
                                                        >
                                                            {{
                                                                translate(
                                                                    "Next"
                                                                )
                                                            }}
                                                        </button>
                                                        <button
                                                            class="btn c-btn-theme-yellow text-white w-100"
                                                            type="button"
                                                            disabled
                                                            v-else
                                                        >
                                                            {{
                                                                translate(
                                                                    "Next"
                                                                )
                                                            }}
                                                            <span
                                                                class="spinner-border spinner-border-sm"
                                                                role="status"
                                                                aria-hidden="true"
                                                            ></span>
                                                        </button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-2 text-center mt-5">
                                        <strong>{{ translate("OR") }}</strong>
                                    </div>

                                    <div class="col-md-5">
                                        <nav>
                                            <div
                                                class="nav nav-tabs"
                                                id="nav-tab"
                                                role="tablist"
                                            >
                                                <button
                                                    class="nav-link active"
                                                    id="nav-login-tab"
                                                    data-bs-toggle="tab"
                                                    data-bs-target="#nav-login"
                                                    type="button"
                                                    role="tab"
                                                    aria-controls="nav-login"
                                                    aria-selected="true"
                                                >
                                                    {{ translate("Login") }}
                                                </button>

                                                <button
                                                    class="nav-link"
                                                    id="nav-register-tab"
                                                    data-bs-toggle="tab"
                                                    data-bs-target="#nav-register"
                                                    type="button"
                                                    role="tab"
                                                    aria-controls="nav-register"
                                                    aria-selected="false"
                                                >
                                                    {{ translate("Register") }}
                                                </button>
                                            </div>
                                        </nav>

                                        <div
                                            class="tab-content"
                                            id="nav-tabContent"
                                        >
                                            <div
                                                class="tab-pane fade show active"
                                                id="nav-login"
                                                role="tabpanel"
                                                aria-labelledby="nav-login-tab"
                                            >
                                                <div
                                                    class="card c-global-radius"
                                                >
                                                    <div class="card-body">
                                                        <div>
                                                            <h5
                                                                class="text-theme"
                                                            >
                                                                {{
                                                                    translate(
                                                                        "Proceed with login"
                                                                    )
                                                                }}
                                                            </h5>
                                                        </div>
                                                        <form class="row g-3">
                                                            <div class="col-12">
                                                                <label
                                                                    for="email"
                                                                    class="form-label"
                                                                    >{{
                                                                        translate(
                                                                            "Email"
                                                                        )
                                                                    }}</label
                                                                >
                                                                <input
                                                                    type="email"
                                                                    class="form-control"
                                                                    :class="{
                                                                        'invalid-bg':
                                                                            formErrors.email,
                                                                    }"
                                                                    v-model="
                                                                        form.email
                                                                    "
                                                                    autocomplete="current-email"
                                                                />
                                                                <div
                                                                    v-if="
                                                                        formErrors.email
                                                                    "
                                                                    class="invalid-feedback"
                                                                >
                                                                    {{
                                                                        formErrors
                                                                            .email[0]
                                                                    }}
                                                                </div>
                                                            </div>

                                                            <div class="col-12">
                                                                <label
                                                                    for="password"
                                                                    class="form-label"
                                                                    >{{
                                                                        translate(
                                                                            "Password"
                                                                        )
                                                                    }}</label
                                                                >
                                                                <input
                                                                    type="password"
                                                                    name="passwword"
                                                                    class="form-control"
                                                                    :class="{
                                                                        'invalid-bg':
                                                                            formErrors.email,
                                                                    }"
                                                                    v-model="
                                                                        form.password
                                                                    "
                                                                    autocomplete="current-password"
                                                                />
                                                                <div
                                                                    v-if="
                                                                        formErrors.password
                                                                    "
                                                                    class="invalid-feedback"
                                                                >
                                                                    {{
                                                                        formErrors
                                                                            .password[0]
                                                                    }}
                                                                </div>
                                                            </div>

                                                            <div class="col-12">
                                                                <button
                                                                    v-if="
                                                                        formStatus ==
                                                                        1
                                                                    "
                                                                    class="btn c-btn-theme-yellow text-white w-100"
                                                                    type="button"
                                                                    @click="
                                                                        bookingUsingLogin
                                                                    "
                                                                >
                                                                    {{
                                                                        translate(
                                                                            "Login"
                                                                        )
                                                                    }}
                                                                </button>
                                                                <button
                                                                    class="btn c-btn-theme-yellow text-white w-100"
                                                                    type="button"
                                                                    disabled
                                                                    v-else
                                                                >
                                                                    {{
                                                                        translate(
                                                                            "Login"
                                                                        )
                                                                    }}
                                                                    <span
                                                                        class="spinner-border spinner-border-sm"
                                                                        role="status"
                                                                        aria-hidden="true"
                                                                    ></span>
                                                                </button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                            <div
                                                class="tab-pane fade"
                                                id="nav-register"
                                                role="tabpanel"
                                                aria-labelledby="nav-register-tab"
                                            >
                                                <div
                                                    class="card mb-3 c-global-radius"
                                                >
                                                    <div class="card-body">
                                                        <div>
                                                            <h5
                                                                class="text-theme"
                                                            >
                                                                {{
                                                                    translate(
                                                                        "Register New Account"
                                                                    )
                                                                }}
                                                            </h5>
                                                        </div>

                                                        <form
                                                            @submit.prevent="
                                                                bookingUsingRegisterNewAccount
                                                            "
                                                        >
                                                            <div
                                                                class="row g-2"
                                                            >
                                                                <div
                                                                    class="col-12"
                                                                >
                                                                    <label
                                                                        for="email"
                                                                        class="form-label"
                                                                        >{{
                                                                            translate(
                                                                                "Full name"
                                                                            )
                                                                        }}
                                                                    </label>
                                                                    <input
                                                                        type="text"
                                                                        class="form-control"
                                                                        :class="{
                                                                            'invalid-bg':
                                                                                formErrors.user_name,
                                                                        }"
                                                                        v-model="
                                                                            registerForm.user_name
                                                                        "
                                                                    />
                                                                    <div
                                                                        v-if="
                                                                            formErrors.user_name
                                                                        "
                                                                        class="invalid-feedback"
                                                                    >
                                                                        {{
                                                                            formErrors
                                                                                .user_name[0]
                                                                        }}
                                                                    </div>
                                                                </div>

                                                                <div
                                                                    class="col-12"
                                                                >
                                                                    <label
                                                                        for="email"
                                                                        class="form-label"
                                                                        >{{
                                                                            translate(
                                                                                "Email"
                                                                            )
                                                                        }}
                                                                    </label>
                                                                    <input
                                                                        type="text"
                                                                        class="form-control"
                                                                        :class="{
                                                                            'invalid-bg':
                                                                                formErrors.email,
                                                                        }"
                                                                        v-model="
                                                                            registerForm.email
                                                                        "
                                                                    />
                                                                    <div
                                                                        v-if="
                                                                            formErrors.email
                                                                        "
                                                                        class="invalid-feedback"
                                                                    >
                                                                        {{
                                                                            formErrors
                                                                                .email[0]
                                                                        }}
                                                                    </div>
                                                                </div>

                                                                <div
                                                                    class="col-12"
                                                                >
                                                                    <label
                                                                        for="password"
                                                                        class="form-label"
                                                                        >{{
                                                                            translate(
                                                                                "Password"
                                                                            )
                                                                        }}
                                                                    </label>
                                                                    <input
                                                                        type="password"
                                                                        class="form-control"
                                                                        :class="{
                                                                            'invalid-bg':
                                                                                formErrors.password,
                                                                        }"
                                                                        v-model="
                                                                            registerForm.password
                                                                        "
                                                                    />
                                                                    <div
                                                                        v-if="
                                                                            formErrors.password
                                                                        "
                                                                        class="invalid-feedback"
                                                                    >
                                                                        {{
                                                                            formErrors
                                                                                .password[0]
                                                                        }}
                                                                    </div>
                                                                </div>

                                                                <div
                                                                    class="col-12"
                                                                >
                                                                    <label
                                                                        for="confirm_password"
                                                                        class="form-label"
                                                                        >{{
                                                                            translate(
                                                                                "Confirm password"
                                                                            )
                                                                        }}
                                                                    </label>
                                                                    <input
                                                                        type="password"
                                                                        class="form-control"
                                                                        :class="{
                                                                            'invalid-bg':
                                                                                formErrors.confirm_password,
                                                                        }"
                                                                        id="confirm_password"
                                                                        v-model="
                                                                            registerForm.confirm_password
                                                                        "
                                                                    />
                                                                    <div
                                                                        v-if="
                                                                            formErrors.confirm_password
                                                                        "
                                                                        class="invalid-feedback"
                                                                    >
                                                                        {{
                                                                            formErrors
                                                                                .confirm_password[0]
                                                                        }}
                                                                    </div>
                                                                </div>

                                                                <br />
                                                                <div
                                                                    class="col-12"
                                                                >
                                                                    <div
                                                                        class="mt-2"
                                                                    >
                                                                        <button
                                                                            v-if="
                                                                                RegisterformStatus ==
                                                                                1
                                                                            "
                                                                            class="btn c-btn-theme-yellow text-white w-100"
                                                                            type="submit"
                                                                        >
                                                                            {{
                                                                                translate(
                                                                                    "Register"
                                                                                )
                                                                            }}
                                                                        </button>

                                                                        <button
                                                                            class="btn c-btn-theme-yellow text-white w-100"
                                                                            type="submit"
                                                                            disabled
                                                                            v-else
                                                                        >
                                                                            {{
                                                                                translate(
                                                                                    "Register"
                                                                                )
                                                                            }}
                                                                            <span
                                                                                class="spinner-border spinner-border-sm"
                                                                                role="status"
                                                                                aria-hidden="true"
                                                                            ></span>
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </form>
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
            </div>
        </div>
    </Master>
    <div v-if="openConfirmCodeModal == true">
        <verification-code-component
            :email="user_confirmation_email"
            @parentProcesses="parentProcesses"
        />
    </div>
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
        "price",
        "discount",

    ],
    created() {
        this.fetchTourDetails();
        this.fetchTourDates();
        
    },
    data() {
        return {
            openConfirmCodeModal: false,
            user_confirmation_email: "",
            process_user_email: "",
            processing: "",

            form: {
                email: "",
                password: "",
                remember: false,
            },
            registerForm: {
                user_name: "",
                email: "",
                password: "",
                confirm_password: "",
            },
            email_process: {
                email: "",
            },
            bookingUsingEmailStatus: 1,
            formErrors: [],

            emailProcessFormErrors: [],
            user_id: "",
            formStatus: 1,
            RegisterformStatus: 1,
            RegisterbuttonStatus: 1,
            buttonStatus: 1,
        };
    },
    methods: {
        parentProcesses() {
            toastr.success(
                this.translate(
                    "Thank you! Your account has been successfully verified and is now active. Welcome aboard! You may proceed your further processes."
                )
            );

            let url =
                "/getting-payment-page/" +
                this.process_user_email +
                "/" +
                this.tour_id +
                "/" +
                this.dates_id +
                "/" +
                this.booking_code +
                "/" +
                this.infants +
                "/" +
                this.children +
                "/" +
                this.adults+"/"+this.price+"/"+this.discount;;
            window.location.href = url;
        },
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

        // booking
        bookingUsingLogin() {
            this.formStatus = 0;
            axios
                .post("/api/booking-using-existing-account-login", this.form)
                .then((response) => {
                    if (
                        response.data ==
                        "verification-required"
                    ) {
                        this.formStatus = 0;
                        this.openConfirmCodeModal = true;
                        this.user_confirmation_email = this.form.email;
                        this.process_user_email = this.form.email;
                    }

                    if (response.data == "success") {
                        let email = this.form.email;
                        let url =
                            "/getting-payment-page/" +
                            email +
                            "/" +
                            this.tour_id +
                            "/" +
                            this.dates_id +
                            "/" +
                            this.booking_code +
                            "/" +
                            this.infants +
                            "/" +
                            this.children +
                            "/" +
                            this.adults+"/"+this.price+"/"+this.discount;
                        window.location.href = url;
                    }
                })
                .catch((error) => {
                    this.formStatus = 1;
                    toastr.error(error.response.data.message);

                    if (error.response.data.errors) {
                        this.formErrors = error.response.data.errors;
                    }
                });
        },
        // submit method is for new patient registeration
        bookingUsingRegisterNewAccount() {
            this.RegisterformStatus = 0;
            axios
                .post("/api/user-register", this.registerForm)
                .then((response) => {
                    this.RegisterformStatus = 1;
                    this.formStatus = 0;
                    this.openConfirmCodeModal = true;
                    this.user_confirmation_email = this.registerForm.email;
                    this.process_user_email = this.registerForm.email;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);

                    if (error.response.data.errors) {
                        this.formErrors = error.response.data.errors;
                        this.RegisterformStatus = 1;
                    }
                });
        },
        bookingUsingEmail() {
            this.bookingUsingEmailStatus = 0;

            axios
                .post("/api/booking-using-email", this.email_process)
                .then((response) => {
                    this.bookingUsingEmailStatus = 0;
                    this.openConfirmCodeModal = true;
                    this.user_confirmation_email = this.email_process.email;
                    this.process_user_email = this.email_process.email;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                    this.bookingUsingEmailStatus = 1;

                    if (error.response.data.errors) {
                        this.emailProcessFormErrors =
                            error.response.data.errors;
                    }
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
