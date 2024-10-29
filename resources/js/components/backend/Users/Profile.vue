<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h1 class="mb-0">
                    <span>{{ translate("Profile") }}</span>
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

            <!-- <div>
                <a class="btn btn-success" href="/create-user">{{
                    translate("Create user")
                }}</a>
            </div> -->
        </div>
        <!-- End Page Title -->

        <section class="section profile">
            <div class="row">
                <div class="col-xl-4">
                    <div class="card">
                        <div
                            class="card-body profile-card pt-4 d-flex flex-column align-items-center"
                        >
                            <image-zooming-component
                                :file="
                                    currentUserRecord.image ??
                                    '/images/default.jpg'
                                "
                                :custom_class="'img-fluid img-thumbnail rounded-circle'"
                                :width="'120px'"
                            />
                        </div>
                    </div>
                </div>

                <div class="col-xl-8">
                    <div class="card">
                        <div class="card-body pt-3">
                            <!-- Bordered Tabs -->
                            <ul class="nav nav-tabs nav-tabs-bordered">
                                <li class="nav-item">
                                    <button
                                        class="nav-link active"
                                        data-bs-toggle="tab"
                                        data-bs-target="#profile-overview"
                                    >
                                        {{ translate("Overview") }}
                                    </button>
                                </li>

                                <li class="nav-item">
                                    <button
                                        class="nav-link"
                                        data-bs-toggle="tab"
                                        data-bs-target="#profile-edit"
                                    >
                                        {{ translate("Edit profile") }}
                                    </button>
                                </li>

                                <li class="nav-item">
                                    <button
                                        class="nav-link"
                                        data-bs-toggle="tab"
                                        data-bs-target="#profile-change-password"
                                        @click="clearFields"
                                    >
                                        {{ translate("Change password") }}
                                    </button>
                                </li>
                            </ul>
                            <div class="tab-content pt-2">
                                <div
                                    class="tab-pane fade show active profile-overview"
                                    id="profile-overview"
                                >
                                    <h5 class="card-title">
                                        {{ translate("Profile details") }}
                                    </h5>

                                    <div class="row">
                                        <div class="col-lg-3 col-md-4 label">
                                            {{ translate("Full name") }}
                                        </div>
                                        <div class="col-lg-9 col-md-8">
                                            {{ currentUserRecord.name }}
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-3 col-md-4 label">
                                            {{ translate("Email") }}
                                        </div>
                                        <div class="col-lg-9 col-md-8">
                                            {{ currentUserRecord.email }}
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3 col-md-4 label">
                                            {{ translate("Role") }}
                                        </div>
                                        <div class="col-lg-9 col-md-8">
                                            {{ currentUserRecord.role }}
                                        </div>
                                    </div>
                                </div>

                                <div
                                    class="tab-pane fade profile-edit pt-3"
                                    id="profile-edit"
                                >
                                    <!-- Profile Edit Form -->
                                    <form>
                                        <div class="row mb-3">
                                            <label
                                                for="profileImage"
                                                class="col-md-4 col-lg-3 col-form-label"
                                                >{{
                                                    translate("Profile image")
                                                }}</label
                                            >
                                            <br />
                                            <div class="col-md-12 col-lg-12">
                                                <image-zooming-component
                                                    v-if="
                                                        formProfile.profile_image
                                                    "
                                                    :file="
                                                        formProfile.profile_image ??
                                                        '/images/default.jpg'
                                                    "
                                                    :custom_class="'img-fluid img-thumbnail'"
                                                    :width="'100px'"
                                                />
                                                <image-zooming-component
                                                    v-else
                                                    :file="
                                                        currentUserRecord.image ??
                                                        '/images/default.jpg'
                                                    "
                                                    :custom_class="'img-fluid img-thumbnail'"
                                                    :width="'100px'"
                                                />
                                            </div>
                                        </div>

                                        <div class="row mb-3 g-3">
                                            <div class="col-md-12 col-lg-12">
                                                <div>
                                                    <label for="user_name">
                                                        {{
                                                            translate(
                                                                "Full name"
                                                            )
                                                        }}
                                                    </label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        :class="{
                                                            'invalid-bg':
                                                                formProfileErrors.user_name,
                                                        }"
                                                        v-model="
                                                            formProfile.user_name
                                                        "
                                                    />
                                                </div>
                                                <div
                                                    class="invalid-feedback animated fadeIn"
                                                    v-if="
                                                        formProfileErrors.user_name
                                                    "
                                                >
                                                    {{
                                                        formProfileErrors
                                                            .user_name[0]
                                                    }}
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <ImageCropper
                                                    :ratio="1"
                                                    @croppedImg="
                                                        croppedImgSubmit
                                                    "
                                                />
                                            </div>
                                        </div>

                                        <div class="">
                                            <button
                                                type="button"
                                                @click="UpdateProfile"
                                                class="btn btn-success"
                                                v-if="formStatus == 1"
                                            >
                                                {{ translate("Save changes") }}
                                            </button>
                                            <button
                                                class="btn btn-success"
                                                type="button"
                                                disabled
                                                v-else
                                            >
                                                {{ translate("Save changes") }}
                                                <span
                                                    class="spinner-border spinner-border-sm"
                                                    role="status"
                                                    aria-hidden="true"
                                                ></span>
                                            </button>
                                        </div>
                                    </form>
                                    <!-- End Profile Edit Form -->
                                </div>

                                <div
                                    class="tab-pane fade pt-3"
                                    id="profile-change-password"
                                >
                                    <!-- Change Password Form -->

                                    <form>
                                        <div class="row mb-3">
                                            <div class="col-md-12 col-lg-12">
                                                <div>
                                                    <label
                                                        for="current_password"
                                                    >
                                                        {{
                                                            translate(
                                                                "Current password"
                                                            )
                                                        }}
                                                    </label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id="current_password"
                                                        :class="{
                                                            'invalid-bg':
                                                                formErrors.current_password,
                                                        }"
                                                        v-model="
                                                            form.current_password
                                                        "
                                                    />
                                                </div>
                                                <div
                                                    class="invalid-feedback animated fadeIn"
                                                    v-if="
                                                        formErrors.current_password
                                                    "
                                                >
                                                    {{
                                                        formErrors
                                                            .current_password[0]
                                                    }}
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <div class="col-md-12 col-lg-12">
                                                <div>
                                                    <label for="new_password"
                                                        >{{
                                                            translate(
                                                                "New password"
                                                            )
                                                        }}
                                                    </label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id="new_password"
                                                        :class="{
                                                            'invalid-bg':
                                                                formErrors.new_password,
                                                        }"
                                                        v-model="
                                                            form.new_password
                                                        "
                                                    />
                                                </div>
                                                <div
                                                    class="invalid-feedback animated fadeIn"
                                                    v-if="
                                                        formErrors.new_password
                                                    "
                                                >
                                                    {{
                                                        formErrors
                                                            .new_password[0]
                                                    }}
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <div class="col-md-12 col-lg-12">
                                                <div>
                                                    <label
                                                        for="confirm_password"
                                                        >{{
                                                            translate(
                                                                "Confirm password"
                                                            )
                                                        }}
                                                    </label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id="confirm_password"
                                                        :class="{
                                                            'invalid-bg':
                                                                formErrors.confirm_password,
                                                        }"
                                                        v-model="
                                                            form.confirm_password
                                                        "
                                                    />
                                                </div>
                                                <div
                                                    class="invalid-feedback animated fadeIn"
                                                    v-if="
                                                        formErrors.confirm_password
                                                    "
                                                >
                                                    {{
                                                        formErrors
                                                            .confirm_password[0]
                                                    }}
                                                </div>
                                            </div>
                                        </div>

                                        <div>
                                            <button
                                                type="submit"
                                                class="btn btn-success"
                                                v-if="passwordFormStatus == 1"
                                                @click="ChangePassword"
                                            >
                                                {{
                                                    translate("Change password")
                                                }}
                                            </button>
                                            <button
                                                v-else
                                                class="btn btn-success"
                                                type="button"
                                                disabled
                                            >
                                                {{
                                                    translate("Change password")
                                                }}
                                                <span
                                                    class="spinner-border spinner-border-sm"
                                                    role="status"
                                                    aria-hidden="true"
                                                ></span>
                                            </button>
                                        </div>
                                    </form>
                                    <!-- End Change Password Form -->
                                </div>
                            </div>
                            <!-- End Bordered Tabs -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </Master>
    <!-- End #main -->
</template>

<script>
import Master from "@components/backend/layout/Master.vue";
export default {
    components: {
        Master,
    },
    props: ["user_id"],
    created() {
        this.currentUser();
    },
    data() {
        return {
            formStatus: 1,
            passwordFormStatus: 1,
            form: {
                current_password: "",
                new_password: "",
                confirm_password: "",
            },
            formProfile: {
                user_name: "",
                profile_image: "",
            },
            formProfileErrors: [],
            formErrors: [],
            currentUserRecord: "",
        };
    },
    methods: {
        ChangePassword() {
            this.passwordFormStatus = 0;
            axios
                .post("/api/password-update", this.form)
                .then((data) => {
                    this.passwordFormStatus = 1;
                    toastr.success(
                        this.translate(
                            "Password changed successfully please login with your new password."
                        )
                    ); 
                    this.form.current_password = "";
                    this.form.new_password = "";
                    this.form.confirm_password = "";
                    this.formErrors = [];

                    setTimeout(() => {
                        this.logOut();
                    }, 2000);
                })
                .catch((error) => {
                    this.passwordFormStatus = 1;
                    toastr.error(error.response.data.message);

                    if (error.response.data.errors) {
                        this.formErrors = error.response.data.errors;
                    }
                });
        },
        logOut() {
            axios
                .post("/api/logout-user")
                .then((response) => {
                    this.formErrors = [];
                    window.location.href = "/";
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        currentUser() {
            axios
                .get("/api/user-show")
                .then((response) => {
                    this.formProfile.user_name = response.data.name;
                    this.profile_photo_path = response.data.profile_photo_path;

                    this.currentUserRecord = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },

        UpdateProfile() {
            this.formStatus = 0;
            let formData = new FormData();
            formData.append("user_name", this.formProfile.user_name);
            formData.append("profile_image", this.formProfile.profile_image);

            axios
                .post("/api/profile-update", formData)
                .then(() => {
                    this.formStatus = 1;
                    toastr.success(
                        this.translate("Profile updated successfully")
                    );

                    window.location.href = "/profile-settings";
                })
                .catch((error) => {
                    this.formStatus = 1;
                    toastr.error(error.response.data.message);

                    if (error.response.data.errors) {
                        this.formErrors = error.response.data.errors;
                    }
                });
        },
        croppedImgSubmit(img) {
            this.formProfile.profile_image = img;
        },
        clearFields() {
            this.form.current_password = "";
            this.form.new_password = "";
            this.form.confirm_password = "";
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
</style>
