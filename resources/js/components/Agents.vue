<template>
    <Master>
        <div class="property-detail-section">
            <div class="info-overlay">
                <div class="container text-center">
                    <h1 class="uppercase c-main-title">
                        Available Agents & Move-In Ready Homes
                    </h1>
                </div>
            </div>

            <section class="c-section-main-details py-4">
                <div class="container">
                    <div class="row g-4">
                        <div
                            class="col-12 col-sm-6 col-lg-4 d-flex"
                            v-for="agent in all_agents"
                            :key="agent.user_id"
                        >
                            <div
                                class="card border-0 shadow-lg rounded-4 p-4 w-100 d-flex flex-column"
                            >
                                <div class="text-center mb-3">
                                    <img
                                        class="rounded-circle border border-3"
                                        style="
                                            width: 120px;
                                            height: 120px;
                                            object-fit: cover;
                                        "
                                        :src="
                                            agent.image ??
                                            '/images/default_image.png'
                                        "
                                        alt="Agent Image"
                                    />
                                </div>
                                <div class="flex-grow-1">
                                    <h5
                                        class="fw-bold text-dark text-center c-title"
                                    >
                                        {{ agent.name }}
                                    </h5>
                                    <p class="text-muted text-center mb-2">
                                        {{ agent.agency_name }}
                                    </p>

                                    <div class="small text-muted">
                                        <p class="mb-1">
                                            <strong>Email:</strong>
                                            {{ agent.email }}
                                        </p>
                                        <p class="mb-1">
                                            <strong>Contact:</strong>
                                            {{ agent.contact }}
                                        </p>
                                        <p class="mb-1">
                                            <strong>Experience:</strong>
                                            {{ agent.experience }} years
                                        </p>
                                        <p class="mb-1">
                                            <strong>Languages:</strong>
                                            {{ agent.languages }}
                                        </p>
                                        <p class="mb-1">
                                            <strong>Specialties:</strong>
                                            {{ agent.specialties }}
                                        </p>
                                    </div>

                                    <p class="text-dark small mt-2">
                                        {{ agent.biography }}
                                    </p>
                                </div>

                                <button
                                    class="btn btn-primary rounded-pill text-white fw-semibold w-100 mt-auto"
                                    style="
                                        background-color: #023f86;
                                        border: 1px solid #023f86;
                                    "
                                    @click="openModal(agent.id, agent.name)"
                                >
                                    {{ translate("Request to Connect") }}
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Contact Modal -->
            <button
                style="display: none"
                class="btn btn-success"
                data-bs-toggle="modal"
                data-bs-target="#contractModal"
                ref="openContractModal"
            ></button>
            <div
                class="modal fade"
                id="contractModal"
                tabindex="-1"
                aria-hidden="true"
            >
                <div class="modal-dialog modal-dialog-centered modal-lg">
                    <!-- Centered + larger -->
                    <div class="modal-content rounded-4 shadow-lg border-0">
                        <div
                            class="modal-header border-0 bg-light rounded-top-4 px-4 py-3"
                        >
                            <h5
                                class="modal-title fw-bold text-primary mb-0 c-title"
                            >
                                {{ translate("Request to Mr") }}.  {{ selelectedAgentName }}

                            </h5>

                            <button
                                type="button"
                                class="btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close"
                                ref="closeContactModel"
                            ></button>
                        </div>

                        <div class="modal-body px-4 py-3">
                            <form @submit.prevent="submitForm" class="row g-3">
                                <!-- Name -->
                                <div class="col-md-12">
                                    <label
                                        for="name"
                                        class="form-label fw-semibold"
                                        >Name</label
                                    >
                                    <input
                                        type="text"
                                        class="form-control rounded-pill shadow-sm"
                                        id="name"
                                        v-model="form.name"
                                        :class="{
                                            'is-invalid': formErrors.name,
                                        }"
                                    />
                                    <div
                                        class="invalid-feedback"
                                        v-if="formErrors.name"
                                    >
                                        {{ formErrors.name[0] }}
                                    </div>
                                </div>

                                <!-- Email -->
                                <div class="col-md-12">
                                    <label
                                        for="email"
                                        class="form-label fw-semibold"
                                        >Email</label
                                    >
                                    <input
                                        type="email"
                                        class="form-control rounded-pill shadow-sm"
                                        id="email"
                                        v-model="form.email"
                                        :class="{
                                            'is-invalid': formErrors.email,
                                        }"
                                    />
                                    <div
                                        class="invalid-feedback"
                                        v-if="formErrors.email"
                                    >
                                        {{ formErrors.email[0] }}
                                    </div>
                                </div>

                                <!-- Phone -->
                                <div class="col-md-12">
                                    <label
                                        for="phone"
                                        class="form-label fw-semibold"
                                        >Phone Number</label
                                    >
                                    <input
                                        type="tel"
                                        class="form-control rounded-pill shadow-sm"
                                        id="phone"
                                        v-model="form.phone"
                                        :class="{
                                            'is-invalid': formErrors.phone,
                                        }"
                                    />
                                    <div
                                        class="invalid-feedback"
                                        v-if="formErrors.phone"
                                    >
                                        {{ formErrors.phone[0] }}
                                    </div>
                                </div>

                                <!-- Submit Button -->
                                <div class="col-12">
                                    <button
                                        :disabled="loading"
                                        class="btn btn-primary w-100 rounded-pill fw-semibold py-2"
                                        type="submit"
                                    >
                                        <span v-if="loading">
                                            {{ translate("Connecting") }}
                                            <span
                                                class="spinner-border spinner-border-sm ms-2"
                                                role="status"
                                                aria-hidden="true"
                                            ></span>
                                        </span>
                                        <span v-else>
                                            {{ translate("Connect") }}
                                        </span>
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
    components: { Master },
    data() {
        return {
            selelectedAgentName: "",
            all_agents: [],
            formErrors: [],
            form: { name: "", email: "", phone: "", property_id: "" },
            selectedAgentId: null,
            loading: false,
            logged_in_user: logged_in_user,
        };
    },
    created() {
        this.getAgents();
    },
    mounted() {
        if (this.logged_in_user) {
            this.form.name = this.logged_in_user.name || "";
            this.form.email = this.logged_in_user.email || "";
            this.form.phone = this.logged_in_user.phone || "";
        }
    },

    props: ["property_id"],
    methods: {
        async getAgents() {
            try {
                const response = await axios.get("/api/fetch-all-agents");
                this.all_agents = response.data;
            } catch (error) {
                toastr.error(error.response.data.message);
            }
        },
        openModal(agent_id, agent_name) {
            this.selelectedAgentName = agent_name;
            this.selectedAgentId = agent_id;
            this.formErrors = {}; // Clear validation errors

            // Pre-fill form with logged-in user info
            this.form = {
                name: this.logged_in_user?.name || "",
                email: this.logged_in_user?.email || "",
                phone: this.logged_in_user?.phone || "",
                property_id: this.property_id || "",
            };

            this.$refs.openContractModal.click();
        },

        async submitForm() {
            this.loading = true;
            let formData = new FormData();
            formData.append("name", this.form.name);
            formData.append("email", this.form.email);
            formData.append("phone", this.form.phone);
            formData.append("agent_id", this.selectedAgentId);
            formData.append("property_id", this.property_id);

            try {
                await axios.post("/api/connect/customer/agents", formData);
                toastr.success(
                    "Request Sent! An agent will contact you shortly."
                );
                this.$refs.closeContactModel.click();
                this.form = { name: "", email: "", phone: "" };
            } catch (error) {
                this.formErrors = error.response.data.errors || [];
                toastr.error(error.response.data.message);
            } finally {
                this.loading = false;
            }
        },
    },
};
</script>

<style scoped>
.info-overlay {
    background: #f7fafc;
    padding: 10px;
    width: 100%;
    border-radius: 0px !important;
    font-family: "Playfair Display", serif;
    font-size: 30px;
    font-weight: 700;
    line-height: 36px;
    color: rgb(23, 38, 54);
}
.agent-card {
    background: white;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease;
    display: flex;
    flex-direction: column;
    width: 100%;
}

.agent-card:hover {
    transform: translateY(-5px);
}

.agent-image-container {
    text-align: center;
    padding: 15px;
    background: #f8f9fa !important;
}

.agent-image {
    width: 120px;
    height: 120px;
    border-radius: 50%;
    object-fit: cover;
    border: 3px solid rgb(45, 106, 159);
}

.agent-info {
    padding: 20px;
    display: flex;
    flex-direction: column;
    flex-grow: 1;
}

.agent-name {
    font-size: 18px;
    font-weight: bold;
    color: #333;
}

.agent-agency {
    font-size: 14px;
    color: #777;
}

.agent-details {
    font-size: 14px;
    line-height: 1.5;
}

.agent-bio {
    font-size: 14px;
    color: #555;
    margin-top: 10px;
}

.btn {
    width: 100%;
    font-weight: bold;
}
.c-section-main-details {
    background-color: #f1f1f1 !important;
}

.btn:hover {
    background-color: #035bb8 !important;
    border-color: #035bb8 !important;
}
</style>
