<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h1 class="mb-0">
                    <span>External Website</span>
                </h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span>External Website</span>
                        </li>
                    </ol>
                </nav>
            </div>

            <!-- <div>
                <a class="btn btn-success" href="/languages">{{
                    translate("Go to ABC")
                }}</a>
            </div> -->
            <div class="mb-3 d-flex justify-content-end">
                <!-- <a class="btn btn-success" href="/create-language"
                    ><i class="bi bi-plus-lg"></i> Add New ABC</a
                > -->
            </div>
        </div>
        <DefaultLanguage />
        <div class="card">
            <div class="card-body pt-4">
                <WebsiteInfoComponent /> 
                <WebsiteLogoComponent /> 
                <CarouselComponent />
                <GlobalSeoComponent /> 
            </div>
        </div>
    </Master>
</template>

<script>
import Master from "@components/backend/layout/Master.vue";

import WebsiteInfoComponent from "@components/backend/ExternalWebsite/WebsiteInfoComponent.vue";
import WebsiteLogoComponent from "@components/backend/ExternalWebsite/WebsiteLogoComponent.vue";
import GlobalSeoComponent from "@components/backend/ExternalWebsite/GlobalSeoComponent.vue";
import CarouselComponent from "@components/backend/ExternalWebsite/CarouselComponent.vue";

export default {
    props: [""],
    components: {
        Master,
        WebsiteInfoComponent, 
        WebsiteLogoComponent,
        GlobalSeoComponent,
        CarouselComponent,
    },
    created() {},
    data() {
        return {};
    },
    methods: {
        refetchParentDetails() {
            this.fetchSeo();
        },
    },
};
</script>
