<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h1 class="mb-0">
                    <span v-if="custom_page_id">
                        {{ form.title }} {{ translate("update") }}</span
                    >
                    <span v-else>{{ translate("Special tour create") }}</span>
                </h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span>{{ translate("Special tours") }}</span>
                        </li>
                    </ol>
                </nav>
            </div>

            <div class="mb-3 d-flex justify-content-end">
                <a class="btn btn-success" href="/custom-pages">
                    {{ translate("Special tours") }}</a
                >
            </div>
        </div>

        <div class="card c-form-card mt-2 mb-2">
            <div class="card-header c-form-card-header">
                <label>{{ translate("Special tour") }}</label>
            </div>
            <div class="card-body pt-4">
                <form @submit.prevent="submit">
                    <div class="row g-3">
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
                            <label>{{ translate("Image") }}</label>
                            <div>
                                <ImageCropper
                                    @croppedImg="croppedImgSubmit"
                                    :ratio="1"
                                />
                                <br />

                                <image-zooming-component
                                    v-if="image"
                                    :file="image"
                                    :custom_class="'img-fluid img-thumbnail rounded'"
                                    :width="150"
                                />
                                <image-zooming-component
                                    v-else
                                    :file="image ?? 'empty.png'"
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

                        <div class="col-12 col-md-6">
                            <label>{{ translate("Banner") }}</label>
                            <div>
                               
                                <ExternalWebsitImageCropper
                                    @croppedImg="croppedBannerSubmit"
                                    :ratio="1"
                                />
                                <br />

                                <image-zooming-component
                                    v-if="banner"
                                    :file="banner"
                                    :custom_class="'img-fluid img-thumbnail rounded'"
                                    :width="150"
                                />
                                <image-zooming-component
                                    v-else
                                    :file="banner ?? 'empty.png'"
                                    :custom_class="'img-fluid img-thumbnail rounded'"
                                    :width="150"
                                />
                            </div>
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.banner"
                            >
                                {{ formErrors.banner[0] }}
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-12">
                        <label for="itinerary_description"
                            >{{ translate("Tours") }}
                        </label>
                        <Multiselect
                            v-model="form.tours"
                            mode="tags"
                            :close-on-select="false"
                            :createTag="true"
                            :options="plucked_tours"
                            :searchable="true"
                            :class="{
                                'invalid-bg': formErrors.tours,
                            }"
                        />
                        <div
                            class="invalid-feedback d-block"
                            v-if="formErrors.tours"
                        >
                            {{ formErrors.tours[0] }}
                        </div>
                    </div>
                    <div class="col-12 col-md-12">
                        <label for="itinerary_description"
                            >{{ translate("Description details") }}
                        </label>
                        <QuillEditor
                            v-model:content="form.description_details"
                            contentType="html"
                            toolbar="full"
                            theme="snow"
                        />
                        <div
                            class="invalid-feedback d-block"
                            v-if="formErrors.description_details"
                        >
                            {{ formErrors.description_details[0] }}
                        </div>
                    </div>

                    <div class="mt-3">
                        <button
                            type="submit"
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
import Multiselect from "@vueform/multiselect";
// import ImageCropper from "@components/global/ImageCropper.vue";
import { QuillEditor } from "@vueup/vue-quill";
import "@vueup/vue-quill/dist/vue-quill.snow.css";
import Faq from "@components/backend/TourCountries/Faq.vue";

export default {
    props: ["custom_page_id"],
    components: {
        Master,
        Multiselect,
        QuillEditor,
        // ImageCropper,
        Faq,
    },
    created() {
        this.fetchTours();
        if (this.custom_page_id) {
            this.getCustomPageRecords();
        }
    },
    data() {
        return {
            form: {
                custom_page_id: this.custom_page_id ?? "",
                title: "",
                banner: "",
                image: "",
                description_details: "",
                tours: [],
            },
            plucked_tours: [],
            formErrors: [],
            formStatus: true,
            banner: "",
            image: "", 
        };
    },
    methods: {
        getCustomPageRecords() {
            axios
                .get("/api/edit-custom-page/" + this.custom_page_id)
                .then((response) => {
                    this.form.title = response.data.title;
                    this.form.description_details =
                        response.data.description_details;
                    this.image = response.data.image;
                    this.banner = response.data.banner;
                    this.form.tours = response.data.tours;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },

        croppedImgSubmit(img) {
            this.form.image = img;
            this.image = img;
        },
        croppedBannerSubmit(img) {
            this.form.banner = img;
            this.banner = img;
        },

        submit() {
            this.formStatus = false;
            if (this.custom_page_id) {
                this.form.process_status = "Update";
            } else {
                this.form.process_status = "New";
            }
            axios
                .post("/api/custom-page-save", this.form)
                .then((response) => {
                    this.form.title = "";
                    this.form.description_details = [];
                    this.image = "";
                    this.banner = "";
                    
                    toastr.success(this.translate("Record saved successfully"));
                    this.formErrors = [];

                    setTimeout(() => {
                         
                        window.location.href = "/custom-page-details/"+response.data;
                        // this.getCustomPageRecords();
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
        setAltImg(event) {
            event.target.src = "/images/default.jpg";
        },
        fetchTours() {
            axios
                .get("/api/tours-pluck")
                .then((response) => {
                    this.plucked_tours = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
    },
};
</script>
<style>
.c-form-card {
    padding: 0px !important;
    border-top-left-radius: 15px !important;
    border-top-right-radius: 15px !important;
}
.c-form-card-header {
    background: #198754 !important;
    color: #fff !important;
    font-size: 1.5rem !important;
    border-top-left-radius: 15px !important;
    border-top-right-radius: 15px !important;
}
</style>
