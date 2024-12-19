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
                <div class="card-body pt-4">
                    <div class="container-fluid">
                        <div v-if="Community">
                            <div class="row g-3">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <h1 class="c-theme-text-color">
                                           {{ Community.name }} 
                                        </h1>
                                    </div>
                                    <div>
                                        <a
                                            class="text-end btn text-success btn-sm fs-6 p-2"
                                            type="button"
                                            :title="translate('Edit')"
                                            :href="
                                                '/community/edit/' +
                                                community_id
                                            "
                                        >
                                            <i class="bi bi-pencil"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label>Name</label>
                                    <p>{{ Community.name }}</p>
                                </div>
                                <div class="col-md-6">
                                    <label>Description</label>
                                    <p>{{ Community.description }}</p>
                                </div>
                                <div class="col-md-6">
                                    <label>Location</label>
                                    <p>{{ Community.location }}</p>
                                </div>
                                <div class="col-md-6">
                                    <label>Longitude</label>
                                    <p>{{ Community.longitude }}</p>
                                </div>
                                <div class="col-md-6">
                                    <label>Latitude</label>
                                    <p>{{ Community.latitude }}</p>
                                </div>
                                <div class="col-md-6">
                                    <label>HOA</label>
                                    <p>{{ Community.hoa }}</p>
                                </div>
                                <div class="col-md-6">
                                    <label>Legal Subdivision</label>
                                    <p>{{ Community.legal_subdivision }}</p>
                                </div>
                                <div class="col-md-6">
                                    <label>Nearby Properties</label>
                                    <p>{{ Community.nearby_properties }}</p>
                                </div>
                                <div class="col-md-6">
                                    <label>Masterplan</label>
                                    <p>{{ Community.masterplan }}</p>
                                </div>
                                <div class="col-md-6">
                                    <label>Amenities</label>
                                    <p>
                                        {{
                                            Community.amenities
                                                ? Community.amenities.join(", ")
                                                : "No amenities listed"
                                        }}
                                    </p>
                                </div>
                                <div class="col-md-6">
                                    <label>Regions</label>
                                    <p>
                                        {{
                                            Community.regions
                                                ? Community.regions.join(", ")
                                                : "No regions listed"
                                        }}
                                    </p>
                                </div>
                                <div class="col-md-6">
                                    <label>Neighborhoods</label>
                                    <p>
                                        {{
                                            Community.neighborhoods
                                                ? Community.neighborhoods.join(
                                                      ", "
                                                  )
                                                : "No neighborhoods listed"
                                        }}
                                    </p>
                                </div>
                            </div>
                            <hr />
                            <div class="row g-3 mt-3">
                                <h3 class="c-theme-text-color">
                                    Additional Information
                                </h3>
                                <div class="col-md-6">
                                    <label>Sub Association</label>
                                    <p>{{ Community.sub_association }}</p>
                                </div>
                                <div class="col-md-6">
                                    <label>CIC</label>
                                    <p>{{ Community.cic }}</p>
                                </div>
                                <div class="col-md-6">
                                    <label>LID</label>
                                    <p>{{ Community.lid }}</p>
                                </div>
                                <div class="col-md-6">
                                    <label>CID</label>
                                    <p>{{ Community.cid }}</p>
                                </div>
                                <div class="col-md-6">
                                    <label>Sid lid fee</label>
                                    <p>{{ Community.sid_lid_fee }}</p>
                                </div>
                                <div class="col-md-6">
                                    <label>Sid lid payment frequency</label>
                                    <p>
                                        {{
                                            Community.sid_lid_payment_frequency
                                        }}
                                    </p>
                                </div>
                                <div class="col-md-6">
                                    <label>Map location</label>
                                    <p>{{ Community.map_location }}</p>
                                </div>
                                <div class="col-md-6">
                                    <label>Proximity to Strip</label>
                                    <p>{{ Community.proximity_to_strip }}</p>
                                </div>
                                <div class="col-md-6">
                                    <label>Proximity to Airport</label>
                                    <p>{{ Community.proximity_to_airport }}</p>
                                </div>
                                <div class="col-md-6">
                                    <label>Nearby Attractions</label>
                                    <p>{{ Community.nearby_attractions }}</p>
                                </div>
                            </div>
                            <hr />

                            <h3 class="c-theme-text-color">Main Image</h3>

                            <image-zooming-component
                                :file="Community.main_image ?? 'empty.png'"
                                :width="260"
                            />

                            <div
                                class="col-md-12 mt-4"
                                v-if="Community.files && Community.files.length"
                            >
                                <div class="form-group mt-2">
                                    <h3 class="c-theme-text-color">
                                        Community Photo Gallery
                                    </h3>

                                    <!-- start of the loop -->
                                    <div class="row">
                                        <div
                                            class="col-sm-2 col-lg-2 mb-4"
                                            v-for="file in Community.files"
                                            :key="file.id"
                                        >
                                            <!-- images -->

                                            <div
                                                class=""
                                                v-if="file.type.match('image')"
                                            >
                                                <div class="text-center">
                                                    <DeleteModal
                                                        :deleteId="file.id"
                                                        @deleteThis="deleteThis"
                                                    />
                                                </div>

                                                <image-zooming-component
                                                    :file="file.file_name"
                                                    @loaded="fileLoaded"
                                                />
                                            </div>

                                            <!-- videos -->

                                            <div
                                                v-if="file.type.match('video')"
                                                class="card"
                                            >
                                                <video
                                                    style="border-radius: 5px"
                                                    class="video-js img-fluid img-thumbnail"
                                                    controls
                                                    preload="auto"
                                                    data-setup="{}"
                                                    @load="fileLoaded"
                                                >
                                                    <source
                                                        :src="file.file_name"
                                                        :type="file.type"
                                                    />
                                                </video>
                                            </div>

                                            <!-- files -->
                                            <div v-else class="card">
                                                <div
                                                    v-if="
                                                        file.extension == 'pdf'
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
                                                        :href="file.file_name"
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
                                                        file.extension == 'doc'
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
                                                        :href="file.file_name"
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
                                                        file.extension == 'ppt'
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
                                                        :href="file.file_name"
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
                                                        :href="file.file_name"
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
        </section>
    </Master>
</template>

<script>
import Master from "@components/backend/layout/Master.vue";

export default {
    components: {
        Master,
    },
    props: ["community_id"],
    created() {
        this.getCommunityDetails();
    },

    data() {
        return {
            Community: [],
        };
    },
    methods: {
        getCommunityDetails() {
            axios
                .get("/api/get/community/details/" + this.community_id)
                .then((response) => {
                    this.Community = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },

        deleteThis(id) {
            axios
                .post(
                    "/api/community/photo/gallery/delete/" +
                        id +
                        "/" +
                        this.community_id
                )
                .then(() => {
                    toastr.success(
                        this.translate("Photo deleted successfully.")
                    );
                    this.getPropertyDetails();
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
.c-theme-text-color {
    color: #174696 !important;
    text-decoration: none !important;
}
</style>
