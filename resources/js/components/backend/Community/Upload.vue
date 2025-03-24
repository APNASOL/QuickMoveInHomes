<template>
    <Master>
      <div class="d-flex justify-content-between align-items-center">
        <div class="pagetitle">
          <h3 class="mb-0 c-theme-text-color">
            <span>Communities Scrap File Upload</span>
          </h3>
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item c-theme-text-color">
                <a class="c-theme-text-color" href="#">Community</a>
              </li>
              <li class="breadcrumb-item active" aria-current="page">
                <span>Communities</span>
              </li>
            </ol>
          </nav>
        </div>
      </div>
      <section class="section">
        <div class="card c-card-border">
          <div class="card-body pt-4">
            <div>
              <h2>Upload Communities File</h2>
              <div class="mb-3">
                <label for="excelFile" class="form-label">Upload Excel File</label>
                <div
                  class="dropzone"
                  @dragover.prevent
                  @drop.prevent="handleExcelDrop"
                  @dragenter="excelDragging = true"
                  @dragleave="excelDragging = false"
                  @click="triggerExcelPicker"
                  :class="{ 'dropzone-active': excelDragging }"
                >
                  <div v-if="excelFile" class="file-info d-flex align-items-center">
                    <i class="bi bi-file-earmark-excel-fill file-icon"></i>
                    <div class="ms-2">
                      <p class="mb-0">{{ excelFile.name }}</p>
                      <small>
                        {{ formatFileSize(excelFile.size) }} |
                        {{ getFileExtension(excelFile.name).toUpperCase() }}
                      </small>
                    </div>
                  </div>
                  <p v-else>Drag & drop your Excel file here or click to select</p>
                  <input
                    type="file"
                    @change="handleExcelUpload"
                    accept=".xlsx"
                    class="d-none"
                    ref="excelInput"
                  />
                </div>
              </div>
  
              <div class="mb-3">
                <label for="imageZip" class="form-label">Upload Images ZIP</label>
                <div
                  class="dropzone"
                  @dragover.prevent
                  @drop.prevent="handleZipDrop"
                  @dragenter="zipDragging = true"
                  @dragleave="zipDragging = false"
                  @click="triggerZipPicker"
                  :class="{ 'dropzone-active': zipDragging }"
                >
                  <div v-if="imageZip" class="file-info d-flex align-items-center">
                    <i class="bi bi-file-earmark-zip-fill file-icon"></i>
                    <div class="ms-2">
                      <p class="mb-0">{{ imageZip.name }}</p>
                      <small>
                        {{ formatFileSize(imageZip.size) }} |
                        {{ getFileExtension(imageZip.name).toUpperCase() }}
                      </small>
                    </div>
                  </div>
                  <p v-else>Drag & drop your ZIP file here or click to select</p>
                  <input
                    type="file"
                    @change="handleZipUpload"
                    accept=".zip"
                    class="d-none"
                    ref="zipInput"
                  />
                </div>
              </div>
  
              <div class="mt-3">
                <button
                  @click="uploadFiles"
                  :disabled="!excelFile || !imageZip || loading"
                  class="btn btn-success d-flex align-items-center"
                >
                  <span
                    v-if="loading"
                    class="spinner-border spinner-border-sm me-2"
                    role="status"
                    aria-hidden="true"
                  ></span>
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
        excelFile: null,
        imageZip: null,
        loading: false,
        excelDragging: false, // For Excel dropzone feedback
        zipDragging: false, // For ZIP dropzone feedback
      };
    },
    methods: {
      handleExcelUpload(event) {
        this.excelFile = event.target.files[0];
      },
      handleZipUpload(event) {
        this.imageZip = event.target.files[0];
      },
      handleExcelDrop(event) {
        const files = event.dataTransfer.files;
        if (files.length) {
          this.excelFile = files[0];
        }
        this.excelDragging = false;
      },
      handleZipDrop(event) {
        const files = event.dataTransfer.files;
        if (files.length) {
          this.imageZip = files[0];
        }
        this.zipDragging = false;
      },
      triggerExcelPicker() {
        this.$refs.excelInput.click();
      },
      triggerZipPicker() {
        this.$refs.zipInput.click();
      },
      uploadFiles() {
        if (!this.excelFile || !this.imageZip) return;
  
        this.loading = true;
        const formData = new FormData();
        formData.append("file", this.excelFile);
        formData.append("images", this.imageZip);
       
        axios
          .post("/api/communities/scrap/data/upload", formData)
          .then(() => {
            toastr.success("Files uploaded successfully!");
            window.location.href = "/communities";
          })
          .catch((error) => {
            toastr.error(
              error.response?.data?.message || "An error occurred while uploading."
            );
          })
          .finally(() => {
            this.loading = false;
          });
      },
      formatFileSize(size) {
        const kb = 1024;
        const mb = kb * 1024;
        if (size >= mb) return (size / mb).toFixed(2) + " MB";
        if (size >= kb) return (size / kb).toFixed(2) + " KB";
        return size + " B";
      },
      getFileExtension(filename) {
        return filename.split(".").pop();
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
  