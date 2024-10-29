<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h1 class="mb-0">
                    <span>{{ translate("Call now") }}</span>
                </h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span>{{ translate("Contact") }}</span>
                        </li>
                    </ol>
                </nav>
            </div>

            <!-- <div>
                <a class="btn btn-success" href="/create-office">{{
                    translate("Create office")
                }}</a>
            </div> -->
        </div>

        <div class="card">
            <div class="card-body pt-4">
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                               
                                <th scope="col" class="text-center">#</th>
                                <th scope="col">{{ translate("Contat #") }}</th>
                                <th scope="col">
                                    {{ translate("Agreement") }}
                                </th>

                                <th scope="col" class="text-center">
                                    {{ translate("Actions") }}
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr
                                v-for="(call_now, index) in CallNow"
                                :key="call_now.id"
                            >
                                <th class="text-center">{{ index + 1 }}</th>
                                <td>
                                    {{ call_now.contact_number }}
                                </td>
                                <td>{{ call_now.agreement }}</td>

                                <td class="text-center">
                                    <div class="btn-group">
                                        <DeleteModal
                                            :deleteId="call_now.id"
                                            @deleteThis="deleteThis"
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

export default {
    props: [""],
    components: {
        Master,
    },
    created() {
        this.getRecords();
    },
    data() {
        return {
            CallNow: [],
        };
    },
    methods: {
        getRecords() {
            axios
                .get("/api/call-me-now-fetch")
                .then((response) => {
                    this.CallNow = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        deleteThis(id) {
            axios
                .post("/api/call-me-now-delete/" + id)
                .then((response) => {
                    toastr.success(
                        this.translate("Contact deleted successfully.")
                    );
                    this.getRecords(null);
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
    },
};
</script>
