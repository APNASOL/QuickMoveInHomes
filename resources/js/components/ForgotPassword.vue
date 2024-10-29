<template>
    <div>
        <main class="form-signin w-100 m-auto">
            <div class="card mb-3">
                <div class="card-body">
                    <div class="pt-4 pb-4">
                        <div class="text-center pb-0">
                            <a href="/"> 
                                <img :src="logo" alt="" width="150" />
                            </a>
                        </div>
                    </div>
                    <form @submit.prevent="login">
                        <!-- <h1 class="h3 mb-3 fw-normal">Please sign in</h1> -->

                        <div class="mb-3">
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

                        <div class="col-12">
                            <div class="mt-2">
                                <button
                                    v-if="formStatus == 1"
                                    class="btn btn-primary w-100"
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

                            <a href="/login" class="theme-color-red">
                                {{ translate("Login") }}
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
            alert(this.message);
        }
    },
    data() {
        return {
            logo: external_website.logo,
            form: {
                email: "",
            },
            formErrors: [],
            formStatus: 1,
        };
    },
    methods: {
        async login() {
            this.formStatus = 0;
            await axios
                .post("/api/forgot-password", this.form)
                .then((response) => {
                    toastr.success("Email send please check your email.");

                    this.formErrors = [];
                    this.formStatus = 1;
                    // window.location.href = window.location.href;
                    window.location.href = "/login";
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
    max-width: 330px;
    padding: 1rem;
    margin-top: 10% !important;
}

.form-signin .form-floating:focus-within {
    z-index: 2;
}
</style>
