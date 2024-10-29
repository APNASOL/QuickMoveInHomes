<template>
    <div class="card c-form-card mt-2 mb-2">
        <div class="card-header c-form-card-header">
            <label>{{ translate("Activities") }}</label>
        </div>
        <div class="d-flex justify-content-end p-3">
            <a
                class="btn btn-success"
                :href="'/activity-create/' + tour_id + '/create'"
                >{{ translate("Add new activity") }}</a
            >
        </div>

        <div class="card-body">
            <div
                class="table-responsive"
                v-if="activities && activities.length > 0"
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
                            v-for="(activity, index) in activities"
                            :key="activity.id"
                        >
                            <td>{{ index + 1 }}</td>
                            <td>
                                <a
                                    class="c-linked c-mouse-over"
                                    :href="
                                        '/details-activity/' +
                                        activity.id +
                                        '/' +
                                        tour_id
                                    "
                                >
                                    {{ activity.title }}
                                </a>
                            </td>

                            <td v-if="activity.status == 1">
                                {{ translate("Included") }}
                            </td>
                            <td v-else>{{ translate("Optional") }}</td>
                            <td class="text-center">
                                <div class="btn-group">
                                    <a
                                        type="button"
                                        class="btn btn-sm fs-6"
                                        title="Edit"
                                        :href="
                                            '/edit-activity/' +
                                            tour_id +
                                            '/edit/' +
                                            activity.id
                                        "
                                        ><i class="bi bi-pencil"></i>
                                    </a>

                                    <DeleteModal
                                        :deleteId="activity.id"
                                        @deleteThis="deleteThis"
                                    />
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div v-else>
                <span>{{ translate("No activity added.") }}</span>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    props: ["tour_id"],
    components: {},
    created() {
        this.getActivities();
    },
    data() {
        return {
            activities: "",
        };
    },
    methods: {
        async getActivities() {
            await axios
                .get("/api/get-activities-tour/" + this.tour_id)
                .then((response) => {
                    this.activities = response.data;
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
                .post("/api/activity-delete/" + id)
                .then(() => {
                    toastr.success(
                        this.translate("Activity deleted successfully")
                    );
                    this.getActivities();
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
    },
};
</script>
