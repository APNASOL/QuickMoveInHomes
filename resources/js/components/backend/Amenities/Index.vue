<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h3 class="mb-0 c-theme-text-color">
                    <span>Amenities</span>
                </h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item c-theme-text-color">
                            <a class="c-theme-text-color" href="#">Home</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span>Amenities</span>
                        </li>
                    </ol>
                </nav>
            </div>
            <div>
                <a
                    class="btn btn-success"
                    title="Details"
                    :href="'/amenity/create'"
                >
                    <i class="bi bi-plus-lg"></i>
                    {{ translate("Add new amenity") }}
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
                                        {{ translate("Description") }}
                                    </th>

                                    <th scope="col">
                                        {{ translate("Action") }}
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr
                                    v-for="(amenity, index) in amenities"
                                    :key="amenity.id"
                                >
                                    <th class="text-center">
                                        {{ index + 1 }}
                                    </th>
                                    <td>
                                        {{ amenity.name }}
                                        <br>
                                        <span
                                            class="c-linked c-mouse-over"
                                            @click="
                                                copyToClipboard(amenity.id)
                                            "
                                            style="
                                                cursor: pointer;
                                                color: blue; 
                                            "
                                            >{{ amenity.id }}</span
                                        >
                                    </td>
                                    <td>{{ amenity.description }}</td>

                                    <td>
                                        <div class="btn-group">
                                            <a
                                                type="button"
                                                class="btn btn-sm fs-6"
                                                title="Edit"
                                                :href="
                                                    '/amenity/edit/' +
                                                    amenity.id
                                                "
                                                ><i
                                                    class="bi bi-pencil c-theme-text-color"
                                                ></i
                                            ></a>
                                            <DeleteModal
                                                :deleteId="amenity.id"
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
            default_url: "/api/fetch-amenities",
            amenities: [],
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
                        this.amenities = response.data.data;
                        this.firstTimeLoadCheck = 0;
                    } else {
                        this.amenities = this.amenities.concat(
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
                .post("/api/amenity/delete/" + id)
                .then((response) => {
                    toastr.success(
                        this.translate("Amenity deleted successfully.")
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
