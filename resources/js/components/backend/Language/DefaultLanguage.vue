<template>
    <section class="row section">
        <div class="col-md-6">
            <div class="card">
                <div class="card-body pt-4">
                    <h5 class="card-title">Default Language</h5> 
                    <!-- Floating Labels Form -->
                    <form @submit.prevent="submit">
                        <div class="row g-3">
                            <div class="col-12 col-md-12">
                                <Multiselect
                                    class="form-select"
                                    :options="code_options"
                                    :searchable="true"
                                    :class="{ 'invalid-bg': formErrors.status }"
                                    :placeholder="
                                        translate('Choose default language')
                                    "
                                    v-model="form.default_language"
                                />
                                <div
                                    class="invalid-feedback animated fadeIn"
                                    v-if="formErrors.code"
                                >
                                    {{ formErrors.code[0] }}
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
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
                        </div>
                    </form>
                    <!-- End floating Labels Form -->
                </div>
            </div>
        </div>
    </section>
</template>

<script>
import Multiselect from "@vueform/multiselect";
export default {
    components: {
        Multiselect,
    },
    created() {
        this.fatchLanguages();
        this.fetchDefaultLanguage();
    },
    data() {
        return {
            form: {
                default_language: "",
            },
            code_options: {},
            formErrors: [],
            formStatus: 1,
            defaultLanguage: "",
        };
    },
    methods: {
        async fatchLanguages() {
            await axios
                .get("/api/get-existing-languges")
                .then((response) => {
                    this.code_options = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        async fetchDefaultLanguage() {
            await axios
                .get("/api/get-default-languge")
                .then((response) => {
                    this.form.default_language = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        async submit() {
            this.formStatus = 0;

            await axios
                .post("/api/make-default-language", this.form)
                .then((data) => {
                    this.formStatus = 1;

                    toastr.success("Default Language Changed Successfully.");
                    // toastr.success(this.translate("Default language changed successfully"));
                })
                .catch((error) => {
                    this.formStatus = 1;
                    toastr.error(error.response.data.message);

                    if (error.response.data.errors) {
                        this.formErrors = error.response.data.errors;
                    }
                });
        },
    },
};
</script>

<style></style>
