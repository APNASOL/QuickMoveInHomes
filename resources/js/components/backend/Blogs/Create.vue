<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h3 class="mb-0 c-theme-text-color">
                    <span v-if="blog_post_id">{{ translate("Edit Blog Post") }}</span>
                    <span v-else>{{ translate("Create Blog Post") }}</span>
                </h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item" aria-current="page">
                            <span>{{ translate("Blog Posts") }}</span>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span v-if="blog_post_id">{{ translate("Update") }}</span>
                            <span v-else>{{ translate("Create") }}</span>
                        </li>
                    </ol>
                </nav>
            </div>

            <div class="mb-3 d-flex justify-content-end">
                <a class="btn btn-success justify-content-end" href="/blog_posts">
                    <i class="bi bi-list"></i> {{ translate("Blog Posts") }}</a>
            </div>
        </div>

        <div class="card c-card-border">
            <div class="card-body pt-4">
                <form @submit.prevent="submit">
                    <div class="row g-3">
                        <div class="col-12">
                            <label>{{ translate("Choose Status") }}</label>
                            <br />
                            <div class="d-inline-block me-2">
                                {{ translate("OFF") }}
                            </div>
                            <div class="form-check form-switch d-inline-block">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    :class="{ 'invalid-bg': formErrors.status }"
                                    v-model="form.status"
                                    checked
                                />
                                <label class="form-check-label">{{ translate("ON") }}</label>
                            </div>

                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.status"
                            >
                                {{ formErrors.status[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-12">
                            <label for="title">{{ translate("Title") }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="title"
                                :class="{ 'invalid-bg': formErrors.title }"
                                v-model="form.title"
                            />

                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.title"
                            >
                                {{ formErrors.title[0] }}
                            </div>
                        </div>
                         
                    <div>
                        <div class="col-12 col-md-12">
                            <label for="content">{{ translate("Content") }}</label>
                             
                            <QuillEditor
                            v-model:content="form.content"
                            contentType="html"
                            toolbar="full"
                            theme="snow"
                        />
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.content"
                            >
                                {{ formErrors.content[0] }}
                            </div>
                        </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label>{{ translate("Image") }}</label>
                            <div>
                                <ImageCropper
                                    @croppedImg="croppedImgSubmit"
                                    :ratio="1.6"
                                />
                                <br />

                                <image-zooming-component
                                    v-if="blog_post_image"
                                    :file="blog_post_image"
                                    :custom_class="'img-fluid img-thumbnail rounded'"
                                    :width="150"
                                />
                                <image-zooming-component
                                    v-else
                                    :file="blog_post_image ?? 'empty.png'"
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
                            v-if="formStatus"
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
import { QuillEditor } from "@vueup/vue-quill";
import "@vueup/vue-quill/dist/vue-quill.snow.css";
import Multiselect from "@vueform/multiselect";
import axios from "axios";

export default {
    props: ["blog_post_id"],
    components: {
        Master, 
        Multiselect,
        QuillEditor
    },
    created() {
        if (this.blog_post_id) {
            this.getBlogPost();
        }
        this.pluckUser();
    },
    data() {
        return {
            form: {
                blog_post_id: this.blog_post_id ?? "",
                title: "",
                content: "",
                user_id: "",
                status: true, // Default status to true (active)
                image: "",
            },
            formErrors: [],
            formStatus: true,
            blog_post_image: "",
            users_options: "",
        };
    },
    methods: {
        getBlogPost() {
            axios
                .get("/api/get/blogs/post/" + this.blog_post_id)
                .then((response) => {
                    this.form.title = response.data.title;
                    this.form.content = response.data.content;
                    this.form.status = response.data.status;
                    this.form.user_id = response.data.author_id;
                    this.blog_post_image = response.data.image;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        pluckUser() {
            axios
                .get("/api/users/pluck")
                .then((response) => {
                    this.users_options = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },

        

        submit() {
            this.formStatus = false;
            let formData = new FormData();
            formData.append("blog_post_id", this.form.blog_post_id);
            formData.append("title", this.form.title);
            formData.append("content", this.form.content);
            formData.append("status", this.form.status ? 1 : 0);
          
                formData.append("image", this.form.image);
           
 

            axios
                .post("/api/blog/post/store", this.form)
                .then((response) => {
             
                    this.formStatus = true;
                    toastr.success(this.translate("Blog Post saved successfully"));
                    this.formErrors = [];
                    setTimeout(() => {
                        window.location.href = "/blogs/posts";
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
        croppedImgSubmit(img) {
            this.form.image = img;
            this.blog_post_image = img;
        },
    },
};
</script>
