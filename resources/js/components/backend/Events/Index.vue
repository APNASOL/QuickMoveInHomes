<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h3 class="mb-0">
                    <span>{{ translate("Events") }}</span>
                </h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span>{{ translate("Events") }}</span>
                        </li>
                    </ol>
                </nav>
            </div>

            <div>
                <a
                    class="btn btn-success"
                    title="Add Event"
                    :href="'/event/create/'"
                >
                    {{ translate("Add Event") }}
                </a>
            </div>
        </div>

        <div class="card shadow-lg border-0 rounded-4">
    <div class="card-body pt-4 bg-light">
        <div class="accordion" id="eventsAccordion">
            <div
                class="accordion-item mb-3 rounded-4 overflow-hidden shadow-sm"
                v-for="(event, index) in events"
                :key="event.id"
            >
                <h2 class="accordion-header" :id="'heading' + event.id">
                    <button
                        class="accordion-button bg-gradient bg-primary text-white fw-semibold"
                        type="button"
                        data-bs-toggle="collapse"
                        :data-bs-target="'#collapse' + event.id"
                        aria-expanded="true"
                        :aria-controls="'collapse' + event.id"
                    >
                        <span class="me-3">{{ index + 1 }}</span>
                        {{ event.title }} - {{ event.date }}
                    </button>
                </h2>
                <div
                    :id="'collapse' + event.id"
                    class="accordion-collapse collapse"
                    :aria-labelledby="'heading' + event.id"
                    data-bs-parent="#eventsAccordion"
                >
                    <div class="accordion-body bg-white">
                        <!-- Event Image -->
                        <div class="mb-3">
                            <div>
                                <image-zooming-component
                                    :file="event.image ?? 'empty.png'"
                                    :width="200"
                                />
                            </div>
                        </div>

                        <!-- Event Details -->
                        <div class="row g-3">
                            <div class="col-md-6">
                                <strong>{{ translate("Title") }}:</strong>
                                <p>{{ event.title }}</p>
                            </div>
                            <div class="col-md-6">
                                <strong>{{ translate("Date") }}:</strong>
                                <p>{{ event.date }}</p>
                            </div>
                        </div>

                        <!-- Registration Link -->
                        <div class="mb-3">
                            <strong>{{ translate("Registration Link") }}:</strong>
                            <a :href="event.registeration_link" target="_blank" class="text-decoration-none">
                                <u>{{ event.registeration_link }}</u>
                            </a>
                        </div>

                        <!-- Event Description -->
                        <div class="mb-3">
                            <strong>{{ translate("Description") }}:</strong>
                            <div
                                class="content ql-editor"
                                v-html="event.description"
                            ></div>
                        </div>

                        <!-- Actions -->
                        <div class="d-flex justify-content-end p-2">
                            <a
                                class="btn btn-sm btn-primary"
                                :href="'/event/edit/' + event.id"
                                title="Edit Event"
                            >
                                <i class="bi bi-pencil"></i> {{ translate('Edit') }}
                            </a>
                            <DeleteModal
                                :deleteId="event.id"
                                @deleteThis="deleteThis"
                            />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

    </Master>
</template>

<script>
import Master from "@components/backend/layout/Master.vue";
import { VueDraggableNext } from "vue-draggable-next";
import Multiselect from "@vueform/multiselect";

export default {
    components: {
        Master,
        draggable: VueDraggableNext,
        Multiselect,
    },
    created() {
        this.getEvents();
    },
    data() {
        return {
            events: [],
            default_url: "/api/fetch-events",
        };
    },
    methods: {
        getEvents() {
            axios
                .get("/api/fetch-events")
                .then((response) => {
                    this.events = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },

        deleteThis(id) {
            axios
                .post("/api/event/delete/" + id)
                .then((response) => {
                    toastr.success(
                        this.translate("Event deleted successfully.")
                    );
                    this.getEvents();
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        setAltImg(event) {
            event.target.src = "/images/default_image.png";
        },
    },
};
</script>

<style>
@import "@vueform/multiselect/themes/default.css";
.c-mouse-over {
    cursor: pointer !important;
}
.c-linked {
    color: red;
    text-decoration: none;
}
</style>
