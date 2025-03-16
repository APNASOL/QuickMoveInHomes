<template>
    <Master>
        <section class="container contact-section text-center py-5">
            <div class="container">
                <h2 class="contact-title">Contact Yvonne Khoo</h2>
                <p class="contact-subtitle">
                    Ready to start your real estate journey? Whether you're
                    buying, selling, or just have questions, I'm here to help
                    you every step of the way.
                </p>
            </div>
        </section>

        <section class="container mt-5">
            <div class="row">
                <div class="col-md-6">
                    <div class="card w-100">
                        <div class="card-body">
                            <h4 class="contact-title">
                                Better yet, see us in person!
                            </h4>
                            <p>
                                We love our customers, so feel free to visit
                                during normal business hours.
                            </p>
                            <h5 class="c-title">QBrand New Homes Vegas</h5>
                            <p>
                                10845 Griffith Peak Drive, Suite 2, Las Vegas,
                                NV 89135
                            </p>
                            <h5 class="c-title">
                                Phone | 24-Hour Emergency Assistance
                            </h5>
                            <p>
                                USA & Canada: (702) 819-0035 <br />
                                Overseas: +1 (702) 819-0035
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    
                    <div>
                        <div
                            class="collapse multi-collapse show"
                            id="collapseContactInfo"
                        >
                            <div>
                                <div class="mt-3">
                                    <!-- <b class="c-title"
                                        >Reservation Department Hours</b
                                    > -->
                                    <div
                                        class="accordion mt-3"
                                        id="contactAccorddion"
                                    >
                                        <div class="accordion-item">
                                            <h2
                                                class="accordion-header"
                                                id="headingOne"
                                            >
                                                <button
                                                    class="accordion-button collapsed contact-title"
                                                    type="button"
                                                    data-bs-toggle="collapse"
                                                    data-bs-target="#collapseOne"
                                                    aria-expanded="true"
                                                    aria-controls="collapseOne"
                                                >
                                                    OFFICE HOURS
                                                </button>
                                            </h2>

                                            <div
                                                id="collapseOne"
                                                class="accordion-collapse collapse show"
                                                aria-labelledby="headingOne"
                                                data-bs-parent="#contactAccorddion"
                                            >
                                                <div class="accordion-body">
                                                    <ul class="list-unstyled">
                                                        <li>
                                                            <strong
                                                                >Mon-Fri:</strong
                                                            >
                                                            10:00 AM - 06:00 PM
                                                        </li>
                                                        <li>
                                                            <strong
                                                                >Sat:</strong
                                                            >
                                                            11:00 AM - 03:00 PM
                                                        </li>
                                                        <li>
                                                            <strong
                                                                >Sun:</strong
                                                            >
                                                            Closed
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-4">
                                    <!-- <button
                                        v-if="contactFormBtnStatus == 0"
                                        class="btn btn-secondary"
                                        @click="showForm"
                                    >
                                        DROP US A LINE
                                    </button> -->

                                    <button
                                        class="btn c-btn-theme-primary me-2 mt-2"
                                        @click="showForm('Agent')"
                                        type="button"
                                        data-bs-toggle="collapse"
                                        data-bs-target=".multi-collapse"
                                        aria-expanded="false"
                                        aria-controls="collapseContactForm collapseContactInfo"
                                    >
                                        {{
                                            translate(
                                                "DROP US A LINE AS AN AGENT"
                                            )
                                        }}
                                    </button>
                                    <button
                                        class="btn c-btn-theme-primary w-30 mt-2"
                                        @click="showForm('Customer')"
                                        type="button"
                                        data-bs-toggle="collapse"
                                        data-bs-target=".multi-collapse"
                                        aria-expanded="false"
                                        aria-controls="collapseContactForm collapseContactInfo"
                                    >
                                        {{
                                            translate(
                                                "DROP US A LINE A CUSTOMER"
                                            )
                                        }}
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- form starts here -->

                    <div>
                        <div
                            class="collapse multi-collapse"
                            id="collapseContactForm"
                        >
                            <div class="card">
                                <div class="card-body">
                                    <div class="row g-3 c-bg-form p-2">
                                        <b class="c-title"
                                            >Dear
                                            <i class="c-theme-color"
                                                >{{ contacting_user }}
                                            </i>
                                            Drop us a line</b
                                        >
                                        <div class="col-md-12">
                                            <label class="form-label">{{
                                                translate("Your Full Name")
                                            }}</label>
                                            <input
                                                type="text"
                                                class="form-control"
                                                :class="{
                                                    'invalid-bg':
                                                        formErrors.name,
                                                }"
                                                v-model="form.name"
                                            />
                                            <div
                                                class="invalid-feedback animated fadeIn"
                                                v-if="formErrors.name"
                                            >
                                                {{ formErrors.name[0] }}
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label"
                                                >Email</label
                                            >
                                            <input
                                                type="text"
                                                class="form-control"
                                                :class="{
                                                    'invalid-bg':
                                                        formErrors.email,
                                                }"
                                                v-model="form.email"
                                            />
                                            <div
                                                class="invalid-feedback animated fadeIn"
                                                v-if="formErrors.email"
                                            >
                                                {{ formErrors.email[0] }}
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label"
                                                >Phone</label
                                            >
                                            <input
                                                type="number"
                                                class="form-control"
                                                :class="{
                                                    'invalid-bg':
                                                        formErrors.phone,
                                                }"
                                                v-model="form.phone"
                                            />
                                            <div
                                                class="invalid-feedback animated fadeIn"
                                                v-if="formErrors.phone"
                                            >
                                                {{ formErrors.phone[0] }}
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="message">Message</label>
                                            <textarea
                                                class="form-control"
                                                id="message"
                                                :class="{
                                                    'invalid-bg':
                                                        formErrors.message,
                                                }"
                                                v-model="form.message"
                                                rows="3"
                                            ></textarea>
                                            <div
                                                class="invalid-feedback animated fadeIn"
                                                v-if="formErrors.message"
                                            >
                                                {{ formErrors.message[0] }}
                                            </div>
                                        </div>
                                        <div class="mt-3">
                                            <button
                                                type="submit"
                                                class="btn c-btn-theme-primary"
                                                v-if="formStatus"
                                                @click="save"
                                            >
                                                {{ translate("Send") }}
                                            </button>
                                            <button
                                                class="btn c-btn-theme-primary"
                                                type="button"
                                                disabled
                                                v-else
                                            >
                                                {{ translate("Sending") }}
                                                <span
                                                    class="spinner-border spinner-border-sm"
                                                    role="status"
                                                    aria-hidden="true"
                                                ></span>
                                            </button>

                                            <!-- data-bs-toggle="collapse"
                                    data-bs-target="#collapseContactInfo"
                                    aria-expanded="false"
                                    aria-controls="collapseContactInfo" -->
                                            <button
                                                class="btn btn-danger ms-3"
                                                type="button"
                                                data-bs-toggle="collapse"
                                                data-bs-target=".multi-collapse"
                                                aria-expanded="false"
                                                aria-controls="collapseContactForm collapseContactInfo"
                                                @click="showForm(null)"
                                            >
                                                Cancel
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <p></p>

                    <!-- form ends here -->
                </div>
                
            </div>
        </section>
    </Master>
</template>

<script>
import Master from "@components/layout/Master.vue";
export default {
    components: {
        Master,
    },
    created() {
        this.fetchWesiteInfo();
    },
    data() {
        return {
            logo: external_website.logo,
            name: external_website.name,
            website_address: "",
            website_phone: "",
            form: {
                name: "",

                phone: "",
                email: "",

                message: "",
                contacted_from: "",
            },
            formErrors: [],
            formStatus: 1,
            contactFormBtnStatus: 0,
            contacting_user: "",
        };
    },
    methods: {
        showForm(user) {
            this.contactFormBtnStatus = 1;
            this.contacting_user = user;
            this.form = Object.assign(
                {},
                {
                    name: "",
                    phone: "",
                    email: "",
                    message: "",
                    contacted_from: user,
                }
            );
            this.formErrors = [];
        },
        hideForm() {
            this.contactFormBtnStatus = 0;
        },

        fetchWesiteInfo() {
            axios
                .get("/api/fetch-website-info")
                .then((response) => {
                    this.email = response.data.email;
                    this.website_address = response.data.website_address;
                    this.website_phone = response.data.website_phone;
                })

                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        save() {
            this.formStatus = 0;
            axios
                .post("/api/contact-save", this.form)
                .then((data) => {
                    toastr.success(
                        this.translate("Message Sent successfully.")
                    );
                    this.form = {
                        name: "",

                        email: "",
                        phone: "",

                        message: "",
                    };
                    this.contactFormBtnStatus = 0;
                    this.formErrors = [];
                    this.formStatus = 1;
                })
                .catch((error) => {
                    this.formStatus = 1;
                    toastr.error(error.response.data.message);

                    if (error.response.data.errors) {
                        this.formErrors = error.response.data.errors;
                    }
                });
        },
    },
};
</script>
<style scoped>
 
html,
body {
    height: 100%;
}

.c-title {
    font-family: Poppins, sans-serif;
    font-size: 20px;
    color: rgb(61, 102, 143);
}

.contact-section {
    font-family: "Playfair Display", serif;
    font-size: 36px;
    font-weight: 700;
    line-height: 40px;
    color: rgb(61, 102, 143);
}

.contact-section {
    background-color: #f8fafc; /* Light background */
}

.contact-title {
    font-family: "Playfair Display", serif !important;
    font-size: 28px;
    font-weight: bold;
    color: rgb(61, 102, 143);
}

.contact-subtitle {
    font-family: Inter, sans-serif;
    font-size: 16px;
    font-weight: 400;
    line-height: 24px;
    color: rgb(61, 102, 143);
}
</style>
