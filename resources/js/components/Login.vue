<template>
    <div>
        <main class="form-signin m-auto">
            <div class="card">
                <div class="card-body">
                    
                    <form @submit.prevent="login">
                        <!-- <h1 class="h3 mb-3 fw-normal">Please sign in</h1> -->

                        <div class="mb-3">
                            <label for="email" class="form-label"
                            >{{ translate("Email") }}
                        </label>
                            <input
                                type="Email"
                                class="form-control"
                                placeholder="Email"
                                v-model="form.email"
                            />
                            <div
                                v-if="formErrors.email"
                                class="invalid-feedback d-block"
                            >
                                {{ formErrors.email[0] }}
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label"
                            >{{ translate("Password") }}
                        </label>
                            <input
                                type="password"
                                class="form-control"
                                placeholder="Password"
                                v-model="form.password"
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
                                <button
                                    v-if="formStatus == 1"
                                    class="btn btn-primary w-100"
                                    type="submit"
                                >
                                    {{ translate("Log in") }}
                                </button>

                                <button
                                    class="btn btn-success w-100"
                                    type="submit"
                                    disabled
                                    v-else
                                >
                                    {{ translate("Log in") }}
                                    <span
                                        class="spinner-border spinner-border-sm"
                                        role="status"
                                        aria-hidden="true"
                                    ></span>
                                </button>
                            </div>
                        </div>
                    </form>
                    <div class="col-12 theme-color-red">
                        <p class="small mb-0 theme-color-red">
                            <br />

                            <a href="/register" class="theme-color-red">
                                {{ translate("Register new user") }}
                            </a>
                        </p>
                    </div>
                    <div class="col-12 theme-color-red">
                        <p class="small mb-0 theme-color-red">
                            <br />

                            <a href="/forgot-password" class="theme-color-red">
                                {{ translate("Forgot password") }}
                            </a>
                        </p>
                    </div>
                </div>
            </div>
        </main>
    </div>
</template>

<script>
export default {
    props: ["message"],
    created() {
        if (this.message) {
            toastr.success(this.message);
        }
    },
    data() {
        return {
            logo: external_website.logo,
            name: external_website.name,
            form: {
                email: "",
                password: "",
            },
            formErrors: [],
            formStatus: 1,
        };
    },
    methods: {
        async login() {
            this.formStatus = 0;
            await axios
                .post("/api/login-user", this.form)
                .then((response) => {
                    // toastr.success(this.translate("You are logged in"));

                    this.formErrors = [];
                    this.formStatus = 1;
                    // window.location.href = window.location.href;
                    window.location.href = "/dashboard";
                })
                .catch((error) => {
                    this.formStatus = 1;
                    toastr.error(error.response.data.message);
                    if (error.response.data.errors) {
                        this.formErrors = error.response.data.errors;
                    }
                });
        },
        setAltImg(event) {
            event.target.src = "/images/default_image.png";
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
