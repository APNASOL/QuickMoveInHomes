<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h1 class="mb-0">
                    <span v-if="user_id">{{ translate("Edit user") }}</span>
                    <span v-else>{{ translate("Create users") }}</span>
                </h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span>{{ translate("Users") }}</span>
                        </li>
                    </ol>
                </nav>
            </div>

            <div class="mb-3 d-flex justify-content-end">
                <a class="btn btn-success" href="/users">
                    {{ translate("Users") }}</a
                >
            </div>
        </div>

        <div class="card">
            <div class="card-body pt-4">
                <form @submit.prevent="submit">
                    <div class="row g-3">
                        <div class="col-12 col-md-6">
                            <label for="user_name">{{
                                translate("Name")
                            }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="user_name"
                                :class="{ 'invalid-bg': formErrors.user_name }"
                                v-model="form.user_name"
                            />

                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.user_name"
                            >
                                {{ formErrors.user_name[0] }}
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
                            <label for="role">{{ translate("Role") }}</label>
                            <Multiselect
                                style="position: relative; z-index: 3"
                                id="role"
                                v-model="form.role"
                                :options="role_options"
                                :searchable="true"
                                :class="{
                                    'invalid-bg': formErrors.role,
                                }"
                            />

                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.role"
                            >
                                {{ formErrors.role[0] }}
                            </div>
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
                                    v-if="user_image"
                                    :file="user_image"
                                    :custom_class="'img-fluid img-thumbnail rounded'"
                                    :width="150"
                                />
                                <image-zooming-component
                                    v-else
                                    :file="user_image ?? 'empty.png'"
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
    props: ["user_id"],
    components: {
        Master,
        Multiselect,
    },
    created() {
        if (this.user_id) {
            this.getUser();
        }
    },
    data() {
        return {
            form: {
                user_id: this.user_id ?? "",
                user_name: "",
                email: "",
                role: "",
                admin_registeration: true,
                process_by: "Admin",
                process_status: "",
            },
            role_options: ["user", "admin", "tour operator"],
            formErrors: [],
            formStatus: true,
            user_image: "",
        };
    },
    methods: {
        getUser() {
            axios
                .get("/api/get-user/" + this.user_id)
                .then((response) => {
                    this.form.user_name = response.data.name;
                    this.form.email = response.data.email;
                    this.form.role = response.data.role;
                    this.user_image = response.data.image;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },

        croppedImgSubmit(img) {
            this.form.image = img;
            this.user_image = img;
        },

        submit() {
            this.formStatus = false;
            if (this.user_id) {
                        this.form.process_status = "Update";
                    } else {
                        this.form.process_status = "New";
                    }
            axios
                .post("/api/user-save", this.form)
                .then((response) => {
                    
                    this.formStatus = true;
                    toastr.success(this.translate("User saved successfully"));
                    this.formErrors = [];
                    setTimeout(() => {
                        window.location.href = "/users";
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
            event.target.src = "/images/default-home-image.png";
        },
    },
};
</script>
