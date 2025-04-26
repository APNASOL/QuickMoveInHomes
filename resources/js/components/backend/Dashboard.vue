<template>
    <Master>
        <div class="pagetitle">
            <h1 class="mb-0">Dashboard</h1>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">
                        Dashboard
                    </li>
                </ol>
            </nav>
        </div>

        <section
            class="section dashboard"
            v-if="logged_in_user.role == 'admin'"
        >
            <div class="row">
                <div class="col-lg-12">
                    <div class="row g-4">
                        <!-- Properties Card -->
                        <div class="col-xxl-4 col-md-6">
                            <a class="nav-link" href="/properties">
                                <div
                                    class="card shadow-sm border-0 text-white"
                                    style="
                                        background: linear-gradient(
                                            135deg,
                                            #3d668f,
                                            #5fa1dd
                                        );
                                        border-radius: 20px;
                                    "
                                >
                                    <div class="card-body">
                                        <h5
                                            class="card-title mb-3 text-white"
                                            style="color: white !important"
                                        >
                                            Properties
                                        </h5>
                                        <div class="d-flex align-items-center">
                                            <div
                                                class="bg-white text-primary rounded-circle d-flex align-items-center justify-content-center"
                                                style="
                                                    width: 50px;
                                                    height: 50px;
                                                "
                                            >
                                                <i
                                                    class="bi bi-house-fill fs-4"
                                                ></i>
                                            </div>
                                            <div class="ps-3">
                                                <h4 class="mb-0">
                                                    {{ peroperties_count }}
                                                </h4>
                                                <small>Total Listings</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <!-- Communities Card -->
                        <div class="col-xxl-4 col-md-6">
                            <a class="nav-link" href="/communities">
                                <div
                                    class="card shadow-sm border-0 text-white"
                                    style="
                                        background: linear-gradient(
                                            135deg,
                                            #28a745,
                                            #58d68d
                                        );
                                        border-radius: 20px;
                                    "
                                >
                                    <div class="card-body">
                                        <h5
                                            class="card-title mb-3"
                                            style="color: white !important"
                                        >
                                            Communities
                                        </h5>
                                        <div class="d-flex align-items-center">
                                            <div
                                                class="bg-white text-success rounded-circle d-flex align-items-center justify-content-center"
                                                style="
                                                    width: 50px;
                                                    height: 50px;
                                                "
                                            >
                                                <i
                                                    class="bi bi-people-fill fs-4"
                                                ></i>
                                            </div>
                                            <div class="ps-3">
                                                <h4 class="mb-0">
                                                    {{ communities_count }}
                                                </h4>
                                                <small>Total Communities</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <!-- Agents Card -->
                        <div class="col-xxl-4 col-md-6">
                            <a class="nav-link" href="/agents">
                                <div
                                    class="card shadow-sm border-0 text-white"
                                    style="
                                        background: linear-gradient(
                                            135deg,
                                            #f39c12,
                                            #f5b041
                                        );
                                        border-radius: 20px;
                                    "
                                >
                                    <div class="card-body">
                                        <h5
                                            class="card-title mb-3"
                                            style="color: white !important"
                                        >
                                            Agents
                                        </h5>
                                        <div class="d-flex align-items-center">
                                            <div
                                                class="bg-white text-warning rounded-circle d-flex align-items-center justify-content-center"
                                                style="
                                                    width: 50px;
                                                    height: 50px;
                                                "
                                            >
                                                <i
                                                    class="bi bi-chat-dots-fill fs-4"
                                                ></i>
                                            </div>
                                            <div class="ps-3">
                                                <h4 class="mb-0">
                                                    {{ agents_count }}
                                                </h4>
                                                <small>Total Agents</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-12 mt-4">
                            <div class="card shadow-lg border-0 rounded-4">
                                <div class="card-body pt-4 bg-light">
                                    <h5 class="card-title mb-4">
                                        Recent Connected Customers
                                    </h5>

                                    <div
                                        class="table-responsive mt-4 rounded-4 shadow-sm"
                                    >
                                        <table
                                            class="table table-hover align-middle bg-white"
                                        >
                                            <thead
                                                class="table-primary text-dark"
                                                style="
                                                    border-top-left-radius: 10px;
                                                    border-top-right-radius: 10px;
                                                "
                                            >
                                                <tr>
                                                    <th class="text-center">
                                                        #
                                                    </th>
                                                    <th>Customer</th>
                                                    <th>Agent</th>
                                                    <th>Property</th>
                                                    <th>Date</th>
                                                    <th>Agent Status</th>
                                                    <th>Date & Time</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr
                                                    v-for="(
                                                        agreement, index
                                                    ) in agreements"
                                                    :key="agreement.id"
                                                    style="
                                                        vertical-align: middle;
                                                    "
                                                >
                                                    <td class="text-center">
                                                        {{ index + 1 }}
                                                    </td>
                                                    <td class="c-title">
                                                        {{
                                                            agreement.customer_name
                                                        }}
                                                    </td>
                                                    <td>
                                                        {{
                                                            agreement.agent_name
                                                        }}
                                                    </td>
                                                    <td>
                                                        <a
                                                            :href="
                                                                '/property/details/' +
                                                                agreement.property_id
                                                            "
                                                            class="text-decoration-none fw-bold c-title"
                                                            style="
                                                                color: #3498db;
                                                            "
                                                            title="View Property"
                                                        >
                                                            {{
                                                                agreement.home_title
                                                            }}
                                                        </a>
                                                    </td>
                                                    <td>
                                                        {{ agreement.date }}
                                                    </td>
                                                    <td>
                                                        <span
                                                            class="badge"
                                                            :class="
                                                                statusBadgeClass(
                                                                    agreement.current_status
                                                                )
                                                            "
                                                            style="
                                                                font-size: 14px;
                                                                min-width: 100px;
                                                            "
                                                        >
                                                            {{
                                                                agreement.current_status
                                                            }}
                                                        </span>
                                                    </td>
                                                    <td>
                                                        {{
                                                            formatDate(
                                                                agreement.created_at
                                                            )
                                                        }}
                                                    </td>
                                                </tr>
                                                <tr
                                                    v-if="
                                                        agreements.length === 0
                                                    "
                                                >
                                                    <td
                                                        colspan="7"
                                                        class="text-center text-muted py-4"
                                                    >
                                                        No agreements found.
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                    <!-- Load More Button -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section
            class="section dashboard"
            v-if="logged_in_user.role == 'agent'"
        >
            <div class="row">
                <!-- Left side columns -->
                <div class="col-lg-12">
                    <div class="row g-3">
                        <div class="col-ms-12">
                            <div
                                class="card card-body"
                                v-if="agent_history && agent_history.length"
                            >
                                <h4>Property Engagement Record</h4>
                                <div class="accordion" id="historyAccordion">
                                    <div
                                        v-for="(entry, index) in agent_history"
                                        :key="entry.id"
                                        class="accordion-item"
                                    >
                                        <h2
                                            class="accordion-header"
                                            :id="'heading' + entry.id"
                                        >
                                            <button
                                                class="accordion-button collapsed d-flex align-items-center"
                                                type="button"
                                                data-bs-toggle="collapse"
                                                :data-bs-target="
                                                    '#collapse' + entry.id
                                                "
                                                aria-expanded="true"
                                                :aria-controls="
                                                    'collapse' + entry.id
                                                "
                                                style="
                                                    background: linear-gradient(
                                                        90deg,
                                                        #f0f4ff,
                                                        #e0eaff
                                                    );
                                                    color: #333;
                                                    font-weight: 600;
                                                    border: 1px solid #d0d7e4;
                                                    box-shadow: 0px 4px 8px
                                                        rgba(0, 0, 0, 0.05);
                                                "
                                            >
                                                <div class="d-flex flex-column">
                                                    <div
                                                        class="d-flex align-items-center mb-1"
                                                    >
                                                        <span
                                                            class="me-2"
                                                            style="
                                                                font-size: 18px;
                                                            "
                                                            >🏡</span
                                                        >
                                                        <span
                                                            class="text-primary"
                                                            style="
                                                                font-size: 18px;
                                                            "
                                                        >
                                                            {{
                                                                entry.property
                                                                    .title
                                                            }}
                                                        </span>
                                                    </div>
                                                    <small class="text-muted">
                                                        Connection Date:
                                                        {{ entry.date }}
                                                    </small>
                                                </div>

                                                <!-- Spacer -->
                                                <div
                                                    class="ms-auto d-flex align-items-center"
                                                    style="gap: 10px"
                                                >
                                                    <div
                                                        class="badge"
                                                        :class="
                                                            statusBadgeClass(
                                                                entry.current_status
                                                            )
                                                        "
                                                        style="font-size: 14px"
                                                    >
                                                        Status:
                                                        {{
                                                            entry.current_status
                                                        }}
                                                    </div>

                                                    <Multiselect
                                                        v-model="
                                                            entry.current_status
                                                        "
                                                        :options="statusOptions"
                                                        @select="
                                                            changeTheCurrentStatus(
                                                                entry.id,
                                                                entry.current_status
                                                            )
                                                        "
                                                        style="width: 250px"
                                                    />
                                                </div>
                                            </button>
                                        </h2>

                                        <div
                                            :id="'collapse' + entry.id"
                                            class="accordion-collapse collapse"
                                            :class="{ show: index === 0 }"
                                            :aria-labelledby="
                                                'heading' + entry.id
                                            "
                                            data-bs-parent="#historyAccordion"
                                        >
                                            <div class="accordion-body">
                                                <div
                                                    class="card shadow-sm p-4"
                                                    style="
                                                        background: #f9fbfd;
                                                        border: 1px solid
                                                            #e0e7ef;
                                                        border-radius: 10px;
                                                    "
                                                >
                                                    <div
                                                        class="d-flex align-items-center mb-4"
                                                    >
                                                        <div
                                                            v-if="
                                                                entry &&
                                                                entry.user.image
                                                            "
                                                            class="me-3"
                                                        >
                                                            <image-zooming-component
                                                                :file="
                                                                    entry.user
                                                                        .image
                                                                "
                                                                :custom_class="'img-fluid img-thumbnail rounded-circle shadow'"
                                                                :width="80"
                                                            />
                                                        </div>
                                                        <div>
                                                            <h5
                                                                class="mb-0 text-primary"
                                                            >
                                                                {{
                                                                    entry.user
                                                                        .name
                                                                }}
                                                            </h5>
                                                            <small
                                                                class="text-muted"
                                                                >Email :
                                                                {{
                                                                    entry.user
                                                                        .email
                                                                }}</small
                                                            >
                                                            <br />
                                                            <small
                                                                class="text-muted"
                                                                v-if="
                                                                    entry.user
                                                                        .phone
                                                                "
                                                                >Phone :
                                                                {{
                                                                    entry.user
                                                                        .phone
                                                                }}</small
                                                            >
                                                        </div>
                                                    </div>

                                                    <hr />

                                                    <!-- <div class="mb-3">
                            <strong class="text-secondary"
                              >Connection Date:</strong
                            >
                            <div>
                              {{ entry.date }}
                            </div>
                          </div> -->

                                                    <div class="mb-3">
                                                        <strong
                                                            class="text-secondary"
                                                            >Property
                                                            Address:</strong
                                                        >
                                                        <div>
                                                            {{
                                                                entry.property
                                                                    .address
                                                            }},
                                                            {{
                                                                entry.property
                                                                    .city
                                                            }},
                                                            {{
                                                                entry.property
                                                                    .state
                                                            }},
                                                            {{
                                                                entry.property
                                                                    .zip_code
                                                            }}
                                                        </div>
                                                    </div>

                                                    <div class="mb-3">
                                                        <strong
                                                            class="text-secondary"
                                                            >Property
                                                            Description:</strong
                                                        >
                                                        <div class="text-muted">
                                                            {{
                                                                entry.property
                                                                    .description
                                                            }}
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div v-else>
                                <div class="alert alert-info">
                                    No history found
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section
            class="section dashboard"
            v-if="logged_in_user.role == 'customer'"
        >
            <div class="row">
                <div class="col-lg-12">
                    <div class="row g-3">
                        <div class="col-ms-12">
                            <div
                                class="card card-body"
                                v-if="
                                    customer_history && customer_history.length
                                "
                            >
                                <h4>Property Dealing History</h4>
                                <div class="accordion" id="historyAccordion">
                                    <div
                                        v-for="(
                                            entry, index
                                        ) in customer_history"
                                        :key="entry.id"
                                        class="accordion-item"
                                    >
                                        <h2
                                            class="accordion-header"
                                            :id="'heading' + entry.id"
                                        >
                                            <button
                                                class="accordion-button collapsed d-flex align-items-center"
                                                type="button"
                                                data-bs-toggle="collapse"
                                                :data-bs-target="
                                                    '#collapse' + entry.id
                                                "
                                                aria-expanded="true"
                                                :aria-controls="
                                                    'collapse' + entry.id
                                                "
                                                style="
                                                    background: linear-gradient(
                                                        90deg,
                                                        #f0f4ff,
                                                        #e0eaff
                                                    );
                                                    color: #333;
                                                    font-weight: 600;
                                                    border: 1px solid #d0d7e4;
                                                    box-shadow: 0px 4px 8px
                                                        rgba(0, 0, 0, 0.05);
                                                "
                                            >
                                                <div class="d-flex flex-column">
                                                    <div
                                                        class="d-flex align-items-center mb-1"
                                                    >
                                                        <span
                                                            class="me-2"
                                                            style="
                                                                font-size: 18px;
                                                            "
                                                            >🏡</span
                                                        >
                                                        <span
                                                            class="text-primary"
                                                            style="
                                                                font-size: 18px;
                                                            "
                                                        >
                                                            {{
                                                                entry.property
                                                                    .title
                                                            }}
                                                        </span>
                                                    </div>
                                                    <small class="text-muted">
                                                        Dealing Date:
                                                        {{ entry.date }}
                                                    </small>
                                                </div>

                                                <!-- Spacer -->
                                                <div
                                                    class="ms-auto d-flex align-items-center"
                                                    style="gap: 10px"
                                                >
                                                    <div
                                                        class="badge"
                                                        :class="
                                                            statusBadgeClass(
                                                                entry.current_status
                                                            )
                                                        "
                                                        style="font-size: 14px"
                                                    >
                                                        Status:
                                                        {{
                                                            entry.current_status
                                                        }}
                                                    </div>
                                                </div>
                                            </button>
                                        </h2>

                                        <div
                                            :id="'collapse' + entry.id"
                                            class="accordion-collapse collapse"
                                            :class="{ show: index === 0 }"
                                            :aria-labelledby="
                                                'heading' + entry.id
                                            "
                                            data-bs-parent="#historyAccordion"
                                        >
                                            <div class="accordion-body">
                                                <div
                                                    class="card shadow-sm p-4"
                                                    style="
                                                        background: #f9fbfd;
                                                        border: 1px solid
                                                            #e0e7ef;
                                                        border-radius: 10px;
                                                    "
                                                >
                                                    <div
                                                        class="d-flex align-items-center mb-4"
                                                    >
                                                        <div
                                                            v-if="
                                                                entry?.user
                                                                    ?.image
                                                            "
                                                            class="me-3"
                                                        >
                                                            <image-zooming-component
                                                                :file="
                                                                    entry.user
                                                                        .image
                                                                "
                                                                :custom_class="'img-fluid img-thumbnail rounded-circle shadow'"
                                                                :width="80"
                                                            />
                                                        </div>
                                                        <div>
                                                            <h5
                                                                class="mb-0 text-primary"
                                                                v-if="
                                                                    entry?.user
                                                                        ?.name
                                                                "
                                                            >
                                                                {{
                                                                    entry.user
                                                                        .name
                                                                }}
                                                            </h5>
                                                            <small
                                                                class="text-muted"
                                                                v-if="
                                                                    entry?.user
                                                                        ?.email
                                                                "
                                                            >
                                                                {{
                                                                    entry.user
                                                                        .email
                                                                }}
                                                            </small>
                                                        </div>
                                                    </div>

                                                    <hr />

                                                    <div class="mb-3">
                                                        <strong
                                                            class="text-secondary"
                                                            >Dealing
                                                            Date:</strong
                                                        >
                                                        <div>
                                                            {{ entry.date }}
                                                        </div>
                                                    </div>

                                                    <div class="mb-3">
                                                        <strong
                                                            class="text-secondary"
                                                            >Property
                                                            Address:</strong
                                                        >
                                                        <div>
                                                            {{
                                                                entry.property
                                                                    .address
                                                            }},
                                                            {{
                                                                entry.property
                                                                    .city
                                                            }},
                                                            {{
                                                                entry.property
                                                                    .state
                                                            }},
                                                            {{
                                                                entry.property
                                                                    .zip_code
                                                            }}
                                                        </div>
                                                    </div>

                                                    <div class="mb-3">
                                                        <strong
                                                            class="text-secondary"
                                                            >Property
                                                            Description:</strong
                                                        >
                                                        <div class="text-muted">
                                                            {{
                                                                entry.property
                                                                    .description
                                                            }}
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="accordion-footer p-3">
                                                <small>
                                                    Created At:
                                                    {{
                                                        new Date(
                                                            entry.created_at
                                                        ).toLocaleString()
                                                    }}
                                                </small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div v-else>
                                <div class="alert alert-info">
                                    No history found
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
import Multiselect from "@vueform/multiselect";
export default {
    components: {
        Master,
        Multiselect,
    },
    created() {
        this.getDataCount();
        if (logged_in_user.role == "agent") {
            this.agentHistory();
        }
        if (logged_in_user.role == "customer") {
            this.customerHistory();
        }
        if (logged_in_user.role == "admin") {
            this.fetchVisitingList();
        }
    },
    data() {
        return {
            agreements: [],
            peroperties_count: "",
            communities_count: "",
            agents_count: "",

            logged_in_user: logged_in_user,
            agent_history: "",
            customer_history: [],
            statusOptions: ["Dealing", "Pending", "Completed", "Canceled"],
        };
    },
    methods: {
        fetchVisitingList() {
            axios
                .get("/api/fetch-customer-agreements")
                .then((response) => {
                    this.agreements = response.data;
                })
                .catch((error) => {
                    toastr.error(
                        error.response?.data?.message || "An error occurred"
                    );
                    if (error.response?.data?.errors) {
                        this.formErrors = error.response.data.errors;
                    }
                });
        },

        formatDate(dateTime) {
            const date = new Date(dateTime);
            let hours = date.getHours();
            const minutes = date.getMinutes();
            const ampm = hours >= 12 ? "PM" : "AM";
            hours = hours % 12 || 12;
            const formattedMinutes = minutes < 10 ? "0" + minutes : minutes;
            return `${date
                .toISOString()
                .slice(0, 10)} ${hours}:${formattedMinutes} ${ampm}`;
        },

        statusBadgeClass(status) {
            switch (status) {
                case "Pending":
                    return "bg-warning text-dark";
                case "Completed":
                    return "bg-success";
                case "Canceled":
                    return "bg-danger";
                default:
                    return "bg-secondary";
            }
        },
        changeTheCurrentStatus(id, status) {
            let formData = new FormData();
            formData.append("id", id);
            formData.append("status", status);

            axios
                .post("/api/deal-status-change", formData)
                .then((response) => {
                    toastr.success("Status changed successfully");
                    this.agentHistory();
                })
                .catch((error) => {
                    toastr.error(
                        error.response.data.message || "Status change failed"
                    );
                });
        },

        getDataCount() {
            axios
                .get("/api/dashboard-data-count")
                .then((response) => {
                    this.peroperties_count = response.data.peroperties_count;
                    this.communities_count = response.data.communities_count;
                    this.agents_count = response.data.agents_count;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        agentHistory() {
            axios
                .get("/api/dashboard-agent-history")
                .then((response) => {
                    this.agent_history = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        customerHistory() {
            axios
                .get("/api/dashboard-customer-history")
                .then((response) => {
                    this.customer_history = response.data;

                    console.log(this.customer_history);
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
    },
};
</script>
<style>
.c-title
{
    color: #163259 !important; 
}
</style>