<template>
    <div class="card c-form-card mt-2 mb-2">
        <div class="card-header c-form-card-header">
            <label>{{ translate("Accommodations") }}</label>
        </div>
        <div class="d-flex justify-content-end p-3">
            <a
                class="btn btn-success"
                :href="'/accommodation-create/' + tour_id + '/create'"
                >{{ translate("Add new accommodation") }}</a
            >
        </div>

        <div class="card-body">
            <div
                class="table-responsive"
                v-if="accommodations && accommodations.length > 0"
            >
                <table class="table table-striper">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>{{ translate("Title") }}</th>

                            <th>{{ translate("Status") }}</th>
                            <th>{{ translate("Action") }}</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr
                            v-for="(accommodation, index) in accommodations"
                            :key="accommodation.id"
                        >
                            <td>{{ index + 1 }}</td>
                            <td>
                                <a
                                    class="c-linked c-mouse-over"
                                    :href="
                                        '/details-accommodation/' +
                                        accommodation.id +
                                        '/' +
                                        tour_id
                                    "
                                >
                                    {{ accommodation.title }}
                                </a>
                            </td>

                            <td v-if="accommodation.status === 1">
                                {{ translate("Included") }}
                            </td>
                            <td v-else>{{ translate("Optional") }}</td>
                            <td class="">
                                <div class="btn-group">
                                    <a
                                        type="button"
                                        class="btn btn-sm fs-6"
                                        title="Edit"
                                        :href="
                                            '/edit-accommodation/' +
                                            tour_id +
                                            '/edit/' +
                                            accommodation.id
                                        "
                                        ><i class="bi bi-pencil"></i>
                                    </a>

                                    <DeleteModal
                                        :deleteId="accommodation.id"
                                        @deleteThis="deleteThis"
                                    />
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div v-else>
                <span>{{ translate("No accommodation added.") }}</span>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    props: ["tour_id"],
    components: {},
    created() {
        this.getAccommodations();
    },
    data() {
        return {
            accommodations: "",
        };
    },
    methods: {
        async getAccommodations() {
            await axios
                .get("/api/get-accommodations-tour/" + this.tour_id)
                .then((response) => {
                    this.accommodations = response.data;
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
                .post("/api/accommodation-delete/" + id)
                .then(() => {
                    toastr.success(
                        this.translate("Accommodation deleted successfully")
                    );
                    this.getAccommodations();
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
    },
};
</script>
