<template>
    <div class="login-wrapper">
        <main class="form-signin m-auto">
            <div class="card shadow-lg rounded-4">
                <div class="card-body p-4">
                    <div class="text-center mb-4">
                        
                        <img
                            :src="logo"
                            @error="setAltImg"
                            alt="Logo"
                            class="logo mb-3"
width="130"
                        />
                        <h2 class="h5 fw-bold">{{ name }}</h2>
                        <p class="text-muted small">Welcome back! Please login.</p>
                    </div>

                    <form @submit.prevent="login">
                        <div class="mb-3">
                            <label for="email" class="form-label">{{ translate("Email") }}</label>
                            <input
                                type="email"
                                class="form-control"
                                placeholder="Enter your email"
                                v-model="form.email"
                            />
                            <div v-if="formErrors.email" class="invalid-feedback d-block">
                                {{ formErrors.email[0] }}
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label">{{ translate("Password") }}</label>
                            <input
                                type="password"
                                class="form-control"
                                placeholder="Enter your password"
                                v-model="form.password"
                            />
                            <div v-if="formErrors.password" class="invalid-feedback d-block">
                                {{ formErrors.password[0] }}
                            </div>
                        </div>

                        <div class="d-grid mb-3">
                            <button
                                v-if="formStatus === 1"
                                class="btn btn-primary w-100"
                                type="submit"
                            >
                                {{ translate("Log in") }}
                            </button>

                            <button
                                v-else
                                class="btn btn-primary w-100"
                                type="submit"
                                disabled
                            >
                                {{ translate("Logging in") }}
                                <span
                                    class="spinner-border spinner-border-sm ms-2"
                                    role="status"
                                    aria-hidden="true"
                                ></span>
                            </button>
                        </div>

                        <div class="text-center">
                            <p class="small mb-2">
                                <a href="/forgot-password" class="text-decoration-none theme-color-red">
                                    {{ translate("Forgot password?") }}
                                </a>
                            </p>
                            <p class="small mb-0">
                                {{ translate("Don't have an account?") }}
                                <a href="/register" class="text-decoration-none theme-color-red">
                                    {{ translate("Register") }}
                                </a>
                            </p>
                        </div>
                    </form>
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
            logo: external_website.white_logo,
        };
    },
    methods: {
        async login() {
            this.formStatus = 0;
            await axios
                .post("/api/login-user", this.form)
                .then((response) => {
                    this.formErrors = [];
                    this.formStatus = 1;
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

<style scoped>
html,
body {
    height: 100%;
    background: #f8f9fa;
}

.login-wrapper {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100vh;
}

.form-signin {
    width: 100%;
    max-width: 400px;
    padding: 20px;
}

.card {
    border: none;
}

.logo {
    max-width: 120px;
    max-height: 120px;
    object-fit: contain;
}

.theme-color-red {
    color: #d9534f;
}

.btn-primary {
    background-color: #007bff;
    border-color: #007bff;
}

.btn-primary:disabled {
    background-color: #6c757d;
    border-color: #6c757d;
}
</style>
