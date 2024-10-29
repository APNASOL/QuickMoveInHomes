<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h1 class="mb-0">
                    <span>{{ translate("Special tours") }}</span>
                </h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span>{{ translate("Special tours") }}</span>
                        </li>
                    </ol>
                </nav>
            </div>

            <div>
                <a
                    class="btn btn-success"
                    title="Details"
                    :href="'/add-custom-page/'"
                >
                    {{ translate("Add special tour") }}
                </a>
            </div>
        </div>

        <div class="card">
            <div class="card-body pt-4">
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <!-- <th scope="col">{{ translate("Order id") }}</th> -->
                                <th scope="col" class="text-center">#</th>

                                <th scope="col">
                                    {{ translate("Title") }}
                                </th>
                                 
                                
                                 
                                <th scope="col" class="text-center">
                                    {{ translate("Action") }}
                                </th>
                            </tr>
                            <tr v-for="(customPage, index) in customPages" :key="customPage.id">
                                <!-- <th class="text-center">{{ office.order_id }}</th> -->
                                <th class="text-center">{{ index + 1 }}</th>
                                <td>
                                    <a
                                        class="fs-6 c-linked c-mouse-over"
                                        title="Details"
                                        :href="'/custom-page-details/' + customPage.id"
                                        >{{ customPage.title }}
                                    </a>
                                    
                                </td>
                                
                                 
                                 
                                <td class="text-center">
                                    <div class="btn-group">
                                        <a
                                        class="fs-6 mt-2 c-linked c-mouse-over"
                                        title="Details"
                                        :href="'/custom-page-edit/' + customPage.id"
                                        ><i class="bi bi-pencil"></i
                                        >
                                    </a>
                                         
                                        <DeleteModal
                                            :deleteId="customPage.id"
                                            @deleteThis="deleteThis"
                                        />
                                    </div>
                                </td>
                            </tr>
                        </thead>
                    </table>
                    <div class="text-center p-2">
                        <button
                            v-if="pagination.next_page_url"
                            @click="getCustomPages(pagination.next_page_url)"
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
import { VueDraggableNext } from "vue-draggable-next";
import Multiselect from "@vueform/multiselect";
export default {
    props: [""],
    components: {
        Master,
        draggable: VueDraggableNext,
        Multiselect,
    },
    created() {
        this.getCustomPages();
        this.fetchCountries();
    },
    data() {
        return {
            customPages: [],

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
            default_url: "/api/fetch-custom-pages",
            process: "create",
        };
    },
    methods: {
        getCustomPages(page_url) {
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
                        this.customPages = response.data.data;
                        this.firstTimeLoadCheck = 0;
                        this.formStatus = 1;
                    } else {
                        this.customPages = this.customPages.concat(
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
        deleteThis(id) {
            axios
                .post("/api/custom-page-delete/" + id)
                .then((response) => {
                    toastr.success(
                        this.translate("Custom page deleted successfully.")
                    );
                    this.getCustomPages(null);
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        fetchCountries() {
            axios
                .get("/api/countries-pluck")
                .then((response) => {
                    this.country_options = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        
        
    },
};
</script>
<style>
@import "@vueform/multiselect/themes/default.css";
.c-mouse-over {
    cursor: pointer !important;
}
.c-linked {
    color: red;
    text-decoration: none;
}
</style>
