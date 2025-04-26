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
                    <div class="row g-2">
                        <div
                            class="col-12 col-md-6 col-lg-4 d-flex align-items-stretch"
                            v-for="agent in all_agents"
                            :key="agent.user_id"
                        >
                            <div class="agent-card card">
                                <div class="agent-image-container">
                                    <img
                                        class="agent-image"
                                        :src="
                                            agent.image ??
                                            '/images/default_image.png'
                                        "
                                        alt="Agent Image"
                                    />
                                </div>
                                <div
                                    class="agent-info card-body d-flex flex-column"
                                >
                                    <h5 class="agent-name">{{ agent.name }}</h5>
                                    <h6 class="agent-agency">
                                        {{ agent.agency_name }}
                                    </h6>
                                    <p class="agent-details">
                                        <strong>Email:</strong> {{ agent.email
                                        }}<br />
                                        <strong>Contact:</strong>
                                        {{ agent.contact }}<br />
                                        <strong>Experience:</strong>
                                        {{ agent.experience }} years<br />
                                        <strong>Languages:</strong>
                                        {{ agent.languages }}<br />
                                        <strong>Specialties:</strong>
                                        {{ agent.specialties }}
                                    </p>
                                    <p class="agent-bio">
                                        {{ agent.biography }}
                                    </p>

                                    <button
                                        class="btn c-btn-theme-primary mt-3 w-100"
                                        @click="openModal(agent.id)"
                                    >
                                        {{ translate("Request to Connect") }}
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal for Contact Form -->
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

                                <button
                                        v-if="!loading"
                                        class="btn c-btn-theme-primary w-100"
                                        type="submit" 
                                    >
                                        {{ translate("Connect") }}
                                    </button>

                                    <button
                                        class="btn c-btn-theme-primary w-100"
                                        type="submit"
                                        v-else
                                    >
                                        {{ translate("Connecting") }}
                                        <span
                                            class="spinner-border spinner-border-sm"
                                            role="status"
                                            aria-hidden="true"
                                        ></span>
                                    </button>

                                <!-- <button
                                    type="submit"
                                    class="btn c-btn-theme-primary w-100"
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
                                </button> -->
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
            all_agents: [],
            formErrors: [],
            form: { name: "", email: "", phone: "",property_id: "" },
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
        console.log(this.logged_in_user.name);
        console.log(this.logged_in_user.email);
        console.log(this.logged_in_user.phone);
        
        this.form.name = this.logged_in_user.name || "";
        this.form.email = this.logged_in_user.email || ""; 
    
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
        openModal(agent_id) {
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
                    "Request placed successfully, an agent will contact you soon."
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
</style>
