<template>
    <Master>
        <!-- Filter Section -->
        <section class="filter-section">
            <div class="container">
                <div class="filter-card">
                    <div class="filter-header">
                        <div class="section-icon">
                            <i class="bi bi-funnel"></i>
                        </div>
                        <h2 class="section-title">Filter Your Search</h2>
                    </div>

                    <div class="filter-content">
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
                                        translate('Enter address, city, or ZIP')
                                    "
                                    @change="quickSearch"
                                    class="filter-input"
                                />
                            </div>

                            <!-- Price Range -->
                            <div class="filter-group">
                                <label class="filter-label">
                                    <i class="bi bi-currency-dollar me-2"></i>
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

                            <!-- Open House -->
                            <div class="filter-group">
                                <label class="filter-label">
                                    <i class="bi bi-calendar-event me-2"></i>
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
                                ref="openFilter"
                                data-bs-target="#filterModal"
                                data-bs-toggle="modal"
                                class="action-btn btn-primary"
                            >
                                <i class="bi bi-funnel-fill me-2"></i>
                                Advanced Filters
                            </button>
                            <button
                                @click="resetForm"
                                class="action-btn btn-outline"
                            >
                                <i class="bi bi-arrow-repeat me-2"></i>
                                Reset Filters
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Results Section -->
        <section class="content-section">
            <div class="container">
                <div class="content-card">
                    <!-- Results Header -->
                    <div class="results-header">
                        <div class="results-info">
                            <h3 class="results-title">Brand New Homes Vegas</h3>
                            <p class="results-count">
                                {{ total_homes }} results found
                            </p>
                        </div>
                        <div class="sort-section">
                            <label class="sort-label">Sort By</label>
                            <Multiselect
                                v-model="sort_by"
                                :options="sortingOptions"
                                :placeholder="translate('Sort homes for you')"
                                :searchable="true"
                                @select="sortProperties"
                                class="sort-select"
                            />
                        </div>
                    </div>

                    <!-- Homes Grid -->
                    <div v-if="homes && homes.length > 0" class="homes-grid">
                        <div
                            v-for="home in homes"
                            :key="home.id"
                            class="home-card"
                        >
                            <div class="home-card-inner">
                                <!-- Badge -->
                                <div
                                    class="home-badge"
                                    :class="
                                        home.is_open_house == 1
                                            ? 'open-house'
                                            : 'quick-move'
                                    "
                                >
                                    {{
                                        home.is_open_house == 1
                                            ? "OPEN HOUSE"
                                            : "QUICK MOVE IN"
                                    }}
                                </div>

                                <!-- Image -->
                                <div class="home-image">
                                    <img
                                        :src="
                                            home.main_image ??
                                            '/images/default_image.png'
                                        "
                                        :alt="home.title"
                                        @error="setAltImg"
                                    />
                                    <div
                                        v-if="home.incentive"
                                        class="incentive-badge"
                                    >
                                        Incentive Home
                                    </div>
                                </div>

                                <!-- Content -->
                                <div class="home-content">
                                    <!-- Price -->
                                    <div class="home-price">
                                        ${{ formatPrice(home.price) }}
                                    </div>

                                    <!-- Title -->
                                    <h3 class="home-title">{{ home.title }}</h3>

                                    <!-- Address -->
                                    <p class="home-address">
                                        {{ home.address }}
                                    </p>

                                    <!-- Features -->
                                    <div class="home-features">
                                        <div class="feature">
                                            <i class="bi bi-house-door"></i>
                                            <span class="feature-value">{{
                                                home.bedrooms || 0
                                            }}</span>
                                            <span class="feature-label"
                                                >bd</span
                                            >
                                        </div>
                                        <div class="feature">
                                            <i class="bi bi-droplet"></i>
                                            <span class="feature-value">{{
                                                home.bathrooms || 0
                                            }}</span>
                                            <span class="feature-label"
                                                >ba</span
                                            >
                                        </div>
                                        <div class="feature">
                                            <i class="bi bi-aspect-ratio"></i>
                                            <span class="feature-value">{{
                                                home.square_feet || 0
                                            }}</span>
                                            <span class="feature-label"
                                                >sqft</span
                                            >
                                        </div>
                                        <div class="feature">
                                            <i class="bi bi-car-front"></i>
                                            <span class="feature-value">{{
                                                home.garages || 0
                                            }}</span>
                                            <span class="feature-label"
                                                >garage</span
                                            >
                                        </div>
                                    </div>

                                    <!-- View Details Button -->
                                    <a
                                        :href="
                                            '/home-details/' + home.property_id
                                        "
                                        class="view-details-btn"
                                    >
                                        View Property Details
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Map Section -->
        <section class="map-section">
            <div class="container-fluid">
                <div class="map-container">
                    <Map v-if="loadmap" :homes="homes" />
                </div>
            </div>
        </section>

        <!-- Advanced Filter Modal -->
        <div class="modal fade" id="filterModal">
            <div class="modal-dialog modal-lg">
                <div class="modal-content filter-modal-content">
                    <div class="modal-header">
                        <div class="section-icon">
                            <i class="bi bi-sliders"></i>
                        </div>
                        <h5 class="modal-title">
                            {{ translate("Advance Filter") }}
                        </h5>
                        <button
                            type="button"
                            class="btn-close"
                            data-bs-dismiss="modal"
                            aria-label="Close"
                        ></button>
                    </div>
                    <div class="modal-body">
                        <form @submit.prevent="searchHomes">
                            <div class="filter-accordion">
                                <!-- Property Accordion -->
                                <div class="policy-section">
                                    <div class="section-header">
                                        <div class="section-icon">
                                            <i class="bi bi-building"></i>
                                        </div>
                                        <h4 class="section-title">
                                            Property Details
                                        </h4>
                                    </div>
                                    <div class="section-content">
                                        <div class="filter-grid">
                                            <div class="filter-group">
                                                <label for="city">{{
                                                    translate("City")
                                                }}</label>
                                                <input
                                                    type="text"
                                                    class="filter-input"
                                                    id="city"
                                                    v-model="form.city"
                                                    :class="{
                                                        'is-invalid':
                                                            formErrors.city,
                                                    }"
                                                />
                                                <div
                                                    class="invalid-feedback"
                                                    v-if="formErrors.city"
                                                >
                                                    {{ formErrors.city[0] }}
                                                </div>
                                            </div>

                                            <div class="filter-group">
                                                <label for="state">{{
                                                    translate("State")
                                                }}</label>
                                                <input
                                                    type="text"
                                                    class="filter-input"
                                                    id="state"
                                                    v-model="form.state"
                                                    :class="{
                                                        'is-invalid':
                                                            formErrors.state,
                                                    }"
                                                />
                                                <div
                                                    class="invalid-feedback"
                                                    v-if="formErrors.state"
                                                >
                                                    {{ formErrors.state[0] }}
                                                </div>
                                            </div>

                                            <div class="filter-group">
                                                <label for="zip_code">{{
                                                    translate("ZIP Code")
                                                }}</label>
                                                <input
                                                    type="text"
                                                    class="filter-input"
                                                    id="zip_code"
                                                    v-model="form.zip_code"
                                                    :class="{
                                                        'is-invalid':
                                                            formErrors.zip_code,
                                                    }"
                                                />
                                                <div
                                                    class="invalid-feedback"
                                                    v-if="formErrors.zip_code"
                                                >
                                                    {{ formErrors.zip_code[0] }}
                                                </div>
                                            </div>

                                            <div class="filter-group">
                                                <label for="community_id">{{
                                                    translate("Community")
                                                }}</label>
                                                <Multiselect
                                                    v-model="form.community_id"
                                                    :options="
                                                        communities_options
                                                    "
                                                    :placeholder="
                                                        translate(
                                                            'Search by Community'
                                                        )
                                                    "
                                                    :searchable="true"
                                                    :class="{
                                                        'invalid-bg':
                                                            formErrors.community_id,
                                                    }"
                                                />
                                                <div
                                                    class="invalid-feedback"
                                                    v-if="
                                                        formErrors.community_id
                                                    "
                                                >
                                                    {{
                                                        formErrors
                                                            .community_id[0]
                                                    }}
                                                </div>
                                            </div>

                                            <div class="filter-group">
                                                <label for="cic">{{
                                                    translate("CIC")
                                                }}</label>
                                                <Multiselect
                                                    v-model="form.cic"
                                                    :options="YesNoOptions"
                                                    :searchable="true"
                                                    :class="{
                                                        'invalid-bg':
                                                            formErrors.cic,
                                                    }"
                                                />
                                                <div
                                                    class="invalid-feedback"
                                                    v-if="formErrors.cic"
                                                >
                                                    {{ formErrors.cic[0] }}
                                                </div>
                                            </div>

                                            <div class="filter-group">
                                                <label for="school_id">{{
                                                    translate("School")
                                                }}</label>
                                                <Multiselect
                                                    v-model="form.school_id"
                                                    :options="schoolOptions"
                                                    :placeholder="
                                                        translate(
                                                            'Search by School'
                                                        )
                                                    "
                                                    :searchable="true"
                                                    :class="{
                                                        'invalid-bg':
                                                            formErrors.school_id,
                                                    }"
                                                />
                                                <div
                                                    class="invalid-feedback"
                                                    v-if="formErrors.school_id"
                                                >
                                                    {{
                                                        formErrors.school_id[0]
                                                    }}
                                                </div>
                                            </div>

                                            <div class="filter-group">
                                                <label for="hoa_id">{{
                                                    translate("HOA")
                                                }}</label>
                                                <Multiselect
                                                    v-model="form.hoa_id"
                                                    :options="hoasOptions"
                                                    :placeholder="
                                                        translate(
                                                            'Search by HOA'
                                                        )
                                                    "
                                                    :searchable="true"
                                                    :class="{
                                                        'invalid-bg':
                                                            formErrors.hoa_id,
                                                    }"
                                                />
                                                <div
                                                    class="invalid-feedback"
                                                    v-if="formErrors.hoa_id"
                                                >
                                                    {{ formErrors.hoa_id[0] }}
                                                </div>
                                            </div>

                                            <div class="filter-group">
                                                <label for="property_type">{{
                                                    translate("Property Type")
                                                }}</label>
                                                <input
                                                    type="text"
                                                    class="filter-input"
                                                    id="property_type"
                                                    v-model="form.property_type"
                                                    :class="{
                                                        'is-invalid':
                                                            formErrors.property_type,
                                                    }"
                                                />
                                                <div
                                                    class="invalid-feedback"
                                                    v-if="
                                                        formErrors.property_type
                                                    "
                                                >
                                                    {{
                                                        formErrors
                                                            .property_type[0]
                                                    }}
                                                </div>
                                            </div>

                                            <div class="filter-group">
                                                <label for="listing_type">{{
                                                    translate("Listing Type")
                                                }}</label>
                                                <input
                                                    type="text"
                                                    class="filter-input"
                                                    id="listing_type"
                                                    v-model="form.listing_type"
                                                    :class="{
                                                        'is-invalid':
                                                            formErrors.listing_type,
                                                    }"
                                                />
                                                <div
                                                    class="invalid-feedback"
                                                    v-if="
                                                        formErrors.listing_type
                                                    "
                                                >
                                                    {{
                                                        formErrors
                                                            .listing_type[0]
                                                    }}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Features Accordion -->
                                <div class="policy-section">
                                    <div class="section-header">
                                        <div class="section-icon">
                                            <i class="bi bi-star"></i>
                                        </div>
                                        <h4 class="section-title">Features</h4>
                                    </div>
                                    <div class="section-content">
                                        <div class="filter-grid">
                                            <div class="filter-group">
                                                <label for="fireplace_type">{{
                                                    translate("Fireplace Type")
                                                }}</label>
                                                <input
                                                    type="text"
                                                    class="filter-input"
                                                    id="fireplace_type"
                                                    v-model="
                                                        form.fireplace_type
                                                    "
                                                    :class="{
                                                        'is-invalid':
                                                            formErrors.fireplace_type,
                                                    }"
                                                />
                                                <div
                                                    class="invalid-feedback"
                                                    v-if="
                                                        formErrors.fireplace_type
                                                    "
                                                >
                                                    {{
                                                        formErrors
                                                            .fireplace_type[0]
                                                    }}
                                                </div>
                                            </div>

                                            <div class="filter-group">
                                                <label
                                                    for="kitchen_pantry_type"
                                                    >{{
                                                        translate(
                                                            "Kitchen Pantry Type"
                                                        )
                                                    }}</label
                                                >
                                                <input
                                                    type="text"
                                                    class="filter-input"
                                                    id="kitchen_pantry_type"
                                                    v-model="
                                                        form.kitchen_pantry_type
                                                    "
                                                    :class="{
                                                        'is-invalid':
                                                            formErrors.kitchen_pantry_type,
                                                    }"
                                                />
                                                <div
                                                    class="invalid-feedback"
                                                    v-if="
                                                        formErrors.kitchen_pantry_type
                                                    "
                                                >
                                                    {{
                                                        formErrors
                                                            .kitchen_pantry_type[0]
                                                    }}
                                                </div>
                                            </div>

                                            <div class="filter-group">
                                                <label for="reach_in">{{
                                                    translate("Reach In")
                                                }}</label>
                                                <Multiselect
                                                    v-model="form.reach_in"
                                                    :options="YesNoOptions"
                                                    :searchable="true"
                                                    :class="{
                                                        'invalid-bg':
                                                            formErrors.reach_in,
                                                    }"
                                                />
                                                <div
                                                    class="invalid-feedback"
                                                    v-if="formErrors.reach_in"
                                                >
                                                    {{ formErrors.reach_in[0] }}
                                                </div>
                                            </div>

                                            <div class="filter-group">
                                                <label for="walk_in">{{
                                                    translate("Walk In")
                                                }}</label>
                                                <Multiselect
                                                    v-model="form.walk_in"
                                                    :options="YesNoOptions"
                                                    :searchable="true"
                                                    :class="{
                                                        'invalid-bg':
                                                            formErrors.walk_in,
                                                    }"
                                                />
                                                <div
                                                    class="invalid-feedback"
                                                    v-if="formErrors.walk_in"
                                                >
                                                    {{ formErrors.walk_in[0] }}
                                                </div>
                                            </div>

                                            <div class="filter-group">
                                                <label for="laundry_closet">{{
                                                    translate("Laundry Closet")
                                                }}</label>
                                                <Multiselect
                                                    v-model="
                                                        form.laundry_closet
                                                    "
                                                    :options="YesNoOptions"
                                                    :searchable="true"
                                                    :class="{
                                                        'invalid-bg':
                                                            formErrors.laundry_closet,
                                                    }"
                                                />
                                                <div
                                                    class="invalid-feedback"
                                                    v-if="
                                                        formErrors.laundry_closet
                                                    "
                                                >
                                                    {{
                                                        formErrors
                                                            .laundry_closet[0]
                                                    }}
                                                </div>
                                            </div>

                                            <div class="filter-group">
                                                <label for="bedroom_location">{{
                                                    translate(
                                                        "Bedroom Location"
                                                    )
                                                }}</label>
                                                <input
                                                    type="text"
                                                    class="filter-input"
                                                    id="bedroom_location"
                                                    v-model="
                                                        form.bedroom_location
                                                    "
                                                    :class="{
                                                        'is-invalid':
                                                            formErrors.bedroom_location,
                                                    }"
                                                />
                                                <div
                                                    class="invalid-feedback"
                                                    v-if="
                                                        formErrors.bedroom_location
                                                    "
                                                >
                                                    {{
                                                        formErrors
                                                            .bedroom_location[0]
                                                    }}
                                                </div>
                                            </div>

                                            <div class="filter-group">
                                                <label for="bathroom_type">{{
                                                    translate("Bathroom Type")
                                                }}</label>
                                                <input
                                                    type="text"
                                                    class="filter-input"
                                                    id="bathroom_type"
                                                    v-model="form.bathroom_type"
                                                    :class="{
                                                        'is-invalid':
                                                            formErrors.bathroom_type,
                                                    }"
                                                />
                                                <div
                                                    class="invalid-feedback"
                                                    v-if="
                                                        formErrors.bathroom_type
                                                    "
                                                >
                                                    {{
                                                        formErrors
                                                            .bathroom_type[0]
                                                    }}
                                                </div>
                                            </div>

                                            <div class="filter-group">
                                                <label for="pool_shape">{{
                                                    translate("Pool Shape")
                                                }}</label>
                                                <input
                                                    type="text"
                                                    class="filter-input"
                                                    id="pool_shape"
                                                    v-model="form.pool_shape"
                                                    :class="{
                                                        'is-invalid':
                                                            formErrors.pool_shape,
                                                    }"
                                                />
                                                <div
                                                    class="invalid-feedback"
                                                    v-if="formErrors.pool_shape"
                                                >
                                                    {{
                                                        formErrors.pool_shape[0]
                                                    }}
                                                </div>
                                            </div>

                                            <div class="filter-group">
                                                <label for="water_features">{{
                                                    translate("Water Features")
                                                }}</label>
                                                <input
                                                    type="text"
                                                    class="filter-input"
                                                    id="water_features"
                                                    v-model="
                                                        form.water_features
                                                    "
                                                    :class="{
                                                        'is-invalid':
                                                            formErrors.water_features,
                                                    }"
                                                />
                                                <div
                                                    class="invalid-feedback"
                                                    v-if="
                                                        formErrors.water_features
                                                    "
                                                >
                                                    {{
                                                        formErrors
                                                            .water_features[0]
                                                    }}
                                                </div>
                                            </div>

                                            <div class="filter-group">
                                                <label for="spa">{{
                                                    translate("Spa")
                                                }}</label>
                                                <Multiselect
                                                    v-model="form.spa"
                                                    :options="YesNoOptions"
                                                    :searchable="true"
                                                    :class="{
                                                        'invalid-bg':
                                                            formErrors.spa,
                                                    }"
                                                />
                                                <div
                                                    class="invalid-feedback"
                                                    v-if="formErrors.spa"
                                                >
                                                    {{ formErrors.spa[0] }}
                                                </div>
                                            </div>

                                            <div class="filter-group">
                                                <label for="fencing_material">{{
                                                    translate(
                                                        "Fencing Material"
                                                    )
                                                }}</label>
                                                <input
                                                    type="text"
                                                    class="filter-input"
                                                    id="fencing_material"
                                                    v-model="
                                                        form.fencing_material
                                                    "
                                                    :class="{
                                                        'is-invalid':
                                                            formErrors.fencing_material,
                                                    }"
                                                />
                                                <div
                                                    class="invalid-feedback"
                                                    v-if="
                                                        formErrors.fencing_material
                                                    "
                                                >
                                                    {{
                                                        formErrors
                                                            .fencing_material[0]
                                                    }}
                                                </div>
                                            </div>

                                            <div class="filter-group">
                                                <label for="fencing_status">{{
                                                    translate("Fencing Status")
                                                }}</label>
                                                <input
                                                    type="text"
                                                    class="filter-input"
                                                    id="fencing_status"
                                                    v-model="
                                                        form.fencing_status
                                                    "
                                                    :class="{
                                                        'is-invalid':
                                                            formErrors.fencing_status,
                                                    }"
                                                />
                                                <div
                                                    class="invalid-feedback"
                                                    v-if="
                                                        formErrors.fencing_status
                                                    "
                                                >
                                                    {{
                                                        formErrors
                                                            .fencing_status[0]
                                                    }}
                                                </div>
                                            </div>

                                            <div class="filter-group">
                                                <label
                                                    for="parking_enclosure"
                                                    >{{
                                                        translate(
                                                            "Parking Enclosure"
                                                        )
                                                    }}</label
                                                >
                                                <Multiselect
                                                    v-model="
                                                        form.parking_enclosure
                                                    "
                                                    :options="YesNoOptions"
                                                    :searchable="true"
                                                    :class="{
                                                        'invalid-bg':
                                                            formErrors.parking_enclosure,
                                                    }"
                                                />
                                                <div
                                                    class="invalid-feedback"
                                                    v-if="
                                                        formErrors.parking_enclosure
                                                    "
                                                >
                                                    {{
                                                        formErrors
                                                            .parking_enclosure[0]
                                                    }}
                                                </div>
                                            </div>

                                            <div class="filter-group">
                                                <label for="private_bath">{{
                                                    translate("Private Bath")
                                                }}</label>
                                                <Multiselect
                                                    v-model="form.private_bath"
                                                    :options="YesNoOptions"
                                                    :searchable="true"
                                                    :class="{
                                                        'invalid-bg':
                                                            formErrors.private_bath,
                                                    }"
                                                />
                                                <div
                                                    class="invalid-feedback"
                                                    v-if="
                                                        formErrors.private_bath
                                                    "
                                                >
                                                    {{
                                                        formErrors
                                                            .private_bath[0]
                                                    }}
                                                </div>
                                            </div>

                                            <div class="filter-group">
                                                <label for="outdoor_shower">{{
                                                    translate("Outdoor Shower")
                                                }}</label>
                                                <Multiselect
                                                    v-model="
                                                        form.outdoor_shower
                                                    "
                                                    :options="YesNoOptions"
                                                    :searchable="true"
                                                    :class="{
                                                        'invalid-bg':
                                                            formErrors.outdoor_shower,
                                                    }"
                                                />
                                                <div
                                                    class="invalid-feedback"
                                                    v-if="
                                                        formErrors.outdoor_shower
                                                    "
                                                >
                                                    {{
                                                        formErrors
                                                            .outdoor_shower[0]
                                                    }}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="modal-actions">
                                <button
                                    type="submit"
                                    class="action-btn btn-primary"
                                    v-if="formStatus"
                                >
                                    {{ translate("Search") }}
                                </button>
                                <button
                                    class="action-btn btn-primary"
                                    type="button"
                                    disabled
                                    v-else
                                >
                                    {{ translate("Searching") }}
                                    <span
                                        class="spinner-border spinner-border-sm"
                                        role="status"
                                        aria-hidden="true"
                                    ></span>
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <button
                style="display: none"
                ref="closefilterModal"
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
            >
                Close
            </button>
        </div>
    </Master>
</template>

<script>
import Master from "@components/layout/Master.vue";
import Map from "@components/Map.vue";
import Multiselect from "@vueform/multiselect";
import axios from "axios";

export default {
    components: {
        Master,
        Multiselect,
        Map,
    },
    props: ["location"],
    created() {
        this.pluckCommunities();
        this.pluckHoas();
        this.pluckSchools();
        this.sortProperties();
    },
    data() {
        return {
            sortingOptions: [
                "Homes for You",
                "Price (High to Low)",
                "Price (Low to High)",
                "Newest",
                "Bedrooms",
                "Square Feet",
                "Lot Size",
            ],
            sort_by: "Newest",
            bathroom: 0,
            bedrooms: 0,
            total_homes: 0,
            YesNoOptions: ["Yes", "No"],
            communities_options: [],
            schoolOptions: [],
            hoasOptions: [],
            homes: [],
            formErrors: [],
            form: {
                // Your existing form structure
                city: "",
                state: "",
                zip_code: "",
                // ... other form fields
            },
            formStatus: 1,
            loadmap: false,
            main_search_field: this.location ?? "",
            min_price: "",
            max_price: "",
            min_square_feet: "",
            max_square_feet: "",
            min_lot_size: "",
            max_lot_size: "",
            is_open_house: "",
        };
    },
    methods: {
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
            this.is_open_house = "";
            this.sortProperties();
        },
        // ... your other methods remain the same
        setAltImg(event) {
            event.target.src = "/images/default_image.png";
        },
        pluckCommunities() {
            axios
                .get("/api/communities/pluck")
                .then((response) => {
                    this.communities_options = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        pluckSchools() {
            axios
                .get("/api/schools/pluck/")
                .then((response) => {
                    this.schoolOptions = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        pluckHoas() {
            axios
                .get("/api/home/owners/pluck")
                .then((response) => {
                    this.hoasOptions = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        sortProperties() {
            let formData = new FormData();
            formData.append("sort_by", this.sort_by ?? "");
            axios
                .post("/api/homes/sort", formData)
                .then((response) => {
                    this.homes = response.data.properties;
                    this.loadmap = true;
                    this.total_homes = response.data.total_homes;
                    this.formErrors = [];
                })
                .catch((error) => {
                    toastr.error(
                        error.response?.data?.message || "An error occurred."
                    );
                    if (error.response?.data?.errors) {
                        this.formErrors = error.response.data.errors;
                    }
                });
        },
        quickSearch() {
            let formData = new FormData();
            formData.append("is_open_house", this.is_open_house ?? "");
            formData.append("main_search_field", this.main_search_field ?? "");
            formData.append("min_price", this.min_price ?? "");
            formData.append("max_price", this.max_price ?? "");
            formData.append("min_square_feet", this.min_square_feet ?? "");
            formData.append("max_square_feet", this.max_square_feet ?? "");
            formData.append("min_lot_size", this.min_lot_size ?? "");
            formData.append("max_lot_size", this.max_lot_size ?? "");
            formData.append("bathroom", this.bathroom ?? "");
            formData.append("bedrooms", this.bedrooms ?? "");

            axios
                .post("/api/quick/search", formData)
                .then((response) => {
                    this.homes = response.data.properties;
                    this.total_homes = response.data.total_homes;
                    this.loadmap = true;
                    this.formErrors = [];
                })
                .catch((error) => {
                    toastr.error(
                        error.response?.data?.message || "An error occurred."
                    );
                    if (error.response?.data?.errors) {
                        this.formErrors = error.response.data.errors;
                    }
                });
        },
        searchHomes() {
            this.formStatus = 0;
            let formData = new FormData();
            // Append your form data as before
            Object.keys(this.form).forEach((key) => {
                formData.append(key, this.form[key] ?? "");
            });

            axios
                .post("/api/main/filter", formData)
                .then((response) => {
                    this.homes = response.data.properties;
                    this.total_homes = response.data.total_homes;
                    this.loadmap = true;
                    this.formStatus = 1;
                    this.formErrors = [];
                })
                .catch((error) => {
                    this.formStatus = 1;
                    toastr.error(
                        error.response?.data?.message || "An error occurred."
                    );
                    if (error.response?.data?.errors) {
                        this.formErrors = error.response.data.errors;
                    }
                });
        },
        formatPrice(price) {
            return Math.floor(price).toLocaleString();
        },
    },
};
</script>

<style scoped>
/* Filter Section */
.filter-section {
    padding: 2rem 0;
    background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);
}

.filter-card {
    background: white;
    border-radius: 24px;
    padding: 2.5rem;
    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.08);
    border: 1px solid #f1f5f9;
}

.filter-header {
    display: flex;
    align-items: center;
    gap: 1rem;
    margin-bottom: 2rem;
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
    margin-right: 10px;
}

.section-title {
    font-size: 1.6rem;
    font-weight: 700;
    color: #1a365d;
    margin: 0;
}

/* Filter Grid */
.filter-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 1.5rem;
    margin-bottom: 2rem;
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
}

.filter-input {
    padding: 0.75rem 1rem;
    border: 1px solid #e2e8f0;
    border-radius: 12px;
    background: #f8fafc;
    transition: all 0.3s ease;
    font-size: 0.95rem;
}

.filter-input:focus {
    outline: none;
    border-color: hsl(213 71% 45%);
    background: white;
    box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
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
    padding: 0.5rem 1rem;
    border: 1px solid #e2e8f0;
    border-radius: 8px;
    background: white;
    color: #64748b;
    font-weight: 500;
    transition: all 0.3s ease;
    cursor: pointer;
}

.filter-btn:hover {
    border-color: hsl(213 71% 45%);
    color: hsl(213 71% 45%);
}

.filter-btn-active {
    background: linear-gradient(to right, hsl(213 71% 45%), hsl(213 71% 30%));
    border-color: hsl(213 71% 45%);
    color: white;
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
}

.toggle-slider {
    width: 50px;
    height: 26px;
    background: #e2e8f0;
    border-radius: 25px;
    position: relative;
    transition: all 0.3s ease;
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
}

.toggle-input:checked + .toggle-label .toggle-slider {
    background: hsl(213 71% 45%);
}

.toggle-input:checked + .toggle-label .toggle-slider::before {
    transform: translateX(24px);
}

.toggle-text {
    font-weight: 500;
    color: #1a365d;
}

/* Action Buttons */
.filter-actions {
    display: flex;
    gap: 1rem;
    justify-content: flex-end;
    flex-wrap: wrap;
}

.action-btn {
    padding: 0.75rem 2rem;
    border-radius: 12px;
    font-weight: 600;
    text-decoration: none;
    transition: all 0.3s ease;
    border: 2px solid transparent;
    cursor: pointer;
}

.btn-primary {
    background: linear-gradient(to right, hsl(213 71% 45%), hsl(213 71% 30%));
    color: white;
}

.btn-primary:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 20px rgba(59, 130, 246, 0.3);
}

.btn-outline {
    background: transparent;
    border-color: #e2e8f0;
    color: #64748b;
}

.btn-outline:hover {
    background: #f8fafc;
    border-color: hsl(213 71% 45%);
    color: hsl(213 71% 45%);
    transform: translateY(-2px);
}

/* Results Section */
.content-section {
    padding: 3rem 0;
}

.content-card {
    background: white;
    border-radius: 24px;
    padding: 2.5rem;
    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.08);
    border: 1px solid #f1f5f9;
}

.results-header {
    display: flex;
    justify-content: between;
    align-items: center;
    margin-bottom: 2rem;
    flex-wrap: wrap;
    gap: 1rem;
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

.sort-section {
    display: flex;
    align-items: center;
    gap: 1rem;
}

.sort-label {
    font-weight: 600;
    color: #1a365d;
}

.sort-select {
    min-width: 200px;
}

/* Homes Grid */
.homes-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
    gap: 2rem;
}

.home-card {
    background: white;
    border-radius: 16px;
    overflow: hidden;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
    border: 1px solid #f1f5f9;
    transition: all 0.3s ease;
    position: relative;
}

.home-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 30px rgba(0, 0, 0, 0.12);
    border-color: hsl(213 71% 45%);
}

.home-card-inner {
    display: flex;
    flex-direction: column;
    height: 100%;
}

/* Badge */
.home-badge {
    position: absolute;
    top: 1rem;
    left: 1rem;
    color: white;
    padding: 0.5rem 1rem;
    border-radius: 20px;
    font-size: 0.8rem;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    z-index: 2;
}

.home-badge.quick-move {
    background: linear-gradient(to right, hsl(213 71% 45%), hsl(213 71% 30%));
}

.home-badge.open-house {
    background: rgb(22 163 74 / var(--tw-bg-opacity, 1));
}

/* Image */
.home-image {
    position: relative;
    height: 200px;
    overflow: hidden;
}

.home-image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.3s ease;
}

.home-card:hover .home-image img {
    transform: scale(1.05);
}

.incentive-badge {
    position: absolute;
    bottom: 1rem;
    left: 1rem;
    background: linear-gradient(135deg, #dc2626, #b91c1c);
    color: white;
    padding: 0.4rem 0.8rem;
    border-radius: 20px;
    font-size: 0.75rem;
    font-weight: 600;
}

/* Content */
.home-content {
    padding: 1.5rem;
    flex-grow: 1;
    display: flex;
    flex-direction: column;
}

.home-price {
    font-size: 1.5rem;
    font-weight: 700;
    color: #1a365d;
    margin-bottom: 0.5rem;
}

.home-title {
    font-size: 1.1rem;
    font-weight: 600;
    color: #1a365d;
    margin-bottom: 0.5rem;
    line-height: 1.3;
}

.home-address {
    color: #64748b;
    font-size: 0.9rem;
    margin-bottom: 1rem;
    line-height: 1.4;
}

/* Features */
.home-features {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 1rem;
    margin-bottom: 1.5rem;
    padding: 1rem 0;
    border-top: 1px solid #e2e8f0;
    border-bottom: 1px solid #e2e8f0;
}

.feature {
    display: flex;
    align-items: center;
    gap: 0.5rem;
}

.feature i {
    color: hsl(213 71% 45%);
    font-size: 1.1rem;
    width: 20px;
    text-align: center;
}

.feature-value {
    font-size: 1rem;
    font-weight: 600;
    color: #1a365d;
}

.feature-label {
    font-size: 0.8rem;
    color: #64748b;
    text-transform: lowercase;
    margin-left: 0.25rem;
}

/* View Details Button */
.view-details-btn {
    display: inline-block;
    background: linear-gradient(to right, hsl(213 71% 45%), hsl(213 71% 30%));
    color: white;
    text-align: center;
    padding: 0.75rem 1.5rem;
    border-radius: 8px;
    text-decoration: none;
    font-weight: 600;
    font-size: 0.9rem;
    transition: all 0.3s ease;
    margin-top: auto;
    border: none;
    cursor: pointer;
}

.view-details-btn:hover {
    background: linear-gradient(to right, hsl(213 71% 45%), hsl(213 71% 30%));
    transform: translateY(-2px);
    box-shadow: 0 8px 20px rgba(59, 130, 246, 0.3);
    color: white;
    text-decoration: none;
}

/* Responsive Design */
@media (max-width: 768px) {
    .homes-grid {
        grid-template-columns: 1fr;
        gap: 1.5rem;
    }

    .home-features {
        grid-template-columns: repeat(4, 1fr);
    }

    .home-content {
        padding: 1.25rem;
    }

    .feature {
        flex-direction: column;
        text-align: center;
        gap: 0.25rem;
    }

    .feature i {
        margin-bottom: 0.25rem;
    }
}

@media (max-width: 480px) {
    .home-features {
        grid-template-columns: repeat(2, 1fr);
    }

    .home-price {
        font-size: 1.3rem;
    }

    .home-title {
        font-size: 1rem;
    }

    .feature {
        flex-direction: row;
        text-align: left;
    }
}

/* Map Section */
.map-section {
    padding: 0;
}

.map-container {
    height: 600px;
    background: #f8fafc;
}

/* Modal Styling */
.filter-modal-content {
    border-radius: 24px;
    overflow: hidden;
}

.modal-header {
    background: linear-gradient(135deg, #1a365d 0%, #2d3748 100%);
    color: white;
    border-bottom: none;
    padding: 2rem;
}

.modal-header .section-icon {
    width: 40px;
    height: 40px;
    font-size: 1.2rem;
}

.modal-title {
    font-size: 1.4rem;
    font-weight: 600;
    margin: 0;
}

.modal-body {
    padding: 2rem;
}

.modal-actions {
    display: flex;
    justify-content: flex-end;
    margin-top: 2rem;
}

/* Policy Section for Modal */
.policy-section {
    margin-bottom: 2rem;
    padding: 1.5rem;
    background: #f8fafc;
    border-radius: 16px;
    border: 1px solid #e2e8f0;
}

/* Animations */
@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.filter-card,
.content-card {
    animation: fadeInUp 0.6s ease-out;
}

.home-card {
    animation: fadeInUp 0.6s ease-out;
}

.home-card:nth-child(1) {
    animation-delay: 0.1s;
}
.home-card:nth-child(2) {
    animation-delay: 0.2s;
}
.home-card:nth-child(3) {
    animation-delay: 0.3s;
}

/* Responsive Design */
@media (max-width: 768px) {
    .filter-section {
        padding: 1.5rem 0;
    }

    .filter-card {
        padding: 1.5rem;
        border-radius: 20px;
    }

    .filter-grid {
        grid-template-columns: 1fr;
    }

    .range-inputs {
        grid-template-columns: 1fr;
    }

    .filter-header {
        flex-direction: column;
        text-align: center;
        gap: 1rem;
    }

    .results-header {
        flex-direction: column;
        align-items: flex-start;
    }

    .sort-section {
        width: 100%;
    }

    .sort-select {
        min-width: 100%;
    }

    .homes-grid {
        grid-template-columns: 1fr;
    }

    .filter-actions {
        justify-content: center;
    }

    .action-btn {
        width: 100%;
        max-width: 250px;
    }
}

@media (max-width: 576px) {
    .section-title {
        font-size: 1.4rem;
    }

    .section-icon {
        width: 40px;
        height: 40px;
        font-size: 1.2rem;
    }

    .modal-body {
        padding: 1.5rem;
    }
}

/* Modal Styling */
.filter-modal-content {
    border-radius: 24px;
    overflow: hidden;
    border: none;
    box-shadow: 0 25px 50px rgba(0, 0, 0, 0.15);
}

.modal-header {
    background: linear-gradient(135deg, #1a365d 0%, #2d3748 100%);
    color: white;
    border-bottom: none;
    padding: 2rem;
    position: relative;
}

.modal-header::before {
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

.modal-header .section-icon {
    width: 40px;
    height: 40px;
    background: rgba(255, 255, 255, 0.2);
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-size: 1.2rem;
}

.modal-title {
    font-size: 1.4rem;
    font-weight: 600;
    margin: 0;
}

.modal-body {
    padding: 2rem;
    background: #f8fafc;
}

/* Filter Accordion */
.filter-accordion {
    display: flex;
    flex-direction: column;
    gap: 1.5rem;
}

/* Policy Section Styling for Modal */
.policy-section {
    background: white;
    border-radius: 16px;
    padding: 2rem;
    border: 1px solid #e2e8f0;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
    transition: all 0.3s ease;
    position: relative;
    overflow: hidden;
}

.policy-section:hover {
    border-color: hsl(213 71% 45%);
    transform: translateY(-2px);
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
}

.policy-section::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 4px;
    height: 100%;
    background: linear-gradient(to right, hsl(213 71% 45%), hsl(213 71% 30%));
    border-radius: 2px 0 0 2px;
}

.section-header {
    display: flex;
    align-items: center;
    gap: 1rem;
    margin-bottom: 1.5rem;
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
    font-size: 1.3rem;
    font-weight: 700;
    color: #1a365d;
    margin: 0;
}

.section-content {
    color: #64748b;
}

/* Filter Grid for Modal */
.filter-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 1.5rem;
}

.filter-group {
    display: flex;
    flex-direction: column;
    gap: 0.5rem;
}

.filter-group label {
    font-weight: 600;
    color: #1a365d;
    font-size: 0.9rem;
    margin-bottom: 0.25rem;
}

.filter-input {
    padding: 0.75rem 1rem;
    border: 1px solid #e2e8f0;
    border-radius: 12px;
    background: #f8fafc;
    transition: all 0.3s ease;
    font-size: 0.95rem;
    width: 100%;
}

.filter-input:focus {
    outline: none;
    border-color: hsl(213 71% 45%);
    background: white;
    box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
}

.filter-input.is-invalid {
    border-color: #dc3545;
    background: #fff5f5;
}

.invalid-feedback {
    display: block;
    color: #dc3545;
    font-size: 0.875rem;
    margin-top: 0.25rem;
}

/* Multiselect Styling */
:deep(.multiselect) {
    border-radius: 12px;
    border: 1px solid #e2e8f0;
    background: #f8fafc;
    transition: all 0.3s ease;
}

:deep(.multiselect:focus) {
    border-color: hsl(213 71% 45%);
    box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
}

:deep(.multiselect.invalid-bg) {
    border-color: #dc3545;
    background: #fff5f5;
}

:deep(.multiselect-dropdown) {
    border-radius: 12px;
    border: 1px solid #e2e8f0;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
}

:deep(.multiselect-option) {
    padding: 0.75rem 1rem;
    border-radius: 8px;
    margin: 0.25rem;
}

:deep(.multiselect-option.is-selected) {
    background: linear-gradient(to right, hsl(213 71% 45%), hsl(213 71% 30%));
    color: white;
}

:deep(.multiselect-option.is-pointed) {
    background: #f1f5f9;
}

/* Modal Actions */
.modal-actions {
    display: flex;
    justify-content: flex-end;
    margin-top: 2rem;
    padding-top: 2rem;
    border-top: 1px solid #e2e8f0;
}

.action-btn {
    padding: 0.75rem 2rem;
    border-radius: 12px;
    font-weight: 600;
    text-decoration: none;
    transition: all 0.3s ease;
    border: 2px solid transparent;
    cursor: pointer;
    min-width: 120px;
}

.btn-primary {
    background: linear-gradient(to right, hsl(213 71% 45%), hsl(213 71% 30%));
    color: white;
}

.btn-primary:hover:not(:disabled) {
    transform: translateY(-2px);
    box-shadow: 0 8px 20px rgba(59, 130, 246, 0.3);
}

.btn-primary:disabled {
    opacity: 0.7;
    cursor: not-allowed;
}

/* Responsive Design for Modal */
@media (max-width: 768px) {
    .modal-dialog {
        margin: 1rem;
    }

    .modal-header {
        padding: 1.5rem;
    }

    .modal-body {
        padding: 1.5rem;
    }

    .policy-section {
        padding: 1.5rem;
    }

    .filter-grid {
        grid-template-columns: 1fr;
    }

    .section-header {
        flex-direction: column;
        text-align: center;
        gap: 1rem;
    }

    .modal-actions {
        justify-content: center;
    }

    .action-btn {
        width: 100%;
        max-width: 200px;
    }
}

@media (max-width: 576px) {
    .modal-header .section-icon {
        width: 36px;
        height: 36px;
        font-size: 1rem;
    }

    .modal-title {
        font-size: 1.2rem;
    }

    .section-title {
        font-size: 1.1rem;
    }

    .section-icon {
        width: 40px;
        height: 40px;
        font-size: 1.2rem;
    }
}

/* Animation */
@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.filter-modal-content {
    animation: fadeInUp 0.4s ease-out;
}

.policy-section {
    animation: fadeInUp 0.6s ease-out;
}

.policy-section:nth-child(2) {
    animation-delay: 0.1s;
}
</style>
