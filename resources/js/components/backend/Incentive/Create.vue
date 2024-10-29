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
                            <label for="how_much">{{
                                translate("How much")
                            }}</label>
                            <input type="number"
                                class="form-control"
                                id="how_much"
                                :class="{
                                    'invalid-bg': formErrors.how_much,
                                }"
                                v-model="form.how_much"
                            />

                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.how_much"
                            >
                                {{ formErrors.how_much[0] }}
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

                        <div class="col-12 col-md-12">
                            <label for="descriptions">{{
                                translate("Description")
                            }}</label>
                            <textarea
                                class="form-control"
                                id="descriptions"
                                :class="{
                                    'invalid-bg': formErrors.descriptions,
                                }"
                                v-model="form.descriptions"
                                rows="2"
                            ></textarea>

                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.descriptions"
                            >
                                {{ formErrors.descriptions[0] }}
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

import axios from "axios";
import Datepicker from "@vuepic/vue-datepicker";

export default {
    props: ["incentive_id"],
    components: {
        Master,
        Datepicker,
    },
    created() {
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
                how_much: "",
                home_id: "",
                status: true, // Default status to true (active)
            },
            formErrors: [],
            formStatus: true,
            homes_options: [],
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
                    this.form.descriptions = response.data.description;
                    this.form.how_much = response.data.how_much;
                    this.form.status = response.data.status;
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
    },
};
</script>

<style>
/* Add your custom styles here */
</style>
