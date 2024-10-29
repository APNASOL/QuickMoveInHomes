<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h3 class="mb-0 c-theme-text-color">
                    <span v-if="agent_id">{{
                        translate("Edit Agent")
                    }}</span>
                    <span v-else>{{ translate("Create Agent") }}</span>
                </h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item" aria-current="page">
                            <span>{{ translate("Agents") }}</span>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span v-if="agent_id">{{
                                translate("Update")
                            }}</span>
                            <span v-else>{{ translate("Create") }}</span>
                        </li>
                    </ol>
                </nav>
            </div>

            <div class="mb-3 d-flex justify-content-end">
                <a class="btn btn-success justify-content-end" href="/agents">
                    <i class="bi bi-list"></i> {{ translate("Agents") }}
                </a>
            </div>
        </div>

        <div class="card c-card-border">
            <div class="card-body pt-4">
                <form @submit.prevent="submit">
                    <div class="row g-3">
                        <!-- Agency Name Input -->
                        <div class="col-12 col-md-6">
                            <label for="agent_name">{{ translate("Agent Name") }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="agent_name"
                                :class="{ 'invalid-bg': formErrors.agent_name }"
                                v-model="form.agent_name"
                            />
                            <div class="invalid-feedback animated fadeIn" v-if="formErrors.agent_name">
                                {{ formErrors.agent_name[0] }}
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label for="email">{{ translate("Agent Email") }}</label>
                            <input
                                type="email"
                                class="form-control"
                                id="email"
                                :class="{ 'invalid-bg': formErrors.email }"
                                v-model="form.email"
                            />
                            <div class="invalid-feedback animated fadeIn" v-if="formErrors.email">
                                {{ formErrors.email[0] }}
                            </div>
                        </div>
                        <!-- Agency Name Input -->
                        <div class="col-12 col-md-6">
                            <label for="agency_name">{{ translate("Agency Name") }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="agency_name"
                                :class="{ 'invalid-bg': formErrors.agency_name }"
                                v-model="form.agency_name"
                            />
                            <div class="invalid-feedback animated fadeIn" v-if="formErrors.agency_name">
                                {{ formErrors.agency_name[0] }}
                            </div>
                        </div>

                        <!-- License Number Input -->
                        <div class="col-12 col-md-6">
                            <label for="license_number">{{ translate("License Number") }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="license_number"
                                :class="{ 'invalid-bg': formErrors.license_number }"
                                v-model="form.license_number"
                            />
                            <div class="invalid-feedback animated fadeIn" v-if="formErrors.license_number">
                                {{ formErrors.license_number[0] }}
                            </div>
                        </div>

                        <!-- Specialties Input -->
                        <div class="col-12">
                            <label for="specialties">{{ translate("Specialties") }}</label>
                            <textarea
                                class="form-control"
                                id="specialties"
                                :class="{ 'invalid-bg': formErrors.specialties }"
                                v-model="form.specialties"
                            ></textarea>
                            <div class="invalid-feedback animated fadeIn" v-if="formErrors.specialties">
                                {{ formErrors.specialties[0] }}
                            </div>
                        </div>

                        <!-- Biography Input -->
                        <div class="col-12">
                            <label for="biography">{{ translate("Biography") }}</label>
                            <textarea
                                class="form-control"
                                id="biography"
                                :class="{ 'invalid-bg': formErrors.biography }"
                                v-model="form.biography"
                            ></textarea>
                            <div class="invalid-feedback animated fadeIn" v-if="formErrors.biography">
                                {{ formErrors.biography[0] }}
                            </div>
                        </div>

                        <!-- Experience Input -->
                        <div class="col-12">
                            <label for="experience">{{ translate("Experience") }}</label>
                            <textarea
                                class="form-control"
                                id="experience"
                                :class="{ 'invalid-bg': formErrors.experience }"
                                v-model="form.experience"
                            ></textarea>
                            <div class="invalid-feedback animated fadeIn" v-if="formErrors.experience">
                                {{ formErrors.experience[0] }}
                            </div>
                        </div>

                        <!-- Languages Input -->
                        <div class="col-12 col-md-6">
                            <label for="languages">{{ translate("Languages") }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="languages"
                                :class="{ 'invalid-bg': formErrors.languages }"
                                v-model="form.languages"
                            />
                            <div class="invalid-feedback animated fadeIn" v-if="formErrors.languages">
                                {{ formErrors.languages[0] }}
                            </div>
                        </div>

                        <!-- Contact Input -->
                        <div class="col-12 col-md-6">
                            <label for="contact">{{ translate("Contact") }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="contact"
                                :class="{ 'invalid-bg': formErrors.contact }"
                                v-model="form.contact"
                            />
                            <div class="invalid-feedback animated fadeIn" v-if="formErrors.contact">
                                {{ formErrors.contact[0] }}
                            </div>
                        </div>

                        <!-- Save Button -->
                        <div class="mt-3">
                            <button type="submit" class="btn btn-success" v-if="formStatus">
                                {{ translate("Save") }}
                            </button>
                            <button class="btn btn-success" type="button" disabled v-else>
                                {{ translate("Save") }}
                                <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </Master>
</template>

<script>
import Master from "@components/backend/layout/Master.vue"; 
import axios from "axios";

export default {
    props: ["agent_id"],
    components: {
        Master, 
    },
    created() {
        if (this.agent_id) {
            this.getAgent();
        }
    },
    data() {
        return {
            form: {
                id: this.agent_id ?? "",
                agent_name: '',
                email: '',
                agency_name: '',
                license_number: '',
                specialties: '',
                biography: '',
                experience: '',
                languages: '',
                contact: ''
            },
            formErrors: [],
            formStatus: true, 
        };
    },
    methods: {
        getAgent() {
            axios
                .get("/api/get/agent/" + this.agent_id)
                .then((response) => {
                    this.form.agent_name = response.data.name;
                    this.form.email = response.data.email;
                    this.form.agency_name = response.data.agency_name;
                    this.form.license_number = response.data.license_number;
                    this.form.specialties = response.data.specialties;
                    this.form.biography = response.data.biography;
                    this.form.experience = response.data.experience;
                    this.form.languages = response.data.languages;
                    this.form.contact = response.data.contact;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },

        submit() {
            this.formStatus = false;
            axios
                .post("/api/agent/store", this.form)
                .then((response) => {
                    this.formStatus = true;
                    toastr.success(this.translate("Agent saved successfully"));
                    this.formErrors = [];
                    setTimeout(() => {
                        window.location.href = "/agents";
                    }, 2000); // Delay of 2000 milliseconds (2 seconds)
                })
                .catch((error) => {
                    this.formStatus = true;
                    toastr.error(error.response.data.message);
                    if (error.response.data.errors) {
                        this.formErrors = error.response.data.errors;
                    }
                });
        },
    },
};
</script>
