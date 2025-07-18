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
            <div class="card shadow-lg border-0 rounded-4">
                <div class="card-body pt-4 bg-light">
                    <!-- Section Title -->
                    <div class="mb-4 text-center">
                        <h2 class="fw-bold text-primary">
                            Upload Properties File
                        </h2>
                    </div>

                    <!-- Upload Excel File -->
                    <div class="mb-4">
                        <label for="excelFile" class="form-label fw-semibold"
                            >Upload Excel File</label
                        >
                        <div
                            class="dropzone rounded-4 border border-primary border-dashed p-4 text-center bg-white position-relative"
                            @dragover.prevent
                            @drop.prevent="handleExcelDrop"
                            @dragenter="excelDragging = true"
                            @dragleave="excelDragging = false"
                            @click="triggerExcelPicker"
                            :class="{ 'bg-light': excelDragging }"
                        >
                            <div
                                v-if="excelFile"
                                class="d-flex align-items-center justify-content-center"
                            >
                                <i
                                    class="bi bi-file-earmark-excel-fill fs-1 text-success"
                                ></i>
                                <div class="ms-3">
                                    <p class="mb-0 fw-semibold">
                                        {{ excelFile.name }}
                                    </p>
                                    <small class="text-muted">
                                        {{ formatFileSize(excelFile.size) }} |
                                        {{
                                            getFileExtension(
                                                excelFile.name
                                            ).toUpperCase()
                                        }}
                                    </small>
                                </div>
                            </div>
                            <p v-else class="text-muted mb-0">
                                Drag & drop your
                                <strong>Excel file</strong> here or click to
                                select
                            </p>
                            <input
                                type="file"
                                @change="handleExcelUpload"
                                accept=".xlsx"
                                class="d-none"
                                ref="excelInput"
                            />
                        </div>
                    </div>

                    <!-- Upload Images ZIP -->
                    <div class="mb-4">
                        <label for="imageZip" class="form-label fw-semibold"
                            >Upload Images ZIP</label
                        >
                        <div
                            class="dropzone rounded-4 border border-warning border-dashed p-4 text-center bg-white position-relative"
                            @dragover.prevent
                            @drop.prevent="handleZipDrop"
                            @dragenter="zipDragging = true"
                            @dragleave="zipDragging = false"
                            @click="triggerZipPicker"
                            :class="{ 'bg-light': zipDragging }"
                        >
                            <div
                                v-if="imageZip"
                                class="d-flex align-items-center justify-content-center"
                            >
                                <i
                                    class="bi bi-file-earmark-zip-fill fs-1 text-warning"
                                ></i>
                                <div class="ms-3">
                                    <p class="mb-0 fw-semibold">
                                        {{ imageZip.name }}
                                    </p>
                                    <small class="text-muted">
                                        {{ formatFileSize(imageZip.size) }} |
                                        {{
                                            getFileExtension(
                                                imageZip.name
                                            ).toUpperCase()
                                        }}
                                    </small>
                                </div>
                            </div>
                            <p v-else class="text-muted mb-0">
                                Drag & drop your <strong>ZIP file</strong> here
                                or click to select
                            </p>
                            <input
                                type="file"
                                @change="handleZipUpload"
                                accept=".zip"
                                class="d-none"
                                ref="zipInput"
                            />
                        </div>
                    </div>
                    <div v-if="processingStatus" class="mt-3">
                        <div class="progress">
                            <div
                                 class="progress-bar progress-bar-striped progress-bar-animated bg-success"
                                role="progressbar"
                                :style="{ width: processingPercentage + '%' }"
                                :aria-valuenow="processingPercentage"
                                aria-valuemin="0"
                                aria-valuemax="100"
                            >
                                Processing: {{ processingPercentage }}%
                            </div>
                        </div>
                        <p class="text-muted small mt-2">
                            <span v-if="processingPercentage <= 10"
                                >Initializing upload...</span
                            >
                            <span v-else-if="processingPercentage <= 40"
                                >Extracting ZIP...</span
                            >
                            <span v-else-if="processingPercentage <= 70"
                                >Importing Excel...</span
                            >
                            <span v-else-if="processingPercentage <= 80"
                                >Cleaning up files...</span
                            >
                            <span v-else-if="processingPercentage <= 90"
                                >Finalizing...</span
                            >
                            <span v-else>Completed!</span>
                        </p>
                    </div>

                    <!-- Upload Button -->
                    <div class="text-center mt-4">
                        <button
                            @click="uploadFiles"
                            :disabled="!excelFile || !imageZip || loading"
                            class="btn btn-primary rounded-pill px-5 py-2 shadow-sm d-inline-flex align-items-center justify-content-center"
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
            uploadPercentage: 0,
            jobId: null,
            processingPercentage: 0,
            processingStatus: false,
            pollingInterval: null,
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
            this.uploadPercentage = 0;
            this.jobId = Date.now().toString();

            // Start polling immediately
            this.startPollingProgress();

            const formData = new FormData();
            formData.append("file", this.excelFile);
            formData.append("images", this.imageZip);
            formData.append("job_id", this.jobId);

            axios
                .post("/api/scrap/data/upload", formData, {
                    headers: { "Content-Type": "multipart/form-data" },
                    onUploadProgress: (progressEvent) => {
                        if (progressEvent.lengthComputable) {
                            this.uploadPercentage = Math.round(
                                (progressEvent.loaded / progressEvent.total) *
                                    100
                            );
                        }
                    },
                })
                .then(() => {
                    toastr.success("Uploaded Successfully!"); 
                })
                .catch((error) => {
                    this.loading = false;
                    this.processingStatus = false;
                    toastr.error(
                        error.response?.data?.message || "Upload failed."
                    );
                });
        },

        startPollingProgress() {
            this.processingStatus = true;
            this.processingPercentage = 1;

            this.pollingInterval = setInterval(() => {
                axios
                    .get(`/api/scrap/data/status/${this.jobId}`)
                    .then((res) => {
                        const progress = res.data.progress;
                        if (progress >= 0) {
                            this.processingPercentage = progress;
                        }

                        if (progress === 100) {
                            clearInterval(this.pollingInterval);
                            this.processingStatus = false;
                            this.loading = false;

                            setTimeout(() => {
                                window.location.href = "/properties";
                            }, 1000);
                        } else if (progress === -1) {
                            clearInterval(this.pollingInterval);
                            this.processingStatus = false;
                            this.loading = false;
                            toastr.error("Processing failed.");
                        }
                    });
            }, 500);
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
