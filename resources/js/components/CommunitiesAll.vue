<style scoped>
/* Two Column Layout */
.two-column-layout {
    position: relative;
    width: 100%;
    min-height: calc(100vh - 200px); /* Adjust based on your header/footer */
}

.two-column-layout .row {
    min-height: calc(100vh - 200px);
}

/* Listings Column */
.listings-column {
    padding: 20px;
    overflow-y: auto;
    max-height: calc(100vh - 187px);
    scrollbar-width: thin;
    scrollbar-color: #ccc #f1f1f1;
    border-radius: 20px;
}

.listings-column::-webkit-scrollbar {
    width: 8px;
}

.listings-column::-webkit-scrollbar-track {
    background: #f1f1f1;
}

.listings-column::-webkit-scrollbar-thumb {
    background: #ccc;
    border-radius: 4px;
}

.listings-column::-webkit-scrollbar-thumb:hover {
    background: #aaa;
}

.listings-container {
    max-width: 1200px;
    margin: 0 auto;
}

/* Map Column */
.map-column {
    padding: 0;
    position: relative;
}

.sticky-map-container {
    position: sticky;
    top: 0;
    height: 100vh;
    overflow: hidden;
}

.map-container {
    width: 100%;
    height: 100%;
}

/* Map Placeholder States */
.map-placeholder {
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: #f8f9fa;
}

.map-message {
    text-align: center;
    padding: 40px;
    max-width: 400px;
}

.message-icon {
    font-size: 4rem;
    color: #6c757d;
    margin-bottom: 20px;
}
.results-header {
    display: flex;
    justify-content: between;
    align-items: center;
    margin-bottom: 2rem;
    flex-wrap: wrap;
    gap: 4rem;
}

.results-title {
    font-size: 1.5rem;
    font-weight: 700;
    color: #1a365d;
    margin: 0;
}

.results-count {
    color: #64748b;
    margin: 0;
}

/* New Home Communities Page */
.communities-hero-section {
    background: linear-gradient(
        135deg,
        rgba(26, 54, 93, 0.85) 0%,
        rgba(45, 55, 72, 0.75) 100%
    );
    padding: 4rem 0;
    position: relative;
    overflow: hidden;
}

.communities-hero-section::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 1px;
    background: linear-gradient(
        90deg,
        transparent,
        rgba(255, 255, 255, 0.3),
        transparent
    );
}

.hero-content {
    text-align: center;
    max-width: 800px;
    margin: 0 auto;
}

.page-title {
    font-size: 3rem;
    font-weight: 700;
    color: white;
    margin-bottom: 1.5rem;
    text-transform: uppercase;
    letter-spacing: 1px;
}

.page-subtitle {
    font-size: 1.3rem;
    color: rgba(255, 255, 255, 0.8);
    line-height: 1.6;
    margin: 0 auto;
}

/* Filter Section */
.filter-section {
    padding: 2rem 0;
    background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);
}

.filter-card {
    background: white;
    border-radius: 24px;
    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.08);
    border: 1px solid #f1f5f9;
    overflow: hidden;
}

.filter-header {
    display: flex;
    align-items: center;
    gap: 1rem;
    padding: 1.5rem 2rem;
    user-select: none;
    transition: background-color 0.2s ease;
}

.filter-header:hover {
    background-color: rgba(0, 0, 0, 0.02);
}

.section-icon {
    width: 48px;
    height: 48px;
    background: linear-gradient(to right, hsl(213 71% 45%), hsl(213 71% 30%));
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-size: 1.5rem;
    flex-shrink: 0;
}

.section-title {
    font-size: 1.6rem;
    font-weight: 700;
    color: #1a365d;
    margin: 0;
    flex-grow: 1;
}

.collapse-toggle {
    margin-left: auto;
    background: none;
    border: none;
    font-size: 1.5rem;
    color: #64748b;
    padding: 0.5rem;
    cursor: pointer;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 8px;
    flex-shrink: 0;
}

.collapse-toggle:hover {
    background-color: #f1f5f9;
    color: hsl(213 71% 45%);
    transform: scale(1.05);
}

.collapse-toggle i {
    transition: transform 0.3s ease;
}

.filter-content {
    padding: 2.5rem;
    border-top: 1px solid #f1f5f9;
}

/* Filter Grid */
.filter-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 1.5rem;
    margin-bottom: 2rem;
}

@media (max-width: 768px) {
    .filter-grid {
        grid-template-columns: 1fr;
    }
}

.filter-group {
    display: flex;
    flex-direction: column;
    gap: 0.75rem;
}

.filter-label {
    font-weight: 600;
    color: #1a365d;
    font-size: 0.95rem;
    display: flex;
    align-items: center;
    margin-bottom: 0;
}

.filter-label i {
    color: hsl(213 71% 45%);
}

.filter-input {
    padding: 0.75rem 1rem;
    border: 2px solid #e2e8f0;
    border-radius: 12px;
    background: #f8fafc;
    transition: all 0.3s ease;
    font-size: 0.95rem;
    color: #1a365d;
    width: 100%;
}

.filter-input::placeholder {
    color: #94a3b8;
}

.filter-input:hover {
    border-color: #cbd5e1;
    background: white;
}

.filter-input:focus {
    outline: none;
    border-color: hsl(213 71% 45%);
    background: white;
    box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
}

/* Remove spinner from number inputs */
.filter-input[type="number"]::-webkit-inner-spin-button,
.filter-input[type="number"]::-webkit-outer-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

.filter-input[type="number"] {
    -moz-appearance: textfield;
}

.range-inputs {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 0.75rem;
}

/* Filter Buttons */
.filter-buttons {
    display: flex;
    gap: 0.5rem;
    flex-wrap: wrap;
}

.filter-btn {
    padding: 0.6rem 1.2rem;
    border: 2px solid #e2e8f0;
    border-radius: 10px;
    background: white;
    color: #64748b;
    font-weight: 600;
    font-size: 0.9rem;
    transition: all 0.3s ease;
    cursor: pointer;
    flex: 0 0 auto;
}

.filter-btn:hover {
    border-color: hsl(213 71% 45%);
    color: hsl(213 71% 45%);
    background: rgba(59, 130, 246, 0.05);
    transform: translateY(-2px);
}

.filter-btn-active {
    background: linear-gradient(to right, hsl(213 71% 45%), hsl(213 71% 30%));
    border-color: hsl(213 71% 45%);
    color: white;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(59, 130, 246, 0.3);
}

.filter-btn-active:hover {
    background: linear-gradient(to right, hsl(213 71% 50%), hsl(213 71% 35%));
}

/* Toggle Switch */
.toggle-switch {
    display: flex;
    align-items: center;
    gap: 1rem;
}

.toggle-input {
    display: none;
}

.toggle-label {
    display: flex;
    align-items: center;
    gap: 0.75rem;
    cursor: pointer;
    user-select: none;
}

.toggle-slider {
    width: 50px;
    height: 26px;
    background: #cbd5e1;
    border-radius: 25px;
    position: relative;
    transition: all 0.3s ease;
    flex-shrink: 0;
}

.toggle-slider::before {
    content: "";
    position: absolute;
    width: 20px;
    height: 20px;
    background: white;
    border-radius: 50%;
    top: 3px;
    left: 3px;
    transition: all 0.3s ease;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

.toggle-input:checked + .toggle-label .toggle-slider {
    background: linear-gradient(to right, hsl(213 71% 45%), hsl(213 71% 30%));
}

.toggle-input:checked + .toggle-label .toggle-slider::before {
    transform: translateX(24px);
}

.toggle-label:hover .toggle-slider {
    opacity: 0.9;
}

.toggle-text {
    font-weight: 500;
    color: #1a365d;
    font-size: 0.95rem;
}

/* Action Buttons */
.filter-actions {
    display: flex;
    gap: 1rem;
    justify-content: flex-end;
    flex-wrap: wrap;
    padding-top: 1rem;
    border-top: 1px solid #f1f5f9;
}

.action-btn {
    padding: 0.85rem 2rem;
    border-radius: 12px;
    font-weight: 600;
    font-size: 0.95rem;
    text-decoration: none;
    transition: all 0.3s ease;
    border: 2px solid transparent;
    cursor: pointer;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    white-space: nowrap;
}

.btn-primary {
    background: linear-gradient(to right, hsl(213 71% 45%), hsl(213 71% 30%));
    color: white;
    border-color: transparent;
}

.btn-primary:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 20px rgba(59, 130, 246, 0.3);
}

.btn-primary:active {
    transform: translateY(0);
}

.btn-outline {
    background: white;
    border-color: #e2e8f0;
    color: #64748b;
}

.btn-outline:hover {
    background: #f8fafc;
    border-color: hsl(213 71% 45%);
    color: hsl(213 71% 45%);
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
}

.btn-outline:active {
    transform: translateY(0);
}

.btn-outline i {
    transition: transform 0.3s ease;
}

.btn-outline:hover i {
    transform: rotate(180deg);
}

/* Transition animations */
.slide-fade-enter-active {
    transition: all 0.4s ease-out;
}

.slide-fade-leave-active {
    transition: all 0.3s cubic-bezier(1, 0.5, 0.8, 1);
}

.slide-fade-enter-from {
    transform: translateY(-20px);
    opacity: 0;
    max-height: 0;
}

.slide-fade-leave-to {
    transform: translateY(-10px);
    opacity: 0;
    max-height: 0;
    overflow: hidden;
}

.slide-fade-enter-to {
    max-height: 2000px;
    overflow: visible;
}

.slide-fade-leave-from {
    max-height: 2000px;
}

/* Responsive Design */
@media (max-width: 992px) {
    .filter-content {
        padding: 2rem 1.5rem;
    }

    .filter-header {
        padding: 1.25rem 1.5rem;
    }

    .section-title {
        font-size: 1.4rem;
    }
}

@media (max-width: 576px) {
    .filter-content {
        padding: 1.5rem 1rem;
    }

    .filter-header {
        padding: 1rem;
    }

    .section-icon {
        width: 40px;
        height: 40px;
        font-size: 1.25rem;
    }

    .section-title {
        font-size: 1.2rem;
    }

    .filter-actions {
        justify-content: stretch;
    }

    .action-btn {
        flex: 1;
    }

    .range-inputs {
        grid-template-columns: 1fr;
    }
}

/* Loading state for inputs */
.filter-input:disabled {
    opacity: 0.6;
    cursor: not-allowed;
}

/* Focus visible for accessibility */
.filter-btn:focus-visible,
.action-btn:focus-visible,
.toggle-label:focus-visible {
    outline: 2px solid hsl(213 71% 45%);
    outline-offset: 2px;
}
/* Communities Grid Section */
.communities-grid-section {
    background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);
    padding: 5rem 0;
    position: relative;
}

.communities-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
    gap: 2rem;
}

.community-card {
    background: white;
    border-radius: 20px;
    overflow: hidden;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
    transition: all 0.3s ease;
    border: 1px solid #f1f5f9;
    display: flex;
    flex-direction: column;
    height: 100%;
}

.community-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
    border-color: hsl(213 71% 30%);
}

.community-image-container {
    position: relative;
    width: 100%;
    height: 240px;
    overflow: hidden;
}

.community-image {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.5s ease;
}

.community-card:hover .community-image {
    transform: scale(1.1);
}

.community-badge {
    position: absolute;
    top: 1rem;
    right: 1rem;
    background: linear-gradient(
        to right,
        hsl(213 71% 45%),
        /* lighter */ hsl(213 71% 30%) /* darker */
    );
    color: white;
    padding: 0.5rem 1rem;
    border-radius: 20px;
    font-size: 0.8rem;
    font-weight: 600;
    backdrop-filter: blur(10px);
    border: 1px solid rgba(255, 255, 255, 0.2);
}

.community-content {
    padding: 1.5rem;
    flex-grow: 1;
    display: flex;
    flex-direction: column;
}

.community-name {
    font-size: 1.4rem;
    font-weight: 700;
    color: #1a365d;
    margin-bottom: 0.5rem;
    line-height: 1.3;
    font-family: "Playfair Display", serif;
}

.community-location {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    color: #2d6a9f;
    font-size: 0.9rem;
    font-weight: 500;
    margin-bottom: 1rem;
}

.community-location i {
    font-size: 1rem;
}

.community-description {
    color: #64748b;
    line-height: 1.5;
    margin-bottom: 1.5rem;
    flex-grow: 1;
    font-size: 0.95rem;
}

.community-cta {
    background: linear-gradient(
        to right,
        hsl(213 71% 45%),
        /* lighter */ hsl(213 71% 30%) /* darker */
    );
    border: none;
    border-radius: 12px;
    padding: 0.75rem 1.5rem;
    color: white;
    font-weight: 600;
    text-decoration: none;
    text-align: center;
    transition: all 0.3s ease;
    margin-top: auto;
}

.community-cta:hover {
    background: linear-gradient(
        to right,
        hsl(213 71% 45%),
        /* lighter */ hsl(213 71% 30%) /* darker */
    );
    transform: translateY(-2px);
    box-shadow: 0 8px 20px hsl(213 71% 45%);
    color: white;
}

/* Loading State */
.communities-loading {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
    gap: 2rem;
}

.community-card-loading {
    background: white;
    border-radius: 20px;
    overflow: hidden;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
    border: 1px solid #f1f5f9;
    height: 400px;
    position: relative;
    overflow: hidden;
}

.community-card-loading::after {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(
        90deg,
        transparent,
        rgba(255, 255, 255, 0.4),
        transparent
    );
    animation: loading 1.5s infinite;
}

@keyframes loading {
    0% {
        transform: translateX(-100%);
    }
    100% {
        transform: translateX(100%);
    }
}

/* Empty State */
.empty-state {
    text-align: center;
    padding: 4rem 2rem;
    background: white;
    border-radius: 20px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
    margin: 2rem 0;
}

.empty-state-icon {
    font-size: 4rem;
    color: #cbd5e0;
    margin-bottom: 1.5rem;
}

.empty-state-title {
    font-size: 1.5rem;
    color: #64748b;
    margin-bottom: 1rem;
}

.empty-state-text {
    color: #94a3b8;
    max-width: 400px;
    margin: 0 auto;
}

/* Decorative Elements */
.section-decoration {
    position: absolute;
    width: 200px;
    height: 200px;
    background: linear-gradient(
        135deg,
        rgba(229, 62, 62, 0.1),
        rgba(26, 54, 93, 0.1)
    );
    border-radius: 50%;
    filter: blur(40px);
    z-index: 0;
}

.decoration-1 {
    top: -50px;
    right: -50px;
}

.decoration-2 {
    bottom: -50px;
    left: -50px;
}

/* Responsive Design */
@media (max-width: 768px) {
    .communities-hero-section {
        padding: 3rem 0;
    }

    .page-title {
        font-size: 2.2rem;
    }

    .page-subtitle {
        font-size: 1.1rem;
    }

    .communities-grid-section {
        padding: 3rem 0;
    }

    .communities-grid {
        grid-template-columns: 1fr;
        gap: 1.5rem;
    }

    .community-content {
        padding: 1.25rem;
    }
}

@media (max-width: 576px) {
    .page-title {
        font-size: 1.8rem;
    }

    .communities-grid {
        grid-template-columns: 1fr;
    }

    .community-name {
        font-size: 1.2rem;
    }

    .community-badge {
        top: 0.75rem;
        right: 0.75rem;
        padding: 0.4rem 0.8rem;
        font-size: 0.75rem;
    }

    .community-image-container {
        height: 200px;
    }
}

/* Filter and Search Styles (if added in future) */
.communities-filters {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 2rem;
    gap: 1rem;
    flex-wrap: wrap;
}

.search-box {
    flex: 1;
    max-width: 400px;
}

.search-input {
    width: 100%;
    padding: 0.75rem 1rem;
    border: 2px solid #e2e8f0;
    border-radius: 12px;
    font-size: 1rem;
    transition: all 0.3s ease;
}

.search-input:focus {
    border-color: hsl(213 71% 55%);
    box-shadow: 0 0 0 3px rgba(229, 62, 62, 0.1);
    outline: none;
}
.community-description-wrapper {
    position: relative;
}

.community-description {
    max-height: 1.5em;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
    transition: max-height 0.3s ease, -webkit-line-clamp 0.3s ease;
    line-height: 1.5em;
    margin-bottom: auto;
}

.community-description.expanded {
    max-height: none;
    -webkit-line-clamp: unset;
}

.read-more-btn {
    background: none;
    border: none;
    color: hsl(213 71% 30%);
    cursor: pointer;
    padding: 0;
    font-size: 0.9em;
    font-weight: 600;
    margin-bottom: 1.5rem;
    transition: color 0.2s ease;
}

.read-more-btn:hover {
    color: #1a365d;
    text-decoration: underline;
}

.read-more-btn:focus {
    outline: 2px solid #1a365d;
    outline-offset: 2px;
}
</style>

<template>
    <Master>
        <!-- Hero Section -->
        <section class="communities-hero-section">
            <div class="container position-relative" style="z-index: 1">
                <div class="hero-content">
                    <h1 class="page-title">New Home Communities!</h1>
                    <p class="page-subtitle">
                        Explore master-planned communities in the Las Vegas area
                    </p>
                </div>
            </div>

            <!-- Decorative Elements -->
            <div class="section-decoration decoration-1"></div>
            <div class="section-decoration decoration-2"></div>
        </section>

        <!-- Filter Section -->
        <section class="filter-section">
            <div class="container-fluid">
                <div class="filter-card">
                    <div
                        class="filter-header"
                        @click="toggleFilters"
                        style="cursor: pointer"
                    >
                        <div class="section-icon">
                            <i class="bi bi-funnel"></i>
                        </div>
                        <h2 class="section-title">Filter Your Search</h2>
                        <button class="collapse-toggle" type="button">
                            <i
                                class="bi"
                                :class="
                                    isFilterExpanded
                                        ? 'bi-chevron-up'
                                        : 'bi-chevron-down'
                                "
                            ></i>
                        </button>
                    </div>

                    <transition name="slide-fade">
                        <div class="filter-content" v-show="isFilterExpanded">
                            <div class="filter-grid">
                                <!-- Search -->
                                <div class="filter-group">
                                    <label class="filter-label">
                                        <i class="bi bi-search me-2"></i>
                                        Search Location
                                    </label>
                                    <input
                                        type="text"
                                        v-model="main_search_field"
                                        :placeholder="
                                            translate(
                                                'Enter address, city, or ZIP'
                                            )
                                        "
                                        @change="quickSearch"
                                        @keypress.enter="quickSearch"
                                        class="filter-input"
                                    />
                                </div>

                                <!-- Price Range -->
                                <div class="filter-group">
                                    <label class="filter-label">
                                        <i
                                            class="bi bi-currency-dollar me-2"
                                        ></i>
                                        Price Range
                                    </label>
                                    <div class="range-inputs">
                                        <input
                                            type="number"
                                            v-model="min_price"
                                            placeholder="Min Price"
                                            @change="quickSearch"
                                            class="filter-input"
                                        />
                                        <input
                                            type="number"
                                            v-model="max_price"
                                            placeholder="Max Price"
                                            @change="quickSearch"
                                            class="filter-input"
                                        />
                                    </div>
                                </div>

                                <!-- SQRF Range -->
                                <div class="filter-group">
                                    <label class="filter-label">
                                        <i class="bi bi-aspect-ratio me-2"></i>
                                        Square Feet
                                    </label>
                                    <div class="range-inputs">
                                        <input
                                            type="number"
                                            v-model="min_square_feet"
                                            placeholder="Min SQRF"
                                            @change="quickSearch"
                                            class="filter-input"
                                        />
                                        <input
                                            type="number"
                                            v-model="max_square_feet"
                                            placeholder="Max SQRF"
                                            @change="quickSearch"
                                            class="filter-input"
                                        />
                                    </div>
                                </div>

                                <!-- Lot Size -->
                                <div class="filter-group">
                                    <label class="filter-label">
                                        <i class="bi bi-columns-gap me-2"></i>
                                        Lot Size
                                    </label>
                                    <div class="range-inputs">
                                        <input
                                            type="number"
                                            v-model="min_lot_size"
                                            placeholder="Min Lot Size"
                                            @change="quickSearch"
                                            class="filter-input"
                                        />
                                        <input
                                            type="number"
                                            v-model="max_lot_size"
                                            placeholder="Max Lot Size"
                                            @change="quickSearch"
                                            class="filter-input"
                                        />
                                    </div>
                                </div>

                                <!-- Bathrooms -->
                                <div class="filter-group">
                                    <label class="filter-label">
                                        <i class="bi bi-droplet me-2"></i>
                                        Bathrooms
                                    </label>
                                    <div class="filter-buttons">
                                        <template v-for="n in 5">
                                            <button
                                                type="button"
                                                class="filter-btn"
                                                :class="{
                                                    'filter-btn-active':
                                                        bathroom === n,
                                                }"
                                                @click.prevent="
                                                    bathroom = n;
                                                    quickSearch();
                                                "
                                            >
                                                {{ n }}+
                                            </button>
                                        </template>
                                    </div>
                                </div>

                                <!-- Bedrooms -->
                                <div class="filter-group">
                                    <label class="filter-label">
                                        <i class="bi bi-house-door me-2"></i>
                                        Bedrooms
                                    </label>
                                    <div class="filter-buttons">
                                        <template v-for="n in 5">
                                            <button
                                                type="button"
                                                class="filter-btn"
                                                :class="{
                                                    'filter-btn-active':
                                                        bedrooms === n,
                                                }"
                                                @click.prevent="
                                                    bedrooms = n;
                                                    quickSearch();
                                                "
                                            >
                                                {{ n }}+
                                            </button>
                                        </template>
                                    </div>
                                </div>

                                <!-- Homes Count Filter -->
                                <div class="filter-group">
                                    <label class="filter-label">
                                        <i class="bi bi-houses me-2"></i>
                                        Homes
                                    </label>
                                    <div class="filter-buttons">
                                        <template
                                            v-for="count in [1, 2, 3, 4, 5]"
                                            :key="count"
                                        >
                                            <button
                                                type="button"
                                                class="filter-btn"
                                                :class="{
                                                    'filter-btn-active':
                                                        min_homes_count ===
                                                        count,
                                                }"
                                                @click.prevent="
                                                    min_homes_count = count;
                                                    quickSearch();
                                                "
                                            >
                                                {{ count }}+
                                            </button>
                                        </template>
                                    </div>
                                </div>

                                <!-- Open House -->
                                <div class="filter-group">
                                    <label class="filter-label">
                                        <i
                                            class="bi bi-calendar-event me-2"
                                        ></i>
                                        Open House
                                    </label>
                                    <div class="toggle-switch">
                                        <input
                                            class="toggle-input"
                                            type="checkbox"
                                            v-model="is_open_house"
                                            id="openHouseSwitch"
                                            @change="quickSearch"
                                        />
                                        <label
                                            class="toggle-label"
                                            for="openHouseSwitch"
                                        >
                                            <span class="toggle-slider"></span>
                                            <span class="toggle-text"
                                                >Open House Only</span
                                            >
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <!-- Action Buttons -->
                            <div class="filter-actions">
                                <button
                                    @click="resetForm"
                                    class="action-btn btn-outline"
                                >
                                    <i class="bi bi-arrow-repeat me-2"></i>
                                    Reset Filters
                                </button>
                            </div>
                        </div>
                    </transition>
                </div>
            </div>
        </section>

        <!-- Two-Column Layout Section -->
        <section class="two-column-layout">
            <div class="container-fluid">
                <div class="row g-0">
                    <!-- Left Column - Property Listings -->
                    <div class="col-lg-7 col-xl-6 listings-column">
                        <!-- Results Header -->
                                <div class="results-header">
                                    <div class="results-info">
                                        <h3 class="results-title">
                                            Communities
                                        </h3>
                                        <p class="results-count">
                                            {{ total_communities }} results found
                                        </p>
                                    </div>
                                </div>
                        <div class="listings-container">
                            <!-- Communities Grid -->
                            <div
                                v-if="Communities && Communities.length > 0"
                                class="communities-grid"
                            >
                                <div
                                    v-for="community in Communities"
                                    :key="community.id"
                                    class="community-card"
                                >
                                    <!-- Image + Badge -->
                                    <div class="community-image-container">
                                        <img
                                            :src="
                                                community.main_image ??
                                                '/images/default_image.png'
                                            "
                                            class="community-image"
                                            :alt="community.name"
                                            @error="setAltImg"
                                        />
                                        <span class="community-badge">
                                            {{ community.homes_count }} Homes
                                        </span>
                                    </div>

                                    <!-- Content -->
                                    <div class="community-content">
                                        <h2 class="community-name">
                                            {{ community.name }}
                                        </h2>

                                        <div
                                            class="community-location"
                                            v-if="community.location"
                                        >
                                            <i class="bi bi-geo-alt"></i>
                                            <span>{{
                                                community.location
                                            }}</span>
                                        </div>

                                        <div
                                            class="community-description-wrapper"
                                        >
                                            <p
                                                class="community-description"
                                                :class="{
                                                    expanded:
                                                        expandedDescriptions[
                                                            community.id
                                                        ],
                                                }"
                                            >
                                                {{
                                                    community.description ||
                                                    `Discover the charm of ${community.name} with beautiful homes, thriving communities, and exceptional amenities in the heart of Las Vegas.`
                                                }}
                                            </p>

                                            <button
                                                v-if="
                                                    shouldShowReadMore(
                                                        community
                                                    )
                                                "
                                                @click="
                                                    toggleDescription(
                                                        community.id
                                                    )
                                                "
                                                class="read-more-btn"
                                            >
                                                {{
                                                    expandedDescriptions[
                                                        community.id
                                                    ]
                                                        ? "Read Less"
                                                        : "Read More"
                                                }}
                                            </button>
                                        </div>

                                        <a
                                            :href="
                                                '/detailed/community/' +
                                                community.id
                                            "
                                            class="community-cta"
                                        >
                                            View Community
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <!-- Loading State -->
                            <div
                                v-else-if="!Communities"
                                class="communities-loading"
                            >
                                <div
                                    v-for="n in 6"
                                    :key="n"
                                    class="community-card-loading"
                                ></div>
                            </div>

                            <!-- Empty State -->
                            <div v-else class="empty-state">
                                <div class="empty-state-icon">
                                    <i class="bi bi-building"></i>
                                </div>
                                <h3 class="empty-state-title">
                                    No Communities Available
                                </h3>
                                <p class="empty-state-text">
                                    We're currently updating our community
                                    listings. Please check back soon for the
                                    latest new home communities in Las Vegas.
                                </p>
                            </div>
                        </div>
                    </div>
                    <!-- Right Column - Map (Fixed Position) -->
                    <div class="col-lg-5 col-xl-6 map-column">
                        <div class="sticky-map-container">
                            <!-- Show Map with Properties -->
                            <div
                                v-if="homes.length > 0 && loadmap"
                                class="map-container"
                            >
                                <Map :homes="homes" />
                            </div>

                            <!-- Show Message When No Results with Filters -->
                            <div
                                v-else-if="
                                    homes.length === 0 &&
                                    hasActiveFilters() &&
                                    formStatus === 1
                                "
                                class="map-placeholder"
                            >
                                <div class="map-message">
                                    <div class="message-icon">
                                        <i class="bi bi-geo-alt-fill"></i>
                                    </div>
                                    <h4>No Properties to Display on Map</h4>
                                    <p>
                                        Adjust your filters to see properties in
                                        this area
                                    </p>
                                    <button
                                        @click="resetForm"
                                        class="action-btn btn-primary"
                                    >
                                        <i class="bi bi-funnel me-2"></i>
                                        Show All Properties
                                    </button>
                                </div>
                            </div>

                            <!-- Show Map Placeholder When No Properties at All -->
                            <div
                                v-else-if="
                                    homes.length === 0 &&
                                    !hasActiveFilters() &&
                                    formStatus === 1
                                "
                                class="map-placeholder"
                            >
                                <div class="map-message">
                                    <div class="message-icon">
                                        <i class="bi bi-map"></i>
                                    </div>
                                    <h4>Map Unavailable</h4>
                                    <p>No properties available to display</p>
                                </div>
                            </div>

                            <!-- Loading State -->
                            <div
                                v-else-if="formStatus === 0"
                                class="map-placeholder"
                            >
                                <div class="map-message">
                                    <div
                                        class="spinner-border text-primary"
                                        role="status"
                                    >
                                        <span class="visually-hidden"
                                            >Loading...</span
                                        >
                                    </div>
                                    <h4 class="mt-3">Loading Properties...</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </Master>
</template>

<script>
import { defineComponent } from "vue";
import Master from "@components/layout/Master.vue";
import Map from "@components/Map.vue";

export default defineComponent({
    components: {
        Master,
        Map,
    },
    data() {
        return {
            isFilterExpanded: false,
            bathroom: "",
            bedrooms: "",
            total_homes: 0,
            YesNoOptions: ["Yes", "No"],
            communities_options: [],
            schoolOptions: [],
            hoasOptions: [],
            homes: [],
            formErrors: [],
            validationErrors: {
                price: "",
                square_feet: "",
                lot_size: "",
            },
            form: {
                city: "",
                state: "",
                zip_code: "",
            },
            formStatus: 1,
            loadmap: false,
            searching_location: "",
            main_search_field: this.location ?? "",
            min_price: "",
            max_price: "",
            min_square_feet: "",
            max_square_feet: "",
            min_lot_size: "",
            max_lot_size: "",
            is_open_house: false,
            min_homes_count: null,
            Communities: [],
            expandedDescriptions: {},
            characterLimit: 150,
            total_communities: 0,
        };
    },
    created() {
        this.fetchDestinations();
    },
    watch: {
        min_price() {
            this.validatePriceRange();
        },
        max_price() {
            this.validatePriceRange();
        },
        min_square_feet() {
            this.validateSquareFeetRange();
        },
        max_square_feet() {
            this.validateSquareFeetRange();
        },
        min_lot_size() {
            this.validateLotSizeRange();
        },
        max_lot_size() {
            this.validateLotSizeRange();
        },
    },
    methods: {
        toggleFilters() {
            this.isFilterExpanded = !this.isFilterExpanded;
        },

        // Add this method for Enter key and button click
        handleSearch() {
            if (
                this.formStatus &&
                this.searching_location &&
                this.searching_location.trim()
            ) {
                this.activeSpinner();
                window.location.href = `/homes-list/${this.searching_location.trim()}`;
            }
        },

        // Add this method to activate the spinner
        activeSpinner() {
            this.formStatus = 0;
        },

        validatePriceRange() {
            const min = parseFloat(this.min_price) || 0;
            const max = parseFloat(this.max_price) || 0;

            if (min > 0 && max > 0 && min > max) {
                this.validationErrors.price =
                    "Minimum price cannot be greater than maximum price. Values will be auto-corrected.";
                return false;
            } else {
                this.validationErrors.price = "";
                return true;
            }
        },

        validateSquareFeetRange() {
            const min = parseFloat(this.min_square_feet) || 0;
            const max = parseFloat(this.max_square_feet) || 0;

            if (min > 0 && max > 0 && min > max) {
                this.validationErrors.square_feet =
                    "Minimum square feet cannot be greater than maximum. Values will be auto-corrected.";
                return false;
            } else {
                this.validationErrors.square_feet = "";
                return true;
            }
        },

        validateLotSizeRange() {
            const min = parseFloat(this.min_lot_size) || 0;
            const max = parseFloat(this.max_lot_size) || 0;

            if (min > 0 && max > 0 && min > max) {
                this.validationErrors.lot_size =
                    "Minimum lot size cannot be greater than maximum. Values will be auto-corrected.";
                return false;
            } else {
                this.validationErrors.lot_size = "";
                return true;
            }
        },

        validateAllRanges() {
            const priceValid = this.validatePriceRange();
            const sqFtValid = this.validateSquareFeetRange();
            const lotValid = this.validateLotSizeRange();

            return priceValid && sqFtValid && lotValid;
        },

        autoCorrectRanges() {
            if (this.min_price && this.max_price) {
                const min = parseFloat(this.min_price);
                const max = parseFloat(this.max_price);
                if (min > max) {
                    [this.min_price, this.max_price] = [
                        this.max_price,
                        this.min_price,
                    ];
                }
            }

            if (this.min_square_feet && this.max_square_feet) {
                const min = parseFloat(this.min_square_feet);
                const max = parseFloat(this.max_square_feet);
                if (min > max) {
                    [this.min_square_feet, this.max_square_feet] = [
                        this.max_square_feet,
                        this.min_square_feet,
                    ];
                }
            }

            if (this.min_lot_size && this.max_lot_size) {
                const min = parseFloat(this.min_lot_size);
                const max = parseFloat(this.max_lot_size);
                if (min > max) {
                    [this.min_lot_size, this.max_lot_size] = [
                        this.max_lot_size,
                        this.min_lot_size,
                    ];
                }
            }
        },

        resetForm() {
            this.main_search_field = "";
            this.min_price = "";
            this.max_price = "";
            this.min_square_feet = "";
            this.max_square_feet = "";
            this.min_lot_size = "";
            this.max_lot_size = "";
            this.bathroom = "";
            this.bedrooms = "";
            this.is_open_house = false;
            this.min_homes_count = null;
            this.sort_by = "Newest";

            this.validationErrors = {
                price: "",
                square_feet: "",
                lot_size: "",
            };

            this.formErrors = [];
            this.fetchDestinations();
        },

        buildFilterFormData(includeSort = false) {
            let formData = new FormData();

            if (includeSort) {
                formData.append("sort_by", this.sort_by ?? "");
            }

            if (this.is_open_house) {
                formData.append("is_open_house", this.is_open_house ? 1 : 0);
            }
            if (this.main_search_field && this.main_search_field.trim()) {
                formData.append(
                    "main_search_field",
                    this.main_search_field.trim()
                );
            }
            if (this.min_price) {
                formData.append("min_price", this.min_price);
            }
            if (this.max_price) {
                formData.append("max_price", this.max_price);
            }
            if (this.min_square_feet) {
                formData.append("min_square_feet", this.min_square_feet);
            }
            if (this.max_square_feet) {
                formData.append("max_square_feet", this.max_square_feet);
            }
            if (this.min_lot_size) {
                formData.append("min_lot_size", this.min_lot_size);
            }
            if (this.max_lot_size) {
                formData.append("max_lot_size", this.max_lot_size);
            }
            if (this.bathroom) {
                formData.append("bathroom", this.bathroom);
            }
            if (this.bedrooms) {
                formData.append("bedrooms", this.bedrooms);
            }
            if (this.min_homes_count !== null) {
                formData.append("min_homes_count", this.min_homes_count);
            }

            return formData;
        },

        hasActiveFilters() {
            return !!(
                this.main_search_field ||
                this.min_price ||
                this.max_price ||
                this.min_square_feet ||
                this.max_square_feet ||
                this.min_lot_size ||
                this.max_lot_size ||
                this.bathroom ||
                this.bedrooms ||
                this.is_open_house
            );
        },

        quickSearch() {
            // Set loading state
            this.formStatus = 0;

            // Validate ranges before searching
            this.validateAllRanges();

            // Auto-correct inverted ranges
            this.autoCorrectRanges();

            // Build form data with current filters
            let formData = this.buildFilterFormData(false);

            axios
                .post("/api/search-communities", formData)
                .then((response) => {
                    this.Communities = response.data.communities;
                    this.total_homes = response.data.total_communities;
                    this.total_communities = this.Communities.length;
                    this.formStatus = 1;
                    this.formErrors = [];

                    // Clear validation errors on successful search
                    this.validationErrors = {
                        price: "",
                        square_feet: "",
                        lot_size: "",
                    };

                    // Show success message if results found
                    if (this.Communities.length > 0) {
                        toastr.success(
                            `Found ${this.total_homes} ${
                                this.total_homes === 1
                                    ? "community"
                                    : "communities"
                            }`
                        );
                    } else {
                        toastr.info(
                            "No communities found matching your criteria"
                        );
                    }
                })
                .catch((error) => {
                    this.formStatus = 1;
                    toastr.error(
                        error.response?.data?.message ||
                            "An error occurred during search."
                    );
                    if (error.response?.data?.errors) {
                        this.formErrors = error.response.data.errors;
                    }
                });
        },

        fetchDestinations() {
            axios
                .get("/api/get-all-communities")
                .then((response) => {
                    this.Communities = response.data;
                    this.total_communities = this.Communities.length;
                    // Extract all properties from all communities
                    this.homes = [];
                    this.Communities.forEach((community) => {
                        if (
                            community.properties &&
                            Array.isArray(community.properties)
                        ) {
                            // Add community info to each property for map display
                            community.properties.forEach((property) => {
                                property.community_name = community.name;
                                this.homes.push(property);
                            });
                        }
                    });

                    this.total_homes = this.homes.length;
                    this.loadmap = this.homes.length > 0;
                })
                .catch((error) => {
                    toastr.error(
                        error.response?.data?.message ||
                            "Failed to load communities"
                    );
                });
        },

        setAltImg(event) {
            event.target.src = "/images/default_image.png";
        },

        toggleDescription(communityId) {
            this.expandedDescriptions[communityId] =
                !this.expandedDescriptions[communityId];
        },

        shouldShowReadMore(community) {
            const description =
                community.description ||
                `Discover the charm of ${community.name} with beautiful homes, thriving communities, and exceptional amenities in the heart of Las Vegas.`;
            return description.length > this.characterLimit;
        },
    },
});
</script>
