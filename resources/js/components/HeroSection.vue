<template>
    <div>
        <!-- Hero Section -->
        <div class="hero-section position-relative text-white d-flex align-items-center justify-content-center text-center">
            <!-- Background Image -->
            <img
                src="https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?ixlib=rb-4.0.3&auto=format&fit=crop&w=2070&q=80"
                alt="Background"
                class="hero-image"
            />

            <!-- Overlay Text and Search Box -->
            <div class="overlay"></div>
            <div class="content position-absolute text-center">
                <h1 class="display-3 fw-bold mb-3">Brand New Homes in Las Vegas</h1>
                <h3 class="mb-4 sub-contents">Discover move-in ready new construction homes across Las Vegas Valley</h3>
                <div class="search-bar-container d-flex justify-content-center">
                    <div class="search-bar input-group">
                        <input
                            type="text"
                            class="form-control"
                            placeholder="Enter an address, city, or ZIP code"
                            v-model="searching_location"
                        />
                        <a
                            v-if="formStatus"
                            :href="'/homes-list/' + searching_location"
                            type="submit"
                            class="btn c-btn-theme-primary"
                            @click="activeSpinner"
                        >
                            <i class="bi bi-search"></i>
                        </a>
                        <a class="btn c-btn-theme-primary" type="button" disabled v-else>
                            <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                        </a>
                    </div>
                    <div class="bg-white ms-2" style="border-radius: 0.25rem">
                        <a class="searchHome" href="/search/homes" id="navbarDropdownDeals" role="button">
                            <img src="/images/map-icon.png" height="50" />
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: "HeroSection",
    data() {
        return {
            searching_location: "",
            formStatus: true,
        };
    },
    methods: {
        activeSpinner() {
            this.formStatus = false;
            setTimeout(() => {
                this.formStatus = true;
            }, 2000);
        },
    },
};
</script>

<style scoped>
.c-btn-theme-primary {
    border-radius: 0rem 0.25rem 0.25rem 0rem !important;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 0;
    height: 50px;
    width: 80px;
}

.hero-section {
    height: 50vh;
    position: relative;
    overflow: hidden;
    display: flex;
    align-items: center;
    justify-content: center;
}

.hero-image {
    width: 100%;
    height: 100%;
    object-fit: cover;
    position: absolute;
    top: 0;
    left: 0;
    z-index: 1;
}

.overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.4);
    z-index: 2;
    
}

.content {
    font-family: "Playfair Display", serif;
font-size: 60px;
font-weight: 700;
line-height: 60px;
color: rgb(255, 255, 255);
    
    z-index: 3;
    width: 100%;
   
    
}
.sub-contents
{
    font-family: Inter, sans-serif;
font-size: 24px;
font-weight: 400;
line-height: 32px;
color: rgb(255, 255, 255);
}

.search-bar-container {
    margin-top: 1rem;
    display: flex;
    justify-content: center;
    align-items: center;
}

.search-bar {
    width: 100%;
    max-width: 400px;
    border-radius: 0.25rem;
}

.search-bar input {
    border: none;
    font-size: 1rem;
    height: 50px;
    border-top-left-radius: 0.25rem;
    border-bottom-left-radius: 0.25rem;
}

.search-bar button {
    border: none;
    border-top-right-radius: 0.25rem;
    border-bottom-right-radius: 0.25rem;
    background-color: #fff;
    height: 50px;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: background-color 0.3s;
}

.search-bar button:hover {
    background-color: #f0f0f0;
}

@media (max-width: 768px) {
    .hero-section {
        height: 50vh;
    }

    .content {
        max-width: 90%;
    }

    .search-bar input {
        height: 50px;
        font-size: 0.9rem;
    }

    .search-bar button {
        width: 60px;
    }
}

@media (max-width: 576px) {
    .hero-section {
        height: 45vh;
    }

    .display-4 {
        font-size: 1.75rem;
    }

    .search-bar input {
        height: 50px;
        font-size: 0.85rem;
    }

    .search-bar button {
        width: 50px;
    }
}

.searchHome {
    overflow: hidden;
}

.searchHome img {
    transition: transform 0.3s ease;
}

.searchHome:hover img {
    transform: scale(1.2);
}
</style>