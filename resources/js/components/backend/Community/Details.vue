<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h3 class="mb-0 c-theme-text-color">
                    <span
                        >{{ Community.name }} - {{ translate("Details") }}</span
                    >
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
                    href="/communities"
                >
                    <i class="bi bi-list"></i> {{ translate("Communities") }}</a
                >
            </div>
        </div>

        <section class="section">
            <div class="card c-card-border">
                <a
                    class="d-flex justify-content-end text-success btn-sm fs-6 p-2"
                    type="button"
                    :title="translate('Edit')"
                    :href="'/community/edit/' + community_id"
                >
                    <i class="bi bi-pencil"></i>
                </a>
                <div class="card-body pt-4">
                    <div class="container">
                        <div class="row g-3" v-if="Community">
                            <div class="col-md-6">
                                <h4 class="c-theme-text-color">
                                    Community Details
                                </h4>
                                <div class="form-group">
                                    <label>Name:</label>
                                    <p>{{ Community.name }}</p>
                                </div>
                                <div class="form-group">
                                    <label>Description:</label>
                                    <p>{{ Community.description }}</p>
                                </div>
                                <div class="form-group">
                                    <label>Location:</label>
                                    <p>{{ Community.location }}</p>
                                </div>
                                <div class="form-group">
                                    <label>HOA ID:</label>
                                    <p>{{ Community.hoa_id }}</p>
                                </div>
                                <div class="form-group">
                                    <label>Legal Subdivision:</label>
                                    <p>{{ Community.legal_subdivision }}</p>
                                </div>
                                <div class="form-group">
                                    <label>Nearby Properties:</label>
                                    <p>{{ Community.nearby_properties }}</p>
                                </div>
                                <div class="form-group">
                                    <label>Masterplan:</label>
                                    <p>{{ Community.masterplan }}</p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <h4 class="c-theme-text-color">
                                    Additional Information
                                </h4>
                                <div class="form-group">
                                    <label>Sub Association:</label>
                                    <p>{{ Community.sub_association }}</p>
                                </div>
                                <div class="form-group">
                                    <label>CIC:</label>
                                    <p>{{ Community.cic }}</p>
                                </div>
                                <div class="form-group">
                                    <label>LID:</label>
                                    <p>{{ Community.lid }}</p>
                                </div>
                                <div class="form-group">
                                    <label>CID:</label>
                                    <p>{{ Community.cid }}</p>
                                </div>
                                <div class="form-group">
                                    <label>Proximity to Strip:</label>
                                    <p>{{ Community.proximity_to_strip }}</p>
                                </div>
                                <div class="form-group">
                                    <label>Proximity to Airport:</label>
                                    <p>{{ Community.proximity_to_airport }}</p>
                                </div>
                                <div class="form-group">
                                    <label>Nearby Attractions:</label>
                                    <p>{{ Community.nearby_attractions }}</p>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <h4 class="c-theme-text-color">
                                    Images & Videos
                                </h4>
                                <div class="form-group">
                                    <label>Main image</label>
                                    <br />

                                    <image-zooming-component
                                        :file="
                                            Community.main_image ?? 'empty.png'
                                        "
                                        :width="160"
                                    />
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Other:</label>
                                    <br />
                                    <div class="card p-1">
                                        <div class="card-body">
                                            <!-- start of the loop -->
                                            <div
                                                class="row"
                                                data-masonry='{"percentPosition": true }'
                                            >
                                                <div
                                                    class="col-sm-6 col-lg-4 mb-4"
                                                    v-for="file in Community.files"
                                                >
                                                    <!-- images -->

                                                    <div
                                                        class="card"
                                                        v-if="
                                                            file.type.match(
                                                                'image'
                                                            )
                                                        "
                                                    >
                                                        <image-zooming-component
                                                            :file="
                                                                file.file_name
                                                            "
                                                            @loaded="fileLoaded"
                                                        />
                                                    </div>

                                                    <!-- videos -->

                                                    <div
                                                        v-if="
                                                            file.type.match(
                                                                'video'
                                                            )
                                                        "
                                                        class="card"
                                                    >
                                                        <video
                                                            style="
                                                                border-radius: 5px;
                                                            "
                                                            class="video-js img-fluid img-thumbnail"
                                                            controls
                                                            preload="auto"
                                                            data-setup="{}"
                                                            @load="fileLoaded"
                                                        >
                                                            <source
                                                                :src="
                                                                    file.file_name
                                                                "
                                                                :type="
                                                                    file.type
                                                                "
                                                            />
                                                        </video>
                                                    </div>

                                                    <!-- files -->
                                                    <div v-else class="card">
                                                        <div
                                                            v-if="
                                                                file.extension ==
                                                                'pdf'
                                                            "
                                                            class="card card-body p-2 text-center"
                                                        >
                                                            <img
                                                                src="/images/pdf.svg"
                                                                height="50"
                                                                alt="file logo"
                                                            />
                                                            <a
                                                                download
                                                                :href="
                                                                    file.file_name
                                                                "
                                                            >
                                                                {{
                                                                    file.file_original_name
                                                                }}
                                                            </a>
                                                        </div>
                                                        <div
                                                            v-if="
                                                                file.extension ==
                                                                    'docx' ||
                                                                file.extension ==
                                                                    'doc'
                                                            "
                                                            class="card card-body p-2 text-center"
                                                        >
                                                            <img
                                                                src="/images/word.svg"
                                                                height="50"
                                                                alt="file logo"
                                                            />
                                                            <a
                                                                download
                                                                :href="
                                                                    file.file_name
                                                                "
                                                            >
                                                                {{
                                                                    file.file_original_name
                                                                }}
                                                            </a>
                                                        </div>
                                                        <div
                                                            v-if="
                                                                file.extension ==
                                                                    'pptx' ||
                                                                file.extension ==
                                                                    'ppt'
                                                            "
                                                            class="card card-body p-2 text-center"
                                                        >
                                                            <img
                                                                src="/images/powerpoint.svg"
                                                                height="50"
                                                                alt="file logo"
                                                            />
                                                            <a
                                                                download
                                                                :href="
                                                                    file.file_name
                                                                "
                                                            >
                                                                {{
                                                                    file.file_original_name
                                                                }}
                                                            </a>
                                                        </div>
                                                        <div
                                                            v-if="
                                                                file.extension ==
                                                                'excel'
                                                            "
                                                            class="card card-body p-2 text-center"
                                                        >
                                                            <img
                                                                src="images/excel.svg"
                                                                height="50"
                                                                alt="file logo"
                                                            />
                                                            <a
                                                                download
                                                                :href="
                                                                    file.file_name
                                                                "
                                                            >
                                                                {{
                                                                    file.file_original_name
                                                                }}
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- end of the loop -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </Master>
</template>

<script>
import Master from "@components/backend/layout/Master.vue";

import Masonry from "masonry-layout";

export default {
    components: {
        Master,
        Masonry,
    },
    props: ["community_id"],
    created() {
        this.getCommunityDetails();
    },
    mounted() {
        this.$nextTick(() => {
            this.initMasonry();
        });
    },
    data() {
        return {
            Community: [],
            masonryInstance: null,
        };
    },
    methods: {
        getCommunityDetails() {
            axios
                .get("/api/get/community/details/" + this.community_id)
                .then((response) => {
                    this.Community = response.data;
                    this.$nextTick(() => {
                        this.initMasonry(); // Re-initialize Masonry after data is set
                    });
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        initMasonry() {
            const grid = this.$el.querySelector(".row[data-masonry]");
            const images = grid.querySelectorAll("img");
            const videos = grid.querySelectorAll("video");

            let mediaLoaded = 0;
            const totalMedia = images.length + videos.length;

            const onMediaLoad = () => {
                mediaLoaded++;
                if (mediaLoaded === totalMedia) {
                    // All images and videos are loaded, now initialize Masonry
                    this.masonryInstance = new Masonry(grid, {
                        itemSelector: ".col-sm-6", // Adjust this based on your item structure
                        columnWidth: ".col-sm-6", // Adjust this based on your item structure
                        percentPosition: true,
                    });
                }
            };

            // Add load event listeners to all images and videos
            images.forEach((img) => {
                if (img.complete) {
                    onMediaLoad();
                } else {
                    img.addEventListener("load", onMediaLoad);
                }
            });

            videos.forEach((video) => {
                video.addEventListener("loadeddata", onMediaLoad);
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
