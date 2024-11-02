<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h3 class="mb-0 c-theme-text-color">
                    <span v-if="incentive_id">{{
                        translate("Edit Incentive")
                    }}</span>
                    <span v-else>{{ translate("Create Incentive") }}</span>
                </h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item" aria-current="page">
                            <span>{{ translate("Incentives") }}</span>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span v-if="incentive_id">{{
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
                    href="/incentives"
                >
                    <i class="bi bi-list"></i> {{ translate("Incentives") }}</a
                >
            </div>
        </div>

        <div class="card c-card-border">
            <div class="card-body pt-4">
                <form @submit.prevent="submit">
                    <div class="row g-3">
                        <div class="col-12">
                            <label
                                >{{ translate("Choose Status") }} {{ home_id }}
                            </label>
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

                        <div class="col-12 col-md-6">
                            <label for="title">{{ translate("Title") }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="title"
                                :class="{
                                    'invalid-bg': formErrors.title,
                                }"
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
                            <label for="interest_rate_first_year">{{
                                translate("Interest reate first year")
                            }}</label>
                            <input
                                type="decimal"
                                class="form-control"
                                id="interest_rate_first_year"
                                :class="{
                                    'invalid-bg':
                                        formErrors.interest_rate_first_year,
                                }"
                                v-model="form.interest_rate_first_year"
                            />

                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.interest_rate_first_year"
                            >
                                {{ formErrors.interest_rate_first_year[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="start_date">{{
                                translate("Start Date")
                            }}</label>

                            <Datepicker
                                autoApply
                                :multiple="false"
                                :range="false"
                                :range-options="{ autoRange: 5 }"
                                :enableTimePicker="false"
                                :class="{
                                    'invalid-bg': formErrors.start_date,
                                }"
                                v-model="form.start_date"
                            >
                            </Datepicker>

                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.start_date"
                            >
                                {{ formErrors.start_date[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="end_date">{{
                                translate("End Date")
                            }}</label>
                            <Datepicker
                                autoApply
                                :multiple="false"
                                :range="false"
                                :range-options="{ autoRange: 5 }"
                                :enableTimePicker="false"
                                :class="{
                                    'invalid-bg': formErrors.end_date,
                                }"
                                v-model="form.end_date"
                            >
                            </Datepicker>

                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.end_date"
                            >
                                {{ formErrors.end_date[0] }}
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label for="builder_id">{{
                                translate("Builder")
                            }}</label>
                            <Multiselect
                                v-model="form.builder_id"
                                :options="builderOptions"
                                :placeholder="translate('Search by Builder')"
                                :searchable="true"
                                :class="{
                                    'invalid-bg': formErrors.builder_id,
                                }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.builder_id"
                            >
                                {{ formErrors.builder_id[0] }}
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label>{{ translate("Incentive Banner") }}</label>
                            <div>
                                <ExternalWebsitImageCropper
                                    @croppedImg="cropTheIncentiveBanner"
                                />
                                <br />
                                <image-zooming-component
                                    v-if="incentive_banner"
                                    :file="incentive_banner ?? 'empty.png'"
                                    :custom_class="'img-fluid img-thumbnail'"
                                    :width="'100px'"
                                />
                            </div>
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.incentive_banner"
                            >
                                {{ formErrors.incentive_banner[0] }}
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-12 mt-3">
                        <label for="descriptions"
                            >{{ translate("Description") }}
                        </label>
                        <QuillEditor
                            v-model:content="form.descriptions"
                            contentType="html"
                            toolbar="full"
                            theme="snow"
                        />
                        <div
                            class="invalid-feedback d-block"
                            v-if="formErrors.descriptions"
                        >
                            {{ formErrors.descriptions[0] }}
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
import { QuillEditor } from "@vueup/vue-quill";
import "@vueup/vue-quill/dist/vue-quill.snow.css";
import axios from "axios";
import Datepicker from "@vuepic/vue-datepicker";
import Multiselect from "@vueform/multiselect";
export default {
    props: ["incentive_id"],
    components: {
        Master,
        Datepicker,
        QuillEditor,
        Multiselect
    },
    created() {
        this.pluckBuilders();
        if (this.incentive_id) {
            this.getIncentive();
        }
    },
    data() {
        return {
            form: {
                incentive_id: this.incentive_id,
                title: "",
                start_date: "",
                end_date: "",
                descriptions: "",
                interest_rate_first_year: "",
                home_id: "",
                status: true, // Default status to true (active)
                incentive_banner: "",
                builder_id: "",
            },
            incentive_banner: "",
            formErrors: [],
            formStatus: true,
            homes_options: [],
            builderOptions: [],
        };
    },
    methods: {
        getIncentive() {
            axios
                .get("/api/get/incentive/" + this.incentive_id)
                .then((response) => {
                    this.form.title = response.data.title;
                    this.form.start_date = response.data.start_date;
                    this.form.end_date = response.data.end_date;
                    this.form.builder_id = response.data.builder_id;
                    this.form.descriptions = response.data.description;
                    this.form.interest_rate_first_year =
                        response.data.interest_rate_first_year;
                    this.form.status = response.data.status;
                    this.incentive_banner = response.data.incentive_banner;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        submit() {
            this.formStatus = false;

            axios
                .post("/api/incentive/store", this.form)
                .then((response) => {
                    this.formStatus = true;
                    toastr.success(
                        this.translate("Incentive saved successfully")
                    );
                    this.formErrors = [];

                    window.location.href = "/incentives";
                })
                .catch((error) => {
                    this.formStatus = true;
                    toastr.error(error.response.data.message);
                    if (error.response.data.errors) {
                        this.formErrors = error.response.data.errors;
                    }
                });
        },
        cropTheIncentiveBanner(img) {
            this.form.incentive_banner = img;
            this.incentive_banner = img;
        },
        pluckBuilders() {
            axios
                .get("/api/builders/pluck")
                .then((response) => {
                    this.builderOptions = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
    },
};
</script>

<style>
/* Add your custom styles here */
</style>
