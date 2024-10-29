<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h1 class="mb-0">
                    <span v-if="tour_id">Edit Tour</span>
                    <span v-else>Create Tour</span>
                </h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span v-if="tour_id">Edit Tour</span>
                            <span v-else>Create Tour</span>
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
                <form @submit.prevent="submit">
                    <div class="row g-3">
                        <div
                            class="col-12 col-md-12"
                            v-if="user.role == 'admin'"
                        >
                            <label for="name">
                                {{ translate("Approval status") }}
                            </label>
                            <br />
                            <template v-if="user.role == 'admin'">
                                <div class="d-inline-block me-2">
                                    {{ translate("Disapproved") }}
                                </div>
                                <div
                                    class="form-check form-switch d-inline-block"
                                >
                                    <input
                                        class="form-check-input"
                                        type="checkbox"
                                        :class="{
                                            'invalid-bg':
                                                formErrors.operator_status,
                                        }"
                                        v-model="form.operator_status"
                                        checked
                                    />
                                    <label class="form-check-label">{{
                                        translate("Approved")
                                    }}</label>
                                </div>

                                <div
                                    class="invalid-feedback animated fadeIn"
                                    v-if="formErrors.operator_status"
                                >
                                    {{ formErrors.status[0] }}
                                </div>
                            </template>
                        </div>
                        <div class="col-12 col-md-6">
                            <label for="name">{{ translate("Title") }}</label>
                            <input
                                type="text"
                                class="form-control"
                                v-model="form.title"
                                id="name"
                            />

                            <div
                                class="invalid-feedback d-block"
                                v-if="formErrors.title"
                            >
                                {{ formErrors.title[0] }}
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label for="name">{{
                                translate("Sub title")
                            }}</label>
                            <input
                                type="text"
                                class="form-control"
                                v-model="form.sub_title"
                                id="name"
                            />

                            <div
                                class="invalid-feedback d-block"
                                v-if="formErrors.sub_title"
                            >
                                {{ formErrors.sub_title[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="price">{{ translate("Price") }}</label>
                            <input
                                type="number"
                                class="form-control"
                                id="price"
                                v-model="form.price"
                            />

                            <div
                                class="invalid-feedback d-block"
                                v-if="formErrors.price"
                            >
                                {{ formErrors.price[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="discount">{{
                                translate("Discount")
                            }}</label>
                            <input
                                type="number"
                                class="form-control"
                                id="discount"
                                v-model="form.discount"
                            />

                            <div
                                class="invalid-feedback d-block"
                                v-if="formErrors.discount"
                            >
                                {{ formErrors.discount[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="type">{{ translate("Tags") }}</label>

                            <Multiselect
                                v-model="form.tourTags"
                                mode="tags"
                                :close-on-select="false"
                                :createTag="true"
                                :options="tagOptions"
                                :placeholder="translate('Make Tag')"
                                :searchable="true"
                                :class="{
                                    'invalid-bg': formErrors.tourTags,
                                }"
                            />
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.tourTags"
                            >
                                {{ formErrors.tourTags[0] }}
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label>{{ translate("Country") }}</label>
                            <Multiselect
                                :close-on-select="true"
                                :placeholder="translate('Countries')"
                                
                                v-model="form.countries"
                                mode="tags"
                                :options="country_options"
                                :searchable="true"
                                :class="{
                                    'invalid-bg': formErrors.countries,
                                }"
                            />

                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.countries"
                            >
                                {{ formErrors.countries[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-12">
                            <label for="descriptions">
                                {{ translate("The price includes") }}</label
                            >

                            <!-- The price include  code -->
                            <div class="mt-3">
                                <div
                                    class="row mb-3"
                                    v-for="(list, index) in PriceIncludeList"
                                    :key="index"
                                >
                                    <div class="col-12 col-md-11">
                                        <label :class="index <= 0"
                                            >{{ translate("Text") }}
                                        </label>
                                        <div class="c-input-group">
                                            <input
                                                type="text"
                                                class="form-control"
                                                :class="{
                                                    'invalid-bg':
                                                        formErrors.the_price_include &&
                                                        index == 0,
                                                }"
                                                v-model="list.the_price_include"
                                            />
                                        </div>
                                        <div
                                            class="invalid-feedback animated fadeIn"
                                            v-if="
                                                index == 0 &&
                                                formErrors.the_price_include
                                            "
                                        >
                                            {{
                                                formErrors.the_price_include[0]
                                            }}
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-1">
                                        <label>&nbsp;</label>
                                        <!-- Empty label for spacing -->
                                        <button
                                            type="button"
                                            class="btn mt-4"
                                            v-if="
                                                index !=
                                                PriceIncludeList.length - 1
                                            "
                                            @click="
                                                removePriceIncludeList(
                                                    index,
                                                    list
                                                )
                                            "
                                        >
                                            <i class="bi bi-trash"></i>
                                        </button>

                                        <div
                                            class="c-input-group"
                                            v-if="
                                                index ===
                                                PriceIncludeList.length - 1
                                            "
                                        >
                                            <span
                                                @click="addPriceIncludeList"
                                                class="btn btn-success ms-1"
                                                >+</span
                                            >
                                        </div>
                                        <!-- No need for invalid feedback for the + button -->
                                    </div>
                                </div>
                            </div>
                            <!-- The price include  code -->

                            <!-- <div class="row">
                                <div class="col-md-10">
                                    <label for="descriptions">
                                        1. Included in all our trips. more
                                        information</label
                                    >
                                </div>
                                <div class="col-md-2">
                                    <input
                                        class="form-check-input"
                                        type="checkbox"
                                        v-model="form.price_includes"
                                        :value="1"
                                    />
                                </div>
                                <div class="col-md-10">
                                    <label for="descriptions"
                                        >2. Departures from main US
                                        airports.</label
                                    >
                                </div>
                                <div class="col-md-2">
                                    <input
                                        class="form-check-input"
                                        type="checkbox"
                                        v-model="form.price_includes"
                                        :value="2"
                                    />
                                </div>
                                <div class="col-md-10">
                                    <label for="descriptions"
                                        >3. International flights: US - Lisbon -
                                        US.</label
                                    >
                                </div>
                                <div class="col-md-2">
                                    <input
                                        class="form-check-input"
                                        type="checkbox"
                                        v-model="form.price_includes"
                                        :value="3"
                                    />
                                </div>
                                <div class="col-md-10">
                                    <label for="descriptions"
                                        >4. 7 nights accommodation in Charm
                                        category hotels.</label
                                    >
                                </div>
                                <div class="col-md-2">
                                    <input
                                        class="form-check-input"
                                        type="checkbox"
                                        v-model="form.price_includes"
                                        :value="4"
                                    />
                                </div>
                                <div class="col-md-10">
                                    <label for="descriptions"
                                        >5. All transfers</label
                                    >
                                </div>
                                <div class="col-md-2">
                                    <input
                                        class="form-check-input"
                                        type="checkbox"
                                        v-model="form.price_includes"
                                        :value="5"
                                    />
                                </div>
                                <div class="col-md-10">
                                    <label for="descriptions"
                                        >6. Visits to the Monastery of
                                        Jeronimos, Quinta da Regaleira & Convent
                                        of Christ complex in Tomar.</label
                                    >
                                </div>
                                <div class="col-md-2">
                                    <input
                                        class="form-check-input"
                                        type="checkbox"
                                        v-model="form.price_includes"
                                        :value="6"
                                    />
                                </div>
                                <div class="col-md-10">
                                    <label for="descriptions"
                                        >7. Air taxes and fuel surcharge.</label
                                    >
                                </div>
                                <div class="col-md-2">
                                    <input
                                        class="form-check-input"
                                        type="checkbox"
                                        v-model="form.price_includes"
                                        :value="7"
                                    />
                                </div>
                                <div class="col-md-10">
                                    <label for="descriptions"
                                        >8. City tour in Lisbon, Porto, Tomar &
                                        Coimbra. Visit Fatima, Nazare, Obidos,
                                        Sintra & Aveiro.</label
                                    >
                                </div>
                                <div class="col-md-2">
                                    <input
                                        class="form-check-input"
                                        type="checkbox"
                                        v-model="form.price_includes"
                                        :value="8"
                                    />
                                </div>
                                <div class="col-md-10">
                                    <label for="descriptions"
                                        >9. English-speaking guide.</label
                                    >
                                </div>
                                <div class="col-md-2">
                                    <input
                                        class="form-check-input"
                                        type="checkbox"
                                        v-model="form.price_includes"
                                        :value="9"
                                    />
                                </div>
                            </div> -->
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
                                    v-if="tour_image"
                                    :file="tour_image ?? 'empty.png'"
                                    :custom_class="'img-fluid img-thumbnail'"
                                    :width="'100px'"
                                />
                            </div>
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.image"
                            >
                                {{ formErrors.image[0] }}
                            </div>
                        </div>

                        <div class="col">
                            <div class="form-check form-switch">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    role="switch"
                                    id="status"
                                    v-model="form.status"
                                    :checked="form.status"
                                />
                                <label class="form-check-label" for="status"
                                    >Status</label
                                >
                            </div>
                            <div class="form-check form-switch">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    role="switch"
                                    id="flash_sale"
                                    v-model="form.flash_sale"
                                    :checked="form.flash_sale"
                                />
                                <label class="form-check-label" for="flash_sale"
                                    >Flash Sale</label
                                >
                            </div>
                            <div class="form-check form-switch">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    role="switch"
                                    id="best_seller"
                                    v-model="form.best_seller"
                                    :checked="form.best_seller"
                                />
                                <label
                                    class="form-check-label"
                                    for="best_seller"
                                    >Best Seller</label
                                >
                            </div>
                            <div class="form-check form-switch">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    role="switch"
                                    id="multi_country"
                                    v-model="form.multi_country"
                                    :checked="form.multi_country"
                                />
                                <label
                                    class="form-check-label"
                                    for="multi_country"
                                    >Multi Country</label
                                >
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
                    <div class="col-12 col-md-12">
                        <label for="important_notes"
                            >{{ translate("Important notes") }}
                        </label>
                        <QuillEditor
                            v-model:content="form.important_notes"
                            contentType="html"
                            toolbar="full"
                            theme="snow"
                        />
                        <div
                            class="invalid-feedback d-block"
                            v-if="formErrors.important_notes"
                        >
                            {{ formErrors.important_notes[0] }}
                        </div>
                    </div>
                    <div class="col-12 col-md-12">
                        <label for="offer_conditions"
                            >{{ translate("Offer conditions") }}
                        </label>
                        <QuillEditor
                            v-model:content="form.offer_conditions"
                            contentType="html"
                            toolbar="full"
                            theme="snow"
                        />
                        <div
                            class="invalid-feedback d-block"
                            v-if="formErrors.offer_conditions"
                        >
                            {{ formErrors.offer_conditions[0] }}
                        </div>
                    </div>

                    <div class="col-12 col-md-12">
                        <label for="not_included"
                            >{{ translate("Not included") }}
                        </label>
                        <QuillEditor
                            v-model:content="form.not_included"
                            contentType="html"
                            toolbar="full"
                            theme="snow"
                        />
                        <div
                            class="invalid-feedback d-block"
                            v-if="formErrors.not_included"
                        >
                            {{ formErrors.not_included[0] }}
                        </div>
                    </div>

                    <div class="col-12 col-md-12">
                        <label for="itinerary_description"
                            >{{ translate("Itinerary main description") }}
                        </label>
                        <QuillEditor
                            v-model:content="form.itinerary_description"
                            contentType="html"
                            toolbar="full"
                            theme="snow"
                        />
                        <div
                            class="invalid-feedback d-block"
                            v-if="formErrors.itinerary_description"
                        >
                            {{ formErrors.itinerary_description[0] }}
                        </div>
                    </div>

                    <div class="col-12 col-md-6">
                        <label>{{ translate("Itinerary main Image") }}</label>
                        <div>
                            <ExternalWebsitImageCropper
                                @croppedImg="croppedItineraryImgSubmit"
                            />
                            <br />
                            <image-zooming-component
                                v-if="itinerary_image"
                                :file="itinerary_image ?? 'empty.png'"
                                :custom_class="'img-fluid img-thumbnail'"
                                :width="'100px'"
                            />
                        </div>
                        <div
                            class="invalid-feedback animated fadeIn"
                            v-if="formErrors.itinerary_image"
                        >
                            {{ formErrors.itinerary_image[0] }}
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
import ImageCropper from "@components/global/ImageCropper.vue";
import Multiselect from "@vueform/multiselect";
import { QuillEditor } from "@vueup/vue-quill";
import "@vueup/vue-quill/dist/vue-quill.snow.css";
import Datepicker from "@vuepic/vue-datepicker";
import "@vuepic/vue-datepicker/dist/main.css";
export default {
    props: ["tour_id"],
    components: {
        Master,
        ImageCropper,
        Multiselect,
        QuillEditor,
        Datepicker,
    },
    created() {
        // fetching tour...
        if (this.tour_id) {
            this.getTour();
        }
        this.fetchCountries();
    },
    data() {
        return {
            PriceIncludeList: [
                {
                    the_price_include: "",
                },
            ],
            user: logged_in_user,
            form: {
                id: this.tour_id ?? "",
                title: "",
                sub_title: "",
                description: "",
                price: "",
                discount: "",
                image: "",
                price_includes: [],
                flash_sale: "",
                best_seller: "",
                multi_country: "",
                tourTags: [],
                countries: [],
                important_notes: "",
                offer_conditions: "",
                itinerary_image: "",
                itinerary_description: "",
                dates: [],
                operator_status: "",
            },
            tour_image: "",
            itinerary_image: "",
            formErrors: [],
            formStatus: true,
            tagOptions: [],
            country_options: [],
        };
    },
    methods: {
        addPriceIncludeList() {
            this.PriceIncludeList.push({
                the_price_include: "",
            });
        },
        removePriceIncludeList(index, list) {
            var idx = this.PriceIncludeList.indexOf(list);

            if (idx > -1) {
                this.PriceIncludeList.splice(idx, 1);
            }
        },
        async getTour() {
            await axios
                .get("/api/get-tour/" + this.tour_id)
                .then((response) => {
                    this.form.tourTags = response.data.tour_tags;
                    this.tagOptions = response.data.tour_tags;
                    this.form.price_includes =
                        response.data.tour_price_includes;

                    this.form.title = response.data.title;
                    this.form.sub_title = response.data.sub_title;
                    this.form.description = response.data.description;
                    this.form.price = response.data.price;
                    this.form.countries = response.data.countries;
                    // this.form.countries = response.data.countries;
                    this.form.discount = response.data.discount;
                    this.tour_image = response.data.image;
                    this.form.itinerary_description =
                        response.data.itinerary_description;
                    this.itinerary_image = response.data.itinerary_image;
                    this.form.status = response.data.status;

                    this.form.flash_sale = response.data.flash_sale;
                    this.form.best_seller = response.data.best_seller;
                    this.form.multi_country = response.data.multi_country;
                    this.form.important_notes = response.data.important_notes;
                    this.form.offer_conditions = response.data.offer_conditions;
                    this.form.not_included = response.data.not_included;
                    this.form.operator_status = response.data.operator_status;
                    if (response.data.tour_price_includes.length) {
                        this.PriceIncludeList =
                            response.data.tour_price_includes;
                    }
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        croppedImgSubmit(img) {
            this.form.image = img;
            this.tour_image = img;
        },
        croppedItineraryImgSubmit(img) {
            this.form.itinerary_image = img;
            this.itinerary_image = img;
        },
        async submit() {
            this.formStatus = false;
            let priceIncludesList = this.PriceIncludeList;
            this.form.price_includes = JSON.stringify(priceIncludesList);

            await axios
                .post("/api/tour-save", this.form)
                .then((response) => {
                    // this.tour_id = response.data;
                    this.formStatus = true;
                    toastr.success(this.translate("Tour saved successfully"));
                    this.formErrors = [];
                    setTimeout(() => {
                        window.location.href = "/details-tour/" + response.data;
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
        fetchCountries() {
            axios
                .get("/api/countries-pluck")
                .then((response) => {
                    this.country_options = response.data;
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
