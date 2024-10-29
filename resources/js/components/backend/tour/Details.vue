<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h1 class="mb-0">
                    <span>{{ tour.title }} {{ translate("Detatils") }} </span>
                </h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span>{{ translate("Detatils") }}</span>
                        </li>
                    </ol>
                </nav>
            </div>
            <div>
                <a class="btn btn-success" href="/tours">{{
                    translate("Go to Tours")
                }}</a>
            </div>
        </div>
        <div class="card">
            <div class="card-body pt-4">
                <div class="row">
                    <div class="d-flex justify-content-end">
                        <div>
                            <a
                                class="ms-3 mb-3 text-secondary c-mouse-over"
                                type="button"
                                title="Edit"
                                :href="'/edit-tour/' + tour.id"
                                ><i class="bi bi-pencil"></i
                            ></a>
                        </div>
                    </div>
                </div>

                <div class="card c-form-card mt-2 mb-2">
                    <div class="card-header c-form-card-header">
                        <label>{{ translate("Tour details") }}</label>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <tbody>
                                    <tr>
                                        <th scope="col">
                                            {{ translate("Approval status") }}
                                        </th>
                                        <td scope="col">
                                            {{ tour.operator_status }}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="col">
                                            {{ translate("Sub title") }}
                                        </th>
                                        <td scope="col">
                                            {{ tour.sub_title }}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="col">
                                            {{ translate("Status") }}
                                        </th>
                                        <td scope="col">
                                            {{ tour.status }}
                                        </td>
                                    </tr>

                                    <tr>
                                        <th scope="col">
                                            {{ translate("Country") }}
                                        </th>
                                        <td scope="col">
                                            {{ tour.countries }}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="col">
                                            {{ translate("Price") }}
                                        </th>
                                        <td scope="col">
                                            {{ tour.price }}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="col">
                                            {{ translate("Discount") }}
                                        </th>
                                        <td scope="col">
                                            {{ tour.discount }}
                                        </td>
                                    </tr>

                                    <tr>
                                        <th scope="col">
                                            {{ translate("Flash sale") }}
                                        </th>
                                        <td scope="col">
                                            {{ tour.flash_sale }}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="col">
                                            {{ translate("Best seller") }}
                                        </th>
                                        <td scope="col">
                                            {{ tour.best_seller }}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="col">
                                            {{ translate("Multi country") }}
                                        </th>
                                        <td scope="col">
                                            {{ tour.multi_country }}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="col">
                                            {{ translate("Description") }}
                                        </th>
                                        <td scope="col">
                                            <div
                                                class="content ql-editor"
                                                v-html="tour.description"
                                            ></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="col">
                                            {{ translate("Important notes") }}
                                        </th>
                                        <td scope="col">
                                            <div
                                                class="content ql-editor"
                                                v-html="tour.important_notes"
                                            ></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="col">
                                            {{ translate("Offer conditions") }}
                                        </th>
                                        <td scope="col">
                                            <div
                                                class="content ql-editor"
                                                v-html="tour.offer_conditions"
                                            ></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="col">
                                            {{ translate("Not included") }}
                                        </th>
                                        <td scope="col">
                                            <div
                                                class="content ql-editor"
                                                v-html="tour.not_included"
                                            ></div>
                                        </td>
                                    </tr>
                                    <tr v-if="tour.tourTags">
                                        <th>{{ translate("Tags") }}</th>
                                        <td>
                                            <template
                                                v-for="(
                                                    tag, index
                                                ) in tour.tourTags"
                                                :key="tag.id"
                                            >
                                                <span>
                                                    <i v-if="index != 0"> , </i>
                                                    {{ tag.tag_name }}
                                                </span>
                                            </template>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="col">
                                            {{
                                                translate(
                                                    "Itinerary main image"
                                                )
                                            }}
                                        </th>
                                        <td scope="col">
                                            <image-zooming-component
                                                :file="
                                                    tour.itinerary_image ??
                                                    'empty.png'
                                                "
                                                :width="100"
                                            />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="col">
                                            {{
                                                translate(
                                                    "Itinerary main description"
                                                )
                                            }}
                                        </th>
                                        <td scope="col">
                                            <div
                                                class="content ql-editor"
                                                v-html="
                                                    tour.itinerary_description
                                                "
                                            ></div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th scope="col">
                                            {{ translate("Tour image") }}
                                        </th>
                                        <td scope="col">
                                            <image-zooming-component
                                                :file="
                                                    tour.image ?? 'empty.png'
                                                "
                                                :width="100"
                                            />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="card c-form-card mt-2 mb-2">
                    <div class="card-header c-form-card-header">
                        <label>{{ translate("The price includes") }}</label>
                    </div>
                    <div class="card-body">
                        <div
                            class="col-12 col-md-12"
                            v-if="
                                tour &&
                                tour.tour_price_includes &&
                                tour.tour_price_includes.length
                            "
                        >
                            <div class="row mt-3 g-0">
                                 
                                <div class="col-md-12">
                                    <ul>
                                        <li
                                            v-for="singleRecord in tour.tour_price_includes"
                                            :key="singleRecord.id"
                                        >
                                            {{ singleRecord.the_price_include }}
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- <div class="card-body">
                        <div class="row">
                            <div class="12">
                                <div class="row">
                                    <div
                                        class="col-md-12"
                                        v-if="tour.tourPriceInculde"
                                    >
                                        <div
                                            class="row"
                                            v-if="
                                                tour.tourPriceInculde.includes(
                                                    '1'
                                                )
                                            "
                                        >
                                            <div class="col-md-2">
                                                <img
                                                    src="/images/rulesicons/user.svg"
                                                    @error="setAltImg"
                                                    width="40"
                                                />
                                            </div>
                                            <div class="col-md-10">
                                                <label for="descriptions"
                                                    >Included in all our trips.
                                                    more information.</label
                                                >
                                            </div>
                                        </div>
                                        <div
                                            class="row mt-4"
                                            v-if="
                                                tour.tourPriceInculde.includes(
                                                    '2'
                                                )
                                            "
                                        >
                                            <div class="col-md-2">
                                                <img
                                                    src="/images/rulesicons/card.svg"
                                                    @error="setAltImg"
                                                    width="40"
                                                />
                                            </div>
                                            <div class="col-md-10">
                                                <label for="descriptions"
                                                    >Departures from main US
                                                    airports.
                                                </label>
                                            </div>
                                        </div>
                                        <div
                                            class="row mt-4"
                                            v-if="
                                                tour.tourPriceInculde.includes(
                                                    '3'
                                                )
                                            "
                                        >
                                            <div class="col-md-2">
                                                <img
                                                    src="/images/rulesicons/2+.svg"
                                                    @error="setAltImg"
                                                    width="40"
                                                />
                                            </div>
                                            <div class="col-md-10">
                                                <label for="descriptions"
                                                    >International flights: US -
                                                    Lisbon - US.</label
                                                >
                                            </div>
                                        </div>
                                        <div
                                            class="row mt-4"
                                            v-if="
                                                tour.tourPriceInculde.includes(
                                                    '4'
                                                )
                                            "
                                        >
                                            <div class="col-md-2">
                                                <img
                                                    src="/images/rulesicons/warning.svg"
                                                    @error="setAltImg"
                                                    width="40"
                                                />
                                            </div>
                                            <div class="col-md-10">
                                                <label for="descriptions"
                                                    >7 nights accommodation in
                                                    Charm category
                                                    hotels.</label
                                                >
                                            </div>
                                        </div>
                                        <div
                                            class="row mt-4"
                                            v-if="
                                                tour.tourPriceInculde.includes(
                                                    '5'
                                                )
                                            "
                                        >
                                            <div class="col-md-2">
                                                <img
                                                    src="/images/rulesicons/user.svg"
                                                    @error="setAltImg"
                                                    width="40"
                                                />
                                            </div>
                                            <div class="col-md-10">
                                                <label for="descriptions"
                                                    >All transfers</label
                                                >
                                            </div>
                                        </div>
                                        <div
                                            class="row mt-4"
                                            v-if="
                                                tour.tourPriceInculde.includes(
                                                    '6'
                                                )
                                            "
                                        >
                                            <div class="col-md-2">
                                                <img
                                                    src="/images/rulesicons/portagal.png"
                                                    @error="setAltImg"
                                                    width="40"
                                                />
                                            </div>
                                            <div class="col-md-10">
                                                <label for="descriptions"
                                                    >Visits to the Monastery of
                                                    Jeronimos, Quinta da
                                                    Regaleira & Convent of
                                                    Christ complex in
                                                    Tomar.</label
                                                >
                                            </div>
                                        </div>
                                        <div
                                            class="row mt-4"
                                            v-if="
                                                tour.tourPriceInculde.includes(
                                                    '7'
                                                )
                                            "
                                        >
                                            <div class="col-md-2">
                                                <img
                                                    src="/images/rulesicons/portagal.png"
                                                    @error="setAltImg"
                                                    width="40"
                                                />
                                            </div>
                                            <div class="col-md-10">
                                                <label for="descriptions">
                                                    Air taxes and fuel
                                                    surcharge.</label
                                                >
                                            </div>
                                        </div>
                                        <div
                                            class="row mt-4"
                                            v-if="
                                                tour.tourPriceInculde.includes(
                                                    '8'
                                                )
                                            "
                                        >
                                            <div class="col-md-2">
                                                <img
                                                    src="/images/rulesicons/portagal.png"
                                                    @error="setAltImg"
                                                    width="40"
                                                />
                                            </div>
                                            <div class="col-md-10">
                                                <label for="descriptions">
                                                    City tour in Lisbon, Porto,
                                                    Tomar & Coimbra. Visit
                                                    Fatima, Nazare, Obidos,
                                                    Sintra & Aveiro.</label
                                                >
                                            </div>
                                        </div>
                                        <div
                                            class="row mt-4"
                                            v-if="
                                                tour.tourPriceInculde.includes(
                                                    '9'
                                                )
                                            "
                                        >
                                            <div class="col-md-2">
                                                <img
                                                    src="/images/rulesicons/portagal.png"
                                                    @error="setAltImg"
                                                    width="40"
                                                />
                                            </div>
                                            <div class="col-md-10">
                                                <label for="descriptions">
                                                    English-speaking
                                                    guide.</label
                                                >
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> -->
                </div>

                <div class="card c-form-card">
                    <div class="card-header c-form-card-header">
                        <label>{{ translate("Tour other images") }}</label>
                    </div>
                    <div class="card-body">
                        <div class="col-12 col-md-6">
                            <div>
                                <Cropper @croppedImg="croppedImgSubmit" />
                                <br />
                                <div class="col-12 col-md-12">
                                    <div class="c-files">
                                        <label class="col-6 col-form-label">{{
                                            translate("Uplaod video file")
                                        }}</label>
                                        <br />
                                        <small>
                                            {{
                                                translate(
                                                    "The recommended resolutions for video are 1080p and 720p."
                                                )
                                            }}
                                        </small>

                                        <ImageDropper
                                            class="mt-2"
                                            DropperType="single"
                                            fileTypes=".mp4"
                                            @emitMethod="DropedVideo"
                                        />
                                    </div>
                                </div>
                                <br />

                                <img
                                    v-if="other_image_form"
                                    :src="other_image_form.image"
                                    width="150"
                                    class="img-thumbnail"
                                />
                            </div>
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.image"
                            >
                                {{ formErrors.image[0] }}
                            </div>
                        </div>

                        <div
                            class="mt-2"
                            v-if="
                                other_image_form.image || other_image_form.video
                            "
                        >
                            <button
                                v-if="formStatus"
                                @click="save"
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
                                v-for="list in tour.other_images"
                                :key="list"
                            >
                                <DeleteModal
                                    :deleteId="list.id"
                                    @deleteThis="deleteThis"
                                />
                                <image-zooming-component
                                    v-if="
                                        list.file &&
                                        list.file.type &&
                                        list.file.type.match('image')
                                    "
                                    :file="list.file.url ?? 'empty.png'"
                                    :width="350"
                                />
                                <video
                                    v-if="
                                        list.file &&
                                        list.file.type &&
                                        list.file.type.match('video')
                                    "
                                    style="border-radius: 5px"
                                    class="video-js img-fluid img-thumbnail"
                                    controls
                                    preload="auto"
                                    data-setup="{}"
                                    @load="fileLoaded"
                                    width="350"
                                >
                                    <source
                                        :src="list.file.url"
                                        :type="list.file.type"
                                    />
                                </video>
                            </div>
                            <!-- {{ tour.other_images }} -->
                        </div>
                    </div>
                </div>

                <Itinerary :tour_id="tour_id" />
                <Activity :tour_id="tour_id" />
                <Accommodation :tour_id="tour_id" />
                <TourDates :tour_id="tour_id" />
                <UsefullInformation :tour_id="tour_id" />
                <TripHightlights :tour_id="tour_id" />
            </div>
        </div>
    </Master>
</template>

<script>
import Master from "@components/backend/layout/Master.vue";
// import ImageCropper from "@components/global/ImageCropper.vue";
import Activity from "@components/backend/tour/Activity.vue";
import Accommodation from "@components/backend/tour/Accommodation.vue";
import Itinerary from "@components/backend/tour/Itinerary.vue";
import TourDates from "@components/backend/tour/TourDates.vue";
import UsefullInformation from "@components/backend/tour/UsefullInformation.vue";
import TripHightlights from "@components/backend/tour/TripHightlights.vue";
import Multiselect from "@vueform/multiselect";
import { QuillEditor } from "@vueup/vue-quill";
import "@vueup/vue-quill/dist/vue-quill.snow.css";
import Cropper from "@components/backend/ExternalWebsite/Cropper.vue";
export default {
    props: ["tour_id"],
    components: {
        Master,
        // ImageCropper,
        Cropper,
        Multiselect,
        QuillEditor,
        Activity,
        Itinerary,
        TourDates,
        Accommodation,
        UsefullInformation,
        TripHightlights,
    },
    created() {
        // fetching tour details...
        this.getTour();
    },
    data() {
        return {
            user: logged_in_user,
            tour: [],
            other_image_form: {
                id: this.tour_id ?? "",
                image: "",
                video: "",
            },
            form: {
                status: "",
                tour_id: this.tour_id,
            },
            formErrors: [],
            formStatus: 1,
        };
    },
    methods: {
        async getTour() {
            await axios
                .get("/api/get-details-tour/" + this.tour_id)
                .then((response) => {
                    this.tour = response.data;
                    this.other_image_form.image = null;
                    this.form.status = response.data.operator_status;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },

        croppedImgSubmit(img) {
            this.other_image_form.image = img;
        },
        DropedVideo(video) {
            this.other_image_form.video = video; 
        },
        async save() {
            this.formStatus = 0;

            let formData = new FormData();
            formData.append("id", this.other_image_form.id);
            formData.append("image", this.other_image_form.image);
            formData.append("video", this.other_image_form.video);
            await axios
                .post("/api/tour-other-image-save", formData)
                .then((response) => {
                    this.formStatus = 2;
                    this.other_image_form.image = "";
                    this.other_image_form.video = "";
                    toastr.success(this.translate("Image saved"));
                    setTimeout(() => {
                        this.getTour();
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
                .post("/api/tour-other-image-delete/" + id)
                .then(() => {
                    toastr.success(
                        this.translate("Image deleted successfully")
                    );
                    this.getTour();
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        setAltImg(event) {
            event.target.src = "/images/default.jpg";
        },
    },
};
</script>
<style>
@import "@vueform/multiselect/themes/default.css";

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
.c-mouse-over {
    cursor: pointer !important;
}
</style>
