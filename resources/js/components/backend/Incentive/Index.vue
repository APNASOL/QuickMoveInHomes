<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h3 class="mb-0 c-theme-text-color">
                    <span>Incentives</span>
                </h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item c-theme-text-color">
                            <a class="c-theme-text-color" href="#">Home</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span>Incentives</span>
                        </li>
                    </ol>
                </nav>
            </div>
            <div>
                <a
                    class="btn btn-success"
                    title="Details"
                    :href="'/incentive/create'"
                >
                    <i class="bi bi-plus-lg"></i>
                    {{ translate("Add new incentive") }}
                </a>
            </div>
        </div>

        <section class="section">
            <div class="card c-card-border">
                <div class="card-body pt-4">
                    <div class="row g-3 p-3">
                        <div class="input-group">
                            <div class="form-outline col-md-5">
                                <input
                                    type="text"
                                    v-model="form.title"
                                    class="form-control c-searchbox-radius"
                                    id="title"
                                    :placeholder="translate('Search by title')"
                                    :class="{
                                        'invalid-bg': formErrors.title,
                                    }"
                                />

                                <div
                                    class="invalid-feedback animated fadeIn"
                                    v-if="formErrors.title"
                                >
                                    {{ formErrors.title[0] }}
                                </div>
                            </div>

                            <button
                                v-if="formStatus == 1"
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

                    <div class="accordion" id="accordionExample">
                        <div
                            class="accordion-item"
                            v-for="(incentive, index) in incentives"
                            :key="incentive.id"
                        >
                            <h2 class="accordion-header">
                                <button
                                    class="accordion-button collapsed"
                                    type="button"
                                    :data-bs-toggle="'collapse'"
                                    :data-bs-target="'#collapse' + index"
                                    :aria-expanded="
                                        index === 0 ? 'true' : 'false'
                                    "
                                    :aria-controls="'collapse' + index"
                                >
                                   <b> {{ incentive.title }} -
                                    {{ incentive.interest_rate_first_year }}% -
                                    {{ incentive.builder_name }}</b>
                                    
                                </button>
                            </h2>
                            <div
                                :id="'collapse' + index"
                                class="accordion-collapse collapse"
                                data-bs-parent="#accordionExample"
                            >
                                <div class="accordion-body">
                                    <strong>Status:</strong>
                                    {{ incentive.status }}<br /> 
                                    <strong>Start Date:</strong>
                                    {{ incentive.start_date }}<br />
                                    <strong>End Date:</strong>
                                    {{ incentive.end_date }}<br />

                                    <strong>Descriptions:</strong>
                                    <div
                                        class="content ql-editor"
                                        v-html="incentive.description"
                                    ></div>
                                    <div>
                                        <strong>Banner</strong>
                                        <br />
                                        <image-zooming-component
                                            :file="
                                                incentive.incentive_banner ??
                                                'empty.png'
                                            "
                                            :width="350"
                                        />
                                    </div>

                                    <div class="btn-group mt-2">
                                        <a
                                            type="button"
                                            class="btn btn-sm fs-6"
                                            title="Edit"
                                            :href="
                                                '/incentive/edit/' +
                                                incentive.id
                                            "
                                        >
                                            <i
                                                class="bi bi-pencil c-theme-text-color"
                                            ></i>
                                        </a>
                                        <DeleteModal
                                            :deleteId="incentive.id"
                                            @deleteThis="deleteThis"
                                        />

                                    
                                    </div>
                                    <br>
                                    Created at on : {{ incentive.created_at }}
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="text-center mt-4">
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

export default {
    components: {
        Master,
    },
    created() {
        this.search(this.default_url);
    },
    data() {
        return {
            default_url: "/api/fetch-incentives",
            incentives: [],
            form: {
                title: "",
            },
            formErrors: [],
            firstTimeLoadCheck: 0,
            formStatus: 1,
            pagination: {},
        };
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
                        this.incentives = response.data.data;
                        this.firstTimeLoadCheck = 0;
                    } else {
                        this.incentives = this.incentives.concat(
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
                .post("/api/incentive/delete/" + id)
                .then((response) => {
                    toastr.success(
                        this.translate("Incentive deleted successfully.")
                    );
                    setTimeout(() => {
                        this.search(null);
                    }, 2000);
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
    },
};
</script>

<style>
.c-linked {
    text-decoration: none;
}
.c-mouse-over {
    cursor: pointer;
    font-weight: bold;
}
</style>
