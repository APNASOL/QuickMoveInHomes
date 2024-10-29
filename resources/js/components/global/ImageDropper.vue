<template>
    <div class="dropper-main">
        <div
            class=" dropzone-container"
            @dragover="dragover"
            @dragleave="dragleave"
            @drop="drop"
        >
            <div v-if="DropperType == 'multiple'" class="row">
                <div class="col-md-3">
                    <input
                        multiple
                        type="file"
                        @input="images = $event.target.files" 
                        class="hidden-input"
                        @change="onChange"
                        ref="file"
                        :accept="acceptFileTypes"
                    />
                </div>
            </div>

            <div v-if="DropperType == 'single'">
                <input
                    type="file"
                    @input="images = $event.target.files[0]" 
                    class="hidden-input"
                    @change="onChange"
                    ref="file"
                    :accept="acceptFileTypes"
                />
            </div>
            
            <!-- <div v-if="imagePosterDropperType == 'poster'">
                <input
                    type="file"
                    @input="images = $event.target.files[0]"
                    
                    class="hidden-input"
                    @change="posterChange"
                    ref="file"
                    accept=".jpg,.jpeg,.png"
                />
            </div>

            <div v-if="imageScreenShotDropperType == 'screenshot'">
                <input
                    type="file"
                    @input="images = $event.target.files[0]"
                    
                    class="hidden-input"
                    @change="screenShotChange"
                    ref="file"
                    accept=".jpg,.jpeg,.png"
                />
            </div> -->

            <!-- <input
                type="file" 
                name="file"
                
                class="hidden-input"
                @change="onChange"
                ref="file"
                accept=".pdf,.jpg,.jpeg,.png"
            /> -->
             

            <label :for="'fileInput-' + randId" class="file-label">
                <div v-if="isDragging">
                    {{ translate("Release to drop files here.") }}
                </div>
                <div v-else @click="clickInput">
                    {{ translate("Drop files here or") }}
                    <u>{{ translate("click here") }}</u>
                    {{ translate("to upload.") }}
                </div>
            </label>

            <!-- Note: Only add the code block below -->
            <div class="preview-container mt-4 table-responsive" v-if="files.length">
                <div
                    v-for="file in files"
                    :key="file.name"
                    class="preview-card"
                >
                    <div>
                        <img class="preview-img" :src="generateURL(file)" />
                        <p>
                            {{ file.name }} -
                            {{ Math.round(file.size / 1000) + "kb" }}
                        </p>
                    </div>
                    <div>
                        <button
                            class="btn btn-sm btn-success"
                            type="button"
                            @click="remove(files.indexOf(file))"
                            :title="translate('Remove file')"
                        >
                            <b>×</b>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    props: [
        "DropperType",
        "fileTypes",
    ],
    emits: [
        "emitMethod",
    ],
    data() {
        return {
            isDragging: false,
            files: [],  
            images: [],  
            randId : Math.random()*100, 
            acceptFileTypes: this.fileTypes,        
        };
    },
    methods: {
        onChange() {  
            this.files = [...this.$refs.file.files];

            if (this.DropperType == 'multiple') {
                this.$emit("emitMethod", this.files);
            } else {
                this.$emit("emitMethod", this.files[0]);
            }
        },
        dragover(e) { 
            e.preventDefault();
            this.isDragging = true;
        },
        dragleave() { 
            this.isDragging = false;
        },
        drop(e) { 
            e.preventDefault();
            this.$refs.file.files = e.dataTransfer.files;
            this.onChange();
            this.isDragging = false;
        },
        generateURL(file) {
            let fileSrc = URL.createObjectURL(file);
            setTimeout(() => {
                URL.revokeObjectURL(fileSrc);
            }, 1000);
            return fileSrc;
        },
        remove(i) {
            this.files.splice(i, 1);
            if (this.DropperType == 'multiple') {
                this.$emit("emitMethod", this.files);
            } else {
                this.$emit("emitMethod", "");
            }
        },
        clickInput(){
            this.$refs.file.click();
        }
    },
};
</script>
<style>
.dropper-main {
    display: flex;
    flex-grow: 1;
    align-items: center;
    /* height: 100vh; */
    justify-content: center;
    text-align: center;
}

.dropzone-container {
    width: 100%;
    padding: 2rem;
    background: #f7fafc;
    border: 1px dashed #8B2D88;
}

.hidden-input {
    display: none;
    /* opacity: 0;
    overflow: hidden;
    position: absolute;
    width: 1px;
    height: 1px; */
}

.file-label {
    font-size: 20px;
    display: block;
    cursor: pointer;
}

.preview-container {
    display: flex;
    margin-top: 2rem;
}

.preview-card {
    display: flex;
    border: 1px solid #a2a2a2;
    padding: 5px;
    margin-left: 5px;
}

.preview-img {
    width: 50px;
    height: 50px;
    border-radius: 5px;
    border: 1px solid #a2a2a2;
    background-color: #a2a2a2;
}
</style>
