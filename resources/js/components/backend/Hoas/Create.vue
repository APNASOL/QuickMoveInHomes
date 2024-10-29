<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h3 class="mb-0 c-theme-text-color">
                    <span v-if="hoa_id">{{
                        translate("Edit HOA")
                    }}</span>
                    <span v-else>{{ translate("Create HOA") }}</span>
                </h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item" aria-current="page">
                            <span>{{ translate("HOAs") }}</span>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span v-if="hoa_id">{{
                                translate("Update")
                            }}</span>
                            <span v-else>{{ translate("Create") }}</span>
                        </li>
                    </ol>
                </nav>
            </div>

            <div class="mb-3 d-flex justify-content-end">
                <a
                    class="btn btn-success justify-content-end"
                    href="/hoas"
                >
                    <i class="bi bi-list"></i> {{ translate("HOAs") }}</a
                >
            </div>
        </div>

        <div class="card c-card-border">
            <div class="card-body pt-4">
                <form @submit.prevent="submit">
                    <div class="row g-3">

                        <div class="col-12 col-md-6">
                            <label>{{ translate("Master plan") }}</label>
                            <br />
                            <div class="d-inline-block me-2">
                                {{ translate("OFF") }}
                            </div>
                            <div class="form-check form-switch d-inline-block">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    :class="{ 'invalid-bg': formErrors.master_plan }"
                                    v-model="form.master_plan"
                                    checked
                                />
                                <label class="form-check-label">{{
                                    translate("ON")
                                }}</label>
                            </div>

                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.master_plan"
                            >
                                {{ formErrors.master_plan[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label>{{ translate("Sub association") }}</label>
                            <br />
                            <div class="d-inline-block me-2">
                                {{ translate("OFF") }}
                            </div>
                            <div class="form-check form-switch d-inline-block">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    :class="{ 'invalid-bg': formErrors.sub_association }"
                                    v-model="form.sub_association"
                                    checked
                                />
                                <label class="form-check-label">{{
                                    translate("ON")
                                }}</label>
                            </div>

                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.sub_association"
                            >
                                {{ formErrors.sub_association[0] }}
                            </div>
                        </div>


                        <!-- Name Input -->
                        <div class="col-12 col-md-6 col-md-6">
                            <label for="name">{{ translate("Name") }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="name"
                                :class="{ 'invalid-bg': formErrors.name }"
                                v-model="form.name"
                            />
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.name"
                            >
                                {{ formErrors.name[0] }}
                            </div>
                        </div>

                        <!-- Fee Input -->
                        <div class="col-12 col-md-6">
                            <label for="fee">{{ translate("Fee") }}</label>
                            <input
                                type="number"
                                class="form-control"
                                id="fee"
                                :class="{ 'invalid-bg': formErrors.fee }"
                                v-model="form.fee"
                            />
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.fee"
                            >
                                {{ formErrors.fee[0] }}
                            </div>
                        </div>

                        <!-- Frequency Input -->
                        <div class="col-12 col-md-6">
                            <label for="frequency">{{
                                translate("Frequency")
                            }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="frequency"
                                :class="{ 'invalid-bg': formErrors.frequency }"
                                v-model="form.frequency"
                            />
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.frequency"
                            >
                                {{ formErrors.frequency[0] }}
                            </div>
                        </div>
 

                        

                        <!-- Save Button -->
                        <div class="mt-3">
                            <button
                                type="submit"
                                class="btn btn-success"
                                v-if="formStatus"
                            >
                                {{ translate("Save") }}
                            </button>
                            <button
                                class="btn btn-success"
                                type="button"
                                disabled
                                v-else
                            >
                                {{ translate("Save") }}
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
    </Master>
</template>

<script>
import Master from "@components/backend/layout/Master.vue"; 
import axios from "axios";

export default {
    props: ["hoa_id"],
    components: {
        Master, 
    },
    created() {
        if (this.hoa_id) {
            this.getHoa();
        }
    },
    data() {
        return {
            form: {
                id: this.hoa_id ?? "",
            name: '',
            fee: '',
            frequency: '',
            master_plan: '',
            sub_association: ''
        },
            
            formErrors: [],
            formStatus: true, 
        };
    },
    methods: {
        getHoa() {
            axios
                .get("/api/get/hoa/" + this.hoa_id)
                .then((response) => {
                    this.form.name = response.data.name;
                    this.form.fee = response.data.fee;
                    this.form.frequency = response.data.frequency;
                    this.form.master_plan = response.data.master_plan;
                    this.form.sub_association = response.data.sub_association;
                     
                   
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },

         

        submit() {
            this.formStatus = false;
            axios
                .post("/api/hoa/store", this.form)
                .then((response) => {
                    this.formStatus = true;
                    toastr.success(
                        this.translate("Hoa saved successfully")
                    );
                    this.formErrors = [];
                    setTimeout(() => {
                        window.location.href = "/hoas";
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
