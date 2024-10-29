<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h1 class="mb-0">
                    <span>{{ translate("Users") }}</span>
                </h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span>{{ translate("Users") }}</span>
                        </li>
                    </ol>
                </nav>
            </div>

            <div>
                <a class="btn btn-success" href="/create-user">{{
                    translate("Create user")
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
                                v-model="form.name"
                                class="form-control"
                                id="name"
                                :placeholder="translate('Search user by name')"
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
                            @click="getUser(null)"
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
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col" class="text-center">#</th>
                                <th scope="col">{{ translate("Name") }}</th>
                                <th scope="col">
                                    {{ translate("Email") }}
                                </th>
                                <th scope="col">{{ translate("Role") }}</th>

                                <th scope="col" class="text-center">
                                    {{ translate("Image") }}
                                </th>
                                <th scope="col" class="text-center">
                                    {{ translate("Actions") }}
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(user, index) in Users" :key="user.id">
                                <th class="text-center">{{ index + 1 }}</th>
                                <td>
                                    <!-- <Link class="theme-text-color" :href="route('user.details',user.id)"> -->
                                    {{ user.name }}
                                    <!-- </Link> -->
                                </td>
                                <td>{{ user.email }}</td>
                                <td>{{ user.role }}</td>
                                <td>
                                    <image-zooming-component
                                        :file="user.image ?? 'empty.png'"
                                        :width="70"
                                    />
                                </td>

                                <td class="text-center">
                                    <div class="btn-group">
                                        <a
                                            type="button"
                                            class="btn btn-sm fs-6"
                                            title="Edit"
                                            :href="'/edit-user/' + user.id"
                                            ><i class="bi bi-pencil"></i
                                        ></a>
                                        <DeleteModal
                                            :deleteId="user.id"
                                            @deleteThis="deleteThis"
                                        />
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="text-center p-2">
                        <button
                            v-if="pagination.next_page_url"
                            @click="getUser(pagination.next_page_url)"
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
import ImageCropper from "@components/global/ImageCropper.vue";
export default {
    props: [""],
    components: {
        Master,
    },
    created() {
        this.getUser();
    },
    data() {
        return {
            Users: [],

            form: {
                name: "",
            },
            formErrors: [],
            formStatus: 1,
            // loadmore variables
            firstTimeLoadCheck: 0,
            loaderForTimes: 1,
            pagination: {},
            loadMoreStatus: 1,
            default_url: "/api/fetch-users",
        };
    },
    methods: {
        async getUser(page_url) {
            if (!page_url) {
                this.firstTimeLoadCheck = 1;
                this.formStatus = 0;
            } else {
                this.loadMoreStatus = 0;
            }
            page_url = page_url || this.default_url;
            let formData = new FormData();
            formData.append("name", this.form.name);
            axios
                .post(page_url, formData)
                .then((response) => {
                    if (this.firstTimeLoadCheck == 1) {
                        this.Users = response.data.data;
                        this.firstTimeLoadCheck = 0;
                        this.formStatus = 1;
                    } else {
                        this.Users = this.Users.concat(response.data.data);
                        this.loadMoreStatus = 1;
                        this.formStatus = 1;
                    }
                    this.makePagination(response.data);
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
        async deleteThis(id) {
            await axios
                .post("/api/user-delete/" + id)
                .then((response) => {
                    toastr.success(
                        this.translate("User deleted successfully.")
                    );
                    this.getUser(null);
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
    },
};
</script>
