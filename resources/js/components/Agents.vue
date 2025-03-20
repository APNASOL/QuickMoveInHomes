<template>
    <Master>
        <div class="property-detail-section">
            <div class="info-overlay">
                <div class="d-flex justify-content-between container">
                    <div>
                        <h1 class="uppercase c-main-title">
                            AVAILABLE AGENTS MOVE IN HOMES
                        </h1>
                    </div>
                </div>
            </div>

            <div class="c-section-main-details p-3">
                <div class="container">
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
                                                '/images/default_image.png'
                                            "
                                            height="150px"
                                            width="150px"
                                        />
                                        <h5 class="card-title">
                                            {{ agent.name }}
                                        </h5>
                                        <h6
                                            class="card-subtitle mb-2 text-muted"
                                        >
                                            {{ agent.agency_name }}
                                        </h6>
                                        <p class="card-text">
                                            <strong>Email:</strong>
                                            {{ agent.email }}<br />
                                            <strong>Contact:</strong>
                                            {{ agent.contact }}<br />
                                            <strong>Experience:</strong>
                                            {{ agent.experience }}<br />
                                            <strong>Languages:</strong>
                                            {{ agent.languages }}<br />
                                            <strong>Specialties:</strong>
                                            {{ agent.specialties }}<br />
                                        </p>
                                        <p class="card-text">
                                            {{ agent.biography }}
                                        </p>
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
                                                        translate(
                                                            "Request to connect"
                                                        )
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
                                        :class="{
                                            'invalid-bg': formErrors.name,
                                        }"
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
                                        :class="{
                                            'invalid-bg': formErrors.email,
                                        }"
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
                                        :class="{
                                            'invalid-bg': formErrors.phone,
                                        }"
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
                                    ><p>
                                        By applying for a home purchase through
                                        this website, you acknowledge and agree
                                        to the following terms:
                                    </p>

                                    <ul>
                                        <li>
                                            <strong>Eligibility:</strong>
                                            <ul>
                                                <li>
                                                    You must be at least 18
                                                    years old and legally
                                                    capable of entering into a
                                                    contract.
                                                </li>
                                                <li>
                                                    All information provided
                                                    must be accurate and
                                                    truthful.
                                                </li>
                                            </ul>
                                        </li>

                                        <li>
                                            <strong
                                                >Electronic Communication
                                                Consent:</strong
                                            >
                                            <ul>
                                                <li>
                                                    You agree to receive
                                                    electronic communications,
                                                    including agreements,
                                                    disclosures, and updates.
                                                </li>
                                                <li>
                                                    Communications may include
                                                    automated calls, SMS texts,
                                                    and emails.
                                                </li>
                                                <li>
                                                    Standard message and data
                                                    rates may apply.
                                                </li>
                                            </ul>
                                        </li>

                                        <li>
                                            <strong
                                                >Marketing & Contact
                                                Permission:</strong
                                            >
                                            <ul>
                                                <li>
                                                    You consent to receiving
                                                    promotional messages from
                                                    REAL Broker, LLC.
                                                </li>
                                                <li>
                                                    Reply
                                                    <strong>"STOP"</strong> to
                                                    unsubscribe or
                                                    <strong>"HELP"</strong> for
                                                    assistance.
                                                </li>
                                            </ul>
                                        </li>

                                        <li>
                                            <strong
                                                >Application Process:</strong
                                            >
                                            <ul>
                                                <li>
                                                    Submitting an application
                                                    does not guarantee approval.
                                                </li>
                                                <li>
                                                    All applications are subject
                                                    to financial verification
                                                    and approval.
                                                </li>
                                                <li>
                                                    You may be required to
                                                    provide additional
                                                    documentation.
                                                </li>
                                            </ul>
                                        </li>

                                        <li>
                                            <strong
                                                >Privacy Policy & Data
                                                Usage:</strong
                                            >
                                            <ul>
                                                <li>
                                                    Your personal information
                                                    will be used in accordance
                                                    with our .
                                                </li>
                                                <li>
                                                    We do not share or sell your
                                                    data without consent.
                                                </li>
                                            </ul>
                                        </li>

                                        <li>
                                            <strong
                                                >Limitation of
                                                Liability:</strong
                                            >
                                            <ul>
                                                <li>
                                                    REAL Broker, LLC is not
                                                    responsible for delays or
                                                    changes due to third-party
                                                    approvals.
                                                </li>
                                                <li>
                                                    Market conditions and
                                                    pricing are subject to
                                                    change.
                                                </li>
                                            </ul>
                                        </li>

                                        <li>
                                            <strong
                                                >Contact Information:</strong
                                            >
                                            <ul>
                                                <li>
                                                    📞
                                                    <strong>Phone:</strong>
                                                    (702) 819-0035
                                                </li>
                                                <li>
                                                    🌐
                                                    <strong>Website:</strong>
                                                    <a
                                                        href="https://brandnewhomesvegas.com/"
                                                        >brandnewhomesvegas.com</a
                                                    >
                                                </li>
                                            </ul>
                                        </li>
                                    </ul></small
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
.c-agent-image {
    border-radius: 50%;
    width: 150px;
    height: 150px;
    object-fit: cover;
}
.c-section-main-details {
    background-color: #f1f1f1;
}
.card {
    display: flex;
    flex-direction: column;
    height: 100%;
}
.card-body {
    flex-grow: 1;
}
</style>
