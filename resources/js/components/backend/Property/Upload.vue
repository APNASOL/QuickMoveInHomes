<template>
  <Master>
      <div class="d-flex justify-content-between align-items-center">
          <div class="pagetitle">
              <h3 class="mb-0 c-theme-text-color">
                  <span>Properties Scrap File Upload</span>
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
           
      </div>
      <section class="section">
          <div class="card c-card-border">
              <div class="card-body pt-4">
                  <div>
                      <h2>Upload Properties File</h2>
                      <div
                          class="dropzone"
                          @dragover.prevent
                          @drop.prevent="handleDrop"
                          @dragenter="dragging = true"
                          @dragleave="dragging = false"
                          @click="triggerFilePicker"
                          :class="{ 'dropzone-active': dragging }"
                      >
                          <div v-if="file" class="file-info d-flex align-items-center">
                              <i class="bi bi-file-earmark-excel-fill file-icon"></i>
                              <div class="ms-2">
                                  <p class="mb-0">{{ file.name }}</p>
                                  <small>
                                      {{ formatFileSize(file.size) }} | 
                                      {{ getFileExtension(file.name).toUpperCase() }}
                                  </small>
                              </div>
                          </div>
                          <p v-else>Drag & drop your file here or click to select</p>
                          <input
                              type="file"
                              @change="handleFileUpload"
                              accept=".xlsx"
                              class="d-none"
                              ref="fileInput"
                          />
                      </div>
                      <div class="mt-2">
                          <button
                              @click="uploadFile"
                              :disabled="!file || loading"
                              class="btn btn-success justify-content-end d-flex align-items-center"
                          >
                              <span v-if="loading" class="spinner-border spinner-border-sm me-2" role="status" aria-hidden="true"></span>
                              <span v-if="!loading">Upload</span>
                              <span v-else>Uploading...</span>
                          </button>
                      </div>
                  </div>
              </div>
          </div>
      </section>
  </Master>
</template>

<script>
import Master from "@components/backend/layout/Master.vue";
import axios from "axios";

export default {
  components: { Master },
  data() {
      return {
          file: null,
          loading: false,
          dragging: false, // For dropzone visual feedback
      };
  },
  methods: {
      handleFileUpload(event) {
          this.file = event.target.files[0];
      },
      handleDrop(event) {
          const files = event.dataTransfer.files;
          if (files.length) {
              this.file = files[0];
          }
          this.dragging = false;
      },
      triggerFilePicker() {
          this.$refs.fileInput.click();
      },
      uploadFile() {
          if (!this.file) return;

          this.loading = true;
          const formData = new FormData();
          formData.append("file", this.file);

          axios
              .post("/api/properties/upload", formData, {
                  headers: { "Content-Type": "multipart/form-data" },
              })
              .then((response) => {
                  toastr.success("File uploaded successfully!");
                  window.location.href="properties";
                   
              })
              .catch((error) => {
                  toastr.error(
                      error.response?.data?.message ||
                          "An error occurred while uploading."
                  );
              })
              .finally(() => {
                  this.loading = false;
              });
      },
      formatFileSize(size) {
          const kb = 1024;
          const mb = kb * 1024;
          if (size >= mb) return (size / mb).toFixed(2) + ' MB';
          if (size >= kb) return (size / kb).toFixed(2) + ' KB';
          return size + ' B';
      },
      getFileExtension(filename) {
          return filename.split('.').pop();
      },
  },
};
</script>

<style scoped>
h2 {
  font-size: 24px;
  margin-bottom: 10px;
}
button {
  margin-top: 10px;
}
.dropzone {
  border: 2px dashed #ccc;
  padding: 20px;
  text-align: center;
  cursor: pointer;
  transition: background-color 0.3s;
}
.dropzone-active {
  background-color: #f0f8ff;
  border-color: #007bff;
}
.dropzone p {
  margin: 0;
  color: #666;
}
.file-info {
  text-align: left;
}
.file-icon {
  font-size: 32px;
  color: #28a745;
}
.spinner-border {
  width: 1rem;
  height: 1rem;
}
</style>
