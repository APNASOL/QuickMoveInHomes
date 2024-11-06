<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h3 class="mb-0 c-theme-text-color">
                    <span>Customers Visit Homes</span>
                </h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item c-theme-text-color">
                            <a class="c-theme-text-color" href="#">Home</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span>Visits</span>
                        </li>
                    </ol>
                </nav>
            </div>
            <div></div>
        </div>

        <section class="section">
            <div class="card c-card-border">
                <div class="card-body pt-4">
                    <div class="accordion" id="customerVisitsAccordion">
                        <div
                            v-for="(customer, customerIndex) in homeVisits"
                            :key="customer.customer_id"
                            class="accordion-item"
                        >
                            <!-- Accordion Header for Customer ID -->
                            <h2
                                class="accordion-header"
                                :id="'heading' + customerIndex"
                            >
                                <button
                                    class="accordion-button collapsed"
                                    type="button"
                                    data-bs-toggle="collapse"
                                    :data-bs-target="
                                        '#collapse' + customerIndex
                                    "
                                    aria-expanded="true"
                                    :aria-controls="'collapse' + customerIndex"
                                >
                                    {{ translate("Customer ID") }}:
                                    {{ customer.customer_name }}
                                </button>
                            </h2>

                            <!-- Accordion Body for Visit Details -->
                            <div
                                :id="'collapse' + customerIndex"
                                class="accordion-collapse collapse"
                                :aria-labelledby="'heading' + customerIndex"
                                data-bs-parent="#customerVisitsAccordion"
                            >
                                <div class="accordion-body">
                                    <div class="d-flex justify-content-end">
                                        <DeleteModal
                                            :deleteId="customer.customer_id"
                                            @deleteThis="deleteThis"
                                        />
                                    </div>
                                    <div class="table-responsive">
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th
                                                        scope="col"
                                                        class="text-center"
                                                    >
                                                        #
                                                    </th>
                                                    <th scope="col">
                                                        {{
                                                            translate(
                                                                "Visited Home"
                                                            )
                                                        }}
                                                    </th>
                                                    <th scope="col">
                                                        {{
                                                            translate(
                                                                "Date & Time"
                                                            )
                                                        }}
                                                    </th>
                                                    <th scope="col">
                                                        {{
                                                            translate(
                                                                "IP Address"
                                                            )
                                                        }}
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <!-- Inner loop for each visit -->
                                                <tr
                                                    v-for="(
                                                        visit, visitIndex
                                                    ) in customer.visits"
                                                    :key="visit.id"
                                                >
                                                    <td class="text-center">
                                                        {{ visitIndex + 1 }}
                                                    </td>
                                                    <td>
                                                        <a
                                                            type="button"
                                                            class="c-linked c-mouse-over c-theme-text-color"
                                                            title="Edit"
                                                            target="_blank"
                                                            :href="
                                                                '/property/details/' +
                                                                visit.home_id
                                                            "
                                                        >
                                                            {{
                                                                visit.home_title
                                                            }}
                                                        </a>
                                                    </td>
                                                    <td>
                                                        {{
                                                            formatDate(
                                                                visit.created_at
                                                            )
                                                        }}
                                                    </td>
                                                    <td>
                                                        {{ visit.ip_address }}
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
            homeVisits: [],
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
                .get("/api/fetch-customer-visits")
                .then((response) => {
                    this.homeVisits = response.data;

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
        deleteThis(id) {
            axios
                .post("/api/customer-visits-clear/" + id)
                .then((response) => {
                    toastr.success(
                        this.translate("Visiting List cleared Successfully.")
                    );
                    this.fetchVistingList();
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
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
