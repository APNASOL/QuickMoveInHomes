<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h1 class="mb-0">
                    <span>{{ translate("Offices") }}</span>
                </h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span>{{ translate("Offices") }}</span>
                        </li>
                    </ol>
                </nav>
            </div>

            <div>
                <a class="btn btn-success" href="/create-office">{{
                    translate("Create office")
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
                                :placeholder="
                                    translate('Search office by name')
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
                            @click="getOffices(null)"
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
                                <!-- <th scope="col">{{ translate("Order id") }}</th> -->
                                <th scope="col" class="text-center">#</th>
                                <th scope="col">{{ translate("Name") }}</th>
                                <th scope="col">
                                    {{ translate("Phone") }}
                                </th>
                                <th scope="col">{{ translate("Email") }}</th>

                                <th scope="col" class="text-center">
                                    {{ translate("Address") }}
                                </th>
                                <th scope="col" class="text-center">
                                    {{ translate("Image") }}
                                </th>
                                <th scope="col" class="text-center">
                                    {{ translate("Actions") }}
                                </th>
                            </tr>
                        </thead>

                        <draggable
                            :list="Offices"
                            :key="Offices"
                            tag="tbody"
                            @change="changePosition"
                        >
                            <tr
                                v-for="(office, index) in Offices"
                                :key="office.id"
                            >
                                <!-- <th class="text-center">{{ office.order_id }}</th> -->
                                <th class="text-center">{{ index + 1 }}</th>
                                <td>
                                    <!-- <Link class="theme-text-color" :href="route('office.details',office.id)"> -->
                                    {{ office.name }}
                                    <!-- </Link> -->
                                </td>
                                <td>{{ office.phone }}</td>
                                <td>{{ office.email }}</td>
                                <td>{{ office.address }}</td>
                                <td>
                                    <image-zooming-component
                                        :file="office.image ?? 'empty.png'"
                                        :width="70"
                                    />
                                </td>

                                <td class="text-center">
                                    <div class="btn-group">
                                        <a
                                            type="button"
                                            class="btn btn-sm fs-6"
                                            title="Edit"
                                            :href="'/edit-office/' + office.id"
                                            ><i class="bi bi-pencil"></i
                                        ></a>
                                        <DeleteModal
                                            :deleteId="office.id"
                                            @deleteThis="deleteThis"
                                        />
                                    </div>
                                </td>
                            </tr>
                        </draggable>
                    </table>
                    <div class="text-center p-2">
                        <button
                            v-if="pagination.next_page_url"
                            @click="getOffices(pagination.next_page_url)"
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
export default {
    props: [""],
    components: {
        Master,
        draggable: VueDraggableNext,
    },
    created() {
        this.getOffices();
    },
    data() {
        return {
            Offices: [],

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
            default_url: "/api/fetch-offices",
        };
    },
    methods: {
        async getOffices(page_url) {
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
                        this.Offices = response.data.data;
                        this.firstTimeLoadCheck = 0;
                        this.formStatus = 1;
                    } else {
                        this.Offices = this.Offices.concat(response.data.data);
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
                .post("/api/office-delete/" + id)
                .then((response) => {
                    toastr.success(
                        this.translate("office deleted successfully.")
                    );
                    this.getOffices(null);
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        changePosition(event) {
            let newPositions = [];

            for (let index = 0; index < this.Offices.length; index++) {
                newPositions.push({
                    order_id: index,
                    office_id: this.Offices[index].id,
                });
            }

            newPositions = JSON.stringify(newPositions);

            axios
                .post("api/offices-position-change", [newPositions])
                .then(() => {
                     
                    this.getOffices(null);
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
    },
};
</script>
