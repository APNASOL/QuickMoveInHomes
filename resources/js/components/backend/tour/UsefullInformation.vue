<template>
     
        <div class="card c-form-card mt-2 mb-2">
            <div class="card-header c-form-card-header">
                <label>{{ translate("Usefull information") }}</label>
            </div>

            <div class="card-body">
                <div class="row g-3">
                <div class="col-12 col-md-6">
                    <label for="entry_requirements">{{
                        translate("Entry requirements")
                    }}</label>
                    <input
                        type="text"
                        class="form-control"
                        id="entry_requirements"
                        v-model="form.entry_requirements"
                    />

                    <div
                        class="invalid-feedback d-block"
                        v-if="formErrors.entry_requirements"
                    >
                        {{ formErrors.entry_requirements[0] }}
                    </div>
                </div>

                <div class="col-12 col-md-6">
                    <label for="health">{{ translate("Health") }}</label>
                    <input
                        type="text"
                        class="form-control"
                        id="health"
                        v-model="form.health"
                    />

                    <div
                        class="invalid-feedback d-block"
                        v-if="formErrors.health"
                    >
                        {{ formErrors.health[0] }}
                    </div>
                </div>
                <div class="col-12 col-md-6">
                    <label for="visa">{{ translate("Visa") }}</label>
                    <input
                        type="text"
                        class="form-control"
                        id="visa"
                        v-model="form.visa"
                    />

                    <div
                        class="invalid-feedback d-block"
                        v-if="formErrors.visa"
                    >
                        {{ formErrors.visa[0] }}
                    </div>
                </div>
                <div class="col-12 col-md-6">
                    <label for="time_zone">{{ translate("Time zone") }}</label>
                    <input
                        type="text"
                        class="form-control"
                        id="time_zone"
                        v-model="form.time_zone"
                    />

                    <div
                        class="invalid-feedback d-block"
                        v-if="formErrors.time_zone"
                    >
                        {{ formErrors.time_zone[0] }}
                    </div>
                </div>
                <div class="col-12 col-md-6">
                    <label for="currency">{{ translate("Currency") }}</label>
                    <input
                        type="text"
                        class="form-control"
                        id="currency"
                        v-model="form.currency"
                    />

                    <div
                        class="invalid-feedback d-block"
                        v-if="formErrors.currency"
                    >
                        {{ formErrors.currency[0] }}
                    </div>
                </div>
                <div class="col-12 col-md-6">
                    <label for="language">{{ translate("Language") }}</label>
                    <input
                        type="text"
                        class="form-control"
                        id="language"
                        v-model="form.language"
                    />

                    <div
                        class="invalid-feedback d-block"
                        v-if="formErrors.language"
                    >
                        {{ formErrors.language[0] }}
                    </div>
                </div>
                <div class="col-12 col-md-6">
                    <label for="tourist_office_website">{{
                        translate("Tourist office website")
                    }}</label>
                    <input
                        type="text"
                        class="form-control"
                        id="tourist_office_website"
                        v-model="form.tourist_office_website"
                    />

                    <div
                        class="invalid-feedback d-block"
                        v-if="formErrors.tourist_office_website"
                    >
                        {{ formErrors.tourist_office_website[0] }}
                    </div>
                </div>
                <div class="col-12 col-md-6">
                    <label for="electricity">{{
                        translate("Electricity")
                    }}</label>
                    <input
                        type="text"
                        class="form-control"
                        id="electricity"
                        v-model="form.electricity"
                    />

                    <div
                        class="invalid-feedback d-block"
                        v-if="formErrors.electricity"
                    >
                        {{ formErrors.electricity[0] }}
                    </div>
                </div>
                <div class="col-12 col-md-12">
                    <label for="other_useful_information">{{
                        translate("Other useful information")
                    }}</label>
                    <textarea
                        type="text"
                        class="form-control"
                        id="other_useful_information"
                        v-model="form.other_useful_information"
                    ></textarea>

                    <div
                        class="invalid-feedback d-block"
                        v-if="formErrors.other_useful_information"
                    >
                        {{ formErrors.other_useful_information[0] }}
                    </div>
                </div>
                <div class="mt-2">
                        <button
                            type="submit"
                            class="btn btn-success"
                            v-if="formStatus"
                            @click="submit"
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
        this.getRecord();
    },
    data() {
        return {
            tour_dates: "",
            form: {
                tour_id: this.tour_id, 
                entry_requirements: "",
                health: "",
                visa: "",
                time_zone: "",
                currency: "",
                other_useful_information: "",
                language: "",
                tourist_office_website: "",
                electricity: "",
            },
   
            formErrors: [],
            formStatus: true,
        };
    },
    methods: {
         getRecord() {
             axios
                .get("/api/get-usefull-information/" + this.tour_id)
                .then((response) => {
                    this.form.entry_requirements = response.data.entry_requirements;
                    this.form.health = response.data.health;
                    this.form.visa = response.data.visa;
                    this.form.time_zone = response.data.time_zone;
                    this.form.currency = response.data.currency;
                    this.form.other_useful_information = response.data.other_useful_information;
                    this.form.language = response.data.language;
                    this.form.tourist_office_website = response.data.tourist_office_website;
                    this.form.electricity = response.data.electricity;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
         
        submit() {
            this.formStatus = false;
             axios
                .post("/api/usefull-information-save", this.form)
                .then((response) => { 
                    this.formStatus = true;
                    toastr.success(
                        this.translate("Information saved successfully")
                    );
                    
                    setTimeout(() => {
                        this.getRecord();
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
                    this.getRecord();
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
            this.formErrors = [];
        },
    },
};
</script>
<style>
@import "@vueform/multiselect/themes/default.css";
</style>
