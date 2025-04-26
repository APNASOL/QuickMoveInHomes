<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h1 class="mb-0">
                    <span>{{ translate("Our promises") }}</span>
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
                    :href="'/create-our-promise'"
                >
                    {{ translate("Add new prmise") }}
                </a>
            </div>
        </div>
        <!-- End Page Title -->
        <section class="section">
    <div class="card shadow-lg border-0 rounded-4">
        <div class="card-body pt-4 bg-light">
            <!-- Search Input -->
            <div class="row g-3 p-3">
                <div class="input-group">
                    <div class="form-outline col-md-5">
                        <input
                            type="text"
                            v-model="form.title"
                            class="form-control rounded-pill shadow-sm"
                            id="promise"
                            :placeholder="translate('Search by promise')"
                            :class="{ 'is-invalid': formErrors.title }"
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
                        @click="fetchPromises(null)"
                        class="btn btn-success ms-2 rounded-pill shadow-sm"
                    >
                        <i class="bi bi-search"></i>
                    </button>

                    <button
                        v-else
                        class="btn btn-success ms-2 rounded-pill shadow-sm"
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

            <!-- Table with stripped rows -->
            <div class="table-responsive mt-4 rounded-4 shadow-sm">
                <table class="table table-striped table-hover align-middle bg-white rounded-4">
                    <thead class="table-primary text-dark">
                        <tr>
                            <th class="text-center">{{ translate("#") }}</th>
                            <th>{{ translate("Title") }}</th>
                            <th>{{ translate("Description") }}</th>
                            <th>{{ translate("Icon") }}</th>
                            <th class="text-center">{{ translate("Actions") }}</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(show, index) in Promises" :key="show.id">
                            <th class="text-center">{{ index + 1 }}</th>
                            <td>{{ show.title }}</td>
                            <td>{{ show.description }}</td>
                            <td>
                                <image-zooming-component
                                    v-if="show.icon"
                                    :file="show.icon ?? 'empty.png'"
                                    :width="150"
                                />
                            </td>

                            <td class="text-center">
                                <div class="btn-group">
                                    <a
                                        v-if="show.id"
                                        type="button"
                                        class="btn btn-sm btn-outline-primary rounded-pill"
                                        :title="translate('Edit')"
                                        :href="'/edit-our-promise/' + show.id"
                                    >
                                        <i class="bi bi-pencil"></i>
                                    </a>

                                    <DeleteModal
                                        :deleteId="show.id"
                                        @deleteThis="deleteThis"
                                    />
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- End Table with stripped rows -->

            <!-- Load More Button -->
            <div class="text-center mt-4">
                <button
                    v-if="pagination.next_page_url"
                    @click="fetchPromises(pagination.next_page_url)"
                    class="btn btn-success rounded-pill shadow-sm"
                >
                    {{ translate("Load more") }}
                    <span
                        v-if="loadMoreStatus == 0"
                        class="spinner-border text-white spinner-border-sm"
                        role="status"
                        aria-hidden="true"
                    ></span>
                </button>
            </div>
        </div>
    </div>
</section>


        <!-- End #main -->
    </Master>
</template>

<script>
import Master from "@components/backend/layout/Master.vue";
export default {
    components: {
        Master,
    },
    created() {
        this.fetchPromises(this.default_url);
    },
    data() {
        return {
            default_url: "api/fetch-our-promises",
            Promises: [],
            deleteId: null,
            form: {
                title: "",
            },
            loaderForTimes: 1,
            pagination: {},
            loadMoreStatus: 1,

            formErrors: [],
            formStatus: 1,
            firstTimeLoadCheck: 0,
        };
    },

    methods: {
        fetchPromises(page_url) {
            if (!page_url) {
                this.firstTimeLoadCheck = 1;
                this.formStatus = 0;
            } else {
                this.loadMoreStatus = 0;
            }
            page_url = page_url || this.default_url;
            let formData = new FormData();
            formData.append("title", this.form.title);

            axios
                .post(page_url, formData)
                .then((response) => {
                    // this.Promises = response.data;
                    if (this.firstTimeLoadCheck == 1) {
                        this.Promises = response.data.data;
                        this.firstTimeLoadCheck = 0;
                        this.formStatus = 1;
                    } else {
                        this.Promises = this.Promises.concat(
                            response.data.data
                        );
                        this.loadMoreStatus = 1;
                        this.formStatus = 1;
                    }
                    this.makePagination(response.data);
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
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
        passDeleteId(id) {
            this.deleteId = id;
        },
        deleteThis(id) {
            axios
                .post("/api/our-promise-delete/" + id)
                .then(() => {
                    toastr.success(
                        this.translate("Promise deleted successfully")
                    );
                    this.fetchPromises();
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
    },
};
</script>

<style>
.table td,
.table th {
    vertical-align: middle;
}
</style>
