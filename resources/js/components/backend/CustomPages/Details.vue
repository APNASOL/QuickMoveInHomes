<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h1 class="mb-0">
                    <span v-if="custom_page_id">
                        {{ customPageRecord.title }}
                        {{ translate("details") }}</span
                    >
                    <span v-else>{{ translate("Special tour create") }}</span>
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

            <div class="mb-3 d-flex justify-content-end">
                <a class="btn btn-success" href="/custom-pages">
                    {{ translate("Special tours") }}</a
                >
            </div>
        </div>

        <div class="card c-form-card mt-2 mb-2">
            <div class="card-header c-form-card-header">
                <label>{{ translate("Special tour details") }}</label>
            </div>
            <div class="card-body pt-4">
                <div class="row">
                    <div class="d-flex justify-content-end">
                        <div>
                            <a
                                class="ms-3 mb-3 text-secondary c-mouse-over"
                                type="button"
                                title="Edit"
                                :href="'/custom-page-edit/' + customPageRecord.id"
                                ><i class="bi bi-pencil"></i
                            ></a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <b>{{ translate("Title") }}</b
                        ><br />
                        {{ customPageRecord.title }}
                    </div>
                    <div class="col-md-12 mt-3">
                        <b>{{ translate("Box image") }}</b> <br />
                        <image-zooming-component
                            :file="customPageRecord.image"
                            :custom_class="'img-fluid img-thumbnail rounded'"
                            :width="100"
                        />
                    </div>
                    <div class="col-md-12 mt-3">
                        <b>{{ translate("Banner") }}</b> <br />
                        <image-zooming-component
                            :file="customPageRecord.banner"
                            :custom_class="'img-fluid img-thumbnail rounded'"
                            :width="100"
                        />
                    </div>
                    <div class="col-md-12 mt-3">
                        <b>{{ translate("Details") }}</b>
                        <br />
                        <div
                            class="content ql-editor"
                            v-html="customPageRecord.description_details"
                        ></div>
                    </div>
                    <div class="col-md-12 mt-3">
                        <b>{{ translate("Tours") }}</b>
                        <br />
                        <ul>
                            <li v-for="tour in customPageRecord.tours_records" :key="tour.id">
                                {{ tour.tour_name }}
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </Master>
</template>

<script>
import Master from "@components/backend/layout/Master.vue";
import { QuillEditor } from "@vueup/vue-quill";
import "@vueup/vue-quill/dist/vue-quill.snow.css";

export default {
    props: ["custom_page_id"],
    components: {
        Master,
        QuillEditor,
    },
    created() {
        this.getCustomPageRecords();
    },
    data() {
        return {
            customPageRecord: [],
        };
    },
    methods: {
        getCustomPageRecords() {
            axios
                .get("/api/details-fetch-custom-page/" + this.custom_page_id)
                .then((response) => {
                    this.customPageRecord = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
    },
};
</script>
<style>
.c-form-card {
    padding: 0px !important;
    border-top-left-radius: 15px !important;
    border-top-right-radius: 15px !important;
}
.c-form-card-header {
    background: #198754 !important;
    color: #fff !important;
    font-size: 1.5rem !important;
    border-top-left-radius: 15px !important;
    border-top-right-radius: 15px !important;
}
</style>
