<template>
    <Master>
        <div class="row" >
            <div class="col-md-3"></div>
            <div class="col-md-6 p-5">
            <div class="card mb-3">
                <div class="card-body ">
                     <h2 class="text-center p-4">Reset password</h2>
                    <form @submit.prevent="reset_password">
                        <!-- <h1 class="h3 mb-3 fw-normal">Please sign in</h1> -->

                        <div class="col-12">
                            <label for="password" class="form-label"
                                >{{ translate("Password") }}
                            </label>
                            <input
                                type="password"
                                class="form-control"
                                :class="{
                                    'invalid-bg': formErrors.password,
                                }"
                                id="password"
                                v-model="form.password" 
                            />
                            <div
                                v-if="formErrors.password"
                                class="invalid-feedback"
                            >
                                {{ formErrors.password[0] }}
                            </div>
                        </div>

                        <div class="col-12">
                            <label for="confirm_password" class="form-label"
                                >{{ translate("Confirm Password") }}
                            </label>
                            <input
                                type="password"
                                class="form-control"
                                :class="{
                                    'invalid-bg': formErrors.confirm_password,
                                }"
                                id="confirm_password"
                                v-model="form.confirm_password"
                                
                            />
                            <div
                                v-if="formErrors.confirm_password"
                                class="invalid-feedback"
                            >
                                {{ formErrors.confirm_password[0] }}
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="mt-2">
                                <button
                                    v-if="formStatus == 1"
                                    class="btn btn-success w-100"
                                    type="submit"
                                >
                                    {{ translate("Submit") }}
                                </button>

                                <button
                                    class="btn btn-success w-100"
                                    type="submit"
                                    disabled
                                    v-else
                                >
                                    {{ translate("Submit") }}
                                    <span
                                        class="spinner-border spinner-border-sm"
                                        role="status"
                                        aria-hidden="true"
                                    ></span>
                                </button>
                            </div>
                        </div>
                    </form>
                    <!-- <div class="col-12 theme-color-red">
                        <p class="small mb-0 theme-color-red">
                            <br />

                            <a href="/register" class="theme-color-red">
                                {{ translate("Register new user") }}
                            </a>
                        </p>
                    </div> -->
                    <!-- <div class="col-12 theme-color-red">
                        <p class="small mb-0 theme-color-red">
                            <br />

                            <a href="/login" class="theme-color-red">
                                {{ translate("Login") }}
                            </a>
                        </p>
                    </div> -->
                </div>
            </div>
        </div>
        </div>
    </Master>
</template>

<script>
import Master from "@components/layout/Master.vue";
export default {
    props: ["user_id"],
    created() {
        
    },
    components: {
        Master,
    },
    data() {
        return {
            logo: external_website.logo, 
            form: {
                user_id: this.user_id,
                password: "",
                confirm_password: "",
            },
            formErrors: [],
            formStatus: 1,
        };
    },
    methods: {
         reset_password() { 
            this.formStatus = 0;
             axios
                .post("/api/reset-password", this.form)
                .then(() => {
                    toastr.success(
                        "Password successfully reset. You can now log in using the new password."
                    );
                    
                    this.formErrors = [];
                    this.formStatus = 1;
                    // window.location.href = window.location.href;
                    window.location.href = "/";
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
html,
body {
    height: 100%;
}

.form-signin {
    /* max-width: 330px;
    padding: 1rem;
    margin-top: 10% !important; */
}

.form-signin .form-floating:focus-within {
    z-index: 2;
}
</style>
