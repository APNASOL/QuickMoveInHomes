<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h3 class="mb-0 c-theme-text-color">
                    <span>Connected Customers</span>
                </h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item c-theme-text-color">
                            <a class="c-theme-text-color" href="#">Home</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span>Dealing</span>
                        </li>
                    </ol>
                </nav>
            </div>
            <div></div>
        </div>

        <section class="section">
            <div class="card shadow-sm border-0">
                <div class="card-body pt-4">
                    <div class="table-responsive">
                        <table
                            class="table table-hover align-middle text-center"
                        >
                            <thead class="table-light">
                                <tr>
                                    <th>#</th>
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
                                    v-for="(agreement, index) in agreements"
                                    :key="agreement.id"
                                >
                                    <td>{{ index + 1 }}</td>
                                    <td class="fw-semibold">
                                        {{ agreement.customer_name }}
                                    </td>
                                    <td>{{ agreement.agent_name }}</td>
                                    <td>
                                        <a
                                            :href="
                                                '/property/details/' +
                                                agreement.property_id
                                            "
                                            class="text-decoration-none c-theme-text-color fw-semibold"
                                            title="View Property"
                                        >
                                            {{ agreement.home_title }}
                                        </a>
                                    </td>
                                    <td>{{ agreement.date }}</td>
                                    <td>
                                        <div
                                            class="badge"
                                            :class="
                                                statusBadgeClass(
                                                    agreement.current_status
                                                )
                                            "
                                            style="font-size: 14px; width: 100px;"
                                        >
                                             
                                            {{ agreement.current_status }}
                                        </div>

                                        <!-- <span :class="statusBadgeClass(agreement.current_status)">
                                            {{ agreement.current_status }}
                                        </span> -->
                                    </td>
                                    <td>
                                        {{ formatDate(agreement.created_at) }}
                                    </td>
                                </tr>
                                <tr v-if="agreements.length === 0">
                                    <td colspan="7" class="text-muted">
                                        No connections found
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>
    </Master>
</template>
<script>
import Master from "@components/backend/layout/Master.vue";

export default {
    components: {
        Master,
    },
    created() {
        this.fetchVisitingList();
    },
    data() {
        return {
            agreements: [],
            formErrors: [],
            formStatus: 1,
        };
    },
    methods: {
        fetchVisitingList() {
            this.formStatus = 0;
            axios
                .get("/api/fetch-customer-agreements")
                .then((response) => {
                    this.agreements = response.data;
                    this.formStatus = 1;
                })
                .catch((error) => {
                    this.formStatus = 1;
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
    },
};
</script>
<style scoped>
.breadcrumb {
    background: none;
    padding: 0;
    margin-bottom: 0;
}

.card {
    border-radius: 0.75rem;
}

.table th,
.table td {
    vertical-align: middle;
}

.badge {
    font-size: 0.75rem;
    padding: 0.5em 0.75em;
}

.text-primary {
    color: #0d6efd !important;
}

.text-secondary {
    color: #6c757d !important;
}
</style>
