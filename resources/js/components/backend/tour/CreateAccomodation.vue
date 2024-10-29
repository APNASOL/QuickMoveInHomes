<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h1 class="mb-0">
                    <span v-if="process_status == 'edit'">Edit Accommodation</span>
                    <span v-else>Create Accommodation</span>
                </h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span v-if="process_status == 'edit'"
                                >Edit Accommodation</span
                            >
                            <span v-else>Create Accommodation</span>
                        </li>
                    </ol>
                </nav>
            </div>
            <div>
                <a class="btn btn-success" :href="'/details-tour/'+tour_id">{{
                    translate("Go back")
                }}</a>
            </div>
        </div>
        <div class="card">
            <div class="card-body pt-4">
                <form @submit.prevent="submit">
                    <div class="row g-3">
                        <div class="col-12">
                            <label>{{ translate("Choose Status") }}</label>
                            <br />
                            <div class="d-inline-block me-2">
                                {{ translate("Optional") }}
                            </div>
                            <div class="form-check form-switch d-inline-block">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    :class="{
                                        'invalid-bg': formErrors.status,
                                    }"
                                    v-model="form.status"
                                    checked
                                />
                                <label class="form-check-label">{{
                                    translate("Included")
                                }}</label>
                            </div>

                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.status"
                            >
                                {{ formErrors.status[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-12">
                            <label for="title">{{ translate("Title") }}</label>
                            <input
                                type="text"
                                class="form-control"
                                v-model="form.title"
                                id="title"
                            />

                            <div
                                class="invalid-feedback d-block"
                                v-if="formErrors.title"
                            >
                                {{ formErrors.title[0] }}
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-12">
                        <label for="description"
                            >{{ translate("Description") }}
                        </label>
                        <QuillEditor
                            v-model:content="form.description"
                            contentType="html"
                            toolbar="full"
                            theme="snow"
                        />
                        <div
                            class="invalid-feedback d-block"
                            v-if="formErrors.description"
                        >
                            {{ formErrors.description[0] }}
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
                </form>
            </div>
        </div>
    </Master>
</template>

<script>
import Master from "@components/backend/layout/Master.vue";
import ImageCropper from "@components/global/ImageCropper.vue";
import Multiselect from "@vueform/multiselect";
import { QuillEditor } from "@vueup/vue-quill";
import "@vueup/vue-quill/dist/vue-quill.snow.css";
export default {
    props: ["tour_id", "process_status", "accommodation_id"],
    components: {
        Master,
        ImageCropper,
        Multiselect,
        QuillEditor,
    },
    created() {
        // fetching accommodation...
        if(this.accommodation_id)
        {
            this.getAccommodation();
        }
    },
    data() {
        return {
            form: {
                id: this.accommodation_id,
                tour_id: this.tour_id,
                name: "",
                description: "",
                status: "",
                process_status: this.process_status,
            },
            formErrors: [],
            formStatus: true,
        };
    },
    methods: {
        async getAccommodation() {
            await axios
                .get("/api/get-accommodation-edit/" + this.accommodation_id)
                .then((response) => {
                    this.form.title = response.data.title;
                    this.form.description = response.data.description;
                    this.form.status = response.data.status;
                })
                .catch((error) => { 
                    toastr.error(error.response.data.message);
                });
        },

        async submit() {
            this.formStatus = false;
            await axios
                .post("/api/accommodation-save", this.form)
                .then((response) => {
                    this.formStatus = true;

                    toastr.success(this.translate("Accommodation saved successfully"));

                    this.formErrors = [];
                    setTimeout(() => {
                        window.location.href = "/details-tour/"+this.tour_id;
                    }, 2000);
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
