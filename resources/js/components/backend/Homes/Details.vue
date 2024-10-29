<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h3 class="mb-0 c-theme-text-color">
                    <span>{{ home.title }} - {{ translate('Details') }}</span>
                </h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item c-theme-text-color">
                            <a class="c-theme-text-color" href="#">Home</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span>Details</span>
                        </li>
                    </ol>
                </nav>
            </div>
            <div class="mb-3 d-flex justify-content-end">
                <a
                    class="btn btn-success justify-content-end"
                    href="/homes"
                >
                    <i class="bi bi-list"></i> {{ translate("Homes") }}</a
                >
            </div>
        </div>

        <section class="section">
            <div class="card c-card-border">
                <div class="card-body pt-4">
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <tbody>
                                <tr>
                                    <th scope="col">
                                        {{ translate("Status") }}
                                    </th>
                                    <td scope="col">
                                        {{ home.status }}
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="col">
                                        {{ translate("Name") }}
                                    </th>
                                    <td scope="col">
                                        {{ home.title }}
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="col">
                                        {{ translate("Price") }}
                                    </th>
                                    <td scope="col">
                                        {{ home.price }}
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="col">
                                        {{ translate("Community") }}
                                    </th>
                                    <td scope="col">
                                        {{ home.community }}
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="col">
                                        {{ translate("Address") }}
                                    </th>
                                    <td scope="col">
                                        {{ home.address }}
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="col">
                                        {{ translate("Description") }}
                                    </th>
                                    <td scope="col">
                                        {{ home.description }}
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="col">
                                        {{ translate("Image") }}
                                    </th>
                                    <td scope="col">
                                        <image-zooming-component
                                            :file="home.image ?? 'empty.png'"
                                            :width="70"
                                        />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
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
    props:['home_id'],
    created() {
        this.getHome();
    },
    data() {
        return {
            home: [],
        };
    },
    methods: {
        getHome() {
            axios
                .get("/api/get/home/" + this.home_id)
                .then((response) => {
                    this.home = response.data;
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
