<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h3 class="mb-0 c-theme-text-color">
                    <span v-if="home_id">{{ translate("Edit Home") }}</span>
                    <span v-else>{{ translate("Create Home") }}</span>
                </h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item" aria-current="page">
                            <span>{{ translate("Homes") }}</span>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span v-if="home_id">{{
                                translate("Update")
                            }}</span>
                            <span v-else>{{ translate("Create") }}</span>
                        </li>
                    </ol>
                </nav>
            </div>

            <div class="mb-3 d-flex justify-content-end">
                <a class="btn btn-success justify-content-end" href="/homes">
                    <i class="bi bi-list"></i> {{ translate("Homes") }}</a
                >
            </div>
        </div>

        <div class="card c-card-border">
            <div class="card-body pt-4">
                <form @submit.prevent="submit">
                    <div class="row g-3">
                        <div class="col-12">
                            <label>{{ translate("Choose Status") }}</label>
                            <br />
                            <div class="d-inline-block me-2">
                                {{ translate("OFF") }}
                            </div>
                            <div class="form-check form-switch d-inline-block">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    :class="{ 'invalid-bg': formErrors.status }"
                                    v-model="form.status"
                                    checked
                                />
                                <label class="form-check-label">{{
                                    translate("ON")
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
                                id="title"
                                :class="{ 'invalid-bg': formErrors.title }"
                                v-model="form.title"
                            />

                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.title"
                            >
                                {{ formErrors.title[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="price">{{ translate("Price") }}</label>
                            <input
                                type="number"
                                class="form-control"
                                id="price"
                                :class="{ 'invalid-bg': formErrors.price }"
                                v-model="form.price"
                            />

                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.price"
                            >
                                {{ formErrors.price[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="community_id">{{
                                translate("Community")
                            }}</label>
                            <Multiselect
                                v-model="form.community_id"
                                :options="communities_options"
                                :placeholder="translate('Search by community')"
                                :searchable="true"
                                :class="{
                                    'invalid-bg': formErrors.community_id,
                                }"
                            />
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.community_id"
                            >
                                {{ formErrors.community_id[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="description">{{
                                translate("Description")
                            }}</label>
                            <textarea
                                class="form-control"
                                id="description"
                                :class="{
                                    'invalid-bg': formErrors.description,
                                }"
                                v-model="form.description"
                                rows="5"
                            ></textarea>

                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.description"
                            >
                                {{ formErrors.description[0] }}
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label for="address">{{
                                translate("Address")
                            }}</label>
                            <textarea
                                class="form-control"
                                id="description"
                                :class="{ 'invalid-bg': formErrors.address }"
                                v-model="form.address"
                                rows="5"
                            ></textarea>

                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.address"
                            >
                                {{ formErrors.address[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label>{{ translate("Image") }}</label>
                            <div>
                                <ImageCropper
                                    @croppedImg="croppedImgSubmit"
                                    :ratio="1.6"
                                />
                                <br />

                                <image-zooming-component
                                    v-if="home_image"
                                    :file="home_image"
                                    :custom_class="'img-fluid img-thumbnail rounded'"
                                    :width="150"
                                />
                                <image-zooming-component
                                    v-else
                                    :file="home_image ?? 'empty.png'"
                                    :custom_class="'img-fluid img-thumbnail rounded'"
                                    :width="150"
                                />
                            </div>
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.image"
                            >
                                {{ formErrors.image[0] }}
                            </div>
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
                </form>
            </div>
        </div>
    </Master>
</template>

<script>
import Master from "@components/backend/layout/Master.vue";
import ImageCropper from "@components/global/ImageCropper.vue";
import Multiselect from "@vueform/multiselect";
import axios from "axios";

export default {
    props: ["home_id"],
    components: {
        Master,
        ImageCropper,
        Multiselect,
    },
    created() {
        if (this.home_id) {
            this.getHome();
        }
        this.pluckCommunities();
    },
    data() {
        return {
            form: {
                home_id: this.home_id,
                title: "",
                description: "",
                price: "",
                address: "",
                community_id: "",
                status: true, // Default status to true (active)
            },
            formErrors: [],
            formStatus: true,
            home_image: "",
            communities_options: [],
        };
    },
    methods: {
        getHome() {
            axios
                .get("/api/get/home/" + this.home_id)
                .then((response) => {
                    this.form.title = response.data.title;
                    this.form.description = response.data.description;
                    this.form.price = response.data.price;
                    this.form.address = response.data.address;
                    this.form.status = response.data.status;
                    this.form.community_id = response.data.community_id;
                    this.home_image = response.data.image;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        pluckCommunities() {
            axios
                .get("/api/communities/pluck")
                .then((response) => {
                    this.communities_options = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        croppedImgSubmit(img) {
            this.form.image = img;
            this.home_image = img;
        },
        submit() {
            this.formStatus = false;
            axios
                .post("/api/hoa/store", this.form)
                .then((response) => {
                    this.formStatus = true;
                    toastr.success(this.translate("Home saved successfully"));
                    this.formErrors = [];
                    setTimeout(() => {
                        window.location.href = "/homes";
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
a
