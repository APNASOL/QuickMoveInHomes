<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h3 class="mb-0 c-theme-text-color">
                    <span v-if="neighborhood_id">{{
                        translate("Edit neighborhood")
                    }}</span>
                    <span v-else>{{ translate("Create neighborhood") }}</span>
                </h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item" aria-current="page">
                            <span>{{ translate("Neighborhoods") }}</span>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span v-if="neighborhood_id">{{
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
                    href="/neighborhoods"
                >
                    <i class="bi bi-list"></i>
                    {{ translate("Neighborhoods") }}</a
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
                            ></textarea>
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.description"
                            >
                                {{ formErrors.description[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="location">{{
                                translate("Location")
                            }}</label>
                            <textarea
                                class="form-control"
                                id="location"
                                :class="{ 'invalid-bg': formErrors.location }"
                                v-model="form.location"
                            ></textarea>
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.location"
                            >
                                {{ formErrors.location[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="amenity">{{
                                translate("Amenity")
                            }}</label>
                            <Multiselect
                                v-model="form.amenity"
                                :options="amenitesOptions"
                                :placeholder="translate('Search by amenity')"
                                :searchable="true"
                                :class="{
                                    'invalid-bg': formErrors.amenity,
                                }"
                            />
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.amenity"
                            >
                                {{ formErrors.amenity[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="map_location">{{
                                translate("Map Location")
                            }}</label>
                            <textarea
                                class="form-control"
                                id="map_location"
                                :class="{
                                    'invalid-bg': formErrors.map_location,
                                }"
                                v-model="form.map_location"
                            ></textarea>
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.map_location"
                            >
                                {{ formErrors.map_location[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="nearby_properties">{{
                                translate("Nearby Properties")
                            }}</label>
                            <textarea
                                class="form-control"
                                id="nearby_properties"
                                :class="{
                                    'invalid-bg': formErrors.nearby_properties,
                                }"
                                v-model="form.nearby_properties"
                            ></textarea>
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.nearby_properties"
                            >
                                {{ formErrors.nearby_properties[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="files">{{
                                translate("Upload Image")
                            }}</label>
                            <div>
                                <ImageCropper
                                    @croppedImg="croppedImgSubmit"
                                    :ratio="1"
                                />
                                <br />
                                <image-zooming-component
                                    v-if="neighborhood_image"
                                    :file="neighborhood_image ?? 'empty.png'"
                                    :custom_class="'img-fluid img-thumbnail'"
                                    :width="'100px'"
                                />
                            </div>
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.files"
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
import Multiselect from "@vueform/multiselect";
export default {
    props: ["neighborhood_id"],
    components: {
        Master,
        ImageCropper,
        Multiselect
    },
    created() {
        this.pluckamenity();
        if (this.neighborhood_id) {
            this.getNeighborhood();
        }
    },
    data() {
        return {
            form: {
                neighborhood_id: this.neighborhood_id ?? "",
                name: "",
                description: null,
                location: null,
                amenity: null,
                image: null,
                map_location: null,
                nearby_properties: null,
            },

            neighborhood_image: "",
            formErrors: [],
            amenitesOptions: [],
            formStatus: true,
        };
    },
    methods: {
        getNeighborhood() {
            axios
                .get("/api/get/neighborhood/" + this.neighborhood_id)
                .then((response) => {
                    this.form.name = response.data.name;
                    this.form.description = response.data.description;
                    this.form.amenity = response.data.amenities;
                    this.form.location = response.data.location;
                    this.form.map_location = response.data.map_location;
                    this.form.nearby_properties = response.data.nearby_properties;
                     this.neighborhood_image = response.data.image;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        pluckamenity() {
            axios
                .get("/api/amenities/pluck/")
                .then((response) => {
                    this.amenitesOptions = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        

        croppedImgSubmit(img) {
            this.form.image = img;
            this.neighborhood_image = img;
        },

        submit() {
            this.formStatus = false;
            axios
                .post("/api/neighborhood/store", this.form)
                .then((response) => {
                    this.formStatus = true;
                    toastr.success(
                        this.translate("Neighborhood saved successfully")
                    );
                    this.formErrors = [];
                    setTimeout(() => {
                        window.location.href = "/neighborhoods";
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
