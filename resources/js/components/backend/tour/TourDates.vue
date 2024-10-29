<template>
    <div class="card c-form-card mt-2 mb-2">
        <div class="card-header c-form-card-header">
            <label>{{ translate("Dates") }}</label>
        </div>
        <div class="d-flex justify-content-end p-3">
            <a
                class="btn btn-success"
                data-bs-target="#datesModal"
                data-bs-toggle="modal"
                @click="clearFields()"
                :title="translate('New dates')"
                >{{ translate("Add new dates") }}</a
            >
        </div>

        <div class="card-body">
            <div
                class="table-responsive"
                v-if="tour_dates && tour_dates.length > 0"
            >
                <table class="table table-striper">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>{{ translate("Start date") }}</th>
                            <th>{{ translate("End date") }}</th>

                            <th>{{ translate("Price") }}</th>
                            <th>{{ translate("Discount") }}</th>
                            <th>{{ translate("Infants") }}</th>
                            <th>{{ translate("Children") }}</th>
                            <th>{{ translate("Adults") }}</th>
                            <th>{{ translate("Action") }}</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr
                            v-for="(tour_date, index) in tour_dates"
                            :key="tour_date.id"
                        >
                            <td>{{ index + 1 }}</td>
                            <td>{{ tour_date.start_date }}</td>
                            <td>{{ tour_date.end_date }}</td>

                            <td>{{ tour_date.price }}</td>
                            <td>{{ tour_date.discounted_price }}</td>
                            <td>{{ tour_date.infants }}</td>
                            <td>{{ tour_date.children }}</td>
                            <td>{{ tour_date.adults }}</td>
                            <td class="">
                                <div class="btn-group">
                                    <a
                                        type="button"
                                        class="btn btn-sm fs-6"
                                        title="Edit"
                                        @click="
                                            editRecord(tour_date.id);
                                            clearFields();
                                        "
                                        data-bs-target="#datesModal"
                                        data-bs-toggle="modal"
                                        ><i class="bi bi-pencil"></i>
                                    </a>

                                    <DeleteModal
                                        :deleteId="tour_date.id"
                                        @deleteThis="deleteThis"
                                    />
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div v-else>
                <span>{{ translate("No dates added.") }}</span>
            </div>
        </div>
    </div>

    <div class="modal fade" id="datesModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" v-if="form.record_id">
                        {{ translate("Upate record") }}
                    </h5>
                    <h5 class="modal-title" v-else>
                        {{ translate("Tour dates") }}
                    </h5>
                    <button
                        ref="closeDatesModal"
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                    ></button>
                </div>
                <div class="modal-body">
                    <form @submit.prevent="submit">
                        <div class="row g-3">
                            <div class="col-12 col-md-12">
                                <label for="dates">{{
                                    translate("Dates")
                                }}</label>
                                <Datepicker
                                    autoApply
                                    :multiple="true"
                                    :range="true"
                                    :range-options="{ autoRange: 5 }"
                                    :enableTimePicker="false"
                                    :class="{
                                        'invalid-bg': formErrors.dates,
                                    }"
                                    v-model="form.dates"
                                >
                                </Datepicker>

                                <div
                                    class="invalid-feedback animated fadeIn"
                                    v-if="formErrors.dates"
                                >
                                    {{ formErrors.dates[0] }}
                                </div>
                            </div>

                            <div class="col-12 col-md-6">
                                <label for="price">{{
                                    translate("Price")
                                }}</label>
                                <input
                                    type="number"
                                    class="form-control"
                                    id="price"
                                    v-model="form.price"
                                />

                                <div
                                    class="invalid-feedback d-block"
                                    v-if="formErrors.price"
                                >
                                    {{ formErrors.price[0] }}
                                </div>
                            </div>

                            <div class="col-12 col-md-6">
                                <label for="discounted_price">{{
                                    translate("Discount")
                                }}</label>
                                <input
                                    type="number"
                                    class="form-control"
                                    id="discounted_price"
                                    v-model="form.discounted_price"
                                />

                                <div
                                    class="invalid-feedback d-block"
                                    v-if="formErrors.discounted_price"
                                >
                                    {{ formErrors.discounted_price[0] }}
                                </div>
                            </div>

                            <div class="col-12 col-md-6">
                                <label for="infants">{{
                                    translate("Infants")
                                }}</label>
                                <input
                                    type="number"
                                    class="form-control"
                                    id="infants"
                                    v-model="form.infants"
                                />

                                <div
                                    class="invalid-feedback d-block"
                                    v-if="formErrors.infants"
                                >
                                    {{ formErrors.infants[0] }}
                                </div>
                            </div>

                            <div class="col-12 col-md-6">
                                <label for="children">{{
                                    translate("Children")
                                }}</label>
                                <input
                                    type="number"
                                    class="form-control"
                                    id="children"
                                    v-model="form.children"
                                />

                                <div
                                    class="invalid-feedback d-block"
                                    v-if="formErrors.children"
                                >
                                    {{ formErrors.children[0] }}
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <label for="adults">{{
                                    translate("Adults")
                                }}</label>
                                <input
                                    type="number"
                                    class="form-control"
                                    id="adults"
                                    v-model="form.adults"
                                />

                                <div
                                    class="invalid-feedback d-block"
                                    v-if="formErrors.adults"
                                >
                                    {{ formErrors.adults[0] }}
                                </div>
                            </div>

                            <div class="mt-2">
                                <button
                                    type="submit"
                                    class="btn btn-success"
                                    v-if="formStatus"
                                >
                                    {{ translate("Save") }}
                                </button>
                                <button
                                    class="btn btn-success"
                                    type="button"
                                    disabled
                                    v-else
                                >
                                    {{ translate("Save") }}
                                    <span
                                        class="spinner-border spinner-border-sm"
                                        role="status"
                                        aria-hidden="true"
                                    ></span>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import Datepicker from "@vuepic/vue-datepicker";
import "@vuepic/vue-datepicker/dist/main.css";
import Multiselect from "@vueform/multiselect";
export default {
    props: ["tour_id"],
    components: {
        Datepicker,
        Multiselect,
    },
    created() {
        this.getDates();
    },
    data() {
        return {
            tour_dates: "",
            form: {
                tour_id: this.tour_id,
                record_id: "",
                price: "",
                discounted_price: "",
                dates: [],
                adults: "",
                infants: "",
                children: "",
            },
            modal_key_id: "",
            formErrors: [],
            formStatus: true,
        };
    },
    methods: {
        async getDates() {
            await axios
                .get("/api/tour-dates-fetch/" + this.tour_id)
                .then((response) => {
                    this.tour_dates = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        async editRecord(record_id) {
            this.modal_key_id = record_id;
            await axios
                .get("/api/edit-tour-date/" + record_id)
                .then((response) => {
                    this.form.record_id = response.data.id;
                    this.form.dates = response.data.dates;
                    this.form.price = response.data.price;
                    this.form.discounted_price = response.data.discounted_price;

                    this.form.infants = response.data.infants;
                    this.form.children = response.data.children;
                    this.form.adults = response.data.adults;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        async submit() {
            this.formStatus = false;
            await axios
                .post("/api/tour-dates-save", this.form)
                .then((response) => {
                    // this.tour_id = response.data;
                    this.formStatus = true;
                    toastr.success(
                        this.translate("Tour dates saved successfully")
                    );
                    this.formErrors = [];
                    this.$refs.closeDatesModal.click();
                    this.modal_key_id = "";
                    setTimeout(() => {
                        this.getDates();
                    }, 2000); // Delay of 2000 milliseconds (2 seconds)
                })
                .catch((error) => {
                    this.formStatus = true;
                    toastr.error(error.response.data.message);
                    if (error.response.data.errors) {
                        this.formErrors = error.response.data.errors;
                    }
                });
        },
        async deleteThis(id) {
            await axios
                .post("/api/tour_date-delete/" + id)
                .then(() => {
                    toastr.success(
                        this.translate("Dates deleted successfully")
                    );
                    this.getDates();
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        clearFields() {
            this.form.record_id = "";
            this.form.dates = "";
            this.form.price = "";
            this.form.discounted_price = "";
            this.form.adults = "";
            this.form.infants = "";
            this.form.children = "";
            this.formErrors = [];
        },
    },
};
</script>
<style>
@import "@vueform/multiselect/themes/default.css";
</style>
