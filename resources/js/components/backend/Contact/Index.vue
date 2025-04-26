<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h2 class="mb-0">
                    <span>Customer contacts</span>
                </h2>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span>Contacts</span>
                        </li>
                    </ol>
                </nav>
            </div>
        </div>

        <div class="card shadow-lg border-0 rounded-4">
    <div class="card-body pt-4 bg-light">
        <section class="section">
            <!-- Table with Search Form -->
            <div class="d-flex justify-content-between mb-4">
                <!-- Floating Labels Form -->
                <div class="row g-3">
                    <div class="input-group">
                        <div class="form-outline">
                            <input
                                type="text"
                                v-model="form.name"
                                class="form-control rounded-pill shadow-sm"
                                id="name"
                                :placeholder="translate('Search by name')"
                                :class="{'is-invalid': formErrors.name}"
                            />
                            <div class="invalid-feedback animated fadeIn" v-if="formErrors.name">
                                {{ formErrors.name[0] }}
                            </div>
                        </div>
                        <button @click="search(null)" class="btn btn-primary rounded-pill shadow-sm">
                            <i class="bi bi-search"></i>
                        </button>

                        <button class="btn" type="button" v-if="formStatus != 1">
                            <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Table -->
            <div class="table-responsive rounded-3 shadow-sm">
                <table class="table table-hover align-middle bg-white">
                    <thead class="table-primary text-dark">
                        <tr>
                            <th scope="col" class="text-center">#</th>
                            <th scope="col">{{ translate("Name") }}</th>
                            <th scope="col">{{ translate("Email") }}</th>
                            <th scope="col">{{ translate("Phone") }}</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(contact, index) in contacts" :key="contact.id">
                            <th class="text-center">{{ index + 1 }}</th>
                            <td>
                                <a
                                    class="c-linked c-mouse-over"
                                    title="Edit"
                                    :href="'/contact-details/' + contact.id"
                                >
                                    {{ contact.name }}
                                    <i v-if="contact.contacted_from == 'Agent'">({{ contact.contacted_from }})</i>
                                </a>
                            </td>
                            <td>{{ contact.email }}</td>
                            <td>{{ contact.phone }}</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Load More Button -->
            <div class="text-center mt-4">
                <button
                    v-if="pagination.next_page_url"
                    @click="search(pagination.next_page_url)"
                    class="btn btn-success rounded-pill shadow-sm"
                >
                    {{ translate("Load More") }}
                </button>
            </div>
        </section>
    </div>
</div>

    </Master>
</template>

<script>
import Master from "@components/backend/layout/Master.vue";
import ImageCropper from "@components/global/ImageCropper.vue";
export default {
    components: {
        Master,
    },
    created() {
        this.search(this.default_url);
    },
    data() {
        return {
            default_url: "/api/fetch-users-contacts",
            contacts: [],
            form: {
                name: "",
            },
            formErrors: [],
            firstTimeLoadCheck: 0,
            loaderForTimes: 1,
            formStatus: 1,
            pagination: {},
            loadMoreStatus: 1,
        };
    },
    methods: {
        makePagination(res) {
            let pagination = {
                links: res.links,
                current_page: res.current_page,
                last_page: res.last_page,
                next_page_url: res.next_page_url,
                prev_page_url: res.prev_page_url,
            };
            this.pagination = pagination;
        },
        search(page_url) {
            // if no page url then it means that search button is clicked
            if (!page_url) {
                this.firstTimeLoadCheck = 1;
            }
            page_url = page_url || this.default_url;

            this.formStatus = 0;
            let formData = new FormData();

            if (this.form.name == null) {
                formData.append("name", "");
            } else {
                formData.append("name", this.form.name);
            }
            // formData.append("status", this.form.status);

            axios
                .post(page_url, formData)

                .then((response) => {
                    if (this.firstTimeLoadCheck == 1) {
                        this.contacts = response.data.data;
                        this.firstTimeLoadCheck = 0;
                        this.formStatus = 1;
                    } else {
                        this.contacts = this.contacts.concat(
                            response.data.data
                        );
                        this.loadMoreStatus = 1;
                        this.formStatus = 1;
                    }
                    this.makePagination(response.data);
                })
                .catch((error) => {
                    this.formStatus = 1;
                    toastr.error(error.response.data.message);
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
<style>
.c-linked {
    color: #163259 !important; 
    text-decoration: none;
}
.c-mouse-over {
    cursor: pointer;
}
</style>
