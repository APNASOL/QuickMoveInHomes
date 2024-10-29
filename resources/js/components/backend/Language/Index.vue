<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h1>{{ translate("Language") }}</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span>Lanaguages</span>
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
                <a class="btn btn-success" href="/create-language"
                    ><i class="bi bi-plus-lg"></i> Add New Language</a
                >
            </div>
        </div>
        <DefaultLanguage />
        <div class="card">
            <div class="card-body pt-4">
                <h5 class="card-title">Languages</h5>

                <!-- Table with stripped rows -->
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col" class="text-center">#</th>
                            <th scope="col">Name</th>
                            <th scope="col">Code</th>
                            <th scope="col" class="text-center">Options</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr
                            v-for="(language, index) in languages"
                            :key="language.id"
                        >
                            <th class="text-center">{{ index + 1 }}</th>
                            <td>{{ language.name }}</td>
                            <td>{{ language.code }}</td>

                            <td class="text-center">
                                <div class="btn-group">
                                    <a
                                        type="button"
                                        class="btn btn-sm fs-6"
                                        :title="translate('Translations')"
                                        :href="
                                            '/translations-show/' + language.id
                                        "
                                    >
                                        <i class="bi bi-translate"></i>
                                    </a>
                                    <a
                                        type="button"
                                        class="btn btn-sm fs-6"
                                        :title="translate('Edit')"
                                        :href="'/edit-language/' + language.id"
                                    >
                                        <i class="bi bi-pencil"></i>
                                    </a>
                                    <DeleteModal
                                        :deleteId="language.id"
                                        @deleteThis="deleteThis"
                                    />
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <!-- End Table with stripped rows -->
            </div>
        </div>
    </Master>
</template>

<script>
import Master from "@components/backend/layout/Master.vue";
import DefaultLanguage from "@components/backend/Language/DefaultLanguage.vue";
import ImageCropper from "@components/global/ImageCropper.vue";
export default {
    props: ["tour_id"],
    components: {
        Master,
        ImageCropper,
        DefaultLanguage,
    },
    created() {
        this.getLanguages();
    },
    data() {
        return {
            languages: "",
        };
    },
    methods: {
        async getLanguages() {
            await axios
                .get("/api/fetch-languages")
                .then((response) => {
                    this.languages = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        async deleteThis(id) {
            await axios
                .post("/api/language-delete/" + id)
                .then(() => {
                    toastr.success(
                        this.translate("Language deleted successfully.")
                    );

                    this.getLanguages();
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
    },
};
</script>
