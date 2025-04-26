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
                <!-- Left side columns -->
                <div class="col-lg-12">
                    <div class="row g-3">
                        <div class="col-xxl-4 col-md-4">
                            <div class="card info-card sales-card">
                                <a
                                    class="nav-link collapsed"
                                    href="/properties"
                                >
                                    <div class="card-body">
                                        <h5 class="card-title">Properties</h5>

                                        <div class="d-flex align-items-center">
                                            <div
                                                class="card-icon rounded-circle d-flex align-items-center justify-content-center"
                                            >
                                               
                                            </div>
                                            <div class="ps-3">
                                                <h4> <i
                                                    class="bi bi-house-fill"
                                                ></i> {{ peroperties_count }}</h4>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col-xxl-4 col-md-4">
                            <a class="nav-link collapsed" href="/communities">
                                <div class="card info-card sales-card">
                                    <div class="card-body">
                                        <h5 class="card-title">Communities</h5>

                                        <div class="d-flex align-items-center">
                                            <div
                                                class="card-icon rounded-circle d-flex align-items-center justify-content-center"
                                            >
                                              
                                            </div>
                                            <div class="ps-3">
                                                
                                                <h4><i class="bi bi-people-fill"></i> {{ communities_count }}</h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-xxl-4 col-md-4">
                            <a class="nav-link collapsed" href="/agents">
                                <div class="card info-card sales-card">
                                    <div class="card-body">
                                        <h5 class="card-title">
                                            Agents
                                        </h5>

                                        <div class="d-flex align-items-center">
                                            <div
                                                class="card-icon rounded-circle d-flex align-items-center justify-content-center"
                                            >
                                             

                                            </div>
                                            <div class="ps-3">
                                                 
                                                


                                                <h4><i class="bi bi-chat-dots-fill"></i> {{ agents_count }}</h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        
                         
                    </div>
                </div>
                <!-- End Left side columns -->
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
                            <div class="card card-body" v-if="agent_history && agent_history.length">
                                <h3>Property Dealing History</h3>
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
                                                class="accordion-button collapsed"
                                                type="button"
                                                data-bs-toggle="collapse"
                                                :data-bs-target="
                                                    '#collapse' + entry.id
                                                "
                                                aria-expanded="true"
                                                :aria-controls="
                                                    'collapse' + entry.id
                                                "
                                            >
                                                {{ entry.property.title }} -
                                                Status:
                                                {{ entry.current_status }}

                                                <!-- Place Multiselect at the end of the button -->
                                                <span
                                                    style="
                                                        margin-left: auto;
                                                        width: 300px;
                                                    "
                                                >
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
                                                    />
                                                </span>
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
                                                <div class="card card-body">
                                                    <div>
                                                        <image-zooming-component
                                                            v-if="
                                                                entry && entry.user.image
                                                            "
                                                            :file="
                                                                entry.user.image
                                                            "
                                                            :custom_class="'img-fluid img-thumbnail rounded'"
                                                            :width="100"
                                                        />
                                                    </div>
                                                    <p>
                                                        <strong
                                                            >Customer:</strong
                                                        >
                                                        {{ entry.user.name }}
                                                    </p>
                                                    <p>
                                                        <strong
                                                            >Customer
                                                            Email:</strong
                                                        >
                                                        {{ entry.user.email }}
                                                    </p>
                                                    <p>
                                                        <strong>Date:</strong>
                                                        {{ entry.date }}
                                                    </p>
                                                    <p>
                                                        <strong
                                                            >Property
                                                            Address:</strong
                                                        >
                                                        {{
                                                            entry.property
                                                                .address
                                                        }},
                                                        {{
                                                            entry.property.city
                                                        }},
                                                        {{
                                                            entry.property.state
                                                        }}
                                                        {{
                                                            entry.property
                                                                .zip_code
                                                        }}
                                                    </p>

                                                    <p>
                                                        <strong
                                                            >Property
                                                            Description:</strong
                                                        >
                                                        {{
                                                            entry.property
                                                                .description
                                                        }}
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="accordion-footer p-3">
                                                <small
                                                    >Created At:
                                                    {{
                                                        new Date(
                                                            entry.created_at
                                                        ).toLocaleString()
                                                    }}</small
                                                >
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
                <!-- Left side columns -->
                <div class="col-lg-12">
                    <div class="row g-3">
                        <div class="col-ms-12">
                          
                            
                            <div class="card card-body" v-if="customer_history && customer_history.length">
                                <h3>Property Dealing History</h3>
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
                                                class="accordion-button collapsed"
                                                type="button"
                                                data-bs-toggle="collapse"
                                                :data-bs-target="
                                                    '#collapse' + entry.id
                                                "
                                                aria-expanded="true"
                                                :aria-controls="
                                                    'collapse' + entry.id
                                                "
                                            >
                                                {{ entry.property.title }} -
                                                Status:
                                                {{ entry.current_status }}
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
                                                <div class="card card-body">
                                                    <image-zooming-component v-if="entry?.user?.image"
                                                        
                                                        :file="entry.user.image"
                                                        :custom_class="'img-fluid img-thumbnail rounded'"
                                                        :width="100"
                                                    />

                                                    <p v-if="entry?.user?.name">
                                                        <strong>Agent:</strong>
                                                        {{ entry.user.name }}
                                                    </p>
                                                    <p v-if="entry?.user?.email">
                                                        <strong
                                                            >Agent
                                                            Email:</strong
                                                        >
                                                        {{ entry.user.email }}
                                                    </p>
                                                    <p v-if="entry?.date">
                                                        <strong>Date:</strong>
                                                        {{ entry.date }}
                                                    </p>
                                                     
                                                  

                                                    <p v-if="entry?.property?.description">
                                                        <strong
                                                            >Property
                                                            Description:</strong
                                                        >
                                                        {{
                                                            entry.property
                                                                .description
                                                        }}
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="accordion-footer p-3">
                                                <small
                                                    >Created At:
                                                    {{
                                                        new Date(
                                                            entry.created_at
                                                        ).toLocaleString()
                                                    }}</small
                                                >
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
    },
    data() {
        return {
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
 
