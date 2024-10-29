<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h1 class="mb-0">All reviews</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                            Reviews
                        </li>
                    </ol>
                </nav>
            </div>
            <!-- <div>
                <a class="btn btn-success" href="/create-tour">{{
                    translate("Create Tour")
                }}</a>
            </div> -->
        </div>
        <div class="card">
            <div class="card-body pt-4">
                <!-- Table with stripped rows -->
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col" class="text-center">#</th>
                                <th scope="col">
                                    {{ translate("Tour") }}
                                </th>
                                <th scope="col">
                                    {{ translate("Title") }}
                                </th>

                                <th scope="col">
                                    {{ translate("Location") }}
                                </th>
                                <th scope="col">
                                    {{ translate("Rating") }}
                                </th>
                                <th scope="col">
                                    {{ translate("Description") }}
                                </th>
                                <th scope="col">
                                    {{ translate("Image") }}
                                </th>
                                <th scope="col">
                                    {{ translate("Action") }}
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr
                                v-for="(review, index) in Reviews"
                                :key="review.id"
                            >
                                <td class="text-center">{{ index + 1 }}</td>
                                <td>
                                    {{ review.tour_name }}
                                </td>
                                <td>
                                    {{ review.title }}
                                </td>

                                <td>{{ review.location }}</td>
                                <td>
                                    <star-rating
                                        v-bind:max-rating="5"
                                        :rating="review.rating"
                                        read-only
                                        :star-size="20"
                                        :show-rating="false"
                                    />
                                </td>
                                <td>
                                    <image-zooming-component
                                        :file="review.image ?? 'empty.png'"
                                        :width="70"
                                        :custom_class="'img-thumbnail'"
                                    />
                                </td>
                                <td>{{ review.description }}</td>
                                <td>
                                    <DeleteModal
                                        :deleteId="review.id"
                                        @deleteThis="deleteThis"
                                    />

                                    <div
                                            class="form-check form-switch d-inline-block"
                                        >
                                            <input
                                                class="form-check-input"
                                                type="checkbox"
                                                 
                                                v-model="review.status"
                                                checked
                                                @change="
                                                    reviewStatusChange(review.id,review.status)
                                                "
                                            />
                                            
                                        </div>

                                         
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </Master>
</template>

<script>
import Master from "@components/backend/layout/Master.vue";
import StarRating from "vue-star-rating";
export default {
    components: {
        Master,
        StarRating,
    },
    created() {
        this.getReviews();
    },
    data() {
        return {
            Reviews: "",
            review:{status:''},
        };
    },
    methods: {
        reviewStatusChange(review_id,status) {
            let formData = new FormData();
           
            formData.append("review_id", review_id);
            formData.append("status",status);

             axios
                .post("/api/review-status-change", formData)
                .then((response) => {
                    toastr.success(this.translate("Tour status changed"));
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        getReviews() {
            axios
                .get("/api/all-reviews-fetch")
                .then((response) => {
                    this.Reviews = response.data; 
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        async deleteThis(id) {
            await axios
                .post("/api/review-delete/" + id)
                .then((response) => {
                    toastr.success(
                        this.translate("Review deleted successfully.")
                    );
                    this.getReviews();
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
    color: red;
    text-decoration: none;
}
.c-mouse-over {
    cursor: pointer;
}
</style>
