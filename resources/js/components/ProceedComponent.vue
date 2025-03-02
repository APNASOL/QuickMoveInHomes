<template>
    <Master v-if="page != 'community'">
        <a
            :href="'/homes-agents/' + home_id"
            class="btn c-btn-theme-primary c-theme-rounded-btn mt-5 w-100 beat"
            v-if="user_status === 'logedin'"
        >
            {{ user_name }} Click to proceed
            <i class="bi bi-arrow-right ms-2"></i>
        </a>

        <a
            class="btn c-btn-theme-primary c-theme-rounded-btn mt-5 w-100 beat"
            ref="openCustomerLoginModal"
            data-bs-toggle="modal"
            data-bs-target="#CustomerLoginModal"
            @click="clearFields"
            v-else
        >
            Click to proceed<i class="bi bi-arrow-right ms-2"></i>
        </a>

        <div class="modal fade" id="CustomerLoginModal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="text-center text-black mt-4">
                            <h2>Login</h2>
                        </div>
                        <div class="block-content p-4">
                            <form @submit.prevent="login">
                                <!-- <h1 class="h3 mb-3 fw-normal">Please sign in</h1> -->

                                <div class="mb-3">
                                    <input
                                        type="Email"
                                        class="form-control"
                                        placeholder="Email"
                                        v-model="form.email"
                                        :class="{
                                            'invalid-bg': formErrors.email,
                                        }"
                                    />
                                    <div
                                        v-if="formErrors.email"
                                        class="invalid-feedback d-block"
                                    >
                                        {{ formErrors.email[0] }}
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <input
                                        type="password"
                                        class="form-control"
                                        placeholder="Password"
                                        v-model="form.password"
                                        :class="{
                                            'invalid-bg': formErrors.password,
                                        }"
                                    />
                                    <div
                                        v-if="formErrors.password"
                                        class="invalid-feedback d-block"
                                    >
                                        {{ formErrors.password[0] }}
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="mt-2">
    <button class="btn c-btn-theme-primary w-100" type="submit" :disabled="formStatus != 1">
        {{ translate("Login") }}
        <span v-if="formStatus != 1" class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
    </button>
</div>

                                </div>
                            </form>
                            <div class="col-12 theme-color-red">
                                <p class="small mb-0 theme-color-red">
                                    <br />

                                    <a
                                        data-bs-toggle="modal"
                                        data-bs-target="#CustomerRegisterModal"
                                        class="text-decoration-none text-black c-pointer"
                                    >
                                        {{ translate("Register new user") }}
                                    </a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="CustomerRegisterModal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="text-center text-black mt-4">
                            <h2>Register user</h2>
                        </div>
                        <div class="block-content p-4">
                            <div class="row">
                                <div class="col-12">
                                    <label for="email" class="form-label"
                                        >{{ translate("Full name") }}
                                    </label>
                                    <input
                                        type="text"
                                        class="form-control"
                                        :class="{
                                            'invalid-bg':
                                                registerFormErrors.user_name,
                                        }"
                                        v-model="registerForm.user_name"
                                        :placeholder="translate('Full name')"
                                    />
                                    <div
                                        v-if="registerFormErrors.user_name"
                                        class="invalid-feedback"
                                    >
                                        {{ registerFormErrors.user_name[0] }}
                                    </div>
                                </div>

                                <div class="col-12">
                                    <label for="email" class="form-label mt-2"
                                        >{{ translate("Email") }}
                                    </label>
                                    <input
                                        type="text"
                                        class="form-control"
                                        :class="{
                                            'invalid-bg':
                                                registerFormErrors.email,
                                        }"
                                        v-model="registerForm.email"
                                        :placeholder="translate('Email')"
                                    />
                                    <div
                                        v-if="registerFormErrors.email"
                                        class="invalid-feedback"
                                    >
                                        {{ registerFormErrors.email[0] }}
                                    </div>
                                </div>

                                <div class="col-12">
                                    <label
                                        for="password"
                                        class="form-label mt-2"
                                        >{{ translate("Password") }}
                                    </label>
                                    <input
                                        type="password"
                                        class="form-control"
                                        :class="{
                                            'invalid-bg':
                                                registerFormErrors.password,
                                        }"
                                        v-model="registerForm.password"
                                        :placeholder="translate('Password')"
                                    />
                                    <div
                                        v-if="registerFormErrors.password"
                                        class="invalid-feedback"
                                    >
                                        {{ registerFormErrors.password[0] }}
                                    </div>
                                </div>

                                <div class="col-12">
                                    <label
                                        for="confirm_password"
                                        class="form-label mt-2"
                                        >{{ translate("Confirm password") }}
                                    </label>
                                    <input
                                        type="password"
                                        class="form-control"
                                        :class="{
                                            'invalid-bg':
                                                registerFormErrors.confirm_password,
                                        }"
                                        v-model="registerForm.confirm_password"
                                        :placeholder="
                                            translate('Confirm password')
                                        "
                                    />
                                    <div
                                        v-if="
                                            registerFormErrors.confirm_password
                                        "
                                        class="invalid-feedback"
                                    >
                                        {{
                                            registerFormErrors
                                                .confirm_password[0]
                                        }}
                                    </div>
                                </div>

                                <br />
                                <div class="col-12">
                                    <div class="mt-2">
                                        <button 
    class="btn c-btn-theme-primary w-100" 
    type="submit" 
    @click="register" 
    :disabled="registerFormStatus != 1"
>
    {{ translate("Register") }}
    <span v-if="registerFormStatus != 1" class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
</button>


                                        <button
                                            type="button"
                                            class="btn btn-secondary"
                                            data-bs-dismiss="modal"
                                            style="display: none"
                                            ref="registerModalClose"
                                        >
                                            Close
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 theme-color-red">
                                <p class="small mb-0 theme-color-red">
                                    <br />

                                    <a
                                        data-bs-toggle="modal"
                                        data-bs-target="#CustomerLoginModal"
                                        class="text-decoration-none text-black c-pointer"
                                    >
                                        {{ translate("Login") }}
                                    </a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <button
            ref="closeModal"
            hidden="hidden"
            data-bs-dismiss="modal"
        ></button>
    </Master>
</template>

<script>
export default {
    components: {},
    created() {},
    props: ["user_status", "home_id", "user_name","page"],
    data() {
        return {
            logo: external_website.logo,
            name: external_website.name,
            website_address: "",
            website_phone: "",

            form: {
                email: "",
                password: "",
            },
            formErrors: [],
            formStatus: 1,

            registerForm: {
                user_name: "",
                email: "",
                password: "",
                confirm_password: "",
                role: "customer",
                process_by: "User",
                process_status: "New",
            },
            registerFormErrors: [],
            registerFormStatus: 1,
        };
    },
    methods: {
        login() {
            this.formStatus = 0;
            axios
                .post("/api/login-user", this.form)
                .then((response) => {
                    this.formErrors = [];
                    this.formStatus = 1;
                    this.processing = "login";

                    if (response.data == "not-verified") {
                        this.user_confirmation_email = this.form.email;
                    } else {
                        // window.location.href = "/";
                        window.location.reload();
                    }
                })
                .catch((error) => {
                    this.formStatus = 1;
                    toastr.error(error.response.data.message);
                    if (error.response.data.errors) {
                        this.formErrors = error.response.data.errors;
                    }
                });
        },

        // Registering user

        register() {
            this.registerFormStatus = 0;
            this.registerForm.role = "customer";
            this.registerForm.process_status = "New";
            axios
                .post("/api/register-submit", this.registerForm)
                .then((response) => {
                    toastr.success(
                        this.translate("New account registered succesfully!")
                    );
                    this.registerFormStatus = 1;
                    this.processing = "register-new-user";

                    this.user_confirmation_email = this.registerForm.email;

                    this.$refs.openCustomerLoginModal.click();

                    this.registerFormErrors = [];
                })
                .catch((error) => {
                    this.registerFormStatus = 1;

                    toastr.error(error.response.data.message);
                    if (error.response.data.errors) {
                        this.registerFormStatus = 1;
                        this.registerFormErrors = error.response.data.errors;
                    }
                });
        },
        clearFields() {
            this.registerForm.user_name = "";
            this.registerForm.email = "";
            this.registerForm.password = "";
            this.registerForm.confirm_password = "";
            this.registerForm.role = "";
            this.registerForm.process_status = "";
            this.registerFormErrors = [];

            this.form.email = "";
            this.form.password = "";
            this.formErrors = [];
        },
    },
};
</script>
<style>
html,
body {
    height: 100%;
}
.beat {
    animation: beating 1s infinite;
}
@keyframes beating {
    0%,
    100% {
        transform: scale(1);
    }
    50% {
        transform: scale(1.1);
    }
}
</style>
