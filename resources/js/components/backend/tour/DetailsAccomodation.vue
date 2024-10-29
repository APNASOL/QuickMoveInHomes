<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h1 class="mb-0">
                    <span> {{ accommodation.title }} Details</span>
                </h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span>Details</span>
                        </li>
                    </ol>
                </nav>
            </div>
            <div>
                <a class="btn btn-success" :href="'/details-tour/' + tour_id">{{
                    translate("Go back")
                }}</a>
            </div>
        </div>
        <div class="card">
            <div class="card-body pt-4">
                <div class="table-responsive">
                    <table class="table table-striped">
                        <tbody>
                            <tr>
                                <th>{{ translate("Status") }}</th>
                                <td>{{ accommodation.status }}</td>
                            </tr>
                            <tr>
                                <th>{{ translate("Title") }}</th>
                                <td>{{ accommodation.title }}</td>
                            </tr>
                            <tr>
                                <th>{{ translate("Description") }}</th>
                                <td>
                                    <div
                                        class="content ql-editor"
                                        v-html="accommodation.description"
                                    ></div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="card c-form-card">
                    <div class="card-header c-form-card-header">
                        <label>{{ translate("Other images") }}</label>
                    </div>
                    <div class="card-body">
                        <div class="col-12 col-md-6">
                            <div>
                                <ImageCropper @croppedImg="croppedImgSubmit" />
                                <br />
                                <img
                                    v-if="other_image_form.image"
                                    :src="other_image_form.image"
                                    width="150"
                                    class="img-thumbnail"
                                    @error="setAltImg" 
                                />
                            </div>
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.image"
                            >
                                {{ formErrors.image[0] }}
                            </div>
                        </div>

                        <div class="mt-2" v-if="other_image_form.image">
                            <button
                                v-if="formStatus"
                                @click="saveOtherImage"
                                type="submit"
                                class="btn btn-success"
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

                        <div class="row">
                            <div
                                class="col-md-2"
                                v-for="image in accommodation.other_images"
                                :key="image"
                            >
                                <DeleteModal
                                    :deleteId="image.id"
                                    @deleteThis="deleteThis"
                                />
                                <image-zooming-component
                                    :file="image.image ?? 'empty.png'"
                                    :width="100"
                                />
                            </div>
                        </div>
                    </div>
                </div>
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
    props: ["tour_id", "accommodation_id"],
    components: {
        Master,
        ImageCropper,
        Multiselect,
        QuillEditor,
    },
    created() {
        // fetching accommodation...
        this.getAccommodation();
    },
    data() {
        return {
            formErrors: [],
            formStatus: true,
            accommodation: "",
            other_image_form: {
                id: this.accommodation_id ?? "",
                image: "",
            },
        };
    },
    methods: {
        async getAccommodation() {
            await axios
                .get("/api/get-accommodation-details/" + this.accommodation_id)
                .then((response) => {
                    this.accommodation = response.data;
                    this.other_image_form.image = "";
                })
                .catch((error) => {
                    toastr.error(error.response.data.message); 
                });
        },

        croppedImgSubmit(img) {
            this.other_image_form.image = img;
        },
        async saveOtherImage() {
            this.formStatus = 0;
            await axios
                .post("/api/accommodation-other-image-save", this.other_image_form)
                .then((response) => {
                    this.formStatus = 2;
                    toastr.success(this.translate("Image saved"));
                    this.other_image_form.imge = "";
                    setTimeout(() => {
                        this.getAccommodation();
                    }, 2000);
                })
                .catch((error) => {
                    this.formStatus = 2;
                    toastr.error(error.response.data.message);
                    if (error.response.data.errors) {
                        this.formErrors = error.response.data.errors;
                    }
                });
        },
        async deleteThis(id) {
            await axios
                .post("/api/accommodation-image-delete/" + id)
                .then(() => {
                    toastr.success(
                        this.translate("Image deleted successfully")
                    );
                    this.getAccommodation();
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
    },
};
</script>
<style>
@import "@vueform/multiselect/themes/default.css";
</style>
