<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h1 class="mb-0">
                    <span v-if="lang_id">Edit Language</span>
                    <span v-else>Create Language</span>
                </h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span v-if="lang_id">Edit Language</span>
                            <span v-else>Create Language</span>
                        </li>
                    </ol>
                </nav>
            </div>
            <div>
                <a class="btn btn-success" href="/languages">{{
                    translate("Go to Languages")
                }}</a>
            </div>
        </div>
        <div class="card">
            <div class="card-body pt-4">
                <h5 class="card-title">Add New Language</h5>

                <form @submit.prevent="submit">
                    <div class="row g-3">
                        <div class="col-12 col-md-6">
                            <label for="name">{{ translate("Name") }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="name"
                                v-model="form.name"
                            />

                            <div
                                class="invalid-feedback d-block"
                                v-if="formErrors.name"
                            >
                                {{ formErrors.name[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="name">{{ translate("Country") }}</label>
                            <Multiselect
                                v-model="form.code"
                                :options="code_options"
                                :searchable="true"
                                :class="{ 'invalid-bg': formErrors.code }"
                                :placeholder="translate('Choose country')"
                            />
                            <div
                                class="invalid-feedback d-block"
                                v-if="formErrors.code"
                            >
                                {{ formErrors.code[0] }}
                            </div>
                        </div>
                    </div>
                    <div class="mt-2">
                        <button
                            type="button"
                            @click="submit"
                            class="btn btn-success"
                            v-if="formStatus == 1"
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
                </form>
            </div>
        </div>
    </Master>
</template>

<script>
import Master from "@components/backend/layout/Master.vue";
import ImageCropper from "@components/global/ImageCropper.vue";
import Multiselect from "@vueform/multiselect";
export default {
    props: ["lang_id"],
    components: {
        Master,
        ImageCropper,
        Multiselect,
    },
    created() {
        // fetching tour...
        this.loadCountries();
        this.getLanguage();
        if(this.lang_id)
        {
            this.getLanguage();
        }
    },
    data() {
        return {
            form: {
                id: this.lang_id ?? "",
                name: "",
                code: "",
            },
            // code_options: this.countries,
            code_options: [],
            formErrors: [],
            formStatus: 1,
        };
    },
    methods: {
        async getLanguage() {
            await axios
                .get("/api/get-language/" + this.lang_id)
                .then((response) => { 
                    this.form.name = response.data.name;
                    this.form.code = response.data.code;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        async loadCountries() {
            await axios
                .get("/api/get-countries")
                .then((response) => {
                    this.code_options = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },

        async submit() {
            this.formStatus = false;
            await axios
                .post("/api/language-save", this.form)
                .then((response) => {
                    this.formStatus = true;

                    toastr.success(
                        this.translate("Language saved successfully.")
                    );

                    this.formErrors = [];
                    window.location.href = "/languages";
                })
                .catch((error) => {
                    this.formStatus = true;

                    toastr.error(error.response.data.message);
                    if (error.response.data.errors) {
                        this.formErrors = error.response.data.errors;
                    }
                });
        },
    },
};
</script>
<style>
@import "@vueform/multiselect/themes/default.css";
</style>
