<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h3 class="mb-0 c-theme-text-color">
                    <span>Agents</span>
                </h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item c-theme-text-color">
                            <a class="c-theme-text-color" href="#">Home</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span>Agents</span>
                        </li>
                    </ol>
                </nav>
            </div>
            <div>
                <a
                    class="btn btn-success"
                    title="Details"
                    :href="'/agent/create'"
                >
                    <i class="bi bi-plus-lg"></i>
                    {{ translate("Add new agent") }}
                </a>
            </div>
        </div>

        <section class="section">
            <div class="card shadow-lg border-0 rounded-4">
                <div class="card-body pt-4 bg-light">
                    <div class="accordion" id="accordionAgents">
                        <div
                            class="accordion-item mb-3 rounded-4 overflow-hidden shadow-sm"
                            v-for="(agent, index) in agents"
                            :key="agent.id"
                        >
                            <h2 class="accordion-header">
                                <button
                                    class="accordion-button bg-gradient bg-primary text-white fw-semibold"
                                    type="button"
                                    :data-bs-toggle="'collapse'"
                                    :data-bs-target="
                                        '#collapseAgent' + agent.id
                                    "
                                    aria-expanded="index === 0 ? 'true' : 'false'"
                                    :aria-controls="'collapseAgent' + agent.id"
                                >
                                    {{ index + 1 }}. {{ agent.name }}
                                </button>
                            </h2>
                            <div
                                :id="'collapseAgent' + agent.id"
                                class="accordion-collapse collapse"
                                :class="index === 0 ? 'show' : ''"
                                data-bs-parent="#accordionAgents"
                            >
                                <div class="accordion-body bg-white">
                                    <!-- Actions -->
                                    <div class="d-flex justify-content-end p-2">
                                        <a
                                            class="btn btn-sm btn-outline-primary me-2"
                                            title="Edit"
                                            :href="'/agent/edit/' + agent.id"
                                        >
                                            <i class="bi bi-pencil"></i>
                                        </a>
                                        <DeleteModal
                                            :deleteId="agent.id"
                                            @deleteThis="deleteThis"
                                        />
                                    </div>

                                    <!-- Agent Info -->
                                    <div class="row g-3">
                                        <div class="col-md-6">
                                            <strong>Email:</strong>
                                            {{ agent.email || "N/A" }}
                                        </div>
                                        <div class="col-md-6">
                                            <strong>Agency Name:</strong>
                                            {{ agent.agency_name }}
                                        </div>
                                        <div class="col-md-6">
                                            <strong>License Number:</strong>
                                            {{ agent.license_number }}
                                        </div>
                                        <div class="col-md-6">
                                            <strong>Experience:</strong>
                                            {{ agent.experience }}
                                        </div>
                                        <div class="col-md-6">
                                            <strong>Specialties:</strong>
                                            {{ agent.specialties }}
                                        </div>
                                        <div class="col-md-6">
                                            <strong>Languages:</strong>
                                            {{ agent.languages }}
                                        </div>
                                        <div class="col-md-6">
                                            <strong>Contact:</strong>
                                            {{ agent.contact }}
                                        </div>
                                        <div class="col-md-12">
                                            <strong>Biography:</strong>
                                            {{ agent.biography }}
                                        </div>
                                    </div>

                                    <!-- Agreements Table -->
                                    <div class="mt-4">
                                        <h5 class="fw-bold mb-3 text-primary">
                                            Connected Customers
                                        </h5>
                                        <div
                                            class="table-responsive rounded-3 shadow-sm"
                                        >
                                            <table
                                                class="table table-hover align-middle bg-white"
                                            >
                                                <thead
                                                    class="table-primary text-dark"
                                                >
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Customer</th>
                                                        <th>Email</th>
                                                        <th>Date</th>
                                                        <th>Status</th>
                                                        <!-- <th>Terms Agreed</th>
                        <th>Agreement Type</th> -->
                                                        <th>Home Title</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr
                                                        v-for="(
                                                            agreement, index
                                                        ) in agent.customer_agreements"
                                                        :key="agreement.id"
                                                    >
                                                        <td>{{ index + 1 }}</td>
                                                        <td>
                                                            {{
                                                                agreement.customer_name
                                                            }}
                                                        </td>
                                                        <td>
                                                            {{
                                                                agreement.customer_email
                                                            }}
                                                        </td>
                                                        <td>
                                                            {{ agreement.date }}
                                                        </td>
                                                        <td>
                                                            <span
                                                                class="badge bg-success"
                                                                style="
                                                                    width: 150px;
                                                                "
                                                            >
                                                                {{
                                                                    agreement.current_status
                                                                }}
                                                            </span>
                                                        </td>
                                                        <!-- <td>{{ agreement.terms_agreed }}</td>
                        <td>{{ agreement.agreement_type }}</td> -->
                                                        <td>
                                                            <a
                                                                class="text-decoration-none text-primary fw-semibold"
                                                                target="_blank"
                                                                :href="
                                                                    '/property/details/' +
                                                                    agreement.home_id
                                                                "
                                                            >
                                                                {{
                                                                    agreement.home_title
                                                                }}
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr
                                                        v-if="
                                                            agent
                                                                .customer_agreements
                                                                .length === 0
                                                        "
                                                    >
                                                        <td
                                                            colspan="8"
                                                            class="text-muted py-3"
                                                        >
                                                        No connections found
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </Master>
</template>

<script>
import Master from "@components/backend/layout/Master.vue";
import DeleteModal from "@components/global/DeleteModal.vue";

export default {
    components: {
        Master,
        DeleteModal,
    },
    created() {
        this.search(this.default_url);
    },
    data() {
        return {
            agents: [],

            formErrors: [],
            formStatus: 1,
        };
    },
    methods: {
        search() {
            this.formStatus = 0;

            axios
                .get("/api/fetch-agents")
                .then((response) => {
                    this.agents = response.data;
                })
                .catch((error) => {
                    this.formStatus = 1;
                    toastr.error(error.response.data.message);
                    if (error.response.data.errors) {
                        this.formErrors = error.response.data.errors;
                    }
                });
        },
        deleteThis(id) {
            axios
                .post("/api/agent/delete/" + id)
                .then((response) => {
                    toastr.success(
                        this.translate("Agent deleted successfully.")
                    );
                    this.search(null);
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
    },
};
</script>

<style>
.c-linked {
    text-decoration: none;
}
.c-mouse-over {
    cursor: pointer;
    font-weight: bold;
}
</style>
