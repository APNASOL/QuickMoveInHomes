<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h3 class="mb-0 c-theme-text-color">
                    <span v-if="region_id">{{ translate("Edit region") }}</span>
                    <span v-else>{{ translate("Create region") }}</span>
                </h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item" aria-current="page">
                            <span>{{ translate("Region") }}</span>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span v-if="region_id">{{
                                translate("Update")
                            }}</span>
                            <span v-else>{{ translate("Create") }}</span>
                        </li>
                    </ol>
                </nav>
            </div>

            <div class="mb-3 d-flex justify-content-end">
                <a
                    class="btn btn-success justify-content-end"
                    href="/regions"
                >
                    <i class="bi bi-list"></i> {{ translate("Regions") }}</a
                >
            </div>
        </div>

        <div class="card c-card-border">
            <div class="card-body pt-4">
                <form @submit.prevent="submit">
                    <div class="row g-3">
                        <div class="col-12 col-md-12">
                            <label for="name">{{ translate("Name") }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="name"
                                :class="{ 'invalid-bg': formErrors.name }"
                                v-model="form.name"
                            />
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.name"
                            >
                                {{ formErrors.name[0] }}
                            </div>
                        </div>
                        <!-- Description -->
                        <div class="col-12">
                            <label for="description">{{
                                translate("Description")
                            }}</label>
                            <textarea
                                class="form-control"
                                id="description"
                                rows="3"
                                :class="{
                                    'invalid-bg': formErrors.description,
                                }"
                                v-model="form.description"
                            ></textarea>
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.description"
                            >
                                {{ formErrors.description[0] }}
                            </div>
                        </div>
                        <!-- Boundaries Input -->
                        <div class="col-12">
                            <label for="boundaries">{{
                                translate("Directions & Details")
                            }}</label>
                            <textarea
                                class="form-control"
                                id="boundaries"
                                rows="3"
                                :class="{
                                    'invalid-bg': formErrors.boundaries,
                                }"
                                v-model="form.boundaries"
                            ></textarea>
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.boundaries"
                            >
                                {{ formErrors.boundaries[0] }}
                            </div>
                        </div>
                        <div class="mt-3">
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
    </Master>
</template>

<script>
import Master from "@components/backend/layout/Master.vue";
import axios from "axios";

export default {
    props: ["region_id"],
    components: {
        Master,
    },
    created() {
        if (this.region_id) {
            this.getRegion();
        }
    },
    data() {
        return {
            form: {
                id: this.region_id ?? "",
                name: "",
                description: "",
                boundaries: "",
            },
            formErrors: [],
            formStatus: true,
        };
    },
    methods: {
        getRegion() {
            axios
                .get("/api/get/region/" + this.region_id)
                .then((response) => {
                    this.form.name = response.data.name; 
                    this.form.description = response.data.description;
                    this.form.boundaries = response.data.boundaries;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },

        submit() {
            this.formStatus = false;
            axios
                .post("/api/region/store", this.form)
                .then((response) => {
                    this.formStatus = true;
                    toastr.success(this.translate("Region saved successfully"));
                    this.formErrors = [];
                    setTimeout(() => {
                        window.location.href = "/regions";
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
