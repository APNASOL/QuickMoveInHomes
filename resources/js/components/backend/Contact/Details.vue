<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h1 class="mb-0">
                    <span>Customer details</span>
                </h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span>Details</span>
                        </li>
                    </ol>
                </nav>
            </div>
            <div>
                <a
                    data-bs-toggle="modal"
                    data-bs-target="#messageReplyModal"
                    class="btn btn-success"
                    href="/create-tour"
                    >{{ translate("Reply") }}</a
                >
            </div>
        </div>

        <div class="card">
            <div class="card-body pt-4">
                <section class="section">
                    <div class="card">
                        <div class="card-body pt-4">
                            <div class="row g-3">
                                <h3
                                    class="card-title ms-2"
                                    v-if="contact.contacted_from"
                                >
                                    {{ contact.contacted_from }}
                                    {{ translate("message") }}
                                </h3>
                                <h3 class="card-title ms-2" v-else>
                                    {{ translate("Customer message") }}
                                </h3>
                                <div class="col-md-3">
                                    <b>Name </b> <br />
                                    {{ contact.name }}
                                </div>
                                <div class="col-md-3">
                                    <b>Email</b><br />
                                    {{ contact.email }}
                                </div>
                                <div class="col-md-3" v-if="contact.phone">
                                    <b>Phone</b><br />
                                    {{ contact.phone }}
                                </div>

                                <div class="col-md-12">
                                    <b>Message</b><br />
                                    {{ contact.message }}
                                </div>
                            </div>
                            <div class="table-responsive mt-4">
                                <h3 class="card-title">
                                    {{ translate("Admin reply") }}
                                </h3>
                                <table class="table table-striper">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>{{ translate("Subject") }}</th>
                                            <th>{{ translate("Messge") }}</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr
                                            v-for="(reply, index) in replies"
                                            :key="reply"
                                        >
                                            <td>
                                                <b>{{ index + 1 }}</b>
                                            </td>
                                            <td>{{ reply.subject }}</td>
                                            <td>{{ reply.message }}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>

        <!-- modal to reply -->
        <div class="modal fade" id="messageReplyModal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="block-content p-4">
                            <form @submit.prevent="send_reply">
                                <div class="row g-3">
                                    <div class="col-12 col-md-12">
                                        <label for="subject">{{
                                            translate("Subject")
                                        }}</label>
                                        <input
                                            type="text"
                                            class="form-control"
                                            id="subject"
                                            :class="{
                                                'invalid-bg':
                                                    formErrors.subject,
                                            }"
                                            v-model="reply.subject"
                                        />

                                        <div
                                            class="invalid-feedback animated fadeIn"
                                            v-if="formErrors.subject"
                                        >
                                            {{ formErrors.subject[0] }}
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-12">
                                        <label>{{
                                            translate("Message")
                                        }}</label>
                                        <textarea
                                            class="form-control"
                                            :class="{
                                                'invalid-bg':
                                                    formErrors.message,
                                            }"
                                            v-model="reply.message"
                                            rows="5"
                                        ></textarea>

                                        <div
                                            class="invalid-feedback animated fadeIn"
                                            v-if="formErrors.message"
                                        >
                                            {{ formErrors.message[0] }}
                                        </div>
                                    </div>
                                    <div class="mt-3">
                                        <button
                                            type="submit"
                                            class="btn btn-success"
                                            v-if="replyFormStatus == 1"
                                        >
                                            {{ translate("Reply") }}
                                        </button>
                                        <button
                                            class="btn btn-success"
                                            type="button"
                                            disabled
                                            v-else
                                        >
                                            {{ translate("Reply") }}
                                            <span
                                                class="spinner-border spinner-border-sm"
                                                role="status"
                                                aria-hidden="true"
                                            ></span>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <button
                ref="closeReplyModal"
                hidden="hidden"
                data-bs-dismiss="modal"
            ></button>
        </div>
        <!-- modal to reply -->
    </Master>
</template>

<script>
import Master from "@components/backend/layout/Master.vue";
export default {
    components: {
        Master,
    },
    props: ["contact_id"],
    created() {
        this.getDetails();
    },
    data() {
        return {
            form: {
                name: "",
            },
            formErrors: [],
            reply: {
                subject: "",
                message: "",
                message_id: this.contact_id,
                status: "",
            },
            replyFormStatus: 1,
            contact: [],
            replies: [],
        };
    },
    methods: {
        getDetails() {
            axios
                .get("/api/get-contact-details/" + this.contact_id)
                .then((response) => {
                    this.replies = response.data.replies;
                    this.contact = response.data.contact;
                })
                .catch((error) => {
                    this.formStatus = 1;
                    toastr.error(error.response.data.message);
                    if (error.response.data.errors) {
                        this.formErrors = error.response.data.errors;
                    }
                });
        },

        // fetchRecord() {
        //     axios
        //         .get(route("/api/contac-ticket.details.fetch", this.contact_id), {
        //             headers: {
        //                 Authorization: "Bearer " + this.$page.props.auth_token,
        //             },
        //         })
        //         .then((respnse) => {
        //             this.messages = respnse.data.services_tickets;
        //             this.parent_record = respnse.data.parent_record;
        //         })
        //         .catch((error) => {
        //             toastr.error(error.response.data.message);
        //         });
        // },

        send_reply() {
            this.replyFormStatus = 0;

            axios
                .post("/api/admin-reply-to-user", this.reply)
                .then((data) => {
                    this.replyFormStatus = 1;
                    toastr.success(
                        this.translate("Message reply sent successfully.")
                    );
                    this.$refs.closeReplyModal.click();
                    this.getDetails();
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);

                    this.replyFormStatus = 1;
                    if (error.response.data.errors) {
                        this.formErrors = error.response.data.errors;
                    }
                });
        },

        deleteThis(id) {
            axios
                .delete("api.contact-delete", id)
                .then(() => {
                    toastr.success(
                        this.translate("Contact deleted successfully.")
                    );
                    this.search(null);
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
    },
};
</script>
