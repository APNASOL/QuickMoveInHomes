<template>
    
        <div class="form-signin w-100 m-auto">
            <div class="card mb-3">
                <div class="card-body">
                    <div class="pt-4 pb-4">
                        <div class="text-center pb-0">
                            <a href="/"> 
                                <img :src="logo" alt="" width="150" />
                            </a>
                        </div>
                    </div>

                    <div class="col-12">
                        <label for="email" class="form-label"
                            >{{ translate("Full name") }}
                        </label>
                        <input
                            type="text"
                            class="form-control"
                            :class="{
                                'invalid-bg': formErrors.user_name,
                            }"
                            v-model="form.user_name"
                            :placeholder="translate('Full name')"
                        />
                        <div
                            v-if="formErrors.user_name"
                            class="invalid-feedback"
                        >
                            {{ formErrors.user_name[0] }}
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
                                'invalid-bg': formErrors.email,
                            }"
                            v-model="form.email"
                            :placeholder="translate('Email')"
                        />
                        <div v-if="formErrors.email" class="invalid-feedback">
                            {{ formErrors.email[0] }}
                        </div>
                    </div>

                    <div class="col-12">
                        <label for="role" class="form-label">{{
                            translate("Account type")
                        }}</label>
                        <br />
                        <div class="btn-group w-100" role="group">
                            <button
                                class="btn w-100"
                                :class="{
                                    'btn-success': form.role === 'user',
                                    'btn-primary': form.role !== 'user',
                                    'invalid-bg': formErrors.role,
                                }"
                                @click="selectRole('user')"
                            >
                                {{ translate("User") }}
                            </button>
                            <button
                                class="btn w-100"
                                :class="{
                                    'btn-success': form.role === 'tour operator',
                                    'btn-primary': form.role !== 'tour operator',
                                    'invalid-bg': formErrors.role,
                                }"
                                @click="selectRole('tour operator')"
                            >
                                {{ translate("Tour operator") }}
                            </button>
                        </div>
                        <div v-if="formErrors.role" class="invalid-feedback">
                            {{ formErrors.role[0] }}
                        </div>
                    </div>

                    <div class="col-12">
                        <label for="password" class="form-label mt-2"
                            >{{ translate("Password") }}
                        </label>
                        <input
                            type="password"
                            class="form-control"
                            :class="{
                                'invalid-bg': formErrors.password,
                            }"
                            v-model="form.password"
                            :placeholder="translate('Password')"
                        />
                        <div
                            v-if="formErrors.password"
                            class="invalid-feedback"
                        >
                            {{ formErrors.password[0] }}
                        </div>
                    </div>

                    <div class="col-12">
                        <label for="confirm_password" class="form-label mt-2"
                            >{{ translate("Confirm password") }}
                        </label>
                        <input
                            type="password"
                            class="form-control"
                            :class="{
                                'invalid-bg': formErrors.confirm_password,
                            }"
                            v-model="form.confirm_password"
                            :placeholder="translate('Confirm password')"
                        />
                        <div
                            v-if="formErrors.confirm_password"
                            class="invalid-feedback"
                        >
                            {{ formErrors.confirm_password[0] }}
                        </div>
                    </div>

                    <br />
                    <div class="col-12">
                        <div class="mt-2">
                            <button
                                v-if="formStatus == 1"
                                class="btn btn-success w-100"
                                type="submit"
                                @click="register"
                            >
                                {{ translate("Register") }}
                            </button>

                            <button
                                class="btn btn-success w-100"
                                type="submit"
                                disabled
                                v-else
                            >
                                {{ translate("Register") }}
                                <span
                                    class="spinner-border spinner-border-sm"
                                    role="status"
                                    aria-hidden="true"
                                ></span>
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
            </div>
        </div>
     
</template>

<script>
export default {
    data() {
        return {
            logo: external_website.logo,
            form: {
                user_name: "",
                email: "",
                password: "",
                confirm_password: "",
                role: "",
                process_by : "User",
                process_status : "New",
            },  
            formErrors: [],
            formStatus: 1,
        };
    },
    methods: {
        selectRole(type) {
            this.form.role = type;
        },
        async register() {
            this.formStatus = 0;
            await axios
                .post("/api/register-submit", this.form)
                .then((response) => {
                    toastr.success(
                        this.translate("Email sent please check to verify")
                    );
                    window.location.href = "/";
                    this.formErrors = [];
                })
                .catch((error) => {
                    this.formStatus = 1;

                    toastr.error(error.response.data.message);
                    if (error.response.data.errors) {
                        this.formStatus = 1;
                        this.formErrors = error.response.data.errors;
                    }
                });
        },
    },
};
</script>
<style>
html,
body {
    height: 100%;
}
 
.form-signin {
    max-width: 330px;
    padding: 1rem;
    margin-top: 10% !important;
}

.form-signin .form-floating:focus-within {
    z-index: 2;
}
</style>
