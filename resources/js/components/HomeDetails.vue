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
                                    <h4>
                                        {{ Home.property_type }}
                                    </h4>
                                </h1>
                            </div>
                            <!-- <div class="uppercase">
                                <b>Starting at</b>

                                <span
                                    v-if="Home.new_price_after_incentive"
                                    class="price ms-2 text-danger mt-3"
                                >
                                    <del>${{ formatPrice(Home.price) }}</del>
                                </span>
                                <span class="price ms-2 mt-3" v-else>
                                    <br />
                                    ${{ formatPrice(Home.price) }}
                                </span>
                                <b v-if="Home.new_price_after_incentive">
                                    <br />
                                    after incentive</b
                                >
                                <span
                                    class="price ms-2"
                                    v-if="Home.new_price_after_incentive"
                                >
                                    ${{ Home.new_price_after_incentive }}
                                </span>
                            </div> -->
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

                    <!-- Thumbnails Carousel -->
                    <!-- <Carousel
                            id="thumbnails"
                            :items-to-show="4"
                            :wrap-around="true"
                            v-model="currentSlide"
                            ref="carousel"
                        > 
                            <Slide
                                v-for="(file, index) in Home.files"
                                :key="index"
                            >
                                <div
                                    class="carousel__item"
                                    @click="slideTo(index)"
                                    style="cursor: pointer"
                                >
                                    <img
                                        :src="file.file_name"
                                        :alt="file.file_original_name"
                                        class="img-fluid"
                                        style="
                                            max-height: 100px;
                                            object-fit: cover;
                                        "
                                    />
                                </div>
                            </Slide>
                        </Carousel> -->
                </div>

                <div
                    class="interactive-open-house-banner mb-2 rounded-lg shadow-lg bg-white p-4 border border-gray-300"
                    v-if="Home.is_open_house && Home.is_open_house != 0"
                >
                    <div class="banner-content text-center container">
                        <div class="c-main-title">OPEN HOUSE</div>
                        <p
                            class="open_house_desc mt- text-gray-700 text-lg font-medium"
                        >
                            {{ Home.open_house_description }}
                        </p>
                        <div
                            class="details mt-4 flex flex-col gap-2 items-center text-gray-600 c-tabs-values"
                        >
                            <p
                                class="text-gray-700 text-lg font-medium"
                            >
                                <span
                                    class="icon bg-gray-200 text-gray-700 p-2 rounded-full"
                                >
                                    <i class="far fa-clock"></i>
                                </span>
                                {{ formatTime(Home.open_house_start_time) }} -
                                {{ formatTime(Home.open_house_end_time) }}
                            </p>
                            <p
                                class="text-gray-700 text-lg font-medium "
                            >
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

                <div class="container">
                    <div class="row g-2">
                        <div class="col-md-8 col-12">
                            <div class="card p-4 border-0 shadow-sm">
                                <div
                                    class="d-flex justify-content-between align-items-center mb-4"
                                >
                                    <h2 class="price c-tabs-price-color">
                                        ${{ formatPrice(Home.price) }}
                                    </h2>
                                    <span class="badge bg-success"
                                        >Move-In Ready</span
                                    >
                                </div>

                                <div class="row text-center mb-4">
                                    <div
                                        class="col info-card-overlay c-basic-info-cards"
                                    >
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="30"
                                            height="30"
                                            fill="none"
                                        >
                                            <path
                                                fill="#2d6a9f"
                                                d="M2.05 21.334h-.5v.5h.5zm0-6.792v-.5h-.5v.5zm10.614 0h.5v-.5h-.5zm0-6.516h.5zM13.79 6.9v-.5zm13.032 0v.5zm1.126 1.126h.5zm-15.742 6.28v.5h.596l-.103-.586zm-.22-1.25.492-.086-.188-1.07-.69.838zm-1.03 1.25-.386-.317-.674.817h1.06zM2.55 21.334v-6.792h-1v6.792zm-.5-6.292h10.614v-1H2.05zm10.114-.5v6.792h1v-6.792zM2.05 21.834h10.614v-1H2.05zm11.114-.5V8.026h-1v13.308zM13.79 7.4h13.032v-1H13.79zm13.658.626v13.308h1V8.026zM12.664 21.834h15.284v-1H12.664zM26.822 7.4c.346 0 .626.28.626.626h1c0-.898-.728-1.626-1.626-1.626zm-13.658.626c0-.346.28-.626.626-.626v-1c-.898 0-1.626.728-1.626 1.626zm14.284 13.308v5.52h1v-5.52zM1.55 5.626v21.228h1V5.626zm10.614 4.882c0 1.978-1.512 3.534-3.321 3.534v1c2.412 0 4.321-2.056 4.321-4.534zm-3.321 3.534c-1.809 0-3.321-1.556-3.321-3.534h-1c0 2.478 1.91 4.534 4.321 4.534zm-3.321-3.534c0-1.977 1.512-3.533 3.321-3.533v-1c-2.412 0-4.321 2.055-4.321 4.533zm3.321-3.533c1.809 0 3.321 1.556 3.321 3.533h1c0-2.478-1.91-4.533-4.321-4.533zm3.856 7.245-.22-1.25-.985.173.22 1.25zm-.493-.414h-1.25v1h1.25zm-.864.818 1.03-1.25-.772-.636-1.03 1.25z"
                                            ></path>
                                        </svg>

                                        <div class="">
                                            <p>Bedrooms</p>
                                            <p class="c-basic-info-card-text">
                                                {{ Home.bedrooms }}
                                            </p>
                                        </div>
                                    </div>
                                    <div
                                        class="col info-card-overlay ms-1 c-basic-info-cards"
                                    >
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="30"
                                            height="30"
                                            fill="none"
                                        >
                                            <path
                                                stroke="#1E1D21"
                                                stroke-linejoin="round"
                                                d="M13.136 5.217V3.314c0-.621-.504-1.126-1.126-1.126h-6.6c-.623 0-1.127.505-1.127 1.126V14.07M8.96 25.414l-.965 3.332m13.528-3.332.965 3.332m-21-14.443 3.285 10.395c.148.468.583.787 1.074.787h18.307c.491 0 .926-.319 1.074-.787l3.284-10.395zm10.251-9.41L9.874 8.155h6.523l-1.863-3.262z"
                                            ></path>
                                        </svg>
                                        <div class="">
                                            <p>Bathrooms</p>
                                            <p class="c-basic-info-card-text">
                                                {{ Home.full_bath }} -
                                                {{ Home.half_bath }}
                                            </p>
                                        </div>
                                    </div>
                                    <div
                                        class="col info-card-overlay ms-1 c-basic-info-cards"
                                    >
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="30"
                                            height="30"
                                            fill="none"
                                        >
                                            <path
                                                fill="#2d6a9f"
                                                d="M3.37 3v-.5h-.5V3zm23.273 0h.5v-.5h-.5zm0 24v.5h.5V27zM3.37 27h-.5v.5h.5zm18.91 0h-.5v.5h.5zm3.635-12.591a.5.5 0 1 0 0-1zm-8-.5h-.5a.5.5 0 0 0 .5.5zm.5-4.364v-.5h-1v.5zm-6.95 8.232a.5.5 0 1 0 0-1zm-8.095-1h-.5v1h.5zm18.909 2.95h.5a.5.5 0 0 0-.457-.498zM13.415 27a.5.5 0 1 0 1 0zM3.37 3.5h23.273v-1H3.37zM26.143 3v24h1V3zM3.87 27V3h-1v24zm10.41-.5H3.37v1h10.91zm12.363 0h-4.364v1h4.364zm-.728-13.091h-8v1h8zm-7.5.5V9.545h-1v4.364zm-6.95 2.868H3.37v1h8.095zM22.779 27v-7.273h-1V27zm-.457-7.77c-1.467-.128-3.67.097-5.528 1.214-1.892 1.14-3.379 3.18-3.379 6.556h1c0-3.024 1.302-4.74 2.895-5.699 1.627-.98 3.605-1.19 4.926-1.076z"
                                            ></path>
                                        </svg>
                                        <div class="">
                                            <p>Sq. Feet</p>
                                            <p class="c-basic-info-card-text">
                                                {{ Home.square_feet }}
                                            </p>
                                        </div>
                                    </div>

                                    <div
                                        class="col info-card-overlay ms-1 c-basic-info-cards"
                                    >
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="30"
                                            height="30"
                                            fill="none"
                                        >
                                            <path
                                                stroke="#1E1D21"
                                                stroke-linejoin="round"
                                                d="M2.5 24.996h25m-20-6.875h15M9.375 12.496h11.25m-9.228-8.125h7.206l5.147 20.625H6.25z"
                                            ></path>
                                        </svg>
                                        <div class=" ">
                                            <p>Building status</p>
                                            <p class="c-basic-info-card-text">
                                                {{ Home.construction_status }}
                                            </p>
                                        </div>
                                    </div>
                                </div>

                                <!-- Tabs -->
                                <ul
                                    class="nav nav-tabs mb-4"
                                    id="propertyTabs"
                                    role="tablist"
                                >
                                    <li class="nav-item" role="presentation">
                                        <button
                                            class="nav-link active"
                                            id="overview-tab"
                                            data-bs-toggle="tab"
                                            data-bs-target="#overview"
                                            type="button"
                                        >
                                            Overview
                                        </button>
                                    </li>
                                    <!-- <li
                                            class="nav-item"
                                            role="presentation"
                                        >
                                            <button
                                                class="nav-link"
                                                id="specifications-tab"
                                                data-bs-toggle="tab"
                                                data-bs-target="#specifications"
                                                type="button"
                                            >
                                                Specifications
                                            </button>
                                        </li> -->
                                    <li class="nav-item" role="presentation">
                                        <button
                                            class="nav-link"
                                            id="features-tab"
                                            data-bs-toggle="tab"
                                            data-bs-target="#features"
                                            type="button"
                                        >
                                            Features
                                        </button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button
                                            class="nav-link"
                                            id="financial-tab"
                                            data-bs-toggle="tab"
                                            data-bs-target="#financial"
                                            type="button"
                                        >
                                            Financial
                                        </button>
                                    </li>
                                </ul>

                                <!-- Tab Content -->
                                <div class="tab-content">
                                    <div
                                        class="tab-pane fade show active"
                                        id="overview"
                                    >
                                        <h5 class="card-title c-card-main">
                                            About {{ Home.title }}
                                        </h5>
                                        <!-- <h3 class="c-tab-title">
                                                Property Overview
                                            </h3> -->
                                        <p class="c-tab-sub">
                                            {{ Home.description }}
                                        </p>
                                        <hr />
                                        <div class="mt-3">
                                            <h3 class="c-tab-title">
                                                Property Details
                                            </h3>
                                            <div class="row g-3">
                                                <div
                                                    class="col-md-3"
                                                    v-if="Home.property_type"
                                                >
                                                    <h4 class="c-tab-sub">
                                                        Home Type
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.property_type ??
                                                            "N/A"
                                                        }}
                                                    </p>
                                                </div>
                                                <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Year Built
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.year_built ??
                                                            "N/A"
                                                        }}
                                                    </p>
                                                </div>
                                                <!-- <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Stories
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.stories ??
                                                            "N/A"
                                                        }}
                                                    </p>
                                                </div> -->
                                                <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Lot Size
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.lot_size ??
                                                            "N/A"
                                                        }}
                                                    </p>
                                                </div>
                                                <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Status
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.construction_status ??
                                                            "N/A"
                                                        }}
                                                    </p>
                                                </div>
                                                <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Listing Status
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.listing_status ??
                                                            "N/A"
                                                        }}
                                                    </p>
                                                </div>
                                                <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Bedrooms
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.bedrooms ??
                                                            "N/A"
                                                        }}
                                                    </p>
                                                </div>
                                                <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Full Bath
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.full_bath ??
                                                            "N/A"
                                                        }}
                                                    </p>
                                                </div>
                                                <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Half Bath
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.half_bath ??
                                                            "N/A"
                                                        }}
                                                    </p>
                                                </div>
                                                <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Square Feet
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.square_feet ??
                                                            "N/A"
                                                        }}
                                                    </p>
                                                </div>
                                                <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Size Range
                                                    </h4>
                                                    <p class="c-tabs-values">
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
                                                <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Price Range
                                                    </h4>
                                                    <p class="c-tabs-values">
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
                                                <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Average Price per Sq Ft
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.average_price_per_square ??
                                                            "N/A"
                                                        }}
                                                    </p>
                                                </div>
                                                <!-- <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        HOA ID
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.hoa_id ?? "N/A"
                                                        }}
                                                    </p>
                                                </div> -->
                                                <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Association Fee
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.association_fee ??
                                                            "N/A"
                                                        }}
                                                    </p>
                                                </div>
                                                <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        CIC
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{ Home.cic ? "Yes"
                                                                : "No" }}
                                                    </p>
                                                </div>
                                                <!-- <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        School ID
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.school_id ??
                                                            "N/A"
                                                        }}
                                                    </p>
                                                </div> -->
                                                <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Is Open House
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.is_open_house
                                                                ? "Yes"
                                                                : "No"
                                                        }}
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- <div
                                            class="tab-pane fade"
                                            id="specifications"
                                        >
                                        <h5 class="card-title c-card-main">
                                                Specifications
                                            </h5>
                                            <p>No data added yet.</p>
                                        </div> -->
                                    <div class="tab-pane fade" id="features">
                                        <div>
                                            <h5 class="card-title c-card-main">
                                                Home Features
                                            </h5>
                                            <hr />
                                            <div class="row g-3">
                                                <!-- Closets -->
                                                <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Reach-In Closet
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.feature
                                                                .reach_in
                                                                ? "Yes"
                                                                : "No"
                                                        }}
                                                    </p>
                                                </div>
                                                <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Walk-In Closet
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.feature.walk_in
                                                                ? "Yes"
                                                                : "No"
                                                        }}
                                                    </p>
                                                </div>
                                                <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Laundry Closet
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.feature
                                                                .laundry_closet
                                                                ? "Yes"
                                                                : "No"
                                                        }}
                                                    </p>
                                                </div>
                                                <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Closet Location 
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.feature
                                                                .closet_location ? "Yes" : "No"
                                                        }}
                                                    </p>
                                                </div>

                                                <!-- Bathroom -->
                                                <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Bathroom Type
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.feature
                                                                .bathroom_type  ? "Yes" : "No"
                                                        }}
                                                    </p>
                                                </div>
                                                <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Bathroom Status
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.feature
                                                                .bathroom_status ? "Yes" : "No"
                                                        }}
                                                    </p>
                                                </div>
                                                <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Private Bath
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.feature
                                                                .private_bath
                                                                ? "Yes"
                                                                : "No"
                                                        }}
                                                    </p>
                                                </div>
                                                <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Outdoor Shower
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.feature
                                                                .outdoor_shower
                                                                ? "Yes"
                                                                : "No"
                                                        }}
                                                    </p>
                                                </div>

                                                <!-- Pool -->
                                                <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Pool Shape
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.feature
                                                                .pool_shape  ? "Yes" : "No"
                                                        }}
                                                    </p>
                                                </div>
                                                <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Water Features
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.feature
                                                                .water_features  ? "Yes" : "No"
                                                        }}
                                                    </p>
                                                </div>
                                                <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Pool Status
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.feature
                                                                .pool_status ? "Yes" : "No"
                                                        }}
                                                    </p>
                                                </div>
                                                <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Spa
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.feature.spa
                                                                ? "Yes"
                                                                : "No"
                                                        }}
                                                    </p>
                                                </div>

                                                <!-- Fencing -->
                                                <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Fencing
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.feature
                                                                .fencing_material ? "Yes" : "No"
                                                        }}
                                                    </p>
                                                </div>
                                                <!-- <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Fencing Status
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.feature
                                                                .fencing_status ? "Yes" : "No"
                                                        }}
                                                    </p>
                                                </div> -->

                                                <!-- Bedroom -->
                                                <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Bedroom
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.feature
                                                                .bedroom_location ? "Yes" : "No"
                                                        }}
                                                    </p>
                                                </div>

                                                <!-- Fireplace -->
                                                <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Fireplace
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.feature
                                                                .fireplace_type ? "Yes" : "No"
                                                        }}
                                                    </p>
                                                </div>

                                                <!-- Kitchen -->
                                                <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Kitchen Pantry
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.feature
                                                                .kitchen_pantry_type ? "Yes" : "No"
                                                        }}
                                                    </p>
                                                </div>

                                                <!-- Parking -->
                                                <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Parking Enclosure
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.feature
                                                                .parking_enclosure
                                                                ? "Yes"
                                                                : "No"
                                                        }}
                                                    </p>
                                                </div>

                                                <!-- Landscape Maintenance -->
                                                <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Landscape Maintenance
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.feature
                                                                .landscape_maintenance
                                                                ? "Yes"
                                                                : "No"
                                                        }}
                                                    </p>
                                                </div>

                                                <!-- Foundation -->
                                                <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Foundation 
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.feature
                                                                .foundation_conditions ? "Yes" : "No"
                                                        }}
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="financial">
                                        <div>
                                            <h5 class="card-title c-card-main">
                                                Price and Fees
                                            </h5>
                                            <hr />
                                            <div class="row g-3">
                                                <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Price
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.price ?? "N/A"
                                                        }}
                                                    </p>
                                                </div>
                                                <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Price Range
                                                    </h4>
                                                    <p class="c-tabs-values">
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
                                                <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Average Price per Sq Ft
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.average_price_per_square ??
                                                            "N/A"
                                                        }}
                                                    </p>
                                                </div>
                                                <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Association Fee
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.association_fee ??
                                                            "N/A"
                                                        }}
                                                    </p>
                                                </div>
                                                 
                                                 
                                                <div class="col-md-3">
                                                    <h4 class="c-tab-sub">
                                                        Size Range
                                                    </h4>
                                                    <p class="c-tabs-values">
                                                        {{
                                                            Home.size_from 
                                                        }}
                                                        -
                                                        {{
                                                            Home.size_to  
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
                        <div class="col-md-4 col-12">
                            <div
                                class="card p-4 border-0 shadow-sm"
                                style="
                                    position: sticky;
                                    top: 85px; /* Adjust this value based on your navbar height */
                                    height: 550px;
                                    overflow: auto;
                                    color: black !important;
                                "
                            >
                                <a
                                    class="btn btn-success mt-3 w-100 p-3 beat"
                                    :href="'/homes-agents/' + home_id"
                                >
                                    <b class="fs-3">Connect to Agent</b>
                                    <i class="bi bi-arrow-right ms-2"></i>
                                </a>
                                <div class="highlights mt-3">
                                    <!-- Show actual data if user is logged in and not a customer -->
                                    <!-- <div
                                    v-if="
                                        logged_in_user &&
                                        logged_in_user.role === 'customer' &&
                                        user_home_visiting_history_count < 50
                                    "
                                > -->

                                    <div>
                                        <!-- <div v-if="Home.incentive">
                                            <div class="banner-content">
                                                <div
                                                    class="open-house-tag mb-2"
                                                >
                                                    COMMUNITY INCENTIVE
                                                </div>
                                                <div>
                                                    <i
                                                        class="bi bi-check-lg c-text-theme fs-5"
                                                    ></i>
                                                    <a
                                                        class="text-decoration-none c-anchor-style"
                                                        :href="
                                                            '/detailed-incentive/' +
                                                            incentive.id
                                                        "
                                                    >
                                                        {{ incentive.title }}</a
                                                    >
                                                </div>
                                            </div>
                                        </div> -->
                                        <div v-if="Home.property_incentives">
                                            <div class="banner-content">
                                                <div
                                                    class="open-house-tag mb-2"
                                                >
                                                    INCENTIVES
                                                </div>
                                                <div
                                                    v-for="(
                                                        prop_incentive, index
                                                    ) in Home.property_incentives"
                                                    :key="prop_incentive.id"
                                                >
                                                    <i
                                                        class="bi bi-check-lg c-text-theme fs-5"
                                                    ></i>
                                                    <a
                                                        class="text-decoration-none c-anchor-style ms-1"
                                                        target="_blank"
                                                        :href="
                                                            '/detailed-incentive/' +
                                                            prop_incentive.id
                                                        "
                                                    >
                                                        {{
                                                            prop_incentive
                                                                .incentive.title
                                                        }}
                                                    </a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="mt-2" v-if="Community">
                                            <div class="open-house-tag mb-2">
                                                COMMUNITY
                                            </div>
                                            <i
                                                class="bi bi-check-lg c-text-theme fs-5"
                                            ></i>
                                            {{ Community.name }}<br />
                                            <i
                                                class="bi bi-list c-text-theme fs-5"
                                            ></i>
                                            {{ Community.description }}<br />
                                            <i
                                                class="bi bi-geo-alt-fill c-text-theme fs-5"
                                            ></i>
                                            {{ Community.location }}
                                        </div>
                                        <div
                                            class="highlights mt-2"
                                            v-if="Home.address"
                                        >
                                            <!-- <div>
                                            <div class="open-house-tag mb-2">
                                                LOCATION
                                            </div>
                                            <i
                                                class="bi bi-geo-alt-fill c-text-theme fs-5"
                                            ></i>
                                            <span v-if="Home.address">{{
                                                Home.address
                                            }}</span>
                                            <span v-if="Home.city"
                                                >,{{ Home.city }}</span
                                            >
                                            <span v-if="Home.state"
                                                >,{{ Home.state }}</span
                                            >
                                            <span v-if="Home.zip_code"
                                                >,{{ Home.zip_code }}</span
                                            >
                                        </div> -->
                                        </div>
                                        <div
                                            class="highlights mt-2"
                                            v-if="Home.school_name"
                                        >
                                            <div>
                                                <div
                                                    class="open-house-tag mb-2"
                                                >
                                                    SCHOOL
                                                </div>
                                                <i
                                                    class="bi bi-buildings-fill c-text-theme fs-5"
                                                ></i>
                                                {{ Home.school_name }}
                                            </div>
                                        </div>
                                        <div
                                            class="highlights mt-2"
                                            v-if="Home.hoa_name"
                                        >
                                            <div>
                                                <div
                                                    class="open-house-tag mb-2"
                                                >
                                                    HOA
                                                </div>
                                                <i
                                                    class="bi bi-house c-text-theme fs-5"
                                                ></i>
                                                {{ Home.hoa_name }}
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Blurred placeholder when user is a customer or not logged in -->
                                    <!-- <div v-else>
                                    <div class="open-house-tag mb-2">
                                        Information is available upon request.
                                        Please login first.
                                    </div>
                                    <div class="blurred-content">
                                        <div class="blurred-box">
                                            Information is available upon
                                            request.
                                        </div>
                                        <div class="blurred-box">
                                            Details are available upon request.
                                        </div>
                                        <div class="blurred-box">
                                            Information is available upon
                                            request.
                                        </div>
                                        <div class="blurred-box">
                                            Information is available upon
                                            request.
                                        </div>
                                    </div>
                                </div> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

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
                    this.getThisCommunityAllHomes();
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        getThisCommunityAllHomes() {
            axios
                .get(`/api/fetch-community-all-homes/${this.Community.id}`)
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
            const [hours, minutes, seconds] = time.split(":");
            let formattedHours = parseInt(hours, 10);
            const period = formattedHours >= 12 ? "PM" : "AM";

            // Convert hours to 12-hour format
            formattedHours = formattedHours % 12 || 12;

            // Return the formatted time with AM/PM
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
/* .top-section {
    position: relative;
    height: 300px; 
    background-size: cover;
    background-position: center;
    color: white;
    display: flex;
    width: 100%;
    align-items: flex-end;
} */
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
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* Adds a soft shadow */
}

/* Hover effect for image */
.icon-hover-effect {
    transition: transform 0.3s ease-in-out;
}

.icon-hover-effect:hover {
    transform: scale(1.05); /* Slightly enlarges the image on hover */
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
    color: rgb(45, 106, 159) !important ;
}
</style>
