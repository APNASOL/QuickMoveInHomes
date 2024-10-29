<template>
    <div class="card c-form-card mt-2 mb-2">
        <div class="card-header c-form-card-header">
            <label>{{ translate("Trip Hightlights") }}</label>
        </div>
        <div class="d-flex justify-content-end p-3">
            <a
                class="btn btn-success"
                data-bs-target="#highlightsModal"
                data-bs-toggle="modal"
                @click="clearFields()"
                :title="translate('New highlights')"
                >{{ translate("Add new highlights") }}</a
            >
        </div>

        <div class="card-body">
            <div
                class="table-responsive"
                v-if="trip_highlights && trip_highlights.length > 0"
            >
                <table class="table table-striper">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>{{ translate("Trip hightlight") }}</th>
                             
                            <th>{{ translate("Action") }}</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr
                            v-for="(trip_highlight, index) in trip_highlights"
                            :key="trip_highlight.id"
                        >
                            <td>{{ index + 1 }}</td>
                             
                            <td>{{ trip_highlight.trip_highlight }}</td>
                            <td class="">
                                <div class="btn-group">
                                    <a
                                        type="button"
                                        class="btn btn-sm fs-6"
                                        title="Edit"
                                        @click="
                                            editRecord(trip_highlight.id);
                                            clearFields();
                                        "
                                        data-bs-target="#highlightsModal"
                                        data-bs-toggle="modal"
                                        ><i class="bi bi-pencil"></i>
                                    </a>

                                    <DeleteModal
                                        :deleteId="trip_highlight.id"
                                        @deleteThis="deleteThis"
                                    />
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div v-else>
                <span>{{ translate("No highlights added.") }}</span>
            </div>
        </div>
    </div>

    <div class="modal fade" id="highlightsModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" v-if="form.record_id">
                        {{ translate("Upate record") }}
                    </h5>
                    <h5 class="modal-title" v-else>
                        {{ translate("Tour highlights") }}
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
                                <label for="trip_highlight">{{
                                    translate("Trip hightlight")
                                }}</label>
                                <input
                                    type="text"
                                    class="form-control"
                                    id="trip_highlight"
                                    v-model="form.trip_highlight"
                                />

                                <div
                                    class="invalid-feedback d-block"
                                    v-if="formErrors.trip_highlight"
                                >
                                    {{ formErrors.trip_highlight[0] }}
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
        this.getHighlights();
    },
    data() {
        return {
            trip_highlights: "",
            form: {
                tour_id: this.tour_id,
                record_id: "",
                trip_highlight: "",
            },
            modal_key_id: "",
            formErrors: [],
            formStatus: true,
        };
    },
    methods: {
        async getHighlights() {
            await axios
                .get("/api/tour-trip-hightlights-fetch/" + this.tour_id)
                .then((response) => {
                    this.trip_highlights = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        async editRecord(record_id) {
            this.modal_key_id = record_id;
            await axios
                .get("/api/edit-tour-trip-hightlight/" + record_id)
                .then((response) => {
                    this.form.record_id = response.data.id;
                    this.form.trip_highlight = response.data.trip_highlight;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        async submit() {
            this.formStatus = false;
            await axios
                .post("/api/tour-trip-hightlights-save", this.form)
                .then((response) => {
                    // this.tour_id = response.data;
                    this.formStatus = true;
                    toastr.success(
                        this.translate("Tour highlights saved successfully")
                    );
                    this.formErrors = [];
                    this.$refs.closeDatesModal.click();
                    this.modal_key_id = "";
                    setTimeout(() => {
                        this.getHighlights();
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
                .post("/api/tour-trip-hightlight-delete/" + id)
                .then(() => {
                    toastr.success(
                        this.translate("Dates deleted successfully")
                    );
                    this.getHighlights();
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        clearFields() {
            this.form.record_id = "";
            this.form.trip_highlight = "";

            this.formErrors = [];
        },
    },
};
</script>
<style>
@import "@vueform/multiselect/themes/default.css";
</style>
