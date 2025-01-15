<template>
    <Master>
        <div class="accordion" id="mainAccordion">
            <div class="accordion-item">
                <h2 class="accordion-header">
                    <button
                        class="accordion-button c-theme-color"
                        style="height: 20px !important"
                        type="button"
                        data-bs-toggle="collapse"
                        data-bs-target="#mainAccordionCollapse"
                        aria-expanded="true"
                        aria-controls="mainAccordionCollapse"
                    >
                        Filter
                    </button>
                </h2>
                <div
                    id="mainAccordionCollapse"
                    class="accordion-collapse collapse show"
                    data-bs-parent="#mainAccordion"
                >
                    <div class="accordion-body">
                        <div class="row mb-2">
                            <div class="col-4 col">
                                <input
                                    type="text"
                                    class="form-control"
                                    v-model="main_search_field"
                                    :placeholder="
                                        translate(
                                            'Enter an address, city or ZIP code'
                                        )
                                    "
                                    @change="quickSearch"
                                />
                            </div>
                            <div class="col-4 col">
                                <div class="d-flex">
                                    <input
                                        type="number"
                                        class="form-control me-1"
                                        v-model="min_price"
                                        placeholder="Min Price"
                                        @change="quickSearch"
                                    />
                                    <input
                                        type="number"
                                        class="form-control"
                                        v-model="max_price"
                                        placeholder="Max Price"
                                        @change="quickSearch"
                                    />
                                </div>
                            </div>

                            <div class="col-4 col">
                                <div class="d-flex">
                                    <input
                                        type="number"
                                        class="form-control me-1"
                                        v-model="min_square_feet"
                                        placeholder="Min SQRF"
                                        @change="quickSearch"
                                    />
                                    <input
                                        type="number"
                                        class="form-control"
                                        v-model="max_square_feet"
                                        placeholder="Max SQRF"
                                        @change="quickSearch"
                                    />
                                </div>
                            </div>
                            <div class="mt-2 col-4 col">
                                <div class="d-flex">
                                    <input
                                        type="number"
                                        class="form-control me-1"
                                        v-model="min_lot_size"
                                        placeholder="Min Lot Size"
                                        @change="quickSearch"
                                    />
                                    <input
                                        type="number"
                                        class="form-control"
                                        v-model="max_lot_size"
                                        placeholder="Max Lot Size"
                                        @change="quickSearch"
                                    />
                                </div>
                            </div>

                            <div class="mt-2 col-3 col">
                                <label for="">Bathrooms</label>

                                <a
                                    href="#"
                                    class="btn"
                                    :class="{
                                        'btn-outline-warning': bathroom === 1,
                                        '': bathroom !== 1,
                                    }"
                                    @click.prevent="
                                        bathroom = 1;
                                        quickSearch();
                                    "
                                >
                                    1
                                </a>
                                <a
                                    href="#"
                                    class="btn"
                                    :class="{
                                        'btn-outline-warning': bathroom === 2,
                                        '': bathroom !== 2,
                                    }"
                                    @click.prevent="
                                        bathroom = 2;
                                        quickSearch();
                                    "
                                >
                                    2
                                </a>
                                <a
                                    href="#"
                                    class="btn"
                                    :class="{
                                        'btn-outline-warning': bathroom === 3,
                                        '': bathroom !== 3,
                                    }"
                                    @click.prevent="
                                        bathroom = 3;
                                        quickSearch();
                                    "
                                >
                                    3
                                </a>
                                <a
                                    href="#"
                                    class="btn"
                                    :class="{
                                        'btn-outline-warning': bathroom === 4,
                                        '': bathroom !== 4,
                                    }"
                                    @click.prevent="
                                        bathroom = 4;
                                        quickSearch();
                                    "
                                >
                                    4
                                </a>
                                <a
                                    href="#"
                                    class="btn"
                                    :class="{
                                        'btn-outline-warning': bathroom === 5,
                                        '': bathroom !== 5,
                                    }"
                                    @click.prevent="
                                        bathroom = 5;
                                        quickSearch();
                                    "
                                >
                                    5
                                </a>
                            </div>

                            <div class="mt-2 col-3 col">
                                <label for="">Bedrooms</label>
                                <a
                                    href="#"
                                    class="btn"
                                    :class="{
                                        'btn-outline-warning': bedrooms === 1,
                                        '': bedrooms !== 1,
                                    }"
                                    @click.prevent="
                                        bedrooms = 1;
                                        quickSearch();
                                    "
                                >
                                    1
                                </a>
                                <a
                                    href="#"
                                    class="btn"
                                    :class="{
                                        'btn-outline-warning': bedrooms === 2,
                                        '': bedrooms !== 2,
                                    }"
                                    @click.prevent="
                                        bedrooms = 2;
                                        quickSearch();
                                    "
                                >
                                    2
                                </a>
                                <a
                                    href="#"
                                    class="btn"
                                    :class="{
                                        'btn-outline-warning': bedrooms === 3,
                                        '': bedrooms !== 3,
                                    }"
                                    @click.prevent="
                                        bedrooms = 3;
                                        quickSearch();
                                    "
                                >
                                    3
                                </a>
                                <a
                                    href="#"
                                    class="btn"
                                    :class="{
                                        'btn-outline-warning': bedrooms === 4,
                                        '': bedrooms !== 4,
                                    }"
                                    @click.prevent="
                                        bedrooms = 4;
                                        quickSearch();
                                    "
                                >
                                    4
                                </a>
                                <a
                                    href="#"
                                    class="btn"
                                    :class="{
                                        'btn-outline-warning': bedrooms === 5,
                                        '': bedrooms !== 5,
                                    }"
                                    @click.prevent="
                                        bedrooms = 5;
                                        quickSearch();
                                    "
                                >
                                    5
                                </a>
                            </div>

                            <div class="mt-3 col-2 col">
                                <label class="custom-checkbox">
                                    <input
                                        type="checkbox"
                                        v-model="is_open_house"
                                        @change="quickSearch"
                                    />
                                    <span class="checkmark"></span>
                                    <!-- Custom checkbox styling -->
                                    Is Open House
                                </label>
                            </div>

                            <div class="mt-3 col d-flex justify-content-end">
                                <button
                                    ref="openFilter"
                                    data-bs-target="#filterModal"
                                    data-bs-toggle="modal"
                                    class="btn btn-primary w-30"
                                >
                                    Advance
                                </button>
                                <button
                                    @click="resetForm"
                                    class="btn btn-primary w-30 ms-1"
                                >
                                    Reset
                                </button>
                            </div>
                            <!-- <div class="mt-2 col-1">
                                <button
                                    ref="openFilter"
                                    data-bs-target="#filterModal"
                                    data-bs-toggle="modal"
                                    class="btn btn-primary beat"
                                >
                                    Advance
                                </button>

                                
                            </div> -->
                        </div>

                        <!-- <div class="row">
                            <div class="col-12 d-flex justify-content-end mt-4">
                                <button
                                    class="btn btn-primary"
                                    @click="main_searching"
                                >
                                    Search
                                </button>
                            </div>
                        </div> -->
                    </div>
                </div>
            </div>
        </div>

        <div class="c-section-main-details container-fluid mt-1">
            <div class="row">
                <div class="col-md-6">
                    <div class="row mx-4">
                        <div class="col-md-4">
                            <b>Brand New Homes Vegas</b>
                            <br />
                            <small>{{ total_homes }} results</small>
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-6">
                            <b>Sort Brand New Homes Vegas</b>
                            <br />
                            <div class="dropdown">
                                <Multiselect
                                    v-model="sort_by"
                                    :options="sortingOptions"
                                    :placeholder="
                                        translate('Sort homes for you')
                                    "
                                    :searchable="true"
                                    @select="sortProperties"
                                />
                            </div>
                            <br />
                        </div>
                    </div>

                    <!-- Scrollable content container -->

                    <div
                        v-if="homes && homes.length > 0"
                        class="scrollable-content"
                    >
                        <div class="mx-4">
                            <div class="row g-2">
                                <div
                                    v-for="home in homes"
                                    :key="home.id"
                                    class="col-md-6 mb-3"
                                >
                                    <a
                                        class="text-decoration-none"
                                        :href="
                                            '/home-details/' + home.property_id
                                        "
                                    >
                                        <GlobalCard
                                            :badge="
                                                home.is_open_house
                                                    ? 'Open House'
                                                    : home.incentive
                                                    ? 'Incentive Home'
                                                    : 'Quick Move In'
                                            "
                                            :main_image="
                                                home.main_image ??
                                                '/images/default-home-image.png'
                                            "
                                            :title="home.title"
                                            :address="home.address"
                                            :bedrooms="home.bedrooms"
                                            :price="home.price"
                                            :bathrooms="home.bathrooms"
                                            :square_feet="home.square_feet"
                                            :garages="home.garages"
                                        />

                                        <!-- <div class="card">
                                            <div class="image-wrapper">
                                                <img
                                                    :src="
                                                        home.main_image ??
                                                        '/images/default-home-image.png'
                                                    "
                                                    class="card-img-top"
                                                    :alt="home.title"
                                                    @error="setAltImg"
                                                />

                                               
                                                <div
                                                    v-if="home.is_open_house"
                                                    class="card-img-overlay c-card-img-overlay-flash-sale"
                                                >
                                                    <span
                                                        class="badge rounded-pill bg-white text-dark"
                                                    >
                                                        Open House
                                                    </span>
                                                </div>

                                                
                                                <div
                                                    v-if="home.incentive"
                                                    class="bottom-bar text-white"
                                                >
                                                    Incentive Home
                                                </div>
                                            </div>

                                            <div class="card-body text-start">
                                                <p>
                                                    <span v-if="home.title">
                                                        <b>{{ home.title }} </b
                                                        ><br />
                                                    </span>
                                                    <span v-if="home.price">
                                                        <b>
                                                            ${{
                                                                formatPrice(
                                                                    home.price
                                                                )
                                                            }} </b
                                                        ><br />
                                                    </span>
                                                    <span
                                                        v-if="home.square_feet"
                                                    >
                                                        <i
                                                            class="bi bi-aspect-ratio"
                                                        ></i>
                                                        {{ home.square_feet }}
                                                        sq ft<br />
                                                    </span>
                                                    <span v-if="home.bedrooms">
                                                        <i
                                                            class="bi bi-house-door"
                                                        ></i>
                                                        {{ home.bedrooms }}
                                                        <br />
                                                    </span>
                                                    <span
                                                        v-if="
                                                            home.property_type
                                                        "
                                                    >
                                                        <i
                                                            class="bi bi-building"
                                                        ></i>
                                                        <small>{{
                                                            home.property_type
                                                        }}</small
                                                        ><br />
                                                    </span>
                                                </p>
                                            </div>
                                        </div> -->
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div
                    class="col-md-6"
                    style="
                        position: sticky;
                        top: 0;
                        height: 550px;
                        overflow: auto;
                    "
                >
                    <Map v-if="loadmap" :homes="homes" />
                    <!-- <div
                        class="container mb-2"
                        ref="map"
                        style="height: 400px; width: 100%"
                    ></div> -->
                </div>
            </div>
        </div>

        <!-- Seraching Filter -->
        <div class="modal fade" id="filterModal">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header interactive-banner">
                        <h5 class="modal-title ms-3">
                            {{ translate("Advance Filter") }}
                        </h5>

                        <!-- <button
                            ref="closeDatesModal"
                            type="button"
                            class="btn-close text-white"
                            data-bs-dismiss="modal"
                            aria-label="Close"
                        ></button> -->
                    </div>
                    <div class="modal-body">
                        <form @submit.prevent="searchHomes">
                            <div class="accordion" id="accordionExample">
                                <div class="accordion-item">
                                    <h2 class="accordion-header">
                                        <button
                                            class="accordion-button"
                                            type="button"
                                            data-bs-toggle="collapse"
                                            data-bs-target="#collapseOne"
                                            aria-expanded="true"
                                            aria-controls="collapseOne"
                                        >
                                            Property
                                        </button>
                                    </h2>
                                    <div
                                        id="collapseOne"
                                        class="accordion-collapse collapse show"
                                        data-bs-parent="#accordionExample"
                                    >
                                        <div class="accordion-body">
                                            <div class="row g-3">
                                                <!-- Main Property Fields -->

                                                <div class="col-12 col-md-4">
                                                    <label for="city">{{
                                                        translate("City")
                                                    }}</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
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

                                                <div class="col-12 col-md-4">
                                                    <label for="state">{{
                                                        translate("State")
                                                    }}</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
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
                                                        {{
                                                            formErrors.state[0]
                                                        }}
                                                    </div>
                                                </div>
                                                <div class="col-12 col-md-4">
                                                    <label for="zip_code">{{
                                                        translate("ZIP Code")
                                                    }}</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id="zip_code"
                                                        v-model="form.zip_code"
                                                        :class="{
                                                            'is-invalid':
                                                                formErrors.zip_code,
                                                        }"
                                                    />
                                                    <div
                                                        class="invalid-feedback"
                                                        v-if="
                                                            formErrors.zip_code
                                                        "
                                                    >
                                                        {{
                                                            formErrors
                                                                .zip_code[0]
                                                        }}
                                                    </div>
                                                </div>

                                                <div class="col-12 col-md-6">
                                                    <label for="community_id">{{
                                                        translate("Community")
                                                    }}</label>

                                                    <Multiselect
                                                        v-model="
                                                            form.community_id
                                                        "
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
                                                <div class="col-12 col-md-6">
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

                                                <div class="col-12 col-md-6">
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
                                                        v-if="
                                                            formErrors.school_id
                                                        "
                                                    >
                                                        {{
                                                            formErrors
                                                                .school_id[0]
                                                        }}
                                                    </div>
                                                </div>

                                                <div class="col-12 col-md-6">
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
                                                        {{
                                                            formErrors.hoa_id[0]
                                                        }}
                                                    </div>
                                                </div>

                                                <div class="col-12 col-md-6">
                                                    <label
                                                        for="property_type"
                                                        >{{
                                                            translate(
                                                                "Property Type"
                                                            )
                                                        }}</label
                                                    >
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id="property_type"
                                                        v-model="
                                                            form.property_type
                                                        "
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

                                                <div class="col-12 col-md-6">
                                                    <label for="listing_type">{{
                                                        translate(
                                                            "Listing Type"
                                                        )
                                                    }}</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id="listing_type"
                                                        v-model="
                                                            form.listing_type
                                                        "
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
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header">
                                        <button
                                            class="accordion-button"
                                            type="button"
                                            data-bs-toggle="collapse"
                                            data-bs-target="#collapseTwo"
                                            aria-expanded="true"
                                            aria-controls="collapseTwo"
                                        >
                                            Features
                                        </button>
                                    </h2>
                                    <div
                                        id="collapseTwo"
                                        class="accordion-collapse collapse"
                                        data-bs-parent="#accordionExample"
                                    >
                                        <div class="accordion-body">
                                            <div class="row g-3">
                                                <div class="col-12 col-md-3">
                                                    <label
                                                        for="fireplace_type"
                                                        >{{
                                                            translate(
                                                                "Fireplace Type"
                                                            )
                                                        }}</label
                                                    >
                                                    <input
                                                        type="text"
                                                        class="form-control"
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

                                                <div class="col-12 col-md-3">
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
                                                        class="form-control"
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

                                                <div class="col-12 col-md-3">
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
                                                        v-if="
                                                            formErrors.reach_in
                                                        "
                                                    >
                                                        {{
                                                            formErrors
                                                                .reach_in[0]
                                                        }}
                                                    </div>
                                                </div>

                                                <div class="col-12 col-md-3">
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
                                                        v-if="
                                                            formErrors.walk_in
                                                        "
                                                    >
                                                        {{
                                                            formErrors
                                                                .walk_in[0]
                                                        }}
                                                    </div>
                                                </div>

                                                <div class="col-12 col-md-3">
                                                    <label
                                                        for="laundry_closet"
                                                        >{{
                                                            translate(
                                                                "Laundry Closet"
                                                            )
                                                        }}</label
                                                    >
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

                                                <div class="col-12 col-md-3">
                                                    <label
                                                        for="bedroom_location"
                                                        >{{
                                                            translate(
                                                                "Bedroom Location"
                                                            )
                                                        }}</label
                                                    >
                                                    <input
                                                        type="text"
                                                        class="form-control"
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

                                                <div class="col-12 col-md-3">
                                                    <label
                                                        for="bathroom_type"
                                                        >{{
                                                            translate(
                                                                "Bathroom Type"
                                                            )
                                                        }}</label
                                                    >
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id="bathroom_type"
                                                        v-model="
                                                            form.bathroom_type
                                                        "
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

                                                <div class="col-12 col-md-3">
                                                    <label for="pool_shape">{{
                                                        translate("Pool Shape")
                                                    }}</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id="pool_shape"
                                                        v-model="
                                                            form.pool_shape
                                                        "
                                                        :class="{
                                                            'is-invalid':
                                                                formErrors.pool_shape,
                                                        }"
                                                    />
                                                    <div
                                                        class="invalid-feedback"
                                                        v-if="
                                                            formErrors.pool_shape
                                                        "
                                                    >
                                                        {{
                                                            formErrors
                                                                .pool_shape[0]
                                                        }}
                                                    </div>
                                                </div>

                                                <div class="col-12 col-md-3">
                                                    <label
                                                        for="water_features"
                                                        >{{
                                                            translate(
                                                                "Water Features"
                                                            )
                                                        }}</label
                                                    >
                                                    <input
                                                        type="text"
                                                        class="form-control"
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

                                                <div class="col-12 col-md-3">
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

                                                <div class="col-12 col-md-3">
                                                    <label
                                                        for="fencing_material"
                                                        >{{
                                                            translate(
                                                                "Fencing Material"
                                                            )
                                                        }}</label
                                                    >
                                                    <input
                                                        type="text"
                                                        class="form-control"
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

                                                <div class="col-12 col-md-3">
                                                    <label
                                                        for="fencing_status"
                                                        >{{
                                                            translate(
                                                                "Fencing Status"
                                                            )
                                                        }}</label
                                                    >
                                                    <input
                                                        type="text"
                                                        class="form-control"
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

                                                <div class="col-12 col-md-4">
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

                                                <div class="col-12 col-md-4">
                                                    <label for="private_bath">{{
                                                        translate(
                                                            "Private Bath"
                                                        )
                                                    }}</label>
                                                    <Multiselect
                                                        v-model="
                                                            form.private_bath
                                                        "
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

                                                <div class="col-12 col-md-4">
                                                    <label
                                                        for="outdoor_shower"
                                                        >{{
                                                            translate(
                                                                "Outdoor Shower"
                                                            )
                                                        }}</label
                                                    >
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
                            </div>

                            <div class="mt-3">
                                <button
                                    type="submit"
                                    class="btn btn-primary"
                                    v-if="formStatus"
                                >
                                    {{ translate("Search") }}
                                </button>
                                <button
                                    class="btn btn-primary"
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

        <!-- Seraching Filter -->
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

    mounted() {},
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
            sort_by: "Newest", // Default value
            bathroom: 0,
            bedrooms: 0,
            total_homes: 0,
            map: null,
            YesNoOptions: ["Yes", "No"],
            communities_options: [],
            schoolOptions: [],
            hoasOptions: [],

            homes: [],
            formErrors: [],
            markers: [],
            form: {
                // Main Property Fields
                user_id: null,
                city: "",
                state: "",
                zip_code: "",
                price: null,
                bedrooms: null,
                square_feet: null,
                lot_size: null,
                property_type: "",
                listing_type: "",

                hoa_id: null,

                cic: null,
                school_id: null,
                community_id: null,

                // Property Features Fields
                feature_id: null,
                name: "",
                fireplace_type: "",
                kitchen_pantry_type: "",
                reach_in: null,
                walk_in: null,
                laundry_closet: "",
                bedroom_location: "",
                bathroom_type: "",
                pool_shape: "",
                water_features: "",
                spa: null,
                fencing_material: "",
                fencing_status: "",
                parking_enclosure: "",
                private_bath: null,
                outdoor_shower: null,
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

            bathroom: "",
            bedrooms: "",
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
        // initMap() {
        //     const mapOptions = {
        //         center: { lat: 36.1699, lng: -115.1398 }, // Center the map to a default location or use first home's coordinates
        //         zoom: 10,
        //     };

        //     // Initialize the Google Map
        //     this.map = new google.maps.Map(this.$refs.map, mapOptions);

        //     // Add markers to the map after fetching community homes
        //     this.addMarkers();
        // },

        // addMarkers() {
        //     // Check if homes have data
        //     if (this.homes.length === 0) {
        //         console.warn("No community homes available to add markers.");
        //         return;
        //     }

        //     this.homes.forEach((home) => {
        //         const markerData = {
        //             lat: parseFloat(home.latitude), // Assuming latitude is part of the home object
        //             lng: parseFloat(home.longitude), // Assuming longitude is part of the home object
        //             title: home.title,
        //             description: home.description,
        //             home_image: home.main_image,
        //             url: "/home-details/" + home.property_id || "#", // Default to "#" if no URL is provided
        //         };

        //         const marker = new google.maps.Marker({
        //             position: { lat: markerData.lat, lng: markerData.lng },
        //             map: this.map,
        //             title: markerData.title,
        //             icon: {
        //                 url: "https://img.icons8.com/3d-fluency/94/home.png",
        //                 scaledSize: new google.maps.Size(50, 50),
        //             },
        //         });

        //         const infoWindow = new google.maps.InfoWindow({
        //     content: `
        //         <div style="max-width: 200px;">
        //             <h4>${markerData.title}</h4>
        //             <p>${markerData.description}</p>

        //         </div>`,
        // });

        //         marker.addListener("mouseover", () => {
        //             infoWindow.open(this.map, marker);
        //         });

        //         marker.addListener("mouseout", () => {
        //             infoWindow.close();
        //         });

        //         marker.addListener("click", () => {
        //             window.location.href = markerData.url; // Redirect to the URL
        //         });
        //     });
        // },
        openModal() {
            // Use Bootstrap's modal API to open the modal
            this.$refs.openFilter.click();
        },

        setAltImg(event) {
            event.target.src = "/images/default-home-image.png";
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

            // Submit the form data using axios
            axios
                .post("/api/homes/sort", formData, {
                    headers: {
                        "Content-Type": "multipart/form-data", // Set the content type for file uploads
                    },
                })
                .then((response) => {
                    this.formStatus = 1;
                    this.homes = response.data.properties;
                    this.loadmap = true;
                    this.total_homes = response.data.total_homes;

                    // Check if the response data is an array and has elements
                    this.formStatus = 1;
                    this.$refs.closefilterModal.click();
                    // this.initMap();

                    this.formErrors = [];
                })

                .catch((error) => {
                    this.formStatus = 1;
                    // Display error messages
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

            // Submit the form data using axios
            axios
                .post("/api/quick/search", formData, {
                    headers: {
                        "Content-Type": "multipart/form-data", // Set the content type for file uploads
                    },
                })
                .then((response) => {
                    this.formStatus = 1;
                    this.homes = response.data.properties;
                    this.total_homes = response.data.total_homes;
                    this.loadmap = true;

                    // Check if the response data is an array and has elements
                    this.formStatus = 1;
                    this.$refs.closefilterModal.click();
                    // this.initMap();

                    this.formErrors = [];
                })

                .catch((error) => {
                    this.formStatus = 1;
                    // Display error messages
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

            // Create a FormData object
            let formData = new FormData();

            // Append each form field individually

            formData.append("city", this.form.city ?? "");
            formData.append("state", this.form.state ?? "");
            formData.append("zip_code", this.form.zip_code ?? "");
            formData.append("price", this.form.price ?? null);
            formData.append("bedrooms", this.form.bedrooms ?? null);
            formData.append("square_feet", this.form.square_feet ?? null);
            formData.append("lot_size", this.form.lot_size ?? null);
            formData.append("property_type", this.form.property_type ?? "");
            formData.append("listing_type", this.form.listing_type ?? "");

            formData.append("hoa_id", this.form.hoa_id ?? null);

            formData.append("cic", this.form.cic ?? null);
            formData.append("school_id", this.form.school_id ?? null);
            formData.append("community_id", this.form.community_id ?? null);

            // Property Features Fields

            formData.append("fireplace_type", this.form.fireplace_type ?? "");
            formData.append(
                "kitchen_pantry_type",
                this.form.kitchen_pantry_type ?? ""
            );
            formData.append("reach_in", this.form.reach_in ?? null);
            formData.append("walk_in", this.form.walk_in ?? null);
            formData.append("laundry_closet", this.form.laundry_closet ?? "");
            formData.append(
                "bedroom_location",
                this.form.bedroom_location ?? ""
            );
            formData.append("bathroom_type", this.form.bathroom_type ?? "");

            formData.append("pool_shape", this.form.pool_shape ?? "");
            formData.append("water_features", this.form.water_features ?? "");
            formData.append("spa", this.form.spa ?? null);
            formData.append(
                "fencing_material",
                this.form.fencing_material ?? ""
            );
            formData.append("fencing_status", this.form.fencing_status ?? "");
            formData.append(
                "parking_enclosure",
                this.form.parking_enclosure ?? ""
            );
            formData.append("private_bath", this.form.private_bath ?? null);
            formData.append("outdoor_shower", this.form.outdoor_shower ?? null);

            // Submit the form data using axios
            axios
                .post("/api/main/filter", formData, {
                    headers: {
                        "Content-Type": "multipart/form-data", // Set the content type for file uploads
                    },
                })
                .then((response) => {
                    this.formStatus = 1;
                    this.homes = response.data.properties;
                    this.total_homes = response.data.total_homes;
                    this.loadmap = true;

                    // Check if the response data is an array and has elements
                    this.formStatus = 1;
                    this.$refs.closefilterModal.click();
                    // this.initMap();

                    this.formErrors = [];
                })

                .catch((error) => {
                    this.formStatus = 1;
                    // Display error messages
                    toastr.error(
                        error.response?.data?.message || "An error occurred."
                    );
                    if (error.response?.data?.errors) {
                        this.formErrors = error.response.data.errors;
                    }
                });
        },
        formatPrice(price) {
            return Math.floor(price); // Removes the decimal portion
        },
    },
};
</script>

<style scoped>
.carousel__slide {
    padding: 5px;
}

.carousel__viewport {
    perspective: 2000px;
}

.carousel__track {
    transform-style: preserve-3d;
}

.carousel__slide--sliding {
    transition: 0.5s;
}

.carousel__slide {
    opacity: 0.9;
    transform: rotateY(-20deg) scale(0.9);
}

.carousel__slide--active ~ .carousel__slide {
    transform: rotateY(20deg) scale(0.9);
}

.carousel__slide--prev {
    opacity: 1;
    transform: rotateY(-10deg) scale(0.9) !important;
}

.carousel__slide--next {
    opacity: 1;
    transform: rotateY(10deg) scale(0.9) !important;
}

.carousel__slide--active {
    opacity: 1;
    transform: rotateY(0) scale(1);
}
.c-card-img-overlay-name {
    top: unset;
    bottom: 120px;
    text-align: left;
    color: white;
}
.c-card-img-overlay-flash-sale {
    left: unset;
}

.beat {
    animation: beating 1s infinite;
}

@keyframes beating {
    0%,
    50% {
        transform: scale(1);
    }
    30% {
        transform: scale(1.1);
    }
}
.form-control {
    width: 100%;
}
@media (max-width: 768px) {
    .row .col,
    .row .col-auto {
        flex: 0 0 100%;
        max-width: 100%;
        margin-bottom: 10px;
    }
}

.card-img-top {
    object-fit: cover;
    width: 100%;

    width: 100%; /* Ensures the image spans the full width of its container */
    height: 140px; /* Fixed height for uniformity */
}
.scrollable-content {
    height: 500px; /* Adjust height as needed */
    overflow-y: auto;
    padding-right: 10px; /* Optional: Adds space to the right to avoid overlapping scrollbar */
}
.card {
    position: relative;
    overflow: hidden;
}
.card {
    position: relative;
    overflow: hidden;
}

.card-img-top {
    position: relative;
}
.card {
    position: relative;
    overflow: hidden;
}

.image-wrapper {
    position: relative;
}

.c-card-img-overlay-flash-sale {
    left: unset;
}
.c-card-img-overlay-flash-sale {
    left: unset;
}

/* Open House badge styling to keep it in its original place */

/* Incentive Home bar at the bottom of the image */
.bottom-bar {
    background-color: red; /* Customize the background color */
    color: white;
    text-align: center;
    font-size: 9px; /* Adjust font size as needed */
    padding: 5px 0; /* Adjust padding as needed */
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    z-index: 2;
    font-weight: bold;
}
</style>
