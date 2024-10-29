<template>
    <div>
        <div class="card c-form-card  mt-1">
            <div class="card-header c-form-card-header">
                {{ translate("Website name section") }}
            </div>
            <div class="card-body pt-4"> 
                <!-- Floating Labels Form -->
                 
                    <div class="row g-3">
                        <div class="col-12 col-md-6">
                            <label for="website_name"
                                >{{ translate("Title") }}
                            </label>
                            <input
                                type="text"
                                class="form-control"
                                v-model="form.website_name"
                                :class="{
                                    'invalid-bg': formErrors.website_name,
                                }"
                            />

                            <div
                                class="invalid-feedback d-block"
                                v-if="formErrors.website_name"
                            >
                                {{ formErrors.website_name[0] }}
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label for="youtube_link"
                                >{{ translate("Youtube") }}
                            </label>
                            <input
                                type="text"
                                class="form-control"
                                v-model="form.youtube_link"
                                :class="{
                                    'invalid-bg': formErrors.youtube_link,
                                }"
                            />

                            <div
                                class="invalid-feedback d-block"
                                v-if="formErrors.youtube_link"
                            >
                                {{ formErrors.youtube_link[0] }}
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label for="instagram_link"
                                >{{ translate("Instagram") }}
                            </label>
                            <input
                                type="text"
                                class="form-control"
                                v-model="form.instagram_link"
                                :class="{
                                    'invalid-bg': formErrors.instagram_link,
                                }"
                            />

                            <div
                                class="invalid-feedback d-block"
                                v-if="formErrors.instagram_link"
                            >
                                {{ formErrors.instagram_link[0] }}
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label for="facebook_link"
                                >{{ translate("Facebook") }}
                            </label>
                            <input
                                type="text"
                                class="form-control"
                                v-model="form.facebook_link"
                                :class="{
                                    'invalid-bg': formErrors.facebook_link,
                                }"
                            />

                            <div
                                class="invalid-feedback d-block"
                                v-if="formErrors.facebook_link"
                            >
                                {{ formErrors.facebook_link[0] }}
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label for="facebook_link"
                                >{{ translate("Email") }}
                            </label>
                            <input
                                type="text"
                                class="form-control"
                                v-model="form.email"
                                :class="{
                                    'invalid-bg': formErrors.email,
                                }"
                            />

                            <div
                                class="invalid-feedback d-block"
                                v-if="formErrors.email"
                            >
                                {{ formErrors.email[0] }}
                            </div>
                        </div>
                        
                        <div class="col-12 col-md-6">
                            <label for="website_phone"
                                >{{ translate("Website phone") }}
                            </label>
                            <input
                                type="text"
                                class="form-control"
                                v-model="form.website_phone"
                                :class="{
                                    'invalid-bg': formErrors.website_phone,
                                }"
                            />

                            <div
                                class="invalid-feedback d-block"
                                v-if="formErrors.website_phone"
                            >
                                {{ formErrors.website_phone[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-12">
                            <label for="website_address"
                                >{{ translate("Website address") }}
                            </label>
                            <textarea 
                                class="form-control"
                                v-model="form.website_address"
                                :class="{
                                    'invalid-bg': formErrors.website_address,
                                }"
                                ></textarea>
                             

                            <div
                                class="invalid-feedback d-block"
                                v-if="formErrors.website_address"
                            >
                                {{ formErrors.website_address[0] }}
                            </div>
                        </div>
                    </div>

                    <div class="mt-2">
                        <button
                            type="submit"
                            class="btn btn-success"
                            v-if="formStatus == 1"
                            @click="submit"
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
                 
                <!-- End floating Labels Form -->
            </div>
        </div>
    </div>
</template>

<script> 
export default { 
    emits: ["refetchParentDetails"],
    created() {
        this.fatchWebsiteName();
    },
    data() {
        return {
            formStatus: 1,
            formErrors: [],

            form: {
                website_name: "",
                youtube_link: "",
                instagram_link: "",
                facebook_link: "",
                email: "",
                website_address:'',
                website_phone:'',
            },
        };
    },
    methods: {
        async submit() {
            this.formStatus = 0;
            await axios
                .post("/api/website-info-store", this.form)
                .then((data) => {
                    this.formStatus = 1;
                    toastr.success(
                        this.translate(
                            "Website info section updated successfully."
                        )
                    );
                })
                .catch((error) => {
                    this.formStatus = 1;
                    toastr.error(error.response.data.message); 
                    if (error.response.data.errors) {
                        this.formErrors = error.response.data.errors;
                    }
                });
        },

        async fatchWebsiteName() {
            await axios
                .get("/api/fetch-website-info")
                .then((response) => {
                    this.form.website_name = response.data.website_name;
                    this.form.youtube_link = response.data.youtube_link;
                    this.form.instagram_link = response.data.instagram_link;
                    this.form.facebook_link = response.data.facebook_link;
                    this.form.email = response.data.email;
                    this.form.website_address = response.data.website_address;
                    this.form.website_phone = response.data.website_phone;
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

.c-file-padding {
    padding: 1rem 0.75rem !important;
}

.invalid-feedback {
    display: block !important;
}

/* .invalid-bg {
    border-color: #f8d4d4 !important;
    background-color: #f8d4d4 !important;
} */

#CodeSelect {
    min-height: 58px;
}

.card {
    overflow: visible;
}

.remove-status {
    margin-left: 15px !important;
    margin-top: 5px !important;
}
</style>
