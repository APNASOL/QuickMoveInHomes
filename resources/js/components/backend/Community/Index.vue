<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h3 class="mb-0 c-theme-text-color">
                    <span>Communities</span>
                </h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item c-theme-text-color">
                            <a class="c-theme-text-color" href="#">Home</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span>Communities</span>
                        </li>
                    </ol>
                </nav>
            </div>
            <div>
                <a
                    class="btn btn-success"
                    title="Details"
                    :href="'/community/create'"
                >
                    <i class="bi bi-plus-lg"></i>
                    {{ translate("Add new community") }}
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
              id="name"
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

      <!-- Communities Table -->
      <div class="table-responsive mt-4 rounded-4 shadow-sm">
        <table class="table table-hover align-middle bg-white">
          <thead class="table-primary text-dark">
            <tr>
              <th class="text-center">#</th>
              <th>{{ translate("Name") }} <br />{{ translate("Id") }}</th>
              <th>{{ translate("Location") }}</th>
              <th>{{ translate("Image") }}</th>
              <th>{{ translate("Banner") }}</th>
              <th>{{ translate("Action") }}</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(community, index) in communities" :key="community.id">
              <th class="text-center">{{ index + 1 }}</th>
              
              <!-- Name and ID -->
              <td>
                <a
                  class="text-decoration-none text-primary fw-semibold"
                  title="Detail"
                  :href="'/community/details/' + community.id"
                >
                  {{ community.name }} <br />
                </a>
                <br />
                <span
                  class="c-linked"
                  @click="copyToClipboard(community.id)"
                  title="Copy"
                  style="cursor: pointer; color: blue;"
                >
                  {{ community.id }}
                </span>
              </td>

              <!-- Location -->
              <td>{{ community.location }}</td>

              <!-- Images -->
              <td>
                <image-zooming-component
                  :file="community.main_image ?? 'empty.png'"
                  :width="70"
                />
              </td>
              <td>
                <image-zooming-component
                  :file="community.banner ?? 'empty.png'"
                  :width="70"
                />
              </td>

              <!-- Actions -->
              <td>
                <div class="btn-group">
                  <a
                    class="btn btn-sm fs-6"
                    title="Edit"
                    :href="'/community/edit/' + community.id"
                  >
                    <i class="bi bi-pencil text-primary"></i>
                  </a>
                  <DeleteModal
                    :deleteId="community.id"
                    @deleteThis="deleteThis"
                  />
                </div>
              </td>
            </tr>

            <!-- No Communities Found -->
            <tr v-if="communities.length === 0">
              <td colspan="6" class="text-center text-muted py-4">
                {{ translate("No communities found.") }}
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
            default_url: "/api/fetch-communities",
            communities: [],
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
        copyToClipboard(id) {
            navigator.clipboard
                .writeText(id)
                .then(() => {
                    toastr.success(this.translate("Copied to clipboard."));
                })
                .catch((err) => {
                    console.error("Failed to copy text: ", err);
                });
        },
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
                        this.communities = response.data.data;
                        this.firstTimeLoadCheck = 0;
                    } else {
                        this.communities = this.communities.concat(
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
        deleteThis(id) {
            axios
                .post("/api/community/delete/" + id)
                .then((response) => {
                    toastr.success(
                        this.translate("Community deleted successfully.")
                    );
                    setTimeout(() => {
                        window.location.href = "/communities";
                    }, 2000);
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
    font-size: 18px;
}
</style>
