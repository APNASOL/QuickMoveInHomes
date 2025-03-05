<template>
    <Master>
        <div
            class="top-section"
            :style="{ backgroundImage: `url('/images/incentive-main.jpg')` }"
        >
            <div class="info-overlay">
                <div class="d-flex justify-content-center container">
                    <div>
                        <h2 class="title uppercase">Agents</h2>
                        <span class="uppercase">
                            Inventory Closeout Specials On Quick Delivery Homes
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid interactive-banner mt-3 mb-3">
            <h1>AVAILABLE AGENTS MOVE IN HOMES</h1>
        </div>

        <div class="c-section-main-details container">
            <div>
                <div class="row">
                    <div
                        class="col-12 col-md-12 col-lg-6 mb-3"
                        v-for="agent in all_agents"
                        :key="agent.user_id"
                    >
                        <div class="card">
                            <div class="card-body">
                                <img
                                    class="c-agent-image"
                                    :src="
                                        agent.image ??
                                        '/images/default-home-image.png'
                                    "
                                    height="150px"
                                    width="150px"
                                />
                                <h5 class="card-title">{{ agent.name }}</h5>
                                <h6 class="card-subtitle mb-2 text-muted">
                                    {{ agent.agency_name }}
                                </h6>
                                <p class="card-text">
                                    <strong>Email:</strong> {{ agent.email
                                    }}<br />
                                    <strong>Contact:</strong> {{ agent.contact
                                    }}<br />
                                    <strong>Experience:</strong>
                                    {{ agent.experience }}<br />
                                    <strong>Languages:</strong>
                                    {{ agent.languages }}<br />
                                    <strong>Specialties:</strong>
                                    {{ agent.specialties }}<br />
                                </p>
                                <p class="card-text">{{ agent.biography }}</p>
                                <div
                                    class="d-flex justify-content-end p-2 mt-3"
                                >
                                    <div class="mt-3">
                                        <button
                                            type="button"
                                            class="btn c-btn-theme-primary"
                                            @click="openModal(agent.id)"
                                        >
                                            {{
                                                translate("Request to connect")
                                            }}
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal for Contract -->
        <button
            style="display: none"
            class="btn btn-success"
            data-bs-toggle="modal"
            data-bs-target="#contractModal"
            ref="openContractModal"
        >
            Open modal
        </button>
        <div
            class="modal fade"
            id="contractModal"
            tabindex="-1"
            aria-hidden="true"
        >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <b class="modal-title">
                            {{ translate("Customer Information") }}
                        </b>
                        <button
                            type="button"
                            class="btn-close"
                            data-bs-dismiss="modal"
                            aria-label="Close"
                            ref="closeContactModel"
                        ></button>
                    </div>
                    <div class="modal-body">
                        <form @submit.prevent="submitForm">
                            <div class="mb-3">
                                <label for="name" class="form-label">{{
                                    translate("Name")
                                }}</label>
                                <input
                                    type="text"
                                    class="form-control"
                                    id="name"
                                    v-model="form.name"
                                    :class="{ 'invalid-bg': formErrors.name }"
                                />
                                <div
                                    class="invalid-feedback animated fadeIn"
                                    v-if="formErrors.name"
                                >
                                    {{ formErrors.name[0] }}
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">{{
                                    translate("Email")
                                }}</label>
                                <input
                                    type="email"
                                    class="form-control"
                                    id="email"
                                    v-model="form.email"
                                    :class="{ 'invalid-bg': formErrors.email }"
                                />
                                <div
                                    class="invalid-feedback animated fadeIn"
                                    v-if="formErrors.email"
                                >
                                    {{ formErrors.email[0] }}
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="phone" class="form-label">{{
                                    translate("Phone Number")
                                }}</label>
                                <input
                                    type="tel"
                                    class="form-control"
                                    id="phone"
                                    v-model="form.phone"
                                    :class="{ 'invalid-bg': formErrors.phone }"
                                />
                                <div
                                    class="invalid-feedback animated fadeIn"
                                    v-if="formErrors.phone"
                                >
                                    {{ formErrors.phone[0] }}
                                </div>
                            </div>
                            <small
                                style="
                                    font-size: 10px;
                                    line-height: 1;
                                    text-align: justify;
                                "
                                >By checking this box, I agree by electronic
                                signature to (1) the Electronic Disclosure
                                Consent; (2) receive recurring marketing
                                communication from or on behalf of REAL Broker,
                                LLC, including auto-dialed calls, texts, and
                                prerecorded messages (consent not required to
                                make a purchase; data rates may apply; reply
                                "STOP" to opt-out of texts or "HELP" for help);
                                and (3) the Terms of Service and Privacy Policy
                                of this website. I understand that I can call
                                7022001272 to obtain direct assistance.By
                                checking this box, I agree by electronic
                                signature to (1) the Electronic Disclosure
                                Consent; (2) receive recurring marketing
                                communication from or on behalf of REAL Broker,
                                LLC, including auto-dialed calls, texts, and
                                prerecorded messages (consent not required to
                                make a purchase; data rates may apply; reply
                                "STOP" to opt-out of texts or "HELP" for help);
                                and (3) the Terms of Service and Privacy Policy
                                of this website. I understand that I can call
                                7022001272 to obtain direct assistance.</small
                            >
                            <div class="mt-3">
                                <button
                                    type="submit"
                                    class="btn btn-primary"
                                    @click="connectCustomer"
                                    :disabled="loading"
                                >
                                    <span
                                        v-if="loading"
                                        class="spinner-border spinner-border-sm"
                                        role="status"
                                        aria-hidden="true"
                                    ></span>
                                    <span v-if="!loading">{{
                                        translate("Connect")
                                    }}</span>
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </Master>
</template>

<script>
import Master from "@components/layout/Master.vue";
import axios from "axios";

export default {
    components: {
        Master,
    },
    props: ["property_id"],
    created() {
        this.getAgents();
    },

    data() {
        return {
            formErrors: [],
            all_agents: [],

            termsAgreed: false,
            agreementType: "single",
            form: {
                name: "",
                email: "",
                phone: "",
            },
            loading: false,
        };
    },

    methods: {
        submitForm() {
            this.loading = true; // Start loading

            let formData = new FormData();
            formData.append("name", this.form.name);
            formData.append("email", this.form.email);
            formData.append("phone", this.form.phone);
            formData.append("property_id", this.property_id);
            formData.append("agent_id", this.selectedAgentId);

            axios
                .post("/api/connect/customer/agents", formData)
                .then((response) => {
                    toastr.success(
                        this.translate(
                            "Your request has been successfully placed. An agent will contact you soon. If you're a new user, check your email for login details."
                        )
                    );
                    this.loading = false;

                    this.$refs.closeContactModel.click();
                    this.formErrors = [];
                    window.location.href = "/home-details/" + this.property_id;
                    this.termsAgreed = false; // Reset checkbox after submission
                })
                .catch((error) => {
                    this.loading = false;
                    toastr.error(error.response.data.message);
                    if (error.response.data.errors) {
                        this.formErrors = error.response.data.errors;
                    }
                });
        },
        async getAgents() {
            await axios
                .get("/api/fetch-all-agents")
                .then((response) => {
                    this.all_agents = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        openModal(agent_id) {
            this.selectedAgentId = agent_id;
            this.$refs.openContractModal.click(); // Trigger the modal open
        },
        async submitContract() {
            // Prepare your form data
            let formData = new FormData();
            formData.append("agent_id", this.selectedAgentId);
            formData.append("property_id", this.property_id);
            formData.append("terms_agreed", this.termsAgreed);
            formData.append("agreement_type", this.agreementType);

            await axios
                .post("/api/connect/customer/agents", formData)
                .then((response) => {
                    toastr.success(
                        this.translate(
                            "Request placed successfully agent will contact you soon."
                        )
                    );
                    this.$refs.closeContactModel.click();
                    window.location.href = "/home-details/" + this.property_id;
                    this.termsAgreed = false; // Reset checkbox after submission
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        agreementTypeSelect(type) {
            this.agreementType = type;
        },
    },
};
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

.beat {
    animation: beating 1s infinite;
}

@keyframes beating {
    0%,
    100% {
        transform: scale(1);
    }
    50% {
        transform: scale(1.1);
    }
}

.top-section {
    position: relative;
    height: 300px; /* Adjust height as needed */
    background-size: cover;
    background-position: center;
    color: white;
    display: flex;
    justify-content: center; /* Center the overlay content */
    align-items: flex-end;
    width: 100%;
    overflow: hidden; /* Ensures no overflow from children */
}

.uppercase {
    text-transform: uppercase;
}

.info-overlay {
    background: rgba(1, 6, 13, 0.8); /* Using RGBA for transparency */
    padding: 20px; /* Increased padding for a better look */
    width: 100%;
    border-radius: 0px !important;
    display: flex; /* Flexbox for alignment */
    flex-direction: column; /* Stack items vertically */
    align-items: center; /* Center align items */
    text-align: center; /* Center align text */
}

.title {
    font-size: 24px;
    margin: 0;
}
.c-agent-image {
    border-radius: 50%;
    width: 150px;
    height: 150px;
    object-fit: cover;
}
</style>
