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
            <div class="card c-card-border">
                <div class="card-body pt-4">
                    <div class="table-responsive">
                        <div class="accordion" id="accordionAgents">
                            <div
                                class="accordion-item"
                                v-for="(agent, index) in agents"
                                :key="agent.id"
                            >
                                <h2 class="accordion-header">
                                    <button
                                        class="accordion-button"
                                        type="button"
                                        :data-bs-toggle="'collapse'"
                                        :data-bs-target="
                                            '#collapseAgent' + agent.id
                                        "
                                        aria-expanded="index === 0 ? 'true' : 'false'"
                                        :aria-controls="
                                            'collapseAgent' + agent.id
                                        "
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
                                    <div class="accordion-body">
                                        <div class="accordion-body">
                                            <div
                                                class="d-flex justify-content-end p-2"
                                            >
                                                <a
                                                    type="button"
                                                    class="btn btn-sm fs-6"
                                                    title="Edit"
                                                    :href="
                                                        '/agent/edit/' +
                                                        agent.id
                                                    "
                                                >
                                                    <i
                                                        class="bi bi-pencil c-theme-text-color"
                                                    ></i>
                                                </a>
                                                <DeleteModal
                                                    :deleteId="agent.id"
                                                    @deleteThis="deleteThis"
                                                />
                                            </div>
                                            <div class="row g-3">
                                                <div class="col-6">
                                                    <strong>Email:</strong>
                                                    {{ agent.email || "N/A" }}
                                                </div>
                                                <div class="col-6">
                                                    <strong
                                                        >Agency Name:</strong
                                                    >
                                                    {{ agent.agency_name }}
                                                </div>
                                                <div class="col-6">
                                                    <strong
                                                        >License Number:</strong
                                                    >
                                                    {{ agent.license_number }}
                                                </div>
                                                <div class="col-6">
                                                    <strong>Experience:</strong>
                                                    {{ agent.experience }}
                                                </div>
                                                <div class="col-6">
                                                    <strong
                                                        >Specialties:</strong
                                                    >
                                                    {{ agent.specialties }}
                                                </div>

                                                <div class="col-6">
                                                    <strong>Languages:</strong>
                                                    {{ agent.languages }}
                                                </div>
                                                <div class="col-6">
                                                    <strong>Contact:</strong>
                                                    {{ agent.contact }}
                                                </div>
                                                <div class="col-12">
                                                    <strong>Biography:</strong>
                                                    {{ agent.biography }}
                                                </div>
                                            </div>
                                        </div>

                                        <div class="container mt-4">
                                            <h3>Agreements</h3>
                                            <table class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">
                                                            Customer
                                                        </th>
                                                        <th scope="col">
                                                            Email
                                                        </th>
                                                        <th scope="col">
                                                            Date
                                                        </th>
                                                        <th scope="col">
                                                            Status
                                                        </th>
                                                        <th scope="col">
                                                            Terms Agreed
                                                        </th>
                                                        <th scope="col">
                                                            Agreement Type
                                                        </th>
                                                        <th scope="col">
                                                            Home Title
                                                        </th>
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
                                                            {{
                                                                agreement.current_status
                                                            }}
                                                        </td>
                                                        <td>
                                                            {{
                                                                agreement.terms_agreed
                                                            }}
                                                        </td>
                                                        <td>
                                                            {{
                                                                agreement.agreement_type
                                                            }}
                                                        </td>
                                                        <td>
                                                            <a
                                                                type="button"
                                                                class="c-linked c-mouse-over c-theme-text-color"
                                                                title="Edit"
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
