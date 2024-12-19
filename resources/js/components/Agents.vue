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
                                    :src="agent.image ?? '/images/default.jpg'"
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
                                            class="btn c-btn-theme-yellow"
                                            @click="openModal(agent.id)"
                                        >
                                            {{ translate("Contract") }}
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
                            {{ translate("Select Contract Type") }}
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
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <a
                                    class="nav-link active c-theme-color"
                                    id="single-tab"
                                    data-bs-toggle="tab"
                                    href="#single"
                                    role="tab"
                                    aria-controls="single"
                                    aria-selected="true"
                                    @click="agreementTypeSelect('single')"
                                >
                                    {{ translate("Single") }}
                                </a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a
                                    class="nav-link c-theme-color"
                                    id="multiple-tab"
                                    data-bs-toggle="tab"
                                    href="#multiple"
                                    role="tab"
                                    aria-controls="multiple"
                                    aria-selected="false"
                                    @click="agreementTypeSelect('multiple')"
                                >
                                    {{ translate("Multiple") }}
                                </a>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <div
                                class="tab-pane fade show active"
                                id="single"
                                role="tabpanel"
                                aria-labelledby="single-tab"
                            >
                                <h5 class="mt-3">
                                    {{ translate("Single Contract") }}
                                </h5>
                                <p>
                                    {{
                                        translate(
                                            "Download the single contract PDF here:"
                                        )
                                    }}
                                </p>
                                <a
                                    target="_blank"
                                    href="/agreement_pdf/quick_move_in_homes_agreement_single.pdf"
                                    class="btn btn-link c-theme-color"
                                    download
                                    >Download PDF</a
                                >
                                <p>Terms and Conditions for Single:</p>
                                <ul type="none">
                                    <li>1. The property is sold as-is.</li>
                                    <li>
                                        2. The buyer is responsible for
                                        inspections.
                                    </li>
                                    <li>3. All deposits are non-refundable.</li>
                                    <li>
                                        4. Closing costs are the buyer's
                                        responsibility.
                                    </li>
                                    <li>
                                        5. The offer is subject to seller
                                        approval.
                                    </li>
                                    <li>
                                        6. Buyer must provide proof of
                                        financing.
                                    </li>
                                    <li>
                                        7. Contract must be signed within 48
                                        hours.
                                    </li>
                                    <li>
                                        8. No changes to terms without seller
                                        consent.
                                    </li>
                                    <li>
                                        9. All agreements are legally binding.
                                    </li>
                                    <li>
                                        10. Please consult a lawyer for any
                                        legal advice.
                                    </li>
                                </ul>
                            </div>
                            <div
                                class="tab-pane fade"
                                id="multiple"
                                role="tabpanel"
                                aria-labelledby="multiple-tab"
                            >
                                <h5 class="mt-3">
                                    {{ translate("Multiple Contracts") }}
                                </h5>
                                <p>
                                    {{
                                        translate(
                                            "Download the multiple contract PDF here:"
                                        )
                                    }}
                                </p>
                                <a
                                    target="_blank"
                                    href="/agreement_pdf/quick_move_in_homes_agreement_multiple.pdf"
                                    class="btn btn-link c-theme-color"
                                    download
                                    >Download PDF</a
                                >
                                <p>Terms and Conditions for Multiple:</p>
                                <ul type="none">
                                    <li>
                                        1. Each property is sold individually.
                                    </li>
                                    <li>
                                        2. All terms are subject to negotiation.
                                    </li>
                                    <li>3. Deposits may vary per property.</li>
                                    <li>
                                        4. Closing dates will be defined for
                                        each property.
                                    </li>
                                    <li>
                                        5. The buyer must review all property
                                        disclosures.
                                    </li>
                                    <li>
                                        6. Compliance with local laws is
                                        required.
                                    </li>
                                    <li>
                                        7. Contracts are binding upon
                                        acceptance.
                                    </li>
                                    <li>
                                        8. Each property has unique
                                        requirements.
                                    </li>
                                    <li>
                                        9. Seller reserves the right to refuse
                                        any offer.
                                    </li>
                                    <li>
                                        10. Consult a financial advisor for
                                        investment advice.
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="form-check mt-3">
                            <input
                                type="checkbox"
                                class="form-check-input"
                                id="termsCheckbox"
                                v-model="termsAgreed"
                            />
                            <label
                                class="form-check-label c-theme-color"
                                for="termsCheckbox"
                            >
                                {{
                                    translate(
                                        "I agree to the terms and conditions"
                                    )
                                }}
                            </label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button
                            type="button"
                            class="btn c-btn-theme-yellow"
                            :disabled="!termsAgreed"
                            @click="submitContract"
                        >
                            {{ translate("Agreed") }}
                        </button>
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
            all_agents: [],
            formStatus: true,
            termsAgreed: false,
            agreementType: "single",
         
        };
    },

    methods: {
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
