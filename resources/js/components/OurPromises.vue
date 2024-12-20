<template>
    <div class="c-bg-color container-fluid">
        <div class="py-5">
            <p class="h1 text-center">Why Choose QMI?</p>
            <div class="row g-4 mt-2 justify-content-center">
                <div
                    v-for="(promise, index) in Promises"
                    :key="promise"
                    class="col-12 col-sm-6 col-md-4 col-lg-3"
                >
                    <div class="card card-body c-border-promis-design h-100">
                        <div
                            class="d-flex justify-content-between c-h-fix text-dark"
                        >
                            <h5>
                                {{ promise.title }}
                            </h5>
                            <img
                                :src="promise.icon"
                                @error="setAltImg"
                                height="40"
                            />
                        </div>
                        <p class="text-dark">
                            {{ promise.description }}
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    created() {
        this.fetchPromises();
    },
    data() {
        return {
            Promises: "",
            hoverIndex: null,
        };
    },
    methods: {
        fetchPromises() {
            axios
                .get("/api/get-promises")
                .then((response) => {
                    this.Promises = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        setAltImg(event) {
            event.target.src = "/images/default.jpg";
        },
    },
};
</script>
<style scoped>
.c-overflow-hidden {
    overflow: hidden !important;
}
.c-destination-cards {
    border-radius: 0.25rem;
    filter: brightness(60%);
    transition: transform 0.5s ease;
}

.c-destination-cards.hovered {
    transform: scale(1.3);
}
.icon-box {
    position: relative;
}

.icon-box .icon {
    position: absolute;
    top: 0;
    right: 0;
}
.c-border-promis-design {
    border-radius: 0.25rem;
}
.c-h-fix {
    min-height: 50px;
}
</style>
