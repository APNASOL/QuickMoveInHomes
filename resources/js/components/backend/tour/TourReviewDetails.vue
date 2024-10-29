<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h1 class="mb-0">
                    <span v-if="Tour">
                        {{ Tour.name }} {{ translate("Review details") }}</span
                    >
                </h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span>{{ translate("Stories") }}</span>
                        </li>
                    </ol>
                </nav>
            </div>

            <div class="mb-3 d-flex justify-content-end">
                <a class="btn btn-success" href="/booked-tours">
                    {{ translate("Booked tours") }}</a
                >

                 
                <a v-if="!story"
                    class="btn btn-success ms-1"
                    :href="'/add-review-on-tour/' + tour_id"
                >
                    <i class="bi bi-plus-lg"></i> Add review
                </a>
            </div>
        </div>

        <div class="accordion" id="reviewsAccordion" v-if="Tour">
            <div class="accordion-item">
                <h2 class="accordion-header">
                    <button
                        class="accordion-button collapsed"
                        type="button"
                        data-bs-toggle="collapse"
                        data-bs-target="#collapseThree"
                        aria-expanded="false"
                        aria-controls="collapseThree"
                    >
                        {{ Tour.name }}
                    </button>
                </h2>
                <div
                    id="collapseThree"
                    class="accordion-collapse collapse"
                    data-bs-parent="#reviewsAccordion"
                >
                    <div class="accordion-body">
                        <div class="card c-form-card" v-if="Tour">
                            <div class="card-body">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped">
                                            <tbody>
                                                <tr>
                                                    <th scope="col">
                                                        {{
                                                            translate("Country")
                                                        }}
                                                    </th>
                                                    <td scope="col">
                                                        {{ Tour.country }}
                                                    </td>
                                                    <th scope="col">
                                                        {{ translate("Price") }}
                                                    </th>
                                                    <td scope="col">
                                                        {{ Tour.price }}
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="col">
                                                        {{
                                                            translate(
                                                                "Discount"
                                                            )
                                                        }}
                                                    </th>
                                                    <td scope="col">
                                                        {{ Tour.discount }}
                                                    </td>

                                                    <th scope="col">
                                                        {{
                                                            translate(
                                                                "Flash sale"
                                                            )
                                                        }}
                                                    </th>
                                                    <td scope="col">
                                                        {{ Tour.flash_sale }}
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="col">
                                                        {{
                                                            translate(
                                                                "Best seller"
                                                            )
                                                        }}
                                                    </th>
                                                    <td scope="col">
                                                        {{ Tour.best_seller }}
                                                    </td>
                                                    <th scope="col">
                                                        {{
                                                            translate(
                                                                "Multi country"
                                                            )
                                                        }}
                                                    </th>
                                                    <td scope="col">
                                                        {{ Tour.multi_country }}
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <th scope="col">
                                                        {{
                                                            translate(
                                                                "Description"
                                                            )
                                                        }}
                                                    </th>
                                                    <td scope="col" colspan="3">
                                                        <div
                                                            class="content ql-editor"
                                                            v-html="
                                                                Tour.description
                                                            "
                                                        ></div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="col">
                                                        {{
                                                            translate(
                                                                "Important notes"
                                                            )
                                                        }}
                                                    </th>
                                                    <td scope="col" colspan="3">
                                                        <div
                                                            class="content ql-editor"
                                                            v-html="
                                                                Tour.important_notes
                                                            "
                                                        ></div>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <th scope="col">
                                                        {{
                                                            translate(
                                                                "Offer conditions"
                                                            )
                                                        }}
                                                    </th>
                                                    <td scope="col" colspan="3">
                                                        <div
                                                            class="content ql-editor"
                                                            v-html="
                                                                Tour.offer_conditions
                                                            "
                                                        ></div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="col">
                                                        {{
                                                            translate(
                                                                "Not included"
                                                            )
                                                        }}
                                                    </th>
                                                    <td scope="col" colspan="3">
                                                        <div
                                                            class="content ql-editor"
                                                            v-html="
                                                                Tour.not_included
                                                            "
                                                        ></div>
                                                    </td>
                                                </tr>
                                                <tr v-if="Tour.tourTags">
                                                    <th>
                                                        {{ translate("Tags") }}
                                                    </th>
                                                    <td>
                                                        <template
                                                            v-for="(
                                                                tag, index
                                                            ) in Tour.tourTags"
                                                            :key="tag.id"
                                                        >
                                                            <span>
                                                                <i
                                                                    v-if="
                                                                        index !=
                                                                        0
                                                                    "
                                                                >
                                                                    ,
                                                                </i>
                                                                {{
                                                                    tag.tag_name
                                                                }}
                                                            </span>
                                                        </template>
                                                    </td>
                                                </tr>
                                                <tr cols="6">
                                                    <th scope="col">
                                                        {{
                                                            translate(
                                                                "Itinerary main image"
                                                            )
                                                        }}
                                                    </th>
                                                    <td scope="col">
                                                        <image-zooming-component
                                                            :file="
                                                                Tour.itinerary_image ??
                                                                'empty.png'
                                                            "
                                                            :width="100"
                                                        />
                                                    </td>

                                                    <th scope="col">
                                                        {{
                                                            translate(
                                                                "Tour image"
                                                            )
                                                        }}
                                                    </th>
                                                    <td scope="col">
                                                        <image-zooming-component
                                                            :file="
                                                                Tour.image ??
                                                                'empty.png'
                                                            "
                                                            :width="100"
                                                        />
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="card mt-3" v-if="story">
            <div class="card-header c-form-card-header">
                <label>{{ translate("Tour review") }}</label>
            </div>
            <div class="card-body pt-4">
                <div class="row">
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <tbody>
                            <tr>
                                <th>Title</th>
                                <td>
                                     
                                    {{ story.title }}
                                </td>
                            </tr>
                            <tr>
                                <th>Location</th>
                                <td>{{ story.location }}</td>
                            </tr>
                            <tr>
                                <th>Location</th>
                                <td>{{ story.location }}</td>
                            </tr>
                            <tr>
                                <th>Description</th>
                                <td>
                                    {{ story.description }}
                                </td>
                            </tr>
                            <tr>
                                <th>Rating</th>
                                <td>
                                    <star-rating
                                        v-bind:max-rating="5"
                                        :rating="story.rating"
                                        read-only
                                        :star-size="20"
                                        :show-rating="false"
                                    />
                                </td>
                            </tr>
                            <tr>
                                <th>Image</th>
                                <td>
                                    
                                    <image-zooming-component
                                        :file="story.image ?? 'empty.png'"
                                        :width="70"
                                        :custom_class="'img-thumbnail'"
                                    />
                                </td>
                            </tr>
                        </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </Master>
</template>

<script>
import Master from "@components/backend/layout/Master.vue";
import StarRating from "vue-star-rating";

export default {
    props: ["tour_id"],
    components: {
        Master,
        StarRating,
    },
    created() {
        this.getStories();
    },
    data() {
        return {
            story: "",
        };
    },
    methods: {
        getStories() {
            axios
                .get("/api/reviews-on-tour-fetch/" + this.tour_id)
                .then((response) => {
                    this.story = response.data.story;
                    this.Tour = response.data.tour;
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
