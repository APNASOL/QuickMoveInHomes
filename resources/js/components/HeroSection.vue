<template>
    <div>
        <!-- Hero Section -->
        <div class="hero-section position-relative text-white">
            <!-- Background Image -->
            <img
                src="https://images.unsplash.com/photo-1519227355453-8f982e425321?q=80&w=1931&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                alt="Background"
                class="hero-image"
            />

            <!-- Overlay Text and Search Box -->
            <div class="overlay"></div>
            <div
                class="content position-absolute top-50 start-0 translate-middle-y ms-4"
            >
                <h1 class="display-3 fw-bold mb-4">Brand New Homes Vegas</h1>
                <div class="search-bar-container d-flex">
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
                        <a
                            class="btn c-btn-theme-primary"
                            type="button"
                            disabled
                            v-else
                        >
                            <span
                                class="spinner-border spinner-border-sm"
                                role="status"
                                aria-hidden="true"
                            ></span>
                        </a>
                    </div>
                    <div class="bg-white ms-2" style="border-radius: 0.25rem">
                        <a
                            class="searchHome"
                            href="/search/homes"
                            id="navbarDropdownDeals"
                            role="button"
                        >
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
            this.formStatus = false; // Set to false initially
            setTimeout(() => {
                this.formStatus = true; // Change to true after 2 seconds
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
    padding: 0; /* Remove extra padding */
    height: 50px; /* Match height of the input field */
    width: 80px; /* Set a fixed width for the button */
}

/* Hero Section Styling */
.hero-section {
    height: 50vh;
    position: relative;
    overflow: hidden;
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
    font-family: "Object Sans", "Adjusted Arial", Tahoma, Geneva, sans-serif;
    z-index: 3;
    width: 100%;
    max-width: 500px;
}

.search-bar-container {
    margin-top: 1rem;
}

.search-bar {
    width: 100%;

    border-radius: 0.25rem;
}

.search-bar input {
    border: none;

    font-size: 1rem;
    height: 50px; /* Set height for desktop screens */
    border-top-left-radius: 0.25rem;
    border-bottom-left-radius: 0.25rem;
}

.search-bar button {
    border: none;
    border-top-right-radius: 0.25rem; /* Ensure rounded corners */
    border-bottom-right-radius: 0.25rem; /* Ensure rounded corners */
    background-color: #fff;
    height: 50px; /* Match height of the input field */
    display: flex; /* Use flexbox to center content */
    align-items: center; /* Center content vertically */
    justify-content: center; /* Center content horizontally */
    transition: background-color 0.3s; /* Add a smooth transition for hover effect */
}

/* Add hover effect */
.search-bar button:hover {
    background-color: #f0f0f0; /* Change background on hover */
}

/* Responsive Styling */
@media (max-width: 768px) {
    .hero-section {
        height: 50vh;
    }

    .content {
        max-width: 90%;
    }

    .search-bar input {
        height: 50px; /* Adjust height for tablets */

        font-size: 0.9rem;
    }

    .search-bar button {
        width: 60px; /* Adjust width for tablets */
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
        height: 50px; /* Adjust height for mobile screens */

        font-size: 0.85rem;
    }

    .search-bar button {
        width: 50px; /* Adjust width for mobile screens */
    }
}

.searchHome {
    overflow: hidden; /* Ensure content doesn’t overflow during zoom */
}

/* Image within .searchHome */
.searchHome img {
    transition: transform 0.3s ease; /* Smooth transition */
}

/* Hover state */
.searchHome:hover img {
    transform: scale(1.2); /* Zoom in the image */
}
</style>
