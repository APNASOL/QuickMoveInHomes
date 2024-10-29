<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h3 class="mb-0 c-theme-text-color">
                    <span>Neighborhoods</span>
                </h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item c-theme-text-color">
                            <a class="c-theme-text-color" href="#">Home</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span>Neighborhoods</span>
                        </li>
                    </ol>
                </nav>
            </div>
            <div>
                <a
                    class="btn btn-success"
                    title="Details"
                    :href="'/neighborhood/create'"
                >
                    <i class="bi bi-plus-lg"></i>
                    {{ translate("Add new neighborhood") }}
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
                                    v-model="form.name"
                                    class="form-control c-searchbox-radius"
                                    id="name"
                                    :placeholder="translate('Search by name')"
                                    :class="{
                                        'invalid-bg': formErrors.name,
                                    }"
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
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col" class="text-center">#</th>
                                    <th scope="col">
                                        {{ translate("Name") }}
                                    </th>
                                    <th scope="col">
                                        {{ translate("Location") }}
                                    </th>
                                    <th scope="col">
                                        {{ translate("Image") }}
                                    </th>
                                    <th scope="col">
                                        {{ translate("Action") }}
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr
                                    v-for="(neighborhood, index) in neighborhoods"
                                    :key="neighborhood.id"
                                >
                                    <th class="text-center">
                                        {{ index + 1 }}
                                    </th>
                                    <td>
                                        <!-- <a
                                                        type="button"
                                                        class="c-linked c-mouse-over c-theme-text-color"
                                                        title="Edit"
                                                        :href="'/neighborhood-details/' + neighborhood.id"
                                                    > -->
                                        {{ neighborhood.name }}
                                        <!-- </a> -->
                                    </td>
                                    <td>{{ neighborhood.location }}</td>
                                    <td>
                                        <image-zooming-component
                                            :file="
                                                neighborhood.image ?? 'empty.png'
                                            "
                                            :width="70"
                                        />
                                    </td>

                                    <td>
                                        <div class="btn-group">
                                            <a
                                                type="button"
                                                class="btn btn-sm fs-6"
                                                title="Edit"
                                                :href="
                                                    '/neighborhood/edit/' +
                                                    neighborhood.id
                                                "
                                                ><i
                                                    class="bi bi-pencil c-theme-text-color"
                                                ></i
                                            ></a>
                                            <DeleteModal
                                                :deleteId="neighborhood.id"
                                                @deleteThis="deleteThis"
                                            />
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
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
            default_url: "/api/fetch-neighborhoods",
            neighborhoods: [],
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
                        this.neighborhoods = response.data.data;
                        this.firstTimeLoadCheck = 0;
                    } else {
                        this.neighborhoods = this.neighborhoods.concat(
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
                .post("/api/neighborhood/delete/" + id)
                .then((response) => {
                    toastr.success(
                        this.translate("Neighborhood deleted successfully.")
                    );
                    setTimeout(() => {
                        window.location.href = "/neighborhoods";
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
