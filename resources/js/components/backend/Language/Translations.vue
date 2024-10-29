<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h1 class="mb-0">
                    <span>Translations</span>
                </h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span>Translations</span>
                        </li>
                    </ol>
                </nav>
            </div>
            <!-- <div>
                <a class="btn btn-success" href="/languages">{{
                    translate("Go to Tours")
                }}</a>
            </div> -->
            <div class="mb-3 d-flex justify-content-end">
                <a class="btn btn-success" href="/languages"
                    ><i class="bi bi-plus-lg"></i> Go to Lanaguages</a
                >
            </div>
        </div>
        <div class="card">
            <div class="card-body pt-4">
                <div class="row mb-4 mb-md-0">
                    <div class="col-md">
                        <h5 class="card-title">{{ language.name }}</h5>
                    </div>
                    <div class="col-md d-flex align-items-center">
                        <input
                            type="text"
                            v-on:input="searchTranslations"
                            v-model="searchForm.search"
                            :placeholder="translate('Search Translations')"
                            class="form-control"
                        />
                    </div>
                </div>
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th width="45%">
                                {{ translate("Key") }}
                            </th>
                            <th width="45%">{{ translate("Value") }}</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr
                            v-for="(translation, index) in translations.data"
                            :key="translation.id"
                        >
                            <td>{{ index + 1 }}</td>
                            <td>{{ translation.lang_key }}</td>
                            <td class="d-flex">
                                <input
                                    type="text"
                                    class="form-control"
                                    v-model="form.values[translation.lang_key]"
                                />

                                <DeleteModal
                                    :deleteId="translation.id"
                                    @deleteThis="deleteThis"
                                />
                            </td>
                        </tr>
                    </tbody>
                </table>
                <nav
                    aria-label="Page navigation example"
                    v-if="pagination.next_page_url || pagination.prev_page_url"
                >
                    <ul class="pagination">
                        <li
                            class="page-item"
                            v-for="(links, index) in pagination.links"
                            :key="index"
                            :class="[
                                { active: links.active },
                                {
                                    disabled:
                                        index == 0 && !pagination.prev_page_url,
                                },
                                {
                                    disabled:
                                        index == pagination.links.length - 1 &&
                                        !pagination.next_page_url,
                                },
                            ]"
                        >
                            <a
                                v-if="
                                    index == 0 ||
                                    index == pagination.links.length - 1
                                "
                                class="page-link"
                                href="#"
                                @click="loadTranslations(links.url)"
                                v-html="links.label"
                            ></a>
                            <a
                                v-else
                                class="page-link"
                                href="#"
                                @click="loadTranslations(links.url)"
                                >{{ links.label }}</a
                            >
                        </li>
                    </ul>
                </nav>

                <div class="mt-2">
                    <button
                        type="button"
                        @click="submit"
                        class="btn btn-success"
                        v-if="formStatus == 1"
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
                <!-- Floating Labels Form -->
            </div>
        </div>
    </Master>
</template>

<script>
import Master from "@components/backend/layout/Master.vue";
export default {
    props: ["language_id"],
    components: {
        Master,
    },
    created() {
        this.getLanguage();
        this.loadTranslations();
    },
    data() {
        return {
            form: {
                language_id: this.language_id,
                values: {},
            },
            // formErrors : [],
            language: [],
            translations: [],
            pagination: {},

            searchForm: {
                language_id: this.language_id,
                search: "",
            },
            formStatus: 1,
            deleteId: "",
        };
    },
    methods: {
        async getLanguage() {
            await axios
                .get("/api/get-language/" + this.language_id)
                .then((response) => {
                    this.language = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        async loadTranslations(page_url) {
            let formData = new FormData();
            page_url = page_url || "/api/translations-show";
            formData.append("language_id", this.language_id);
            await axios.post(page_url, formData).then((response) => {
                this.form.values = {};
                this.translations = response.data;
                response.data.data.forEach((i) => {
                    this.form.values[i.lang_key] = i.lang_value;
                });
                this.makePagination(response.data);
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
        async submit() {
            this.formStatus = 0;
            await axios
                .post("/api/translations-save", this.form)
                .then((data) => {
                    this.formStatus = 1;
                    toastr.success(
                        this.translate("Translations saved successfully.")
                    );
                    window.location.href = "/languages";
                    
                })
                .catch((error) => {
                    
                    this.formStatus = 1;
                    toastr.error(error.response.data.message);
                });
        },
        async searchTranslations() {
            await axios
                .post("/api/translations-search", this.searchForm)
                .then((response) => {
                    // clearing this values object
                    this.form.values = {};
                    this.translations = response.data;
                    response.data.data.forEach((i) => {
                        this.form.values[i.lang_key] = i.lang_value;
                    });
                    this.makePagination(response.data);
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        passDeleteId(id) {
            this.deleteId = id;
        },
        async deleteThis(id) {
            await axios
                .post("/api/translation-delete/" + id)
                .then(() => {
                    toastr.success(
                        this.translate("Translation deleted successfully.")
                    );
                    this.loadTranslations();
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);

                });
        },
    },
};
</script>
<style>
.c-file-padding {
    padding: 1rem 0.75rem !important;
}
.invalid-feedback {
    display: block !important;
}
/* .invalid-bg {
    border-color: #f8d4d4 !important;
    background-color: #f8d4d4 !important;
} */
.pagination .page-item.active .page-link {
    background-color: #198754 !important;
    border-color: #198754 !important;
    z-index: 3;
    color: white !important;
}
.pagination .page-link {
    color: #198754 !important;
}
</style>
