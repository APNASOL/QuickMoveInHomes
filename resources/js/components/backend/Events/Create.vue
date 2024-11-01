<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h3 class="mb-0">
                    <span v-if="event_id"
                        >{{ form.title }} {{ translate("Update") }}</span
                    >
                    <span v-else>{{ translate("Create New Event") }}</span>
                </h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span>{{ translate("Events") }}</span>
                        </li>
                    </ol>
                </nav>
            </div>

            <div class="mb-3 d-flex justify-content-end">
                <a class="btn btn-success" href="/events">
                    {{ translate("View All Events") }}
                </a>
            </div>
        </div>

        <div class="card c-form-card mt-2 mb-2">
            <div class="card-header c-form-card-header">
                <label>{{ translate("Event Details") }}</label>
            </div>
            <div class="card-body pt-4">
                <form>
                    <div class="row g-3">
                         

                        <div class="col-12 col-md-6">
                            <label for="title">
                                {{ translate("Event title") }}
                            </label>
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
                            <label for="phone">
                                {{ translate("Event Date") }}
                            </label>
                            <Datepicker
                                autoApply
                                :enableTimePicker="false"
                                :class="{
                                    'invalid-bg': formErrors.date,
                                }"
                                v-model="form.date"
                            >
                            </Datepicker>

                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.date"
                            >
                                {{ formErrors.date[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="registeration_link">
                                {{ translate("Registeration link") }}
                            </label>
                            <input
                                type="link"
                                class="form-control"
                                id="registeration_link"
                                :class="{
                                    'invalid-bg': formErrors.registeration_link,
                                }"
                                v-model="form.registeration_link"
                            />

                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.registeration_link"
                            >
                                {{ formErrors.registeration_link[0] }}
                            </div>
                        </div>

                        <div>
                        <div class="col-12 col-md-12">
                            <label>
                                {{ translate("Description") }}
                            </label>
                            <QuillEditor
                            v-model:content="form.description"
                            contentType="html"
                            toolbar="full"
                            theme="snow"
                        />

                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.description"
                            >
                                {{ formErrors.description[0] }}
                            </div>
                        </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <div class="c-files">
                                <label class="col-6 col-form-label">{{
                                    translate("Image")
                                }}</label>

                                <br />
                                <img
                                    :src="image"
                                    width="100"
                                    class="mb-2 img-fluid img-thumbnail"
                                    @error="setAltImg"
                                />
                                <br />
                                <ImageCropper
                                    @croppedImg="croppedImgSubmit"
                                    :ratio="1"
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

                    <br />
                    <div class="progress" v-if="progress_bar == 1">
                        <div
                            class="progress-bar progress-bar-striped background-theme progress-bar-animated"
                            role="progressbar"
                            :style="'width: ' + uploadPercentage + '%'"
                            :aria-valuenow="uploadPercentage"
                            aria-valuemin="0"
                            aria-valuemax="100"
                        >
                            {{ uploadPercentage }}%
                        </div>
                    </div>
                    

                    <div>
                        <button
                            type="button"
                            @click="submit"
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
import { QuillEditor } from "@vueup/vue-quill";
import "@vueup/vue-quill/dist/vue-quill.snow.css";
import Datepicker from "@vuepic/vue-datepicker";
import "@vuepic/vue-datepicker/dist/main.css";

export default {
    props: ["event_id"],
    components: {
        Master,
        QuillEditor,
        Datepicker,
    },
    created() {
        if (this.event_id) {
            this.getEventDetails();
        }
    },
    data() {
        return {
            form: {
                id: this.event_id ?? "",
                title: "",
                date: "",
                description: "",
                registeration_link: "",
                image: "",
            },
            formErrors: {},
            formStatus: true,
            image: "",
        };
    },
    methods: {
        getEventDetails() {
            axios
                .get(`/api/get/event/${this.event_id}`)
                .then((response) => {
                     
                    this.image = response.data.image;
                   

                    this.form.id =  response.data.id;
                this.form.title= response.data.title;
                this.form.date = response.data.date;
                this.form.description = response.data.description;
                this.form.registeration_link = response.data.registeration_link;
                 

                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        croppedImgSubmit(img) {
            this.form.image = img;
            this.image = img;
        },

        submit() {
            this.formStatus = false;
            
            axios
                .post("/api/event/store", this.form)
                .then(() => {
                    toastr.success(this.translate("Event saved successfully"));
                    this.formErrors = {};
                    setTimeout(() => {
                        window.location.href = "/events";
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
        setAltImg(event) {
        event.target.src = "/images/default.jpg";
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
