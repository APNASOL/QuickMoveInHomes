<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h1 class="mb-0">
                    <span>{{ translate("Your review") }}</span>
                </h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span>{{ translate("Reviews") }}</span>
                        </li>
                    </ol>
                </nav>
            </div>

            <div class="mb-3 d-flex justify-content-end">
                <a class="btn btn-success" href="/booked-tours">
                    {{ translate("Booked tours") }}</a
                >
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
                            <label for="location">{{
                                translate("Location")
                            }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="location"
                                :class="{ 'invalid-bg': formErrors.location }"
                                v-model="form.location"
                            />

                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.location"
                            >
                                {{ formErrors.location[0] }}
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label for="rating">{{
                                translate("Rating")
                            }}</label>
                            <star-rating
                                v-bind:max-rating="5"
                                v-model:rating="form.rating"
                                :star-size="30"
                                :show-rating="false"
                                :increment="0.5"
                            />
                            <!-- <input
                                type="text"
                                class="form-control"
                                id="rating"
                                :class="{ 'invalid-bg': formErrors.rating }"
                                v-model="form.rating"
                            /> -->

                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.email"
                            >
                                {{ formErrors.email[0] }}
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label for="description">{{
                                translate("Description")
                            }}</label>
                            <textarea
                                type="description"
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
                            <label>{{ translate("Image") }}</label>
                            <div>
                                <ImageCropper
                                    @croppedImg="croppedImgSubmit"
                                    :ratio="1.6"
                                />
                                <br />

                                <image-zooming-component
                                    v-if="story_image"
                                    :file="story_image"
                                    :custom_class="'img-fluid img-thumbnail rounded'"
                                    :width="150"
                                />
                                <image-zooming-component
                                    v-else
                                    :file="story_image ?? 'empty.png'"
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
import StarRating from "vue-star-rating";

export default {
    props: ["tour_id"],
    components: {
        Master,
        Multiselect,
        StarRating,
    },
    created() {
        // if (this.tour_id) {
        //     this.getStory();
        // }
    },
    data() {
        return {
            form: {
                tour_id: this.tour_id ?? "",
                image: "",
                location: "",
                title: "",
                description: "",
                rating: "",
            },

            formErrors: [],
            formStatus: true,
            story_image: "",
        };
    },
    methods: {
        getStory() {
            axios
                .get("/api/get-story/" + this.tour_id)
                .then((response) => {
                    this.form.name = response.data.name;
                    this.form.email = response.data.email;
                    this.form.phone = response.data.phone;
                    this.form.address = response.data.address;
                    this.story_image = response.data.image;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },

        croppedImgSubmit(img) {
            this.form.image = img;
            this.story_image = img;
        },

        submit() {
            this.formStatus = false;
            
            axios
                .post("/api/review-save", this.form)
                .then((response) => {
                    this.formStatus = true;
                    toastr.success(this.translate("Story saved successfully"));
                    this.formErrors = [];
                    setTimeout(() => {
                        window.location.href = "/see-reviews-on-tour/"+this.tour_id;
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
    },
};
</script>
