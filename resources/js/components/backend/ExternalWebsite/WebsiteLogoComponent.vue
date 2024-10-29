<template>
    <div>
        <div class="card c-form-card mt-1">
            <div class="card-header c-form-card-header">
                {{ translate("Logo Section") }}
            </div>
            <div class="card-body pt-4">
                <!-- Floating Labels Form -->
                <form @submit.prevent="submit">
                    <div class="row g-3">
                        <div class="col-12 col-md-6">
                            <label for="">White logo</label>
                            <br />
                            <image-zooming-component  
                                :file="existing_white_logo ?? 'empty.png'"
                                :width="100"
                            />
                            <!-- <img :src="existing_black_logo" width="100" alt=""> -->
                            <br />
                            <br />

                            <input
                                class="form-control c-file-padding"
                                :class="{ 'invalid-bg': formErrors.white_logo }"
                                type="file"
                                @input="
                                    form.white_logo = $event.target.files[0]
                                "
                                id="white_logo"
                            />

                            <div
                                class="invalid-feedback d-block"
                                v-if="formErrors.white_logo"
                            >
                                {{ formErrors.white_logo[0] }}
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label for="">Black logo</label>
                            <br />
                            <image-zooming-component
                                :file="existing_black_logo ?? 'empty.png'"
                                :width="100"
                            />
                            <!-- <img :src="existing_black_logo" width="100" alt=""> -->
                            <br />
                            <br />

                            <input
                                class="form-control c-file-padding"
                                :class="{ 'invalid-bg': formErrors.black_logo }"
                                type="file"
                                @input="
                                    form.black_logo = $event.target.files[0]
                                "
                                id="black_logo"
                            />

                            <div
                                class="invalid-feedback d-block"
                                v-if="formErrors.black_logo"
                            >
                                {{ formErrors.black_logo[0] }}
                            </div>
                        </div>
                    </div>

                    <div class="mt-2">
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
                <!-- End floating Labels Form -->
            </div>
        </div>
    </div>
</template>

<script>
// import Master from "@/Pages/Backend/Layouts/Master";
export default {
    // layout: Master,
    created() {
        this.fetchLogo();
    },
    data() {
        return {
            formStatus: 1,
            formErrors: [],
            // Seo: "",
            existing_black_logo: "",
            existing_white_logo: "",

            form: {
                black_logo: "",
                white_logo: "",
            },
        };
    },
    methods: {
        async fetchLogo() {
            await axios
                .get("/api/logo-fetch")
                .then((response) => {
                    this.existing_black_logo = response.data.black_logo;
                    this.existing_white_logo = response.data.white_logo; 
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },

        async submit() {
            this.formStatus = 0;
            let formData = new FormData();
            formData.append("black_logo", this.form.black_logo);
            formData.append("white_logo", this.form.white_logo);

            await axios
                .post("/api/logo-store", formData)
                .then((data) => {
                    this.formStatus = 1;
                    toastr.success(
                        this.translate("Logos updated successfully.")
                    );
                    this.fetchLogo();
                    
                })
                .catch((error) => {
                    this.formStatus = 1;
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
