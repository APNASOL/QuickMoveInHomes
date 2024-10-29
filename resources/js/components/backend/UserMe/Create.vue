<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h3 class="mb-0 c-theme-text-color">
                    <span v-if="community_id">{{ translate("Edit community") }}</span>
                    <span v-else>{{ translate("Create community") }}</span>
                </h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item" aria-current="page">
                            <span>{{ translate("Communities") }}</span>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span v-if="community_id">{{ translate("Update") }}</span>
                            <span v-else>{{ translate("Create") }}</span>
                        </li>
                    </ol>
                </nav>
            </div>

            <div class="mb-3 d-flex justify-content-end">
                <a class="btn btn-success justify-content-end" href="/communities">
                    <i class="bi bi-list"></i> {{ translate("Communities") }}</a
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
                                    :class="{
                                        'invalid-bg': formErrors.status,
                                    }"
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

                        <div class="col-12 col-md-12">
                            <label for="location">{{ translate("Location") }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="location"
                                :class="{ 'invalid-bg': formErrors.location }"
                                v-model="form.location"
                            />

                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.location"
                            >
                                {{ formErrors.location[0] }}
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
                                    v-if="community_image"
                                    :file="community_image"
                                    :custom_class="'img-fluid img-thumbnail rounded'"
                                    :width="150"
                                />
                                <image-zooming-component
                                    v-else
                                    :file="community_image ?? 'empty.png'"
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
import axios from "axios";

export default {
    props: ["community_id"],
    components: {
        Master,
        ImageCropper,
    },
    created() {
        if (this.community_id) {
            this.getCommunity();
        }
    },
    data() {
        return {
            form: {
                community_id: this.community_id ?? "",
                name: "",
                location: "",
                status: true, // Default status to true (active)
                image: "",
            },
            formErrors: [],
            formStatus: true,
            community_image: "",
        };
    },
    methods: {
        getCommunity() {
            axios
                .get("/api/get/community/" + this.community_id)
                .then((response) => {
                    this.form.name = response.data.name;
                    this.form.location = response.data.location;
                    this.form.status = response.data.status === 1; // Convert status to boolean
                    this.community_image = response.data.image;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },

        croppedImgSubmit(img) {
            this.form.image = img;
            this.community_image = img;
        },

        submit() {
            this.formStatus = false;
            axios
                .post("/api/community/store", this.form)
                .then((response) => {
                    this.formStatus = true;
                    toastr.success(this.translate("Community saved successfully"));
                    this.formErrors = [];
                    setTimeout(() => {
                        window.location.href = "/communities";
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

