<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h3 class="mb-0 c-theme-text-color">
                    <span v-if="community_id">{{
                        translate("Edit community")
                    }}</span>
                    <span v-else>{{ translate("Create community") }}</span>
                </h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item" aria-current="page">
                            <span>{{ translate("Communities") }}</span>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span v-if="community_id">{{
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
                    href="/communities"
                >
                    <i class="bi bi-list"></i> {{ translate("Communities") }}</a
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
                            <label for="amenites">{{
                                translate("Amenities")
                            }}</label>
                            <Multiselect
                                v-model="form.amenites"
                                :options="amenitesOptions"
                                :placeholder="translate('Search by amenity')"
                                :searchable="true"
                                mode="tags"
                                :class="{
                                    'invalid-bg': formErrors.amenites,
                                }"
                            />
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.amenites"
                            >
                                {{ formErrors.amenites[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="hoa_id">{{ translate("HOA") }}</label>
                            <Multiselect
                                v-model="form.hoa_id"
                                :options="hoasOptions"
                                :placeholder="translate('Search by HOA')"
                                :searchable="true"
                                :class="{
                                    'invalid-bg': formErrors.hoa_id,
                                }"
                            />
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.hoa_id"
                            >
                                {{ formErrors.hoa_id[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="neighborhood">{{
                                translate("Neighborhood")
                            }}</label>
                            <Multiselect
                                v-model="form.neighborhood"
                                :options="neighborhoodOptions"
                                :placeholder="
                                    translate('Search by neighborhood')
                                "
                                :searchable="true"
                                mode="tags"
                                :class="{
                                    'invalid-bg': formErrors.neighborhood,
                                }"
                            />
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.neighborhood"
                            >
                                {{ formErrors.neighborhood[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="regions">{{
                                translate("Las Vegas Regions")
                            }}</label>
                            <Multiselect
                                v-model="form.regions"
                                :options="regionOptions"
                                :placeholder="translate('Search by region')"
                                :searchable="true"
                                mode="tags"
                                :class="{
                                    'invalid-bg': formErrors.regions,
                                }"
                            />
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.regions"
                            >
                                {{ formErrors.regions[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="legal_subdivision">{{
                                translate("Legal Subdivision")
                            }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="legal_subdivision"
                                :class="{
                                    'invalid-bg': formErrors.legal_subdivision,
                                }"
                                v-model="form.legal_subdivision"
                            />
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.legal_subdivision"
                            >
                                {{ formErrors.legal_subdivision[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="masterplan">{{
                                translate("Masterplan")
                            }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="masterplan"
                                :class="{ 'invalid-bg': formErrors.masterplan }"
                                v-model="form.masterplan"
                            />
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.masterplan"
                            >
                                {{ formErrors.masterplan[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="sub_association">{{
                                translate("Sub Association")
                            }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="sub_association"
                                :class="{
                                    'invalid-bg': formErrors.sub_association,
                                }"
                                v-model="form.sub_association"
                            />
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.sub_association"
                            >
                                {{ formErrors.sub_association[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="cic">{{ translate("CIC") }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="cic"
                                :class="{ 'invalid-bg': formErrors.cic }"
                                v-model="form.cic"
                            />
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.cic"
                            >
                                {{ formErrors.cic[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="lid">{{ translate("LID") }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="lid"
                                :class="{ 'invalid-bg': formErrors.lid }"
                                v-model="form.lid"
                            />
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.lid"
                            >
                                {{ formErrors.lid[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="cid">{{ translate("CID") }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="cid"
                                :class="{ 'invalid-bg': formErrors.cid }"
                                v-model="form.cid"
                            />
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.cid"
                            >
                                {{ formErrors.cid[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="sid_lid_fee">{{
                                translate("SID/LID Fee")
                            }}</label>
                            <input
                                type="number"
                                step="0.01"
                                class="form-control"
                                id="sid_lid_fee"
                                :class="{
                                    'invalid-bg': formErrors.sid_lid_fee,
                                }"
                                v-model="form.sid_lid_fee"
                            />
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.sid_lid_fee"
                            >
                                {{ formErrors.sid_lid_fee[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="proximity_to_strip">{{
                                translate("Proximity to Strip")
                            }}</label>
                            <input
                                type="number"
                                step="0.01"
                                class="form-control"
                                id="proximity_to_strip"
                                :class="{
                                    'invalid-bg': formErrors.proximity_to_strip,
                                }"
                                v-model="form.proximity_to_strip"
                            />
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.proximity_to_strip"
                            >
                                {{ formErrors.proximity_to_strip[0] }}
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label for="proximity_to_airport">{{
                                translate("Proximity to Airport")
                            }}</label>
                            <input
                                type="number"
                                step="0.01"
                                class="form-control"
                                id="proximity_to_airport"
                                :class="{
                                    'invalid-bg':
                                        formErrors.proximity_to_airport,
                                }"
                                v-model="form.proximity_to_airport"
                            />
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.proximity_to_airport"
                            >
                                {{ formErrors.proximity_to_airport[0] }}
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label for="sid_lid_payment_frequency">{{
                                translate("SID/LID Payment Frequency")
                            }}</label>
                            <textarea
                                class="form-control"
                                id="sid_lid_payment_frequency"
                                :class="{
                                    'invalid-bg':
                                        formErrors.sid_lid_payment_frequency,
                                }"
                                v-model="form.sid_lid_payment_frequency"
                            ></textarea>
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.sid_lid_payment_frequency"
                            >
                                {{ formErrors.sid_lid_payment_frequency[0] }}
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
                            <label for="latitude">{{
                                translate("Latitude")
                            }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="latitude"
                                :class="{ 'invalid-bg': formErrors.latitude }"
                                v-model="form.latitude"
                            />
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.latitude"
                            >
                                {{ formErrors.latitude[0] }}
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label for="longitude">{{
                                translate("Longitude")
                            }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="longitude"
                                :class="{ 'invalid-bg': formErrors.longitude }"
                                v-model="form.longitude"
                            />
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.longitude"
                            >
                                {{ formErrors.longitude[0] }}
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
                            <label for="nearby_attractions">{{
                                translate("Nearby Attractions")
                            }}</label>
                            <textarea
                                class="form-control"
                                id="nearby_attractions"
                                :class="{
                                    'invalid-bg': formErrors.nearby_attractions,
                                }"
                                v-model="form.nearby_attractions"
                            ></textarea>
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.nearby_attractions"
                            >
                                {{ formErrors.nearby_attractions[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="main_image">{{
                                translate("Main image")
                            }}</label>
                            <div class="mt-3 mb-2">
                                <img
                                    v-if="form.main_image"
                                    :src="form.main_image ?? '/images/default.jpg'"
                                    :custom_class="'img-fluid img-thumbnail rounded'"
                                    :width="125"
                                />
                                <img
                                    v-else
                                    :src="existing_main_image ?? '/images/default.jpg'"
                                    :custom_class="'img-fluid img-thumbnail rounded'"
                                    :width="125"
                                />
                                 
                                </div>
                                <ImageCropper
                                    @croppedImg="croppedImgSubmit"
                                    :ratio="1"
                                /> 

                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.main_image"
                            >
                                {{ formErrors.main_image[0] }}
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label for="files">{{
                                translate("Upload Images/Videos")
                            }}</label>
                            <ImageDropper
                                DropperType="multiple"
                                fileTypes=".jpg,.jpeg,.png,.mp4"
                                @emitMethod="moreInfoDropperDataPassing"
                            />

                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.files"
                            >
                                {{ formErrors.files[0] }}
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
    props: ["community_id"],
    components: {
        Master,
        ImageCropper,
        Multiselect,
    },
    created() {
        this.pluckamenity();
        this.pluckHoas();
        this.pluckNeighborhoods();
        this.pluckRegions();
        if (this.community_id) {
            this.getCommunity();
        }
    },
    data() {
        return {
            form: {
                id: this.community_id,
                name: "",
                description: null,
                location: null,
                amenites: [],
                hoa_id: null,
                neighborhood: [],
                regions: [],
                files: null,
                map_location: null,
                legal_subdivision: null,
                nearby_properties: null,
                masterplan: null,
                sub_association: null,
                cic: null,
                longitude: null,
                latitude: null,
                lid: null,
                cid: null,
                sid_lid_fee: null,
                sid_lid_payment_frequency: null,
                proximity_to_strip: null,
                proximity_to_airport: null,
                nearby_attractions: null,
                main_image: null,
            },
            amenitesOptions: [],
            neighborhoodOptions: [],
            hoasOptions: [],
            regionOptions: [],
            formErrors: [],
            formStatus: true,
            community_image: "",
        };
    },
    methods: {
        moreInfoDropperDataPassing(files) {
            this.form.files = files;
        },

        getCommunity() {
            axios
                .get("/api/get/community/" + this.community_id)
                .then((response) => {
                    const data = response.data;

                    // Populate form fields based on the API response
                    this.form.id = data.id || this.community_id; // Keep the original id if not found
                    this.form.name = data.name || "";
                    this.form.description = data.description || null;
                    this.form.location = data.location || null;
                    this.form.latitude = data.latitude || null;
                    this.form.longitude = data.longitude || null;
                    this.form.amenites = data.amenites; // Ensure this is an array
                    this.form.hoa_id = data.hoa_id || null;
                    this.form.neighborhood = data.neighborhood || []; // Ensure this is an array
                    this.form.regions = data.regions || []; // Ensure this is an array
                    this.form.files = data.files || null;
                    this.form.map_location = data.map_location || null;
                    this.form.legal_subdivision =
                        data.legal_subdivision || null;
                    this.form.nearby_properties =
                        data.nearby_properties || null;
                    this.form.masterplan = data.masterplan || null;
                    this.form.sub_association = data.sub_association || null;
                    this.form.cic = data.cic || null;
                    this.form.lid = data.lid || null;
                    this.form.cid = data.cid || null;
                    this.form.sid_lid_fee = data.sid_lid_fee || null;
                    this.form.sid_lid_payment_frequency =
                        data.sid_lid_payment_frequency || null;
                    this.form.proximity_to_strip =
                        data.proximity_to_strip || null;
                    this.form.proximity_to_airport =
                        data.proximity_to_airport || null;
                    this.form.nearby_attractions =
                        data.nearby_attractions || null;

                    this.existing_main_image = data.main_image || null; // Set the main image
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },

        croppedImgSubmit(img) {
            this.form.main_image = img;
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
        pluckHoas() {
            axios
                .get("/api/home/owners/pluck/")
                .then((response) => {
                    this.hoasOptions = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        pluckRegions() {
            axios
                .get("/api/regions/pluck/")
                .then((response) => {
                    this.regionOptions = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        pluckNeighborhoods() {
            axios
                .get("/api/neighborhoods/pluck/")
                .then((response) => {
                    this.neighborhoodOptions = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        submit() {
            this.formStatus = false;

            let formData = new FormData();

            // Helper function to append values, treating null and empty as empty
            const appendField = (key, value) => {
                formData.append(key, value ? value : "");
            };

            // Append each field to the formData
            appendField("id", this.community_id);
            appendField("main_image", this.form.main_image);
            appendField("name", this.form.name);
            appendField("description", this.form.description);
            appendField("location", this.form.location);
            appendField("longitude", this.form.longitude);
            appendField("latitude", this.form.latitude);
            appendField(
                "amenities",
                this.form.amenites.length > 0
                    ? JSON.stringify(this.form.amenites)
                    : ""
            ); // Handle empty array
            appendField("hoa_id", this.form.hoa_id);
            appendField(
                "neighborhood",
                this.form.neighborhood.length > 0
                    ? JSON.stringify(this.form.neighborhood)
                    : ""
            ); // Handle empty array
            appendField(
                "regions",
                this.form.regions.length > 0
                    ? JSON.stringify(this.form.regions)
                    : ""
            ); // Handle empty array
            appendField("map_location", this.form.map_location);
            appendField("legal_subdivision", this.form.legal_subdivision);
            appendField("nearby_properties", this.form.nearby_properties);
            appendField("masterplan", this.form.masterplan);
            appendField("sub_association", this.form.sub_association);
            appendField("cic", this.form.cic);
            appendField("lid", this.form.lid);
            appendField("cid", this.form.cid);
            appendField("sid_lid_fee", this.form.sid_lid_fee);
            appendField(
                "sid_lid_payment_frequency",
                this.form.sid_lid_payment_frequency
            );
            appendField("proximity_to_strip", this.form.proximity_to_strip);
            appendField("proximity_to_airport", this.form.proximity_to_airport);
            appendField("nearby_attractions", this.form.nearby_attractions);

            // Handle file uploads (if files are included)
            if (this.form.files && this.form.files.length > 0) {
                for (let file of this.form.files) {
                    formData.append("files[]", file); // Append each file
                }
            }

            // Now you can use formData to send to your API

            axios
                .post("/api/community/store", formData)
                .then((response) => {
                    this.formStatus = true;
                    toastr.success(
                        this.translate("Community saved successfully")
                    );
                    this.formErrors = [];
                    if (this.community_id) {
                        window.location.href = `/community/details/${this.community_id}`;
                    } else {
                        window.location.href = "/communities";
                    }
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
