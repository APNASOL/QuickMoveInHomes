<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h3 class="mb-0 c-theme-text-color">
                    <span
                        >{{ property.title }} - {{ translate("Details") }}</span
                    >
                </h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item c-theme-text-color">
                            <a class="c-theme-text-color" href="#">Property</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span>Details</span>
                        </li>
                    </ol>
                </nav>
            </div>
            <div class="mb-3 d-flex justify-content-end">
                <a
                    class="btn btn-success justify-content-end"
                    href="/properties"
                >
                    <i class="bi bi-list"></i> {{ translate("Properties") }}</a
                >
            </div>
        </div>

        <section class="section">
            <div class="card c-card-border container-fluid">
                <div class="card-body pt-4">
                    <div class="d-flex justify-content-between">
                        <div>
                            <h1 class="c-theme-text-color">
                                {{ property.title }}
                            </h1>
                        </div>
                        <div>
                            <a
                                class="text-end btn text-success btn-sm fs-6 p-2"
                                type="button"
                                :title="translate('Edit')"
                                :href="'/property/edit/' + property_id"
                            >
                                <i class="bi bi-pencil"></i>
                            </a>
                        </div>
                    </div>
                    <div class="row g-3">
                        <div class="col-12">
                            <b>{{ translate("Is this open house") }}</b
                            ><br />
                            <div class="d-inline-block me-2">
                                {{ translate("No") }}
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
                                    @change="initOpenHouse(form.status)"
                                />
                                <label class="form-check-label">{{
                                    translate("Yes")
                                }}</label>
                            </div>
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.status"
                            >
                                {{ formErrors.status[0] }}
                            </div>
                        </div>
                        <div
                            class="row g-3"
                            v-if="
                                property.is_open_house &&
                                property.is_open_house != 0
                            "
                        >
                            <h3 class="c-theme-text-color">
                                Open house details
                            </h3>

                            <div class="col-12 col-md-6">
                                <b>{{ translate("Date") }}</b
                                ><br />
                                {{ property.open_house_date }}
                            </div>
                            <div class="col-12 col-md-6">
                                <b>{{ translate("Start time") }}</b
                                ><br />
                                {{ property.open_house_start_time }}
                            </div>
                            <div class="col-12 col-md-6">
                                <b>{{ translate("End time") }}</b
                                ><br />
                                {{ property.open_house_end_time }}
                            </div>
                            <div class="col-12 col-md-6">
                                <b>{{ translate("Description") }}</b
                                ><br />
                                {{ property.open_house_description }}
                            </div>
                            <hr />
                        </div>

                        <h3 class="c-theme-text-color">
                            Property information details
                        </h3>
                        <div class="col-12">
                            <b>{{ translate("Title") }}</b
                            ><br />
                            {{ property.title }}
                        </div>

                        <div class="col-12">
                            <b>{{ translate("Community") }}</b
                            ><br />
                            {{ property.community_name }}
                        </div>
                        <!-- <div class="col-12" v-if="property.incentives">
                                <b>{{ translate("Incentives") }}</b>
                                <ul>
                                    <li
                                        v-for="incentive in property.incentives"
                                        :key="incentive.id"
                                    >
                                        {{ incentive }}
                                    </li>
                                </ul>
                            </div> -->

                        <div class="col-12">
                            <b>{{ translate("Description") }}</b
                            ><br />
                            {{ property.description }}
                        </div>

                        <div class="col-12">
                            <b>{{ translate("Address") }}</b
                            ><br />
                            {{ property.address }}<br />
                            {{ property.city }}, {{ property.state }}
                            {{ property.zip_code }}
                        </div>

                        <div class="col-12 col-md-6">
                            <b>{{ translate("Price") }}</b
                            ><br />
                            ${{ property.price }}
                        </div>

                        <div class="col-12 col-md-6">
                            <b>{{ translate("Bedrooms") }}</b
                            ><br />
                            {{ property.bedrooms }}
                        </div>

                        <div class="col-12 col-md-6">
                            <b>{{ translate("Square Feet") }}</b
                            ><br />
                            {{ property.square_feet }}
                        </div>

                        <div class="col-12 col-md-6">
                            <b>{{ translate("Lot Size") }}</b
                            ><br />
                            {{ property.lot_size }}
                        </div>

                        <div class="col-12 col-md-6">
                            <b>{{ translate("Property Type") }}</b
                            ><br />
                            {{ property.property_type }}
                        </div>

                        <div class="col-12 col-md-6">
                            <b>{{ translate("Listing Type") }}</b
                            ><br />
                            {{ property.listing_type }}
                        </div>
                        <div class="col-12 col-md-6">
                            <b>{{ translate("Latitude") }}</b
                            ><br />
                            {{ property.latitude }}
                        </div>
                        <div class="col-12 col-md-6">
                            <b>{{ translate("Longitude") }}</b
                            ><br />
                            {{ property.longitude }}
                        </div>

                        <div class="col-12 col-md-6">
                            <b>{{ translate("Year Built") }}</b
                            ><br />
                            {{ property.year_built }}
                        </div>

                        <div class="col-12 col-md-6">
                            <b>{{ translate("HOA") }}</b
                            ><br />
                            {{ property.hoa_name }}
                        </div>

                        <div class="col-12 col-md-6">
                            <b>{{ translate("Association Fee") }}</b
                            ><br />
                            {{ property.association_fee }}
                        </div>

                        <div class="col-12 col-md-6">
                            <b>{{ translate("CIC") }}</b
                            ><br />
                            {{ property.cic ? "Yes" : "NO" }}
                        </div>

                        <div class="col-12 col-md-6">
                            <b>{{ translate("School") }}</b
                            ><br />
                            {{ property.school_name }}
                        </div>

                        <hr />
                        <h3 class="c-theme-text-color">
                            Property Features details
                        </h3>

                        <div class="col-12 col-md-6">
                            <b>{{ translate("Feature Name") }}</b
                            ><br />
                            {{ property.name }}
                        </div>

                        <div class="col-12 col-md-6">
                            <b>{{ translate("Fireplace Type") }}</b
                            ><br />
                            {{ property.fireplace_type }}
                        </div>

                        <div class="col-12 col-md-6">
                            <b>{{ translate("Kitchen Pantry Type") }}</b
                            ><br />
                            {{ property.kitchen_pantry_type }}
                        </div>

                        <div class="col-12 col-md-6">
                            <b>{{ translate("Reach-In Closet") }}</b
                            ><br />
                            {{ property.reach_in }}
                        </div>

                        <div class="col-12 col-md-6">
                            <b>{{ translate("Walk-In Closet") }}</b
                            ><br />
                            {{ property.walk_in }}
                        </div>

                        <div class="col-12 col-md-6">
                            <b>{{ translate("Laundry Closet") }}</b
                            ><br />
                            {{ property.laundry_closet }}
                        </div>

                        <div class="col-12 col-md-6">
                            <b>{{ translate("Closet Location") }}</b
                            ><br />
                            {{ property.closet_location }}
                        </div>

                        <div class="col-12 col-md-6">
                            <b>{{ translate("Bedroom Location") }}</b
                            ><br />
                            {{ property.bedroom_location }}
                        </div>

                        <div class="col-12 col-md-6">
                            <b>{{ translate("Bathroom Type") }}</b
                            ><br />
                            {{ property.bathroom_type }}
                        </div>

                        <div class="col-12 col-md-6">
                            <b>{{ translate("Bathroom Status") }}</b
                            ><br />
                            {{ property.bathroom_status }}
                        </div>

                        <div class="col-12 col-md-6">
                            <b>{{ translate("Pool Shape") }}</b
                            ><br />
                            {{ property.pool_shape }}
                        </div>

                        <div class="col-12 col-md-6">
                            <b>{{ translate("Water Features") }}</b
                            ><br />
                            {{ property.water_features }}
                        </div>

                        <div class="col-12 col-md-6">
                            <b>{{ translate("Pool Status") }}</b
                            ><br />
                            {{ property.pool_status }}
                        </div>

                        <div class="col-12 col-md-6">
                            <b>{{ translate("Spa") }}</b
                            ><br />
                            {{ property.spa }}
                        </div>

                        <div class="col-12 col-md-6">
                            <b>{{ translate("Fencing Material") }}</b
                            ><br />
                            {{ property.fencing_material }}
                        </div>

                        <div class="col-12 col-md-6">
                            <b>{{ translate("Fencing Status") }}</b
                            ><br />
                            {{ property.fencing_status }}
                        </div>

                        <div class="col-12 col-md-6">
                            <b>{{ translate("Parking Enclosure") }}</b
                            ><br />
                            {{ property.parking_enclosure }}
                        </div>

                        <div class="col-12 col-md-6">
                            <b>{{ translate("Private Bath") }}</b
                            ><br />
                            {{ property.private_bath }}
                        </div>

                        <div class="col-12 col-md-6">
                            <b>{{ translate("Outdoor Shower") }}</b
                            ><br />
                            {{ property.outdoor_shower }}
                        </div>

                        <div class="col-12 col-md-6">
                            <b>{{ translate("Landscape Maintenance") }}</b
                            ><br />
                            {{ property.landscape_maintenance }}
                        </div>

                        <div class="col-12 col-md-6">
                            <b>{{ translate("Foundation Conditions") }}</b
                            ><br />
                            {{ property.foundation_conditions }}
                        </div>
                        <hr />

                        <div class="d-flex justify-content-left">
                            <div>
                                <h3 class="c-theme-text-color">Main Image</h3>
                                <image-zooming-component
                                    :file="property.main_image"
                                    :width="260"
                                />
                            </div>
                            <div class="ms-5">
                                <h3 class="c-theme-text-color">Banner</h3>
                                <image-zooming-component
                                    :file="property.banner"
                                    :width="260"
                                />
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12 mt-3">
                        <h3 class="c-theme-text-color">
                            Property Photo Gallery
                        </h3>

                        <div>
                            <div class="card-body">
                                <!-- start of the loop -->
                                <div class="row">
                                    <div
                                        class="col-sm-2 col-lg-2 mb-4"
                                        v-for="file in property.files"
                                        :key="file.id"
                                    >
                                        <!-- images -->

                                        <div
                                            class=""
                                            v-if="file.type.match('image')"
                                        >
                                            <div class="text-center">
                                                <DeleteModal
                                                    :deleteId="file.id"
                                                    @deleteThis="deleteThis"
                                                />
                                            </div>

                                            <image-zooming-component
                                                :file="file.file_name"
                                                @loaded="fileLoaded"
                                            />
                                        </div>

                                        <!-- videos -->

                                        <div
                                            v-if="file.type.match('video')"
                                            class="card"
                                        >
                                            <video
                                                style="border-radius: 5px"
                                                class="video-js img-fluid img-thumbnail"
                                                controls
                                                preload="auto"
                                                data-setup="{}"
                                                @load="fileLoaded"
                                            >
                                                <source
                                                    :src="file.file_name"
                                                    :type="file.type"
                                                />
                                            </video>
                                        </div>

                                        <!-- files -->
                                        <div v-else class="card">
                                            <div
                                                v-if="file.extension == 'pdf'"
                                                class="card card-body p-2 text-center"
                                            >
                                                <img
                                                    src="/images/pdf.svg"
                                                    height="50"
                                                    alt="file logo"
                                                />
                                                <a
                                                    download
                                                    :href="file.file_name"
                                                >
                                                    {{
                                                        file.file_original_name
                                                    }}
                                                </a>
                                            </div>
                                            <div
                                                v-if="
                                                    file.extension == 'docx' ||
                                                    file.extension == 'doc'
                                                "
                                                class="card card-body p-2 text-center"
                                            >
                                                <img
                                                    src="/images/word.svg"
                                                    height="50"
                                                    alt="file logo"
                                                />
                                                <a
                                                    download
                                                    :href="file.file_name"
                                                >
                                                    {{
                                                        file.file_original_name
                                                    }}
                                                </a>
                                            </div>
                                            <div
                                                v-if="
                                                    file.extension == 'pptx' ||
                                                    file.extension == 'ppt'
                                                "
                                                class="card card-body p-2 text-center"
                                            >
                                                <img
                                                    src="/images/powerpoint.svg"
                                                    height="50"
                                                    alt="file logo"
                                                />
                                                <a
                                                    download
                                                    :href="file.file_name"
                                                >
                                                    {{
                                                        file.file_original_name
                                                    }}
                                                </a>
                                            </div>
                                            <div
                                                v-if="file.extension == 'excel'"
                                                class="card card-body p-2 text-center"
                                            >
                                                <img
                                                    src="images/excel.svg"
                                                    height="50"
                                                    alt="file logo"
                                                />
                                                <a
                                                    download
                                                    :href="file.file_name"
                                                >
                                                    {{
                                                        file.file_original_name
                                                    }}
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- end of the loop -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="openHouseModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" v-if="form.record_id">
                                {{ translate("Upate record") }}
                            </h5>
                            <h5 class="modal-title" v-else>
                                {{ translate("Open houes information") }}
                            </h5>
                            <button
                                ref="closeDatesModal"
                                type="button"
                                class="btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close"
                            ></button>
                        </div>
                        <div class="modal-body">
                            <form @submit.prevent="submit">
                                <div class="row g-3">
                                    <div class="col-12 col-md-12">
                                        <label for="date">{{
                                            translate("Date")
                                        }}</label>
                                        <Datepicker
                                            autoApply
                                            :multiple="false"
                                            :range="false"
                                            :range-options="{ autoRange: 5 }"
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
                                        <label for="start_time">{{
                                            translate("Start time")
                                        }}</label>
                                        <input
                                            type="time"
                                            class="form-control"
                                            :class="{
                                                'invalid-bg':
                                                    formErrors.start_time,
                                            }"
                                            v-model="form.start_time"
                                        />

                                        <div
                                            class="invalid-feedback animated fadeIn"
                                            v-if="formErrors.start_time"
                                        >
                                            {{ formErrors.start_time[0] }}
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-6">
                                        <label for="end_time">{{
                                            translate("End time")
                                        }}</label>
                                        <input
                                            type="time"
                                            class="form-control"
                                            :class="{
                                                'invalid-bg':
                                                    formErrors.end_time,
                                            }"
                                            v-model="form.end_time"
                                        />

                                        <div
                                            class="invalid-feedback animated fadeIn"
                                            v-if="formErrors.end_time"
                                        >
                                            {{ formErrors.end_time[0] }}
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-12">
                                        <label for="description">{{
                                            translate("Description")
                                        }}</label>
                                        <textarea
                                            type="number"
                                            class="form-control"
                                            id="description"
                                            v-model="form.description"
                                        ></textarea>

                                        <div
                                            class="invalid-feedback d-block"
                                            v-if="formErrors.description"
                                        >
                                            {{ formErrors.description[0] }}
                                        </div>
                                    </div>

                                    <div class="mt-2">
                                        <button
                                            type="button"
                                            @click="savePropertyAsOpenHouse"
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
                </div>
                <button
                    style="display: none"
                    class="btn btn-succss"
                    data-bs-target="#openHouseModal"
                    data-bs-toggle="modal"
                    ref="openOpenHouseModal"
                >
                    Open modal
                </button>
                <button
                    ref="closeOpenHouseModal"
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                ></button>
            </div>
        </section>
    </Master>
</template>

<script>
import Master from "@components/backend/layout/Master.vue";

import Datepicker from "@vuepic/vue-datepicker";
export default {
    components: {
        Master,

        Datepicker,
    },
    props: ["property_id"],
    created() {
        this.getPropertyDetails();
    },

    data() {
        return {
            property: [],

            form: {
                property_id: this.property_id,
                status: "",
                date: "",
                start_time: "",
                end_time: "",
                description: "",
            },
            formErrors: [],
            formStatus: true,
        };
    },
    methods: {
        getPropertyDetails() {
            axios
                .get("/api/get/property/details/" + this.property_id)
                .then((response) => {
                    this.property = response.data;
                    this.form.status = response.data.is_open_house;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },

        initOpenHouse(status) {
            if (status == true) {
                this.$refs.openOpenHouseModal.click();
            } else {
                axios
                    .get("/api/remove/property/open/house/" + this.property_id)
                    .then((response) => {
                        toastr.success(
                            this.translate("Property removed as open House")
                        );
                        this.getPropertyDetails();
                    })
                    .catch((error) => {
                        toastr.error(error.response.data.message);
                    });
            }
        },
        savePropertyAsOpenHouse() {
            this.formStatus = false;
            let formData = new FormData();

            if (this.form.date) {
                formData.append(
                    "date",
                    this.form.date.getMonth
                        ? this.form.date.toLocaleDateString("en-US")
                        : this.form.date
                        ? this.form.date
                        : ""
                );
            }
            formData.append("start_time", this.form.start_time);
            formData.append("end_time", this.form.end_time);
            formData.append("property_id", this.form.property_id);
            formData.append("description", this.form.description);
            formData.append("status", this.form.status);

            axios
                .post("/api/property/open/house/status/store", formData, {
                    headers: {
                        "Content-Type": "multipart/form-data", // Set the content type for file uploads
                    },
                })
                .then((response) => {
                    this.formStatus = true;
                    toastr.success(
                        this.translate(
                            "Property saved as open House successfully"
                        )
                    );
                    this.$refs.closeOpenHouseModal.click();
                    this.getPropertyDetails();
                    this.formErrors = [];
                })
                .catch((error) => {
                    this.formStatus = true;
                    // Display error messages
                    toastr.error(
                        error.response?.data?.message || "An error occurred."
                    );
                    if (error.response?.data?.errors) {
                        this.formErrors = error.response.data.errors;
                    }
                });
        },
        getProperty() {
            this.$refs.openOpenHouseModal.click();
            axios
                .get("/api/get/property/open/house/" + this.property_id)
                .then((response) => {
                    this.form.date = response.data.date;
                    this.form.start_time = response.data.start_time;
                    this.form.end_time = response.data.end_time;
                    this.form.descriptions = response.data.descriptions;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },

        deleteThis(id) {
            axios
                .post(
                    "/api/property/photo/gallery/delete/" +
                        id +
                        "/" +
                        this.property_id
                )
                .then(() => {
                    toastr.success(
                        this.translate("Photo deleted successfully.")
                    );
                    this.getPropertyDetails();
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
    },
};
</script>

<style>
.c-linked {
    text-decoration: none;
}
.c-mouse-over {
    cursor: pointer;
    font-weight: bold;
}
.c-theme-text-color {
    color: #174696 !important;
    text-decoration: none !important;
}
</style>
