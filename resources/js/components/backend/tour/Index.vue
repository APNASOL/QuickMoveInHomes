<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h1 class="mb-0">Tours</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                            Tours
                        </li>
                    </ol>
                </nav>
            </div>
            <div>
                <a class="btn btn-success" href="/create-tour">{{
                    translate("Create Tour")
                }}</a>
            </div>
        </div>
        <div class="card">
            <div class="card-body pt-4">
                <div class="row g-3 p-3">
                    <div class="input-group">
                        <div class="form-outline col-md-5">
                            <input
                                type="text"
                                v-model="form.title"
                                class="form-control"
                                id="title"
                                :placeholder="translate('Search tour by title')"
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
                            @click="getTours(null)"
                            class="btn btn-success"
                        >
                            <i class="bi bi-search"></i>
                        </button>

                        <button v-else class="btn btn-success" type="button">
                            <span
                                class="spinner-border spinner-border-sm"
                                role="status"
                                aria-hidden="true"
                            ></span>
                        </button>
                    </div>
                </div>
                <!-- Table with stripped rows -->
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col" class="text-center">#</th>
                                <th scope="col">
                                    {{ translate("Title") }}
                                </th>
                                <th scope="col">
                                    {{ translate("Sub title") }}
                                </th>

                                <th scope="col">
                                    {{ translate("Price") }}
                                </th>
                                <th scope="col">
                                    {{ translate("Discount") }}
                                </th>
                                <th scope="col">
                                    {{ translate("Image") }}
                                </th>

                                <th scope="col" class="text-center">
                                    {{ translate("Actions") }}
                                </th>
                                <th
                                    scope="col"
                                    class="text-center"
                                    v-if="user_role == 'admin'"
                                >
                                {{ translate("Status") }}
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(tour, index) in tours" :key="tour.id">
                                <td class="text-center">{{ index + 1 }}</td>
                                <td>
                                    <a
                                        class="c-linked c-mouse-over"
                                        :href="'/details-tour/' + tour.id"
                                    >
                                        {{ tour.title }}
                                    </a>
                                </td>
                                <td>
                                    {{ tour.sub_title }}
                                </td>

                                <td>{{ tour.price }}</td>
                                <td>{{ tour.discount }}</td>
                                <td>
                                    <image-zooming-component
                                        :file="tour.image ?? 'empty.png'"
                                        :width="70"
                                        :custom_class="'img-thumbnail'"
                                    />
                                </td>
                                <td class="text-center">
                                    <div class="btn-group">
                                        <a
                                            type="button"
                                            class="btn btn-sm fs-6"
                                            title="Edit"
                                            :href="'/edit-tour/' + tour.id"
                                            ><i class="bi bi-pencil"></i
                                        ></a>
                                        <DeleteModal
                                            :deleteId="tour.id"
                                            @deleteThis="deleteThis"
                                        />
                                    </div>
                                </td>
                                <td class="text-center">
                                    <template
                                        v-if="user_role == 'admin'"
                                        class="me-3"
                                    >
                                         
                                        <div
                                            class="form-check form-switch d-inline-block"
                                        >
                                            <input
                                                class="form-check-input"
                                                type="checkbox"
                                                :class="{
                                                    'invalid-bg':
                                                        formErrors.status,
                                                }"
                                                v-model="tour.status"
                                                checked
                                                @change="
                                                    tourStatusChange(tour.id,tour.status)
                                                "
                                            />
                                            
                                        </div>

                                        <div
                                            class="invalid-feedback animated fadeIn"
                                            v-if="formErrors.status"
                                        >
                                            {{ formErrors.status[0] }}
                                        </div>
                                    </template>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="text-center p-2">
                        <button
                            v-if="pagination.next_page_url"
                            @click="getTours(pagination.next_page_url)"
                            class="btn btn-success"
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
        </div>
    </Master>
</template>

<script>
import Master from "@components/backend/layout/Master.vue";
export default {
    components: {
        Master,
    },
    created() {
        this.getTours(this.default_url);
    },
    data() {
        return {
            user_role: logged_in_user.role,
            tours: [],
            form: {
                title: "",
            },
            tourStatusChangerData: {
                status: [], 
            },
            formErrors: [],
            formStatus: 1,

            // loadmore variables
            firstTimeLoadCheck: 0,
            loaderForTimes: 1,
            pagination: {},
            loadMoreStatus: 1,
            default_url: "/api/fetch-tours",
        };
    },
    methods: {
        async tourStatusChange(tour_id, status) {
            let formData = new FormData();
            formData.append("tour_id", tour_id);
            formData.append("status", status);

            await axios
                .post("/api/tour-status-change", formData)
                .then((response) => {
                    toastr.success(
                        this.translate("Tour status changed")
                    );
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        async getTours(page_url) {
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
                    if (this.firstTimeLoadCheck == 1) {
                        this.tours = response.data.data;
                        this.firstTimeLoadCheck = 0;
                        this.formStatus = 1;
                    } else {
                        this.tours = this.tours.concat(response.data.data);
                        this.loadMoreStatus = 1;
                        this.formStatus = 1;
                    }
                    this.makePagination(response.data);
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        async deleteThis(id) {
            await axios
                .post("/api/tour-delete/" + id)
                .then((response) => {
                    toastr.success(
                        this.translate("Tour deleted successfully.")
                    );
                    // this.getTours();
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        makePagination(response) {
            let pagination = {
                links: response.links,
                current_page: response.current_page,
                last_page: response.last_page,
                next_page_url: response.next_page_url,
                prev_page_url: response.prev_page_url,
            };
            this.pagination = pagination;
        },
    },
};
</script>
<style>
.c-linked {
    color: red;
    text-decoration: none;
}
.c-mouse-over {
    cursor: pointer;
}
</style>
