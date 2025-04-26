<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h3 class="mb-0 c-theme-text-color">
                    <span>{{ translate("Blog Posts") }}</span>
                </h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item c-theme-text-color">
                            <a class="c-theme-text-color" href="#">Home</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span>{{ translate("Blog Posts") }}</span>
                        </li>
                    </ol>
                </nav>
            </div>
            <div>
                <a
                    class="btn btn-success"
                    title="Details"
                    href="/blogs/post/create"
                >
                    <i class="bi bi-plus-lg"></i>
                    {{ translate("Add new blog post") }}
                </a>
            </div>
        </div>

        <section class="section">
    <div class="card shadow-lg border-0 rounded-4">
        <div class="card-body pt-4 bg-light">
            <div class="row g-3 p-3">
                <div class="input-group">
                    <div class="form-outline col-md-5">
                        <input
                            type="text"
                            v-model="form.title"
                            class="form-control c-searchbox-radius"
                            id="title"
                            :placeholder="translate('Search by title')"
                            :class="{ 'invalid-bg': formErrors.title }"
                        />

                        <div
                            class="invalid-feedback animated fadeIn"
                            v-if="formErrors.title"
                        >
                            {{ formErrors.title[0] }}
                        </div>
                    </div>

                    <button
                        v-if="formStatus === 1"
                        @click="search(null)"
                        class="btn btn-success"
                    >
                        <i class="bi bi-search"></i>
                    </button>

                    <button
                        v-else
                        class="btn btn-success"
                        type="button"
                    >
                        <span
                            class="spinner-border spinner-border-sm"
                            role="status"
                            aria-hidden="true"
                        ></span>
                    </button>
                </div>
            </div>

            <div class="table-responsive">
                <div class="accordion" id="blogAccordion">
                    <div
                        class="accordion-item mb-3 rounded-4 overflow-hidden shadow-sm"
                        v-for="(post, index) in blogPosts"
                        :key="post.id"
                    >
                        <h2 class="accordion-header">
                            <button
                                class="accordion-button bg-gradient bg-primary text-white fw-semibold"
                                type="button"
                                :data-bs-toggle="'collapse'"
                                :data-bs-target="'#collapse' + post.id"
                                aria-expanded="false"
                                :aria-controls="'collapse' + post.id"
                            >
                                {{ index + 1 }}. {{ post.title }} - {{ post.author_name }}
                            </button>
                        </h2>
                        <div
                            :id="'collapse' + post.id"
                            class="accordion-collapse collapse"
                            :aria-labelledby="'heading' + post.id"
                            data-bs-parent="#blogAccordion"
                        >
                            <div class="accordion-body bg-white">
                                <!-- Actions -->
                                <div class="d-flex justify-content-end p-3">
                                    <div class="btn-group">
                                        <a
                                            type="button"
                                            class="btn btn-sm fs-6"
                                            title="Edit"
                                            :href="'/blogs/post/edit/' + post.id"
                                        >
                                            <i class="bi bi-pencil c-theme-text-color"></i>
                                        </a>
                                        <DeleteModal
                                            :deleteId="post.id"
                                            @deleteThis="deleteThis"
                                        />
                                    </div>
                                </div>

                                <!-- Content -->
                                <div class="row g-3">
                                    <div class="col-md-4">
                                        <strong>{{ translate("Title") }}:</strong>
                                        <p>{{ post.title }}</p>
                                    </div>
                                    <div class="col-md-4">
                                        <strong>{{ translate("Author") }}:</strong>
                                        <p>{{ post.author_name }}</p>
                                    </div>
                                    <div class="col-md-4">
                                        <strong>{{ translate("Date Published") }}:</strong>
                                        <p>{{ post.created_at | formatDate }}</p>
                                    </div>
                                </div>

                                <!-- Image Preview -->
                                <div class="my-3">
                                    <strong>{{ translate("Image") }}:</strong>
                                    <div>
                                        <image-zooming-component
                                            :file="post.image"
                                            :width="250"
                                        />
                                    </div>
                                </div>

                                <!-- Content Body -->
                                <div class="my-3">
                                    <strong>{{ translate("Content") }}:</strong>
                                    <div class="content ql-editor" v-html="post.content"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="text-center">
                <button
                    v-if="pagination.next_page_url"
                    @click="search(pagination.next_page_url)"
                    class="btn btn-success"
                >
                    {{ translate("Load More") }}
                </button>
            </div>
        </div>
    </div>
</section>

    </Master>
</template>

<script>
import Master from "@components/backend/layout/Master.vue";
import axios from "axios";
 
export default {
    components: {
        Master, 
    },
    data() {
        return {
            blogPosts: [],
            form: {
                title: "",
            },
            formErrors: [],
            formStatus: 1,
            pagination: {},
            default_url: "/api/fetch/blogs/posts",
        };
    },
    created() {
        this.search(this.default_url);
    },
    methods: {
        makePagination(res) {
            let pagination = {
                links: res.links,
                current_page: res.current_page,
                last_page: res.last_page,
                next_page_url: res.next_page_url,
                prev_page_url: res.prev_page_url,
            };
            this.pagination = pagination;
        },
        search(page_url) {
            this.formStatus = 0;
            if (!page_url) {
                this.firstTimeLoadCheck = 1;
            }
            page_url = page_url || this.default_url;

            let formData = new FormData();
            formData.append("title", this.form.title || "");

            axios
                .post(page_url, formData)
                .then((response) => {
                    if (this.firstTimeLoadCheck === 1) {
                        this.blogPosts = response.data.data;
                        this.firstTimeLoadCheck = 0;
                    } else {
                        this.blogPosts = this.blogPosts.concat(
                            response.data.data
                        );
                    }
                    this.formStatus = 1;
                    this.makePagination(response.data);
                })
                .catch((error) => {
                    this.formStatus = 1;
                    toastr.error(error.response.data.message);
                    if (error.response.data.errors) {
                        this.formErrors = error.response.data.errors;
                    }
                });
        },
        deleteThis(id) {
            axios
                .post("/api/blogs/post/delete/" + id)
                .then((response) => {
                    toastr.success(
                        this.translate("Blog post deleted successfully.")
                    );
                    setTimeout(() => {
                        this.search(null);
                    }, 2000);
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        setAltImg(event) {
        event.target.src = "/images/default_image.png";
    },
    },
};
</script>

<style scoped>
.c-linked {
    text-decoration: none;
}
.c-mouse-over {
    cursor: pointer;
    font-weight: bold;
}
</style>
