<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h1 class="mb-0">
                    <span>ABC</span>
                </h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span>ABC</span>
                        </li>
                    </ol>
                </nav>
            </div>

            <div>
                <a class="btn btn-success" href="/languages">{{
                    translate("Go to ABC")
                }}</a>
            </div>
            <div class="mb-3 d-flex justify-content-end">
                <!-- <a class="btn btn-success" href="/create-language"
                    ><i class="bi bi-plus-lg"></i> Add New ABC</a
                > -->
            </div>
        </div>
        <DefaultLanguage />
        <div class="card">
            <div class="card-body pt-4">
                <h5 class="card-title">Contents</h5>
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
        this.getData();
    },
    data() {
        return {
            Abc: "",
        };
    },
    methods: {
        async getData() {
            await axios
                .get("/api/fetch-abc")
                .then((response) => {
                    toastr.success(this.translate("data saved successfully."));

                    this.Abc = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        async deleteThis(id) {
            await axios
                .post("/api/abc-delete/" + id)
                .then((response) => {
                    toastr.success(
                        this.translate("data deleted successfully.")
                    );

                    this.getData();
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
    },
};
</script>
