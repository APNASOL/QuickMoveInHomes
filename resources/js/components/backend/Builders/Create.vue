<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h3 class="mb-0 c-theme-text-color">
                    <span v-if="builder_id">{{
                        translate("Edit builder")
                    }}</span>
                    <span v-else>{{ translate("Create builder") }}</span>
                </h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item" aria-current="page">
                            <span>{{ translate("Builders") }}</span>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span v-if="builder_id">{{
                                translate("Update")
                            }}</span>
                            <span v-else>{{ translate("Create") }}</span>
                        </li>
                    </ol>
                </nav>
            </div>

            <div class="mb-3 d-flex justify-content-end">
                <a class="btn btn-success justify-content-end" href="/builders">
                    <i class="bi bi-list"></i> {{ translate("Builders") }}</a
                >
            </div>
        </div>

        <div class="card c-card-border">
            <div class="card-body pt-4">
                <form @submit.prevent="submit">
                    <div class="row g-3">
                        <div class="col-12 col-md-6">
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
                        
                        <div class="col-12 col-md-6">
                            <label for="communities">{{
                                translate("Comminities")
                            }}</label>
                            <Multiselect
                                v-model="form.communities"
                                :options="communities_options"
                                :placeholder="translate('Community')"
                                :searchable="true"
                                mode="tags"
                                :class="{
                                    'invalid-bg': formErrors.communities,
                                }"
                            />
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.communities"
                            >
                                {{ formErrors.communities[0] }}
                            </div>
                        </div>
                        <div class="col-12 col-md-12">
                            <label for="description">{{
                                translate("Description")
                            }}</label>
                            <textarea
                                class="form-control"
                                id="description"
                                rows="5"
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
import ImageCropper from "@components/global/ImageCropper.vue";
import axios from "axios";
import Multiselect from "@vueform/multiselect";


export default {
    props: ["builder_id"],
    components: {
        Master,
        ImageCropper,
     
        Multiselect
    },
    created() {
        if (this.builder_id) {
            this.getBuilders();
        }
        this.pluckCommunities();
    },
    data() {
        return {
            form: {
                id: this.builder_id ?? "",
                name: "",
                description: "",
                communities: [],
            },
            formErrors: [],
            formStatus: true,
            communities_options:[],
        };
    },
    methods: {
        
        getBuilders() {
            axios
                .get("/api/get/builder/" + this.builder_id)
                .then((response) => {
                    this.form.name = response.data.name;
                    this.form.description = response.data.description;
                    this.form.communities = response.data.communities;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        pluckCommunities() {
            axios
                .get("/api/communities/pluck/")
                .then((response) => {
                    this.communities_options = response.data; 
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },

        submit() {
            this.formStatus = false;
            axios
                .post("/api/builder/store", this.form)
                .then((response) => {
                    this.formStatus = true;
                    toastr.success(
                        this.translate("Builder saved successfully")
                    );
                    this.formErrors = [];
                    setTimeout(() => {
                        window.location.href = "/builders";
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
