<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h3 class="mb-0 c-theme-text-color">
                    <span v-if="school_id">{{ translate("Edit school") }}</span>
                    <span v-else>{{ translate("Create school") }}</span>
                </h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item" aria-current="page">
                            <span>{{ translate("Schools") }}</span>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span v-if="school_id">{{
                                translate("Update")
                            }}</span>
                            <span v-else>{{ translate("Create") }}</span>
                        </li>
                    </ol>
                </nav>
            </div>

            <div class="mb-3 d-flex justify-content-end">
                <a class="btn btn-success justify-content-end" href="/schools">
                    <i class="bi bi-list"></i> {{ translate("Schools") }}</a
                >
            </div>
        </div>

        <div class="card c-card-border">
            <div class="card-body pt-4">
                <form >
                    <div class="row g-3">
                        <!-- School Name Input -->
                        <div class="col-12 col-md-6">
                            <label for="name">{{
                                translate("Name")
                            }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="name"
                                :class="{
                                    'invalid-bg': formErrors.name,
                                }"
                                v-model="form.name"
                            />
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.name"
                            >
                                {{ formErrors.name[0] }}
                            </div>
                        </div>

                        <!-- School Type Input -->
                        <div class="col-12 col-md-6">
                            <label for="type">{{
                                translate("Type")
                            }}</label>
                             <Multiselect
                                v-model="form.type"
                                :options="schools"
                                :placeholder="translate('School')"
                                :searchable="true"
                                 
                                :class="{
                                    'invalid-bg': formErrors.type,
                                }"
                            />
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.type"
                            >
                                {{ formErrors.type[0] }}
                            </div>
                        </div>

                        <!-- Directions & Details Input -->
                        <div class="col-12">
                            <label for="directions_and_details">{{
                                translate("Directions & Details")
                            }}</label>
                            <textarea
                                class="form-control"
                                id="directions_and_details"
                                rows="5"
                                :class="{
                                    'invalid-bg':
                                        formErrors.directions_and_details,
                                }"
                                v-model="form.directions_and_details"
                            ></textarea>
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.directions_and_details"
                            >
                                {{ formErrors.directions_and_details[0] }}
                            </div>
                        </div>

                        <!-- Save Button -->
                        <div class="mt-3">
                            <button
                                @click="submit"
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
    </Master>
</template>

<script>
import Master from "@components/backend/layout/Master.vue";
import ImageCropper from "@components/global/ImageCropper.vue";
import axios from "axios";
import Multiselect from "@vueform/multiselect";
export default {
    props: ["school_id"],
    components: {
        Master,
        ImageCropper,
        Multiselect
    },
    created() {
        if (this.school_id) {
            this.getSchools();
        }
    },
    data() {
        return {
            form: {
                id: this.school_id ?? "",
                name: "",
                type: "",

                directions_and_details: "",
            },
            formErrors: [],
            formStatus: true, 
            schools:['Public','Private','Charter'],
        };
    },
    methods: {
        getSchools() {
            axios
                .get("/api/get/school/" + this.school_id)
                .then((response) => {
                    this.form.name = response.data.name;
                    this.form.type = response.data.type;
                    this.form.directions_and_details =
                        response.data.directions_and_details;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },

        submit() {
            this.formStatus = false;
            axios
                .post("/api/school/store", this.form)
                .then((response) => {
                    this.formStatus = true;
                    toastr.success(
                        this.translate("School saved successfully")
                    );
                    this.formErrors = [];
                    setTimeout(() => {
                        window.location.href = "/schools";
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
    },
};
</script>
