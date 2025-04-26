<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h1 class="mb-0">
                    <span>Reset password</span>
                </h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span>Email</span>
                        </li>
                    </ol>
                </nav>
            </div>
        </div>

        <div class="card shadow-lg rounded-4 bg-light">
            <div class="card-body pt-4">
                <div>
                    <!-- Subject Input Field -->
                    <div class="col-12 col-md-12 mb-3">
                        <label for="subject" class="fw-semibold text-primary">{{
                            translate("Subject")
                        }}</label>
                        <input
                            type="text"
                            id="subject"
                            class="form-control rounded-pill shadow-sm"
                            v-model="subject"
                            :class="{ 'is-invalid': formErrors.subject }"
                            placeholder="Enter subject"
                        />
                        <div
                            class="invalid-feedback d-block"
                            v-if="formErrors.subject"
                        >
                            {{ formErrors.subject[0] }}
                        </div>
                    </div>

                    <!-- Description Textarea Field -->
                    <div class="col-12 col-md-12 mb-3">
                        <label
                            for="email_description"
                            class="fw-semibold text-primary"
                            >{{ translate("Description") }}</label
                        >
                        <br />
                        <p class="text-muted">[user_name]</p>
                        <QuillEditor
                            v-model:content="email_description"
                            contentType="html"
                            toolbar="full"
                            theme="snow"
                            class="rounded-4 shadow-sm"
                        />
                        <div
                            class="invalid-feedback d-block"
                            v-if="formErrors.email_description"
                        >
                            {{ formErrors.email_description[0] }}
                        </div>
                    </div>
                </div>

                <!-- Save Button Section -->
                <div class="mt-3 d-flex justify-content-end">
                    <!-- Save Button (Active) -->
                    <button
                        @click="submit"
                        type="submit"
                        class="btn btn-primary rounded-pill shadow-sm px-4 py-2"
                        v-if="formStatus === 'Yes'"
                    >
                        {{ translate("Save") }}
                    </button>

                    <!-- Save Button (Disabled) -->
                    <button
                        class="btn btn-secondary rounded-pill shadow-sm px-4 py-2"
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
        </div>
    </Master>
</template>

<script>
import Master from "@components/backend/layout/Master.vue";
import { QuillEditor } from "@vueup/vue-quill";
import "@vueup/vue-quill/dist/vue-quill.snow.css";
export default {
    props: [""],
    components: {
        Master,
        QuillEditor,
    },
    created() {
        this.getRecord();
    },
    data() {
        return {
            email_description: "",
            subject: "",
            formStatus: "Yes",
            formErrors: [],
        };
    },
    methods: {
        async submit() {
            this.formStatus = "No";
            let formData = new FormData();
            formData.append("email_description", this.email_description);
            formData.append("subject", this.subject);

            await axios
                .post("/api/reset-password-email-save", formData)
                .then((response) => {
                    this.email_description = "";
                    this.formStatus = "Yes";
                    toastr.success(
                        this.translate("Record updated successfully.")
                    );
                    this.formErrors = [];
                    this.getRecord();
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                    this.formStatus = "Yes";

                    if (error.response.data.errors) {
                        this.formErrors = error.response.data.errors;
                    }
                });
        },

        async getRecord() {
            await axios
                .get("/api/reset-email-fetch")
                .then((response) => {
                    this.email_description = "";
                    const myJSON = JSON.parse(response.data.value);

                    this.email_description = myJSON[0].description;
                    this.subject = myJSON[0].subject;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
    },
};
</script>
