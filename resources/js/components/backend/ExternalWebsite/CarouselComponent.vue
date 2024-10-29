<template>
    <div>
        <div class="card c-form-card mt-1">
            <div class="card-header c-form-card-header">
                {{ translate("Carousel Section") }}
            </div>
            <div class="card-body pt-4">
                <!-- <h5 class="card-title">Add New FAQ</h5> -->

                <!-- Floating Labels Form -->

                <div class="row g-3">
                    <div class="col-12 card">
                        <div class="card-body p-1">
                            <draggable
                                :list="CarouselTextList"
                                :key="CarouselTextList"
                                @change="changePosition"
                            >
                                <div v-for="(list, index) in CarouselTextList">
                                    <div class="row">
                                        <div
                                            class="col-md-4 mt-2"
                                            v-if="
                                                list.image &&
                                                list.image.type &&
                                                list.image.type.match('video')
                                            "
                                        >
                                            <video
                                                style="border-radius: 5px"
                                                class="video-js img-fluid img-thumbnail"
                                                controls
                                                preload="auto"
                                                data-setup="{}"
                                                @load="fileLoaded"
                                                width="200"
                                            >
                                                <source
                                                    :src="list.image.url"
                                                    :type="list.image.type"
                                                />
                                            </video>

                                            <!-- <img :src="list.image" width="250" @error="setAltImg"> -->
                                        </div>
                                        <div
                                            class="col-md-4 mt-2"
                                            v-else-if="
                                                list.image &&
                                                list.image.type &&
                                                list.image.type.match('image')
                                            "
                                        >
                                            <image-zooming-component
                                                :file="
                                                    list.image.url ??
                                                    'empty.png'
                                                "
                                                :width="200"
                                            />

                                            <!-- <img :src="list.image" width="250" @error="setAltImg"> -->
                                        </div>

                                        <div class="col-md-6 mt-2">
                                            <textarea
                                                class="form-control"
                                                :class="{
                                                    'invalid-bg':
                                                        formErrors.description,
                                                }"
                                                v-model="list.description"
                                                rows="3"
                                            ></textarea>

                                            <input
                                                type="hidden"
                                                v-model="list.image_id"
                                                checked
                                            />
                                        </div>

                                        <div class="col-md-2 mt-4">
                                            <DeleteModal
                                                :deleteId="list.id"
                                                @deleteThis="recordDelete"
                                            ></DeleteModal>
                                        </div>
                                    </div>
                                </div>
                            </draggable>
                        </div>
                    </div>
                    <div class="col-12 col-md-12">
                        <Cropper @croppedImg="cropedImage" />
                        <br />

                        <div class="col-12 col-md-12">
                            <div class="c-files">
                                <label class="col-6 col-form-label">{{
                                    translate("Uplaod video file")
                                }}</label>
                                <br />
                                <small>
                                    {{
                                        translate(
                                            "The recommended resolutions for video are 1080p and 720p."
                                        )
                                    }}
                                </small>

                                <ImageDropper
                                    class="mt-2"
                                    DropperType="single"
                                    fileTypes=".mp4"
                                    @emitMethod="dropVideo"
                                />
                            </div>
                        </div>
                        <button
                            v-if="CarouselTextList != ''"
                            type="submit"
                            class="btn btn-success mt-3"
                            @click="submitCarouselText"
                        >
                            {{ translate("Update") }}
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import Cropper from "@components/backend/ExternalWebsite/Cropper.vue";
import { VueDraggableNext } from "vue-draggable-next";
export default {
    // layout: Master,
    components: {
        Cropper,
        draggable: VueDraggableNext,
    },
    emits: ["refetchParentDetails"],
    created() {
        this.fetchCarouselText();
    },
    data() {
        return {
            CarouselTextList: [
                {
                    description: "",
                    image_id: "",
                },
            ],
            formStatus: "Yes",
            formErrors: [],
            Carousels: [],
            form: {
                image: "",
                video: "",
            },
            CommentformStatus: 1,
            CarouselTextStatus: 1,
        };
    },
    methods: {
        // addList() {
        //     this.CarouselTextList.push({
        //         carousel_text: "",
        //     });
        // },

        submitCarouselText() {
            this.CarouselTextStatus = 0;
            let formData = new FormData();
            let text_list = this.CarouselTextList;
            formData.append("text_list", JSON.stringify(text_list));
            axios
                .post("/api/carousel-update", formData)
                .then(() => {
                    toastr.success(
                        this.translate("Carousel updated successfully.")
                    );
                    this.CarouselTextStatus = 1;
                    this.fetchCarouselText();
                })
                .catch((error) => {
                    this.CarouselTextStatus = 1;
                    toastr.error(error.response.data.message);
                });
        },

        fetchCarouselText() {
            axios
                .get("/api/carousel-fetch")
                .then((response) => {
                    this.CarouselTextList = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        changePosition(event) {
            let newPositions = [];

            for (let index = 0; index < this.CarouselTextList.length; index++) {
                newPositions.push({
                    order_id: index,
                    event_id: this.CarouselTextList[index].id,
                });
            }

            newPositions = JSON.stringify(newPositions);
            axios
                .post("/api/carousel-dragging/" + newPositions)
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        removeList(index, list) {
            var idx = this.CarouselTextList.indexOf(list);
            if (idx > -1) {
                this.CarouselTextList.splice(idx, 1);
            }
        },

        async save() { 
            let formData = new FormData();
            formData.append("image", this.form.image);
            formData.append("video", this.form.video);
            
            // return ;
            await axios
                .post("/api/carousel-store", formData)
                .then((data) => {
                    toastr.success("New file added successfully.");
                    // this.$emit('refetchParentDetails')
                    this.form.image = "";
                    this.form.video = "";
                    this.formErrors = false;
                    this.fetchCarouselText();
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                    if (error.response.data.errors) {
                        this.formErrors = error.response.data.errors;
                    }
                });
        },
        dropVideo(video) { 
            if(video)
            {
                this.form.video = video;
                this.save();
            }
        },  
        cropedImage(image) { 
            if(image)
            { 
                this.form.image = image;
                this.save();
            }
        },  
        // videoSubmit(video) {
        //     this.form.video = video;
        //     let formData = new FormData();
        //     formData.append("video", video);
 
        //     axios
        //         .post("/api/carousel-store", formData)
        //         .then((data) => {
        //             toastr.success("Caorousel new image added successfully.");
        //             // this.$emit('refetchParentDetails')
        //             this.form.image = "";
        //             this.form.video = "";
        //             this.formErrors = false;
        //             this.fetchCarouselText();
        //         })
        //         .catch((error) => {
        //             toastr.error(error.response.data.message);
        //             if (error.response.data.errors) {
        //                 this.formErrors = error.response.data.errors;
        //             }
        //         });
        // },
        recordDelete(id) {
            axios
                .post("/api/carousel-delete/" + id)
                .then(() => {
                    toastr.success(
                        this.translate("Carousel deleted successfully.")
                    );
                    this.fetchCarouselText();
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        setAltImg(event) {
            event.target.src = "/images/default.jpg";
        },
    },
};
</script>

<style>
@import "@vueform/multiselect/themes/default.css";
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
#CodeSelect {
    min-height: 58px;
}
.card {
    overflow: visible;
}
.remove-status {
    margin-left: 15px !important;
    margin-top: 5px !important;
}
</style>
