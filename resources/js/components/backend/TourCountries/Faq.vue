<template>
    <div>
        <div class="d-flex justify-content-end p-3">
            <a
                class="btn btn-success"
                data-bs-target="#datesModal"
                data-bs-toggle="modal"
                @click="clearFields()"
                :title="translate('New faqs')"
                >{{ translate("Add new faqs") }}</a
            >
        </div>

        <div class="card-body">
            <div
                class="table-responsive"
                v-if="faqs && faqs.length > 0"
            >
                <table class="table table-striper">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>{{ translate("Question") }}</th>
                            <th>{{ translate("Answer") }}</th>
                             
                            <th>{{ translate("Action") }}</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr
                            v-for="(faq, index) in faqs"
                            :key="faq.id"
                        >
                            <td>{{ index + 1 }}</td>
                            <td>{{ faq.question }}</td>
                            <td>{{ faq.answer }}</td>
                             
                            <td class="">
                                <div class="btn-group">
                                    <a
                                        type="button"
                                        class="btn btn-sm fs-6"
                                        title="Edit"
                                        @click="
                                            editRecord(faq.id);
                                            clearFields();
                                        "
                                        data-bs-target="#datesModal"
                                        data-bs-toggle="modal"
                                        ><i class="bi bi-pencil"></i>
                                    </a>

                                    <DeleteModal
                                        :deleteId="faq.id"
                                        @deleteThis="deleteThis"
                                    />
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div v-else>
                <span>{{ translate("No faqs added.") }}</span>
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
                        {{ translate("Tour faqs") }}
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
                                <label for="faq">{{
                                    translate("Question")
                                }}</label>
                                <textarea
                                    type="number"
                                    class="form-control"
                                    id="faq"
                                    v-model="form.question"
                                ></textarea>

                                <div
                                    class="invalid-feedback d-block"
                                    v-if="formErrors.question"
                                >
                                    {{ formErrors.question[0] }}
                                </div>
                            </div>
                            <div class="col-12 col-md-12">
                                <label for="answer">{{
                                    translate("Answer")
                                }}</label>
                                <textarea
                                    type="number"
                                    class="form-control"
                                    id="answer"
                                    v-model="form.answer"
                                ></textarea>

                                <div
                                    class="invalid-feedback d-block"
                                    v-if="formErrors.answer"
                                >
                                    {{ formErrors.answer[0] }}
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
    props: ["tour_country_id"],
    components: {
        Datepicker,
        Multiselect,
    },
    created() {
        this.fetchFaqs();
    },
    data() {
        return {
            faqs: "",
            form: {
                tour_country_id: this.tour_country_id,
                question: "", 
                answer: "", 
            },
            modal_key_id: "",
            formErrors: [],
            formStatus: true,
        };
    },
    methods: {
        async fetchFaqs() {
            await axios
                .get("/api/country-faqs-fetch/" + this.tour_country_id)
                .then((response) => {
                    this.faqs = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        async editRecord(record_id) {
            this.modal_key_id = record_id;
            await axios
                .get("/api/edit-country-faq/" + record_id)
                .then((response) => {
                    this.form.record_id = response.data.id;
                    this.form.question = response.data.question;
                    this.form.answer = response.data.answer;
                     
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        async submit() {
            this.formStatus = false;
            await axios
                .post("/api/country-faq-save", this.form)
                .then((response) => {
                    // this.tour_country_id = response.data;
                    this.formStatus = true;
                    toastr.success(
                        this.translate("Tour faq saved successfully")
                    );
                    this.formErrors = [];
                    this.$refs.closeDatesModal.click();
                    this.modal_key_id = "";
                    setTimeout(() => {
                        this.fetchFaqs();
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
                .post("/api/country-faq-delete/" + id)
                .then(() => {
                    toastr.success(
                        this.translate("Faq deleted successfully")
                    );
                    this.fetchFaqs();
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        clearFields() {
            this.form.record_id = "";
            this.form.question = ""; 
            this.form.answer = ""; 
            this.formErrors = [];
        },
    },
};
</script>
<style>
@import "@vueform/multiselect/themes/default.css";
</style>
