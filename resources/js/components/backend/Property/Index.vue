<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h3 class="mb-0 c-theme-text-color">
                    <span>Properties</span>
                </h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item c-theme-text-color">
                            <a class="c-theme-text-color" href="#">Property</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span>Properties</span>
                        </li>
                    </ol>
                </nav>
            </div>
            <div>
                <a
                    class="btn btn-success"
                    title="Details"
                    :href="'/property/create'"
                >
                    <i class="bi bi-plus-lg"></i>
                    {{ translate("Add new property") }}
                </a>
            </div>
        </div>

        <section class="section">
  <div class="card shadow-lg border-0 rounded-4">
    <div class="card-body pt-4 bg-light">
      
      <!-- Search Input -->
      <div class="row g-3 p-3">
        <div class="input-group">
          <div class="form-outline col-md-5">
            <input
              type="text"
              v-model="form.name"
              class="form-control rounded-pill shadow-sm"
              property_id="name"
              :placeholder="translate('Search by name')"
              :class="{ 'is-invalid': formErrors.name }"
            />
            <div
              class="invalid-feedback animated fadeIn"
              v-if="formErrors.name"
            >
              {{ formErrors.name[0] }}
            </div>
          </div>

          <button
            v-if="formStatus == 1"
            @click="search(null)"
            class="btn btn-primary ms-2 rounded-pill shadow-sm"
          >
            <i class="bi bi-search"></i>
          </button>

          <button
            v-else
            class="btn btn-primary ms-2 rounded-pill shadow-sm"
            type="button"
          >
            <span
              class="spinner-border spinner-border-sm"
              role="status"
              aria-hidden="true"
            ></span>
          </button>
        </div>
      </div>

      <!-- Properties Table -->
      <div class="table-responsive mt-4 rounded-4 shadow-sm">
        <table class="table table-hover align-middle bg-white">
          <thead class="table-primary text-dark">
            <tr>
              <th class="text-center">#</th>
              <th>{{ translate("Name") }}</th>
              <th>{{ translate("Property In Community") }}</th>
              <th>{{ translate("Address") }}</th>
              <th>{{ translate("Image") }}</th>
              <th>{{ translate("Banner") }}</th>
              <th>{{ translate("Action") }}</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(property, index) in properties" :key="property.property_id">
              <th class="text-center">{{ index + 1 }}</th>
              
              <!-- Title -->
              <td>
                <a
                  class="text-decoration-none text-primary fw-semibold"
                  title="Details"
                  :href="'/property/details/' + property.property_id"
                >
                  {{ property.title }}
                </a>
              </td>

              <!-- Community -->
              <td v-if="property.community?.id">
                <a
                  class="text-decoration-none text-success fw-semibold"
                  title="Details"
                  :href="'/community/details/' + property.community.id"
                >
                  {{ property.community.name }}
                </a>
              </td>
              <td v-else>
                <span class="text-muted">{{ translate("No community added") }}</span>
              </td>
              <td>
                {{ property.address || translate("No address provided") }}
              </td>
              <!-- Images -->
              <td>
                <image-zooming-component
                  :file="property.main_image ?? 'empty.png'"
                  :width="70"
                />
              </td>
              <td>
                <image-zooming-component
                  :file="property.banner ?? 'empty.png'"
                  :width="70"
                />
              </td>

              <!-- Actions -->
              <td>
                <div class="btn-group">
                  <a
                    class="btn btn-sm  "
                    title="Edit"
                    :href="'/property/edit/' + property.property_id"
                  >
                    <i class="bi bi-pencil"></i>
                  </a>
                  <DeleteModal
                    :deleteId="property.property_id"
                    @deleteThis="deleteThis"
                  />
                </div>
              </td>
            </tr>

            <tr v-if="properties.length === 0">
              <td colspan="6" class="text-center text-muted py-4">
                {{ translate("No properties found.") }}
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <!-- Load More Button -->
      <div class="text-center mt-4">
        <button
          v-if="pagination.next_page_url"
          @click="search(pagination.next_page_url)"
          class="btn btn-primary rounded-pill shadow-sm"
        >
          {{ translate("Load More") }}
        </button>
      </div>

    </div>
  </div>
</section>

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
            default_url: "/api/fetch/properties",
            properties: [],
            form: {
                name: "",
            },
            formErrors: [],
            firstTimeLoadCheck: 0,
            formStatus: 1,
            pagination: {},
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
            this.formStatus = 0;
            if (!page_url) {
                this.firstTimeLoadCheck = 1;
            }
            page_url = page_url || this.default_url;

            let formData = new FormData();
            formData.append("name", this.form.name || "");

            axios
                .post(page_url, formData)
                .then((response) => {
                    if (this.firstTimeLoadCheck === 1) {
                        this.properties = response.data.data;
                        this.firstTimeLoadCheck = 0;
                    } else {
                        this.properties = this.properties.concat(
                            response.data.data
                        );
                    }
                    this.formStatus = 1;
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
        deleteThis(property_id) {
            axios
                .post("/api/property/delete/" + property_id)
                .then((response) => {
                    toastr.success(
                        this.translate("Property deleted successfully.")
                    );
                    setTimeout(() => {
                        this.search(null);
                        // window.location.href = "/properties";
                    }, 1000);
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
    text-decoration: none;
}
.c-mouse-over {
    cursor: pointer;
    font-weight: bold;
}
.c-searchbox-radius {
    border-radius: 0 !important;
}
</style>
