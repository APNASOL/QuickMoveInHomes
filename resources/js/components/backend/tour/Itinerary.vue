<template>
    <div class="card c-form-card mt-2 mb-2">
        <div class="card-header c-form-card-header">
            <label>{{ translate("Itinerary") }}</label>
        </div>
        <div class="d-flex justify-content-end p-3">
            <a
                class="btn btn-success"
                :href="'/itinerary-create/' + tour_id + '/create'"
                >{{ translate("Add new itinerary") }}</a
            >
        </div>

        <div class="card-body">
            <div
                class="table-responsive"
                v-if="itineraries && itineraries.length > 0"
            >
                <table class="table table-striper">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>{{ translate("Title") }}</th>
                            <th colspan="2">
                                {{ translate("Description") }}
                            </th>
                            <th>{{ translate("Image") }}</th>
                            <th>{{ translate("Action") }}</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr
                            v-for="(itinerary, index) in itineraries"
                            :key="itinerary.id"
                        >
                            <td>{{ index + 1 }}</td>
                            <td>{{ itinerary.title }}</td>
                            <td colspan="2">
                                <div
                                    class="content ql-editor"
                                    v-html="itinerary.description"
                                ></div>
                            </td>
                            <td>
                                <image-zooming-component
                                    :file="itinerary.image ?? 'empty.png'"
                                    :width="100"
                                />
                            </td>
                            <td class="text-center">
                                <div class="btn-group">
                                    <a
                                        type="button"
                                        class="btn btn-sm fs-6"
                                        title="Edit"
                                        :href="
                                            '/edit-itinerary/' +
                                            tour_id +
                                            '/edit/' +
                                            itinerary.id
                                        "
                                        ><i class="bi bi-pencil"></i>
                                    </a>

                                    <DeleteModal
                                        :deleteId="itinerary.id"
                                        @deleteThis="deleteThis"
                                    />
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div v-else>
                <span>{{ translate("No itinerary added.") }}</span>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    props: ["tour_id"],
    components: {},
    created() {
        this.getItineraries();
    },
    data() {
        return {
            itineraries: "",
        };
    },
    methods: {
        async getItineraries() {
            await axios
                .get("/api/get-itineraries-tour/" + this.tour_id)
                .then((response) => {
                    this.itineraries = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        croppedImgSubmit(img) {
            this.other_image_form.image = img;
        },
        async deleteThis(id) {
            await axios
                .post("/api/itinerary-delete/" + id)
                .then(() => {
                    toastr.success(
                        this.translate("Itinerary deleted successfully")
                    );
                    this.getItineraries();
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
    },
};
</script>
