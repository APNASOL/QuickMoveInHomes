<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h1 class="mb-0">
                    <span>{{ translate("Tour countries") }}</span>
                </h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span>{{ translate("Tour countries") }}</span>
                        </li>
                    </ol>
                </nav>
            </div>

            <div>
                <button
                    class="btn btn-success"
                    data-bs-target="#datesModal"
                    data-bs-toggle="modal"
                    @click="clerFields"
                >
                    {{ translate("Add countries") }}
                </button>
            </div>
        </div>

        <div class="card">
            <div class="card-body pt-4">
                <!-- <div class="row g-3 p-3">
                    <div class="input-group">
                        <div class="form-outline col-md-5">
                            <input
                                type="text"
                                v-model="form.name"
                                class="form-control"
                                id="name"
                                :placeholder="
                                    translate('Search tour-countries by name')
                                "
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
                            @click="getTourCountries(null)"
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
                </div> -->
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <!-- <th scope="col">{{ translate("Order id") }}</th> -->
                                <th scope="col" class="text-center">#</th>

                                <th scope="col">
                                    {{ translate("Country") }}
                                </th>
                                <th scope="col" class="text-center">
                                    {{ translate("Action") }}
                                </th>
                            </tr>
                            <tr
                                v-for="(tc, index) in tourCountries"
                                :key="tc.id"
                            >
                                <!-- <th class="text-center">{{ office.order_id }}</th> -->
                                <th class="text-center">{{ index + 1 }}</th>
                                <td>
                                    <a
                                        class="fs-6 c-linked c-mouse-over"
                                        title="Details"
                                        :href="'/tour-country-details/' + tc.id"
                                        >{{ tc.country }}
                                    </a>
                                </td>
                                <td class="text-center">
                                    <div class="btn-group">
                                        <a
                                            type="button"
                                            class="btn btn-sm fs-6"
                                            title="Edit"
                                            data-bs-target="#datesModal"
                                            data-bs-toggle="modal"
                                            @click="edit(tc.id)"
                                            ><i class="bi bi-pencil"></i
                                        ></a>
                                        <DeleteModal
                                            :deleteId="tc.id"
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
                            @click="getTourCountries(pagination.next_page_url)"
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

        <div class="modal fade" id="datesModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" v-if="form.record_id">
                            {{ translate("Upate record") }}
                        </h5>
                        <h5 class="modal-title" v-else>
                            {{ translate("Countries") }}
                        </h5>
                        <button
                            ref="closeDatesModal"
                            type="button"
                            class="btn-close"
                            data-bs-dismiss="modal"
                            aria-label="Close"
                        ></button>
                    </div>
                    <div class="modal-body">
                        <form @submit.prevent="countryDataSave">
                            <div class="row g-3">
                                <div class="col-12 col-md-10">
                                    <label
                                        for="type"
                                        v-if="process == 'edit'"
                                        >{{
                                            translate("Change country")
                                        }}</label
                                    >
                                    <label for="type" v-else>{{
                                        translate("Select countries")
                                    }}</label>

                                    <Multiselect
                                        v-if="process == 'edit'"
                                        v-model="countryDataEdit.country"
                                        :close-on-select="false"
                                        :createTag="true"
                                        :options="country_options"
                                        :searchable="true"
                                        :class="{
                                            'invalid-bg': formErrors.countries,
                                        }"
                                    />
                                    <Multiselect
                                        v-else
                                        v-model="countryData.countries"
                                        mode="tags"
                                        :close-on-select="false"
                                        :createTag="true"
                                        :options="country_options"
                                        :searchable="true"
                                        :class="{
                                            'invalid-bg': formErrors.countries,
                                        }"
                                    />
                                    <div
                                        class="invalid-feedback animated fadeIn"
                                        v-if="formErrors.countries"
                                    >
                                        {{ formErrors.countries[0] }}
                                    </div>
                                </div>
                                <div class="col-12 col-md-2">
                                    <div class="mt-4">
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
                                </div>
                            </div>
                        </form>
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
        this.getTourCountries();
        this.fetchCountries();
    },
    data() {
        return {
            tourCountries: [],

            country_options: "",
            countryDataEdit: {
                tour_country_record_id: "",
                country: "",
            },
            countryData: {
                countries: [],
            },
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
            default_url: "/api/fetch-tour-countries",
            process: "create",
        };
    },
    methods: {
        getTourCountries(page_url) {
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
                        this.tourCountries = response.data.data;
                        this.firstTimeLoadCheck = 0;
                        this.formStatus = 1;
                    } else {
                        this.tourCountries = this.tourCountries.concat(
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
                .post("/api/tour-countries-delete/" + id)
                .then((response) => {
                    toastr.success(
                        this.translate("Country deleted successfully.")
                    );
                    this.getTourCountries(null);
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
        countryDataSave() {
            this.formStatus = false;
            let Data;
            if (this.process == "create") {
                Data = this.countryData;
            } else {
                Data = this.countryDataEdit;
            }

            axios
                .post("/api/tour-countries-save", Data)
                .then((response) => {
                    // this.tour_id = response.data;
                    this.formStatus = true;
                    toastr.success(
                        this.translate("Tour country saved successfully")
                    );
                    this.formErrors = [];
                    this.$refs.closeDatesModal.click();
                    setTimeout(() => {
                        this.getTourCountries();
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
        edit(id) {
            axios

                .get("/api/edit-tour-country/" + id)
                .then((response) => {
                    this.process = "edit";
                    this.countryDataEdit.tour_country_record_id =
                        response.data.id;
                    this.countryDataEdit.country = response.data.country;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                    if (error.response.data.errors) {
                        this.formErrors = error.response.data.errors;
                    }
                });
        },
        clerFields() {
            this.process = "create";
            this.countryData.countries = [];
            this.formErrors = [];
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
