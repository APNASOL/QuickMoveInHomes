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
                            <span>Agreemetns</span>
                        </li>
                    </ol>
                </nav>
            </div>
            <div></div>
        </div>

        <section class="section">
            <div class="card c-card-border">
                <div class="card-body pt-4">
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col" class="text-center">#</th>
                                    <th>Customer</th>
                                    <th>Agent</th>
                                    <th>Property</th>
                                    <th>Date</th>
                                    <th>Agent Connection Status</th>
                                    <!-- <th>Terms Agreed</th>
                                    <th>Agreement Type</th> -->
                                    <th>Date & Time</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr
                                    v-for="(agreement, index) in agreements"
                                    :key="agreement.id"
                                >
                                    <th class="text-center">
                                        {{ index + 1 }}
                                    </th>
                                    <td>{{ agreement.customer_name }}</td>
                                    <td>{{ agreement.agent_name }}</td>
                                    <td>
                                        <a
                                            type="button"
                                            class="c-linked c-mouse-over c-theme-text-color"
                                            title="details"
                                            :href="
                                                '/property/details/' +
                                                agreement.property_id
                                            "
                                            >{{ agreement.home_title }}</a
                                        >
                                    </td>
                                    <td>{{ agreement.date }}</td>
                                    <td>{{ agreement.current_status }}</td>
                                    <!-- <td>{{ agreement.terms_agreed }}</td>
                                    <td>{{ agreement.agreement_type }}</td> -->
                                    <td>
                                        {{ formatDate(agreement.created_at) }}
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
import ImageCropper from "@components/global/ImageCropper.vue";

export default {
    components: {
        Master,
    },
    created() {
        this.fetchVistingList();
    },
    data() {
        return {
            agreements: [],
            form: {
                name: "",
            },
            formErrors: [],

            formStatus: 1,
        };
    },
    methods: {
        fetchVistingList() {
            this.formStatus = 0;
            axios
                .get("/api/fetch-customer-agreements")
                .then((response) => {
                    this.agreements = response.data;

                    this.formStatus = 1;
                })
                .catch((error) => {
                    this.formStatus = 1;
                    toastr.error(error.response.data.message);
                    if (error.response.data.errors) {
                        this.formErrors = error.response.data.errors;
                    }
                });
        },

        formatDate(dateTime) {
            const date = new Date(dateTime);

            // Get the hours and minutes
            let hours = date.getHours();
            const minutes = date.getMinutes();
            const ampm = hours >= 12 ? "PM" : "AM";

            // Convert to 12-hour format
            hours = hours % 12;
            hours = hours ? hours : 12; // the hour '0' should be '12'

            // Format minutes
            const formattedMinutes = minutes < 10 ? "0" + minutes : minutes;

            // Format date as "YYYY-MM-DD HH:mm AM/PM"
            return `${date
                .toISOString()
                .slice(0, 10)} ${hours}:${formattedMinutes} ${ampm}`;
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
