<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h1 class="mb-0">
                    <span v-if="office_id">{{ translate("Edit office") }}</span>
                    <span v-else>{{ translate("Create office") }}</span>
                </h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span>{{ translate("Offices") }}</span>
                        </li>
                    </ol>
                </nav>
            </div>

            <div class="mb-3 d-flex justify-content-end">
                <a class="btn btn-success" href="/offices">
                    {{ translate("Offices") }}</a
                >
            </div>
        </div>

        <div class="card">
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
                            <label for="phone">{{ translate("Phone") }}</label>
                            <input
                                type="phone"
                                class="form-control"
                                id="phone"
                                :class="{ 'invalid-bg': formErrors.phone }"
                                v-model="form.phone"
                            />

                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.phone"
                            >
                                {{ formErrors.phone[0] }}
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label for="email">{{ translate("Email") }}</label>
                            <input
                                type="email"
                                class="form-control"
                                id="email"
                                :class="{ 'invalid-bg': formErrors.email }"
                                v-model="form.email"
                            />

                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.email"
                            >
                                {{ formErrors.email[0] }}
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label for="address">{{
                                translate("Address")
                            }}</label>
                            <textarea
                                type="address"
                                class="form-control"
                                id="address"
                                :class="{ 'invalid-bg': formErrors.address }"
                                v-model="form.address"
                            ></textarea>

                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.address"
                            >
                                {{ formErrors.address[0] }}
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

export default {
    props: ["office_id"],
    components: {
        Master,
        Multiselect,
    },
    created() {
        if (this.office_id) {
            
            this.getOffice();
        }
    },
    data() {
        return {
            form: {
                office_id: this.office_id ?? "",
                name: "",
                phone: "",
                email: "",
                address: "",
                image: "",
            },

            formErrors: [],
            formStatus: true,
            story_image: "",
        };
    },
    methods: {
        getOffice() {
            axios
                .get("/api/get-office/" + this.office_id)
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
            if (this.office_id) {
                this.form.process_status = "Update";
            } else {
                this.form.process_status = "New";
            }
            axios
                .post("/api/office-save", this.form)
                .then((response) => {
                    this.formStatus = true;
                    toastr.success(this.translate("Office saved successfully"));
                    this.formErrors = [];
                    setTimeout(() => {
                        window.location.href = "/offices";
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
