<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h1 class="mb-0">
                    <span v-if="status == 'edit'">Edit Itinerary</span>
                    <span v-else>Create Itinerary</span>
                </h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span v-if="status == 'edit'">Edit Itinerary</span>
                            <span v-else>Create Itinerary</span>
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
                        <div class="col-12 col-md-6">
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

                        <div class="col-12 col-md-6">
                            <label>{{ translate("Image") }}</label>
                            <div>
                                
                                <ExternalWebsitImageCropper
                                @croppedImg="croppedImgSubmit"
                            />
                                <br />
                                <img
                                    v-if="itinerary_image"
                                    :src="itinerary_image"
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
// import ImageCropper from "@components/global/ImageCropper.vue";
import Multiselect from "@vueform/multiselect";
import { QuillEditor } from "@vueup/vue-quill";
import "@vueup/vue-quill/dist/vue-quill.snow.css";
export default {
    props: ["tour_id", "process_status", "itinerary_id"],
    components: {
        Master,
        // ImageCropper,
        Multiselect,
        QuillEditor,
    },
    created() {
        // fetching itinerary...
        if(this.itinerary_id)
        {
            this.getItinerary();
        } 
    },
    data() {
        return {
            form: {
                id: this.itinerary_id,
                tour_id: this.tour_id,
                name: "",
                description: "",
                image: "",
                status: this.process_status,
            },
            itinerary_image: "",
            formErrors: [],
            formStatus: true,
        };
    },
    methods: {
        async getItinerary() {
            await axios
                .get("/api/get-itinerary-edit/" + this.itinerary_id)
                .then((response) => {
                    this.form.title = response.data.title;
                    this.form.description = response.data.description;

                    this.itinerary_image = response.data.image;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        croppedImgSubmit(img) {
            this.form.image = img;
            this.itinerary_image = img;
        },
        async submit() {
            this.formStatus = false;
            await axios
                .post("/api/itinerary-save", this.form)
                .then((response) => {
                    this.formStatus = true;
 
                    toastr.success(this.translate("Itinerary saved successfully"));

                    this.formErrors = [];
                    // window.location.href = window.location.href;
                    setTimeout(() => { 
                        window.location.href = "/details-tour/"+this.tour_id;
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
<style>
@import "@vueform/multiselect/themes/default.css";
</style>
