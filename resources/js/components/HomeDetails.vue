<template>
    <Master>
        <div class="property-detail-section">
            <div class="property-detail-section" v-if="Home">
                <div class="top-section">
                    <div class="info-overlay">
                        <div class="d-flex justify-content-between container">
                            <div>
                                <h1 class="uppercase c-main-title">
                                    {{ Home.title }}
                                </h1>
                                <h4>
                                    {{ Home.property_type }}
                                </h4>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="container">
                    <!-- Image Carousel in col-8 -->

                    <!-- Main Carousel -->
                    <Carousel
                        :wrapAround="true"
                        :transition="500"
                        id="gallery"
                        :items-to-show="1"
                        :wrap-around="false"
                        v-model="currentSlide"
                    >
                        <!-- Main Image Slides -->
                        <Slide v-for="(file, index) in Home.files" :key="index">
                            <img
                                :src="file.file_name"
                                :alt="file.file_original_name"
                                class="img-fluid c-img-filter c-images-border-design w-100"
                                style="height: 500px; object-fit: cover"
                            />
                        </Slide>
                        <template #addons>
                            <Navigation />
                            <!-- <Pagination /> -->
                        </template>
                    </Carousel>
                </div>

                <div
                    class="interactive-open-house-banner mb-2 rounded-lg shadow-lg bg-white p-4 border border-gray-300"
                    v-if="
                        Home.is_open_house &&
                        Home.is_open_house != 0 &&
                        Home.is_open_house != 'Nil'
                    "
                >
                    {{ Home.is_open_house }}
                    <div class="banner-content text-center container">
                        <div class="c-main-title">OPEN HOUSE {{}}</div>
                        <p
                            class="open_house_desc mt- text-gray-700 text-lg font-medium"
                        >
                            {{ Home.open_house_description }}
                        </p>
                        <div
                            class="details mt-4 flex flex-col gap-2 items-center text-gray-600 c-tabs-values"
                        >
                            <p class="text-gray-700 text-lg font-medium">
                                <span
                                    class="icon bg-gray-200 text-gray-700 p-2 rounded-full"
                                >
                                    <i class="far fa-clock"></i>
                                </span>
                                {{ formatTime(Home.open_house_start_time) }} -
                                {{ formatTime(Home.open_house_end_time) }}
                            </p>
                            <p class="text-gray-700 text-lg font-medium">
                                <span
                                    class="icon bg-gray-200 text-gray-700 p-2 rounded-full"
                                >
                                    <i class="far fa-calendar-alt"></i>
                                </span>
                                {{ formatDate(Home.open_house_date) }}
                            </p>
                        </div>
                    </div>
                </div>

                <div class="container"></div>
                <section class="property-detail-section bg-light py-5">
                    <div class="container">
                        <div class="row g-4">
                            <!-- Left Content -->
                            <div class="col-md-8">
                                <div
                                    class="card p-4 border-0 shadow-lg rounded-4 bg-white"
                                >
                                    <!-- Price and Status -->
                                    <div
                                        class="d-flex justify-content-between align-items-center mb-4"
                                    >
                                        <h2
                                            class="text-primary fw-bold mb-0 c-title"
                                        >
                                            ${{ formatPrice(Home.price) }}
                                        </h2>
                                        <span
                                            class="badge bg-success px-3 py-2 fs-6 rounded-pill"
                                            >Move-In Ready</span
                                        >
                                    </div>

                                    <!-- Core Info Boxes -->
                                    <div class="row g-3 mb-4">
                                        <!-- Bedrooms -->
                                        <div
                                            class="col-md-3 col-6 c-title"
                                            v-if="Home.bedrooms"
                                        >
                                            <div class="info-box text-center">
                                                <svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    width="30"
                                                    height="30"
                                                    stroke-width="2"
                                                    fill="none"
                                                >
                                                    <path
                                                        fill="#023f86"
                                                        d="M2.05 21.334h-.5v.5h.5zm0-6.792v-.5h-.5v.5zm10.614 0h.5v-.5h-.5zm0-6.516h.5zM13.79 6.9v-.5zm13.032 0v.5zm1.126 1.126h.5zm-15.742 6.28v.5h.596l-.103-.586zm-.22-1.25.492-.086-.188-1.07-.69.838zm-1.03 1.25-.386-.317-.674.817h1.06zM2.55 21.334v-6.792h-1v6.792zm-.5-6.292h10.614v-1H2.05zm10.114-.5v6.792h1v-6.792zM2.05 21.834h10.614v-1H2.05zm11.114-.5V8.026h-1v13.308zM13.79 7.4h13.032v-1H13.79zm13.658.626v13.308h1V8.026zM12.664 21.834h15.284v-1H12.664zM26.822 7.4c.346 0 .626.28.626.626h1c0-.898-.728-1.626-1.626-1.626zm-13.658.626c0-.346.28-.626.626-.626v-1c-.898 0-1.626.728-1.626 1.626zm14.284 13.308v5.52h1v-5.52zM1.55 5.626v21.228h1V5.626zm10.614 4.882c0 1.978-1.512 3.534-3.321 3.534v1c2.412 0 4.321-2.056 4.321-4.534zm-3.321 3.534c-1.809 0-3.321-1.556-3.321-3.534h-1c0 2.478 1.91 4.534 4.321 4.534zm-3.321-3.534c0-1.977 1.512-3.533 3.321-3.533v-1c-2.412 0-4.321 2.055-4.321 4.533zm3.321-3.533c1.809 0 3.321 1.556 3.321 3.533h1c0-2.478-1.91-4.533-4.321-4.533zm3.856 7.245-.22-1.25-.985.173.22 1.25zm-.493-.414h-1.25v1h1.25zm-.864.818 1.03-1.25-.772-.636-1.03 1.25z"
                                                    ></path>
                                                </svg>

                                                <div
                                                    class="mt-2 fw-semibold fs-5"
                                                >
                                                    {{ Home.bedrooms }}
                                                </div>

                                                <small class="text-muted"
                                                    >Bedrooms</small
                                                >
                                            </div>
                                        </div>

                                        <!-- Bathrooms -->
                                        <div
                                            class="col-md-3 col-6 c-title"
                                            v-if="
                                                Home.full_bath || Home.half_bath
                                            "
                                        >
                                            <div class="info-box text-center">
                                                <svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    width="30"
                                                    height="30"
                                                    fill="none"
                                                    stroke-width="2"
                                                >
                                                    <path
                                                        stroke="#023f86"
                                                        stroke-linejoin="round"
                                                        d="M13.136 5.217V3.314c0-.621-.504-1.126-1.126-1.126h-6.6c-.623 0-1.127.505-1.127 1.126V14.07M8.96 25.414l-.965 3.332m13.528-3.332.965 3.332m-21-14.443 3.285 10.395c.148.468.583.787 1.074.787h18.307c.491 0 .926-.319 1.074-.787l3.284-10.395zm10.251-9.41L9.874 8.155h6.523l-1.863-3.262z"
                                                    ></path>
                                                </svg>
                                                <div
                                                    class="mt-2 fw-semibold fs-5"
                                                >
                                                    {{ Home.full_bath }} -
                                                    {{ Home.half_bath ?? "0" }}
                                                </div>
                                                <small class="text-muted"
                                                    >Bathrooms</small
                                                >
                                            </div>
                                        </div>

                                        <!-- Square Feet -->
                                        <div
                                            class="col-md-3 col-6 c-title"
                                            v-if="Home.square_feet"
                                        >
                                            <div class="info-box text-center">
                                                <svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    width="30"
                                                    height="30"
                                                    fill="none"
                                                    stroke-width="2"
                                                >
                                                    <path
                                                        fill="#023f86"
                                                        d="M3.37 3v-.5h-.5V3zm23.273 0h.5v-.5h-.5zm0 24v.5h.5V27zM3.37 27h-.5v.5h.5zm18.91 0h-.5v.5h.5zm3.635-12.591a.5.5 0 1 0 0-1zm-8-.5h-.5a.5.5 0 0 0 .5.5zm.5-4.364v-.5h-1v.5zm-6.95 8.232a.5.5 0 1 0 0-1zm-8.095-1h-.5v1h.5zm18.909 2.95h.5a.5.5 0 0 0-.457-.498zM13.415 27a.5.5 0 1 0 1 0zM3.37 3.5h23.273v-1H3.37zM26.143 3v24h1V3zM3.87 27V3h-1v24zm10.41-.5H3.37v1h10.91zm12.363 0h-4.364v1h4.364zm-.728-13.091h-8v1h8zm-7.5.5V9.545h-1v4.364zm-6.95 2.868H3.37v1h8.095zM22.779 27v-7.273h-1V27zm-.457-7.77c-1.467-.128-3.67.097-5.528 1.214-1.892 1.14-3.379 3.18-3.379 6.556h1c0-3.024 1.302-4.74 2.895-5.699 1.627-.98 3.605-1.19 4.926-1.076z"
                                                    ></path>
                                                </svg>
                                                <div
                                                    class="mt-2 fw-semibold fs-5"
                                                >
                                                    {{ Home.square_feet }}
                                                </div>
                                                <small class="text-muted"
                                                    >Sq. Feet</small
                                                >
                                            </div>
                                        </div>

                                        <!-- Construction Status -->
                                        <div
                                            class="col-md-3 col-6 c-title"
                                            v-if="Home.construction_status"
                                        >
                                            <div class="info-box text-center">
                                                <svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    width="30"
                                                    height="30"
                                                    stroke-width="2"
                                                    fill="none"
                                                >
                                                    <path
                                                        stroke="#023f86"
                                                        stroke-linejoin="round"
                                                        d="M2.5 24.996h25m-20-6.875h15M9.375 12.496h11.25m-9.228-8.125h7.206l5.147 20.625H6.25z"
                                                    ></path>
                                                </svg>
                                                <div
                                                    class="mt-2 fw-semibold fs-5"
                                                >
                                                    {{
                                                        Home.construction_status
                                                    }}
                                                </div>
                                                <small class="text-muted"
                                                    >Building Status</small
                                                >
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Tabs -->
                                    <ul class="nav nav-tabs nav-fill mb-4">
                                        <li class="nav-item">
                                            <button
                                                class="nav-link active"
                                                data-bs-toggle="tab"
                                                data-bs-target="#overview"
                                            >
                                                Overview
                                            </button>
                                        </li>
                                        <li class="nav-item">
                                            <button
                                                class="nav-link"
                                                data-bs-toggle="tab"
                                                data-bs-target="#features"
                                            >
                                                Features
                                            </button>
                                        </li>
                                        <li class="nav-item">
                                            <button
                                                class="nav-link"
                                                data-bs-toggle="tab"
                                                data-bs-target="#financial"
                                            >
                                                Financial
                                            </button>
                                        </li>
                                    </ul>

                                    <!-- Tab Content -->
                                    <div class="tab-content">
                                        <!-- Overview Tab -->

                                        <div
                                            class="tab-pane fade show active"
                                            id="overview"
                                        >
                                            <h5
                                                class="card-title c-card-main"
                                                v-if="Home.title"
                                            >
                                                About {{ Home.title }}
                                            </h5>
                                            <p
                                                class="c-tab-sub"
                                                v-if="Home.description"
                                            >
                                                {{ Home.description }}
                                            </p>
                                            <hr
                                                v-if="
                                                    Home.title ||
                                                    Home.description
                                                "
                                            />

                                            <div
                                                class="mt-3"
                                                v-if="
                                                    Home.property_type ||
                                                    Home.year_built ||
                                                    Home.lot_size ||
                                                    Home.construction_status ||
                                                    Home.listing_status ||
                                                    Home.bedrooms ||
                                                    Home.full_bath ||
                                                    Home.half_bath ||
                                                    Home.square_feet ||
                                                    Home.size_from ||
                                                    Home.size_to ||
                                                    Home.price_from ||
                                                    Home.price_to ||
                                                    Home.average_price_per_square ||
                                                    Home.association_fee ||
                                                    Home.cic ||
                                                    Home.is_open_house
                                                "
                                            >
                                                <h3 class="c-tab-title">
                                                    Property Details
                                                </h3>
                                                <div class="row g-3">
                                                    <div
                                                        class="col-md-3"
                                                        v-if="
                                                            Home.property_type
                                                        "
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            Home Type
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{
                                                                Home.property_type
                                                            }}
                                                        </p>
                                                    </div>
                                                    <div
                                                        class="col-md-3"
                                                        v-if="Home.year_built"
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            Year Built
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{
                                                                Home.year_built
                                                            }}
                                                        </p>
                                                    </div>
                                                    <div
                                                        class="col-md-3"
                                                        v-if="Home.lot_size"
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            Lot Size
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{ Home.lot_size }}
                                                        </p>
                                                    </div>
                                                    <div
                                                        class="col-md-3"
                                                        v-if="
                                                            Home.construction_status
                                                        "
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            Status
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{
                                                                Home.construction_status
                                                            }}
                                                        </p>
                                                    </div>
                                                    <div
                                                        class="col-md-3"
                                                        v-if="
                                                            Home.listing_status
                                                        "
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            Listing Status
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{
                                                                Home.listing_status
                                                            }}
                                                        </p>
                                                    </div>
                                                    <div
                                                        class="col-md-3"
                                                        v-if="Home.bedrooms"
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            Bedrooms
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{ Home.bedrooms }}
                                                        </p>
                                                    </div>
                                                    <div
                                                        class="col-md-3"
                                                        v-if="Home.full_bath"
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            Full Bath
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{ Home.full_bath }}
                                                        </p>
                                                    </div>
                                                    <div
                                                        class="col-md-3"
                                                        v-if="Home.half_bath"
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            Half Bath
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{ Home.half_bath }}
                                                        </p>
                                                    </div>
                                                    <div
                                                        class="col-md-3"
                                                        v-if="Home.square_feet"
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            Square Feet
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{
                                                                Home.square_feet
                                                            }}
                                                        </p>
                                                    </div>
                                                    <div
                                                        class="col-md-3"
                                                        v-if="
                                                            Home.size_from ||
                                                            Home.size_to
                                                        "
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            Size Range
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{
                                                                Home.size_from ??
                                                                "N/A"
                                                            }}
                                                            -
                                                            {{
                                                                Home.size_to ??
                                                                "N/A"
                                                            }}
                                                        </p>
                                                    </div>
                                                    <div
                                                        class="col-md-3"
                                                        v-if="
                                                            Home.price_from ||
                                                            Home.price_to
                                                        "
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            Price Range
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{
                                                                Home.price_from ??
                                                                "N/A"
                                                            }}
                                                            -
                                                            {{
                                                                Home.price_to ??
                                                                "N/A"
                                                            }}
                                                        </p>
                                                    </div>
                                                    <div
                                                        class="col-md-3"
                                                        v-if="
                                                            Home.average_price_per_square
                                                        "
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            Average Price per Sq
                                                            Ft
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{
                                                                Home.average_price_per_square
                                                            }}
                                                        </p>
                                                    </div>
                                                    <div
                                                        class="col-md-3"
                                                        v-if="
                                                            Home.association_fee
                                                        "
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            Association Fee
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{
                                                                Home.association_fee
                                                            }}
                                                        </p>
                                                    </div>
                                                    <div
                                                        class="col-md-3"
                                                        v-if="Home.cic"
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            CIC
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{ Home.cic }}
                                                        </p>
                                                    </div>
                                                    <div
                                                        class="col-md-3"
                                                        v-if="
                                                            Home.is_open_house
                                                        "
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            Is Open House
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{
                                                                Home.is_open_house
                                                            }}
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Features Tab -->
                                        <div
                                            class="tab-pane fade"
                                            id="features"
                                            v-if="Home.feature"
                                        >
                                            <div>
                                                <h5
                                                    class="card-title c-card-main"
                                                >
                                                    Home Features
                                                </h5>
                                                <hr />
                                                <div class="row g-3">
                                                    <div
                                                        class="col-md-3"
                                                        v-if="
                                                            Home.feature
                                                                .reach_in
                                                        "
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            Reach-In Closet
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{
                                                                Home.feature
                                                                    .reach_in
                                                            }}
                                                        </p>
                                                    </div>
                                                    <div
                                                        class="col-md-3"
                                                        v-if="
                                                            Home.feature.walk_in
                                                        "
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            Walk-In Closet
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{
                                                                Home.feature
                                                                    .walk_in
                                                            }}
                                                        </p>
                                                    </div>
                                                    <div
                                                        class="col-md-3"
                                                        v-if="
                                                            Home.feature
                                                                .laundry_closet
                                                        "
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            Laundry Closet
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{
                                                                Home.feature
                                                                    .laundry_closet
                                                            }}
                                                        </p>
                                                    </div>
                                                    <div
                                                        class="col-md-3"
                                                        v-if="
                                                            Home.feature
                                                                .closet_location
                                                        "
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            Closet Location
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{
                                                                Home.feature
                                                                    .closet_location
                                                            }}
                                                        </p>
                                                    </div>

                                                    <div
                                                        class="col-md-3"
                                                        v-if="
                                                            Home.feature
                                                                .bathroom_type
                                                        "
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            Bathroom Type
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{
                                                                Home.feature
                                                                    .bathroom_type
                                                            }}
                                                        </p>
                                                    </div>
                                                    <div
                                                        class="col-md-3"
                                                        v-if="
                                                            Home.feature
                                                                .bathroom_status
                                                        "
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            Bathroom Status
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{
                                                                Home.feature
                                                                    .bathroom_status
                                                            }}
                                                        </p>
                                                    </div>
                                                    <div
                                                        class="col-md-3"
                                                        v-if="
                                                            Home.feature
                                                                .private_bath
                                                        "
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            Private Bath
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{
                                                                Home.feature
                                                                    .private_bath
                                                            }}
                                                        </p>
                                                    </div>
                                                    <div
                                                        class="col-md-3"
                                                        v-if="
                                                            Home.feature
                                                                .outdoor_shower
                                                        "
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            Outdoor Shower
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{
                                                                Home.feature
                                                                    .outdoor_shower
                                                            }}
                                                        </p>
                                                    </div>

                                                    <div
                                                        class="col-md-3"
                                                        v-if="
                                                            Home.feature
                                                                .pool_shape
                                                        "
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            Pool Shape
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{
                                                                Home.feature
                                                                    .pool_shape
                                                            }}
                                                        </p>
                                                    </div>
                                                    <div
                                                        class="col-md-3"
                                                        v-if="
                                                            Home.feature
                                                                .water_features
                                                        "
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            Water Features
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{
                                                                Home.feature
                                                                    .water_features
                                                            }}
                                                        </p>
                                                    </div>
                                                    <div
                                                        class="col-md-3"
                                                        v-if="
                                                            Home.feature
                                                                .pool_status
                                                        "
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            Pool Status
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{
                                                                Home.feature
                                                                    .pool_status
                                                            }}
                                                        </p>
                                                    </div>
                                                    <div
                                                        class="col-md-3"
                                                        v-if="Home.feature.spa"
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            Spa
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{
                                                                Home.feature.spa
                                                            }}
                                                        </p>
                                                    </div>

                                                    <div
                                                        class="col-md-3"
                                                        v-if="
                                                            Home.feature
                                                                .fencing_material
                                                        "
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            Fencing
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{
                                                                Home.feature
                                                                    .fencing_material
                                                            }}
                                                        </p>
                                                    </div>
                                                    <div
                                                        class="col-md-3"
                                                        v-if="
                                                            Home.feature
                                                                .bedroom_location
                                                        "
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            Bedroom
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{
                                                                Home.feature
                                                                    .bedroom_location
                                                            }}
                                                        </p>
                                                    </div>
                                                    <div
                                                        class="col-md-3"
                                                        v-if="
                                                            Home.feature
                                                                .fireplace_type
                                                        "
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            Fireplace
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{
                                                                Home.feature
                                                                    .fireplace_type
                                                            }}
                                                        </p>
                                                    </div>
                                                    <div
                                                        class="col-md-3"
                                                        v-if="
                                                            Home.feature
                                                                .kitchen_pantry_type
                                                        "
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            Kitchen Pantry
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{
                                                                Home.feature
                                                                    .kitchen_pantry_type
                                                            }}
                                                        </p>
                                                    </div>
                                                    <div
                                                        class="col-md-3"
                                                        v-if="
                                                            Home.feature
                                                                .parking_enclosure
                                                        "
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            Parking Enclosure
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{
                                                                Home.feature
                                                                    .parking_enclosure
                                                            }}
                                                        </p>
                                                    </div>
                                                    <div
                                                        class="col-md-3"
                                                        v-if="
                                                            Home.feature
                                                                .landscape_maintenance
                                                        "
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            Landscape
                                                            Maintenance
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{
                                                                Home.feature
                                                                    .landscape_maintenance
                                                            }}
                                                        </p>
                                                    </div>
                                                    <div
                                                        class="col-md-3"
                                                        v-if="
                                                            Home.feature
                                                                .foundation_conditions
                                                        "
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            Foundation
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{
                                                                Home.feature
                                                                    .foundation_conditions
                                                            }}
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Financial Tab -->
                                        <div
                                            class="tab-pane fade"
                                            id="financial"
                                            v-if="
                                                Home.price ||
                                                Home.price_from ||
                                                Home.price_to ||
                                                Home.average_price_per_square ||
                                                Home.association_fee ||
                                                Home.size_from ||
                                                Home.size_to
                                            "
                                        >
                                            <div>
                                                <h5
                                                    class="card-title c-card-main"
                                                >
                                                    Price and Fees
                                                </h5>
                                                <hr />
                                                <div class="row g-3">
                                                    <div
                                                        class="col-md-3"
                                                        v-if="Home.price"
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            Price
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{ Home.price }}
                                                        </p>
                                                    </div>
                                                    <div
                                                        class="col-md-3"
                                                        v-if="
                                                            Home.price_from ||
                                                            Home.price_to
                                                        "
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            Price Range
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{
                                                                Home.price_from ??
                                                                "N/A"
                                                            }}
                                                            -
                                                            {{
                                                                Home.price_to ??
                                                                "N/A"
                                                            }}
                                                        </p>
                                                    </div>
                                                    <div
                                                        class="col-md-3"
                                                        v-if="
                                                            Home.average_price_per_square
                                                        "
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            Average Price per Sq
                                                            Ft
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{
                                                                Home.average_price_per_square
                                                            }}
                                                        </p>
                                                    </div>
                                                    <div
                                                        class="col-md-3"
                                                        v-if="
                                                            Home.association_fee
                                                        "
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            Association Fee
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{
                                                                Home.association_fee
                                                            }}
                                                        </p>
                                                    </div>
                                                    <div
                                                        class="col-md-3"
                                                        v-if="
                                                            Home.size_from ||
                                                            Home.size_to
                                                        "
                                                    >
                                                        <h4 class="c-tab-sub">
                                                            Size Range
                                                        </h4>
                                                        <p
                                                            class="c-tabs-values"
                                                        >
                                                            {{
                                                                Home.size_from ??
                                                                "N/A"
                                                            }}
                                                            -
                                                            {{
                                                                Home.size_to ??
                                                                "N/A"
                                                            }}
                                                            SQFT
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Right Sidebar -->
                            <div class="col-md-4">
                                <div
                                    class="card p-4 border-0 shadow-lg rounded-4 sticky-sidebar"
                                >
                                    <a
                                        :href="'/homes-agents/' + home_id"
                                        class="btn btn-gradient w-100 py-3 fs-5 rounded-pill fw-bold d-flex justify-content-center align-items-center"
                                    >
                                        Connect to Agent
                                        <i
                                            class="bi bi-arrow-right ms-2 fs-5"
                                        ></i>
                                    </a>

                                    <div class="mt-4">
                                        <div
                                            v-if="Home.property_incentives"
                                            class="mb-4"
                                        >
                                            <h6 class="sidebar-label">
                                                Incentives
                                            </h6>
                                            <ul class="list-unstyled">
                                                <li
                                                    v-for="i in Home.property_incentives"
                                                    :key="i.id"
                                                    class="mb-2"
                                                >
                                                    <i
                                                        class="bi bi-check-circle text-success me-2"
                                                    ></i>
                                                    <a
                                                        :href="
                                                            '/detailed-incentive/' +
                                                            i.id
                                                        "
                                                        class="text-decoration-none fw-semibold text-primary"
                                                        target="_blank"
                                                        >{{
                                                            i.incentive.title
                                                        }}</a
                                                    >
                                                </li>
                                            </ul>
                                        </div>

                                        <div v-if="Community" class="mb-4">
                                            <h6 class="sidebar-label">
                                                Community
                                            </h6>
                                            <p class="mb-1">
                                                <i
                                                    class="bi bi-check-circle text-success me-2"
                                                ></i
                                                >{{ Community.name }}
                                            </p>
                                            <p class="mb-1 text-muted">
                                                <i class="bi bi-list me-2"></i
                                                >{{ Community.description }}
                                            </p>
                                            <p class="mb-0 text-muted">
                                                <i
                                                    class="bi bi-geo-alt-fill me-2"
                                                ></i
                                                >{{ Community.location }}
                                            </p>
                                        </div>

                                        <div
                                            v-if="Home.school_name"
                                            class="mb-4"
                                        >
                                            <h6 class="sidebar-label">
                                                School
                                            </h6>
                                            <p class="mb-0">
                                                <i
                                                    class="bi bi-buildings-fill me-2"
                                                ></i
                                                >{{ Home.school_name }}
                                            </p>
                                        </div>

                                        <div v-if="Home.hoa_name">
                                            <h6 class="sidebar-label">HOA</h6>
                                            <p class="mb-0">
                                                <i class="bi bi-house me-2"></i
                                                >{{ Home.hoa_name }}
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <div class="container-fluid interactive-banner mt-3">
                    <h1>RELATED COMMUNITY MOVE IN HOMES</h1>
                </div>

                <div class="container pt-3">
                    <div class="row">
                        <div
                            v-for="home in community_homes"
                            :key="home.id"
                            class="col-md-3 mb-3"
                        >
                            <a
                                class="text-decoration-none"
                                :href="'/home-details/' + home.property_id"
                            >
                                <GlobalCard
                                    :badge="
                                        home.is_open_house == 1
                                            ? 'Open House'
                                            : 'Quick Move In'
                                    "
                                    :badge2="
                                        home.incentive ? 'Incentive Home' : ''
                                    "
                                    :main_image="
                                        home.main_image ??
                                        '/images/default_image.png'
                                    "
                                    :title="home.title"
                                    :property_id="home.property_id"
                                    :address="home.address"
                                    :bedrooms="home.bedrooms"
                                    :price="home.price"
                                    :bathrooms="home.bathrooms"
                                    :square_feet="home.square_feet"
                                    :garages="home.garages"
                                />
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </Master>
</template>

<script>
import Master from "@components/layout/Master.vue";
import ProceedComponent from "@components/ProceedComponent.vue";
import Multiselect from "@vueform/multiselect";
import { addMonths, startOfMonth, endOfMonth } from "date-fns";

import { Carousel, Slide, Pagination, Navigation } from "vue3-carousel";

import "vue3-carousel/dist/carousel.css";
export default {
    components: {
        Master,
        ProceedComponent,
        Carousel,
        Slide,
        Pagination,
        Navigation,
        Multiselect,
    },
    props: ["home_id"],

    created() {
        this.fetchHomeDetails();
        this.backgroundImage = this.Home.property_main_image;
        if (this.user_home_visiting_history_count > 2) {
            window.location.href = "/help";
        }
    },

    data() {
        return {
            Home: [],

            logo: external_website.white_logo,
            name: external_website.name,
            logged_in_user: logged_in_user,
            user_home_visiting_history_count: user_home_visiting_history_count,
            settings: {
                itemsToShow: 1,
                autoplay: 3500,
                wrapAround: true,
                dir: "rtl",
                // snapAlign: 'center',
            },

            backgroundImage: "",
            maxWords: 50,

            Community: [],
            community_homes: [],
            incentive: [],

            formErrors: [],
            currentSlide: 0,
        };
    },

    methods: {
        // Method to set the current image based on thumbnail click
        setCurrentSlide(index) {
            this.currentIndex = index;
        },
        // Go to the previous image
        prevSlide() {
            if (this.currentIndex > 0) {
                this.currentIndex--;
            }
        },
        // Go to the next image
        nextSlide() {
            if (this.currentIndex < this.Home.files.length - 1) {
                this.currentIndex++;
            }
        },
        fetchHomeDetails() {
            axios
                .get("/api/fetch-home-details/" + this.home_id)

                .then((response) => {
                    this.Home = response.data.property_info;

                    this.Community = response.data.community_info;
                    this.incentive = response.data.incentive;
                    this.getThisCommunityAllHomes(this.Home.community_id);
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        getThisCommunityAllHomes(community_id) {
            axios
                .get(`/api/fetch-community-all-homes/${community_id}`)
                .then((response) => {
                    this.community_homes = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },

        setAltImg(event) {
            event.target.src = "/images/default_image.png";
        },
        formatDate(date) {
            const options = { year: "numeric", month: "long", day: "numeric" };
            return new Date(date).toLocaleDateString(undefined, options);
        },
        formatTime(time) {
            if (!time || typeof time !== "string" || !time.includes(":")) {
                return "N/A";
            }

            const [hours, minutes, seconds] = time.split(":");
            let formattedHours = parseInt(hours, 10);
            const period = formattedHours >= 12 ? "PM" : "AM";

            formattedHours = formattedHours % 12 || 12;

            return `${formattedHours}:${minutes}:${seconds} ${period}`;
        },
        formatPrice(price) {
            return Math.floor(price).toLocaleString(); // Removes the decimal portion
        },
    },
};
</script>

<style scoped>
@import "@vueform/multiselect/themes/default.css";

.title {
    font-size: 24px;
    margin: 0;
}
</style>

<style scoped>
.uppercase {
    text-transform: uppercase;
}

.c-main-title {
    font-size: 30px;
    font-family: "Playfair Display", serif !important;
    font-weight: 700 !important;
    line-height: 60px !important;
    z-index: 3 !important;
    width: 100% !important;
}

.info-overlay {
    background: #f7fafc;
    padding: 10px;
    width: 100%;
    border-radius: 0px !important;
    font-family: "Playfair Display", serif;
    font-size: 30px;
    font-weight: 700;
    line-height: 36px;
    color: rgb(23, 38, 54);
}

.info-card-overlay {
    background: #01060d9d;
    padding: 10px;
    width: 100%;
    border-radius: 0px !important;
}

.c-basic-info-cards {
    border-radius: 5px !important;
    background-color: #f9fafb !important;
    font-family: Inter, sans-serif;
    font-size: 14px;
    font-weight: 400;
    line-height: 20px;
    color: rgb(61, 102, 143);
}

.c-basic-info-card-text {
    font-family: Inter, sans-serif;
    font-size: 16px;
    font-weight: 600;
    line-height: 24px;
    color: rgb(23, 38, 54);
}

.price {
    font-size: 20px;
    margin: 5px 0;
}

.c-tabs-price-color {
    font-family: "Playfair Display", serif;
    font-size: 30px;
    font-weight: 700;
    line-height: 36px;
    color: rgb(45, 106, 159);
}

.property-detail-section {
    background-color: #f1f1f1 !important;
}

.feature-state {
    font-size: 2.25rem;
    color: #002856 !important;
    font-weight: 300 !important;
}

.feature-title {
    font-size: 2.25rem;
    color: #002856 !important;
    font-weight: 300 !important;
}

.c-feature-title {
    color: #002856 !important;
    font-weight: 300 !important;
    font-size: 1.25rem;
    margin-top: 4px;
}

.c-slide-div {
    position: absolute;
    top: 35%;
    left: 5%;
    text-align: left;
    color: white;
    display: flex;
    flex-direction: column;
    gap: 5px !important;
}

.c-slide-div > button {
    width: fit-content;
}

.c-carousel-text {
    position: absolute;
    padding: 70px;
    color: white;
    font-size: 50px;
    font-weight: bold;
}

.interactive-banner {
    background-color: rgb(61, 102, 143);
    color: white;
    text-align: center;
    padding: 20px 0;
}

.interactive-banner h1 {
    letter-spacing: 0.15em;
}

.c-card-img-overlay-name {
    top: unset;
    bottom: 120px;
    text-align: left;
    color: white;
}

.info-card-overlay {
    background: #bcd6f5b2;
    padding: 10px;
    width: 100%;
    border-radius: 0px !important;
}

.interactive-open-house-banner {
    background: white;

    text-align: center;
    box-shadow: 0 4px 8px #bcd6f5b2;
    letter-spacing: 0.15em;
}

.banner-content h3 {
    font-size: 18px;
    font-weight: bold;
}

.banner-content .time,
.banner-content .date {
    font-size: 18px;
    text-align: right;
    margin: 10px 0;
    font-weight: bold;
}

.icon {
    margin-right: 10px;
}

.open-house-tag {
    background-color: rgb(61, 102, 143);
    color: white;
    padding: 5px 10px;
    font-size: 14px;
    font-weight: bold;
    border-radius: 10px;
}

@media (max-width: 768px) {
    .banner-content h3 {
        font-size: 20px;
    }

    .banner-content .time,
    .banner-content .date {
        font-size: 16px;
    }

    .open-house-tag {
        font-size: 12px;
    }
}

.blurred-content {
    filter: blur(4px);
    color: rgba(0, 0, 0, 0.3);
    background-color: #f0f0f0;
    padding: 10px;
    border-radius: 5px;
}

.blurred-box {
    margin-top: 10px;
    padding: 15px;
    background-color: #e0e0e0;
    text-align: center;
    font-size: 14px;
    color: rgba(0, 0, 0, 0.5);
    border-radius: 5px;
}

.placeholder-title {
    font-weight: bold;
    font-size: 18px;
    color: #333;
    margin-bottom: 10px;
}

.open_house_desc {
    text-align: left !important;
}

.c-anchor-style {
    text-decoration: none;
    color: #002855;
}

.c-anchor-style:hover {
    cursor: pointer;
    font-weight: bold;
}

.card-img-top {
    height: 240px;
    object-fit: cover;
}

/* Hover effect for image */
.hover-effect {
    transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
}

.hover-effect:hover {
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    /* Adds a soft shadow */
}

/* Hover effect for image */
.icon-hover-effect {
    transition: transform 0.3s ease-in-out;
}

.icon-hover-effect:hover {
    transform: scale(1.05);
    /* Slightly enlarges the image on hover */
}

.beat {
    animation: beating 1s infinite;
}

.price {
    font-family: "Playfair Display", serif !important;
    font-size: 25px !important;
    z-index: 3 !important;
    width: 100% !important;
    font-weight: bold;
    font-size: 18px;
    margin-bottom: 5px;
}

/* tabs css */
.c-tab-title {
    font-family: "Playfair Display", serif;
    font-size: 20px;
    font-weight: 600;
    line-height: 28px;
    color: rgb(23, 38, 54);
}

.c-tab-sub {
    font-family: Inter, sans-serif;
    font-size: 16px;
    font-weight: 400;
    line-height: 24px;
    color: rgb(61, 102, 143);
    margin: 0;
}

.c-tabs-values {
    font-family: Inter, sans-serif !important;
    font-size: 16px !important;
    font-weight: bold !important;
    line-height: 24px !important;
    color: rgb(23, 38, 54) !important;
}

.c-text-theme {
    color: rgb(61, 102, 143) !important;
}

.nav-tabs .nav-link {
    color: rgb(61, 102, 143) !important;
    font-weight: bold !important;
}

.nav-tabs {
    background-color: #ffffff !important;
}

.c-card-main {
    font-family: "Playfair Display", serif;
    font-size: 30px;
    font-weight: 700;
    line-height: 36px;
    color: rgb(45, 106, 159) !important;
}

.sticky-sidebar {
    position: sticky;
    top: 90px;
    background: white;
    z-index: 2;
}
.btn-gradient {
    background: linear-gradient(90deg, #023f86, #035bb8);
    color: white;
    transition: all 0.3s ease-in-out;
    box-shadow: 0 4px 12px rgba(3, 91, 184, 0.3);
}
.btn-gradient:hover {
    transform: scale(1.03);
    background: linear-gradient(90deg, #035bb8, #023f86);
}
.info-box {
    background: #f7f9fc;
    padding: 1rem;
    border-radius: 0.75rem;
    text-align: center;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
}
.sidebar-label {
    font-size: 14px;
    font-weight: 600;
    color: #023f86;
    text-transform: uppercase;
    margin-bottom: 0.5rem;
}
</style>
