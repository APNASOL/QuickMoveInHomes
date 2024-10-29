<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h1 class="mb-0">
                    <span v-if="our_promise_id">
                        {{ form.title }} {{ translate("Update") }}</span
                    >
                    <span v-else>{{ translate("Our promise") }}</span>
                </h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span>{{ translate("promises") }}</span>
                        </li>
                    </ol>
                </nav>
            </div>

            <div>
                <a
                    class="btn btn-success"
                    title="Details"
                    :href="'/our-promises'"
                >
                    {{ translate("Our promises") }}
                </a>
            </div>
        </div>

        <!-- End Page Title -->
        <section class="section">
            <div class="card">
                <div class="card-body pt-4">
                    <!-- Floating Labels Form -->
                    <form @submit.prevent="submit">
                        <div class="row g-3">
                            <div class="col-12 col-md-12">
                                <div>
                                    <label for="title">
                                        {{ translate("Title") }}</label
                                    >
                                    <input
                                        type="text"
                                        class="form-control"
                                        id="title"
                                        :class="{
                                            'invalid-bg': formErrors.title,
                                        }"
                                        v-model="form.title"
                                    />
                                </div>
                                <div
                                    class="invalid-feedback animated fadeIn"
                                    v-if="formErrors.title"
                                >
                                    {{ formErrors.title[0] }}
                                </div>
                            </div>

                            <div class="form-group">
                                <div>
                                    <label for="description">{{
                                        translate("Description")
                                    }}</label>
                                    <textarea
                                        class="form-control"
                                        id="description"
                                        :class="{
                                            'invalid-bg':
                                                formErrors.description,
                                        }"
                                        v-model="form.description"
                                        rows="6"
                                        style="height: 100px"
                                    >
                                    </textarea>
                                </div>
                                <div
                                    class="invalid-feedback animated fadeIn"
                                    v-if="formErrors.description"
                                >
                                    {{ formErrors.description[0] }}
                                </div>
                            </div>

                            <div class="col-12 col-md-12">
                                <ImageCropper
                                    @croppedImg="croppedImgSubmit"
                                    :ratio="1"
                                />

                                <div
                                    class="invalid-feedback animated fadeIn"
                                    v-if="formErrors.icon"
                                >
                                    {{ formErrors.icon[0] }}
                                </div>

                                <div class="col-12 col-md-4">
                                    <image-zooming-component
                                        v-if="form.icon"
                                        :file="form.icon ?? 'empty.png'"
                                        :width="300"
                                    />
                                    <image-zooming-component
                                        v-else-if="existing_icon"
                                        :file="existing_icon ?? 'empty.png'"
                                        :width="300"
                                    />
                                </div>
                            </div>
                        </div>

                        <div class="mt-2">
                            <button
                                type="button"
                                @click="submit"
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
        </section>
    </Master>
    <!-- End #main -->
</template>

<script>
import Master from "@components/backend/layout/Master.vue";
import ImageCropper from "@components/global/ImageCropper.vue";
export default {
    components: {
        Master,
        ImageCropper,
    },
    props:['our_promise_id'],
    created() {
        if (this.our_promise_id) {
            this.getPromiseRecords();
        }
    },
    data() {
        return {
            form: {
                title: "",
                description: "",
                icon: "",
                id: this.our_promise_id,
            },
            formErrors: [],
            formStatus: 1,
            existing_icon:'',
        };
    },
    methods: {
        submit() {
            this.formStatus = 0;
            axios
                .post("/api/our-promise-store", this.form)
                .then((data) => {
                    // this.formStatus = 1;
                    toastr.success(
                        this.translate("Promise added successfully")
                    );
                     
                    setTimeout(() => {
                         
                         window.location.href = "/our-promises";
                         // this.getCustomPageRecords();
                     }, 2000); // Delay of 2000 milliseconds (2 seconds)
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
            this.form.icon = img;
        },
        getPromiseRecords() {
            axios
                .get("/api/edit-our-promise/" + this.our_promise_id)
                .then((response) => {
                    this.form.title = response.data.title;
                    this.form.description = response.data.description;
                    this.existing_icon = response.data.icon;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
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
</style>
