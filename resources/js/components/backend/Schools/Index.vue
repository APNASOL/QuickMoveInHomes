<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h3 class="mb-0 c-theme-text-color">
                    <span>Schools</span>
                </h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item c-theme-text-color">
                            <a class="c-theme-text-color" href="#">Home</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span>Schools</span>
                        </li>
                    </ol>
                </nav>
            </div>
            <div>
                <a
                    class="btn btn-success"
                    title="Details"
                    :href="'/school/create'"
                >
                    <i class="bi bi-plus-lg"></i>
                    {{ translate("Add new school") }}
                </a>
            </div>
        </div>

        <section class="section">
            <div class="card shadow-lg border-0 rounded-4">
                <div class="card-body pt-4 bg-light">
                    <!-- Search Input -->
                    <div class="row g-3 p-3">
                        <div class="input-group">
                            <div class="form-outline col-md-5">
                                <input
                                    type="text"
                                    v-model="form.name"
                                    class="form-control rounded-pill shadow-sm"
                                    id="name"
                                    :placeholder="translate('Search by name')"
                                    :class="{ 'is-invalid': formErrors.name }"
                                />
                                <div
                                    class="invalid-feedback animated fadeIn"
                                    v-if="formErrors.name"
                                >
                                    {{ formErrors.name[0] }}
                                </div>
                            </div>

                            <button
                                v-if="formStatus == 1"
                                @click="search(null)"
                                class="btn btn-primary ms-2 rounded-pill shadow-sm"
                            >
                                <i class="bi bi-search"></i>
                            </button>

                            <button
                                v-else
                                class="btn btn-primary ms-2 rounded-pill shadow-sm"
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

                    <!-- Schools Table -->
                    <div class="table-responsive mt-4 rounded-4 shadow-sm">
                        <table class="table table-hover align-middle bg-white">
                            <thead class="table-primary text-dark">
                                <tr>
                                    <th class="text-center">#</th>
                                    <th>{{ translate("Name") }}</th>
                                    <th>{{ translate("Type") }}</th>
                                    <th>
                                        {{ translate("Directions & details") }}
                                    </th>
                                    <th>{{ translate("Action") }}</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr
                                    v-for="(school, index) in schools"
                                    :key="school.id"
                                >
                                    <th class="text-center">{{ index + 1 }}</th>
                                    <td>
                                        {{ school.name }}
                                        <br />
                                        <span
                                            class="c-linked c-mouse-over"
                                            @click="copyToClipboard(school.id)"
                                            style="cursor: pointer; color: blue"
                                            >{{ school.id }}</span
                                        >
                                    </td>
                                    <td>{{ school.type }}</td>
                                    <td>{{ school.directions_and_details }}</td>

                                    <td>
                                        <div class="btn-group">
                                            <a
                                                class="btn btn-sm btn-outline-primary rounded-pill"
                                                title="Edit"
                                                :href="
                                                    '/school/edit/' + school.id
                                                "
                                            >
                                                <i class="bi bi-pencil"></i>
                                            </a>
                                            <DeleteModal
                                                :deleteId="school.id"
                                                @deleteThis="deleteThis"
                                            />
                                        </div>
                                    </td>
                                </tr>

                                <tr v-if="schools.length === 0">
                                    <td
                                        colspan="5"
                                        class="text-center text-muted py-4"
                                    >
                                        {{ translate("No schools found.") }}
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!-- Load More Button -->
                    <div class="text-center mt-4">
                        <button
                            v-if="pagination.next_page_url"
                            @click="search(pagination.next_page_url)"
                            class="btn btn-primary rounded-pill shadow-sm"
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
import ImageCropper from "@components/global/ImageCropper.vue";

export default {
    components: {
        Master,
    },
    created() {
        this.search(this.default_url);
    },
    data() {
        return {
            default_url: "/api/fetch-schools",
            schools: [],
            form: {
                name: "",
            },
            formErrors: [],
            firstTimeLoadCheck: 0,
            formStatus: 1,
            pagination: {},
        };
    },
    methods: {
        copyToClipboard(id) {
            navigator.clipboard
                .writeText(id)
                .then(() => {
                    toastr.success(this.translate("Copied to clipboard."));
                })
                .catch((err) => {
                    console.error("Failed to copy text: ", err);
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
        search(page_url) {
            this.formStatus = 0;
            if (!page_url) {
                this.firstTimeLoadCheck = 1;
            }
            page_url = page_url || this.default_url;

            let formData = new FormData();
            formData.append("name", this.form.name || "");

            axios
                .post(page_url, formData)
                .then((response) => {
                    if (this.firstTimeLoadCheck === 1) {
                        this.schools = response.data.data;
                        this.firstTimeLoadCheck = 0;
                    } else {
                        this.schools = this.schools.concat(response.data.data);
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
                .post("/api/school/delete/" + id)
                .then((response) => {
                    toastr.success(
                        this.translate("School deleted successfully.")
                    );
                    this.search(null);
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
