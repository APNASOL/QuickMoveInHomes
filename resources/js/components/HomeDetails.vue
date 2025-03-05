<template>
    <Master>
        <div class="property-detail-section">
            <div class="property-detail-section" v-if="Home">
                <div
                    class="top-section"
                    :style="{
                        backgroundImage: `url(${Home.property_banner})`,
                    }"
                >
                    <div class="info-overlay">
                        <div class="d-flex justify-content-between container">
                            <div>
                                <h2 class="title uppercase">
                                    {{ Home.title }}
                                </h2>
                                <span class="uppercase">
                                    {{ Home.property_type }}
                                </span>
                            </div>
                            <div class="uppercase">
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
                            </div>
                        </div>
                    </div>
                </div>

                <div
                    class="container-fluid interactive-open-house-banner mt-3"
                    v-if="Home.is_open_house && Home.is_open_house != 0"
                >
                    <div class="banner-content p-2">
                        <div class="open-house-tag mb-2">OPEN HOUSE</div>
                        <p class="open_house_desc">
                            {{ Home.open_house_description }}
                        </p>
                        <p class="time">
                            <span class="icon"
                                ><i class="far fa-clock"></i
                            ></span>
                            {{ formatTime(Home.open_house_start_time) }} -
                            {{ formatTime(Home.open_house_end_time) }}
                        </p>
                        <p class="date">
                            <span class="icon"
                                ><i class="far fa-calendar-alt"></i
                            ></span>
                            {{ formatDate(Home.open_house_date) }}
                        </p>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-8">
                            <div
                                class="card card-body rounded-5 mt-5 text-justify hover-effect"
                            >
                                <div>
                                    <h1 id="overview feature-title">
                                        Overview
                                    </h1>
                                </div>

                                <p class="py-4">
                                    {{ Home.description }}
                                </p>
                            </div>

                            <div
                                class="mt-2 card card-body rounded-5 hover-effect"
                            >
                                <div class="row ms-5 icon-sec">
                                    <div
                                        v-if="Home.listing_type"
                                        class="col-md-4 col-sm-12 icon-hover-effect"
                                    >
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="48"
                                            height="48"
                                            fill="none"
                                        >
                                            <path
                                                stroke="#1E1D21"
                                                stroke-linejoin="round"
                                                d="M23.394 14.496v-4.172L14.51 2.62 5.96 10.062V21.56c0 .69.56 1.25 1.25 1.25h7.467M2.9 12.715 14.523 2.62l11.623 10.094"
                                            ></path>
                                            <path
                                                stroke="#1E1D21"
                                                stroke-linecap="square"
                                                d="m23.525 23.246 3.75 3.75M23.202 14.39a6.035 6.035 0 1 1-8.534 8.534 6.035 6.035 0 0 1 8.534-8.534Z"
                                            ></path>
                                        </svg>
                                        <div v-if="Home.listing_type">
                                            <h6>
                                                <strong>{{
                                                    Home.listing_type
                                                }}</strong>
                                            </h6>
                                            <p>Listing status</p>
                                        </div>
                                    </div>

                                    <div
                                        v-if="Home.construction_status"
                                        class="col-md-4 col-sm-12 icon-hover-effect"
                                    >
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="48"
                                            height="48"
                                            fill="none"
                                        >
                                            <path
                                                stroke="#1E1D21"
                                                stroke-linejoin="round"
                                                d="M2.5 24.996h25m-20-6.875h15M9.375 12.496h11.25m-9.228-8.125h7.206l5.147 20.625H6.25z"
                                            ></path>
                                        </svg>
                                        <div class=" ">
                                            <strong>{{
                                                Home.construction_status
                                            }}</strong>
                                            <p>Building status</p>
                                        </div>
                                    </div>

                                    <div
                                        v-if="Home.price_from || Home.price_to"
                                        class="col-md-4 col-sm-12 icon-hover-effect"
                                    >
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="48"
                                            height="48"
                                            fill="none"
                                        >
                                            <path
                                                stroke="#1E1D21"
                                                stroke-linejoin="round"
                                                d="M15.105 2.501 4.483 11.632v14.39c0 .691.56 1.25 1.25 1.25h18.894c.69 0 1.25-.559 1.25-1.25V11.954zm0 0L.73 14.887M15.105 2.5l14.15 12.386"
                                            ></path>
                                            <path
                                                stroke="#1E1D21"
                                                d="M17.605 14.064a2.813 2.813 0 0 0-5.625 0c0 1.553 1.205 2.008 2.813 2.812 1.607.803 2.812 1.26 2.812 2.813a2.813 2.813 0 0 1-5.625 0m3.125-8.706V9.376m0 14.866v-1.607"
                                            ></path>
                                        </svg>
                                        <div class=" ">
                                            <strong>
                                                From {{ Home.price_from }} to
                                                <br />
                                                {{ Home.price_to }}
                                            </strong>
                                            <p>Price USD</p>
                                        </div>
                                    </div>
                                    <!-- <div class="col-md-3 col-sm-12 icon-hover-effect">
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        width="48"
                                        height="48"
                                        fill="none"
                                      >
                                        <path
                                            stroke="#1E1D21"
                                            stroke-linecap="round"
                                            stroke-linejoin="round"
                                            d="m11.992 15.45-.43.188-3.437 1.504L1.25 20.15 15 26.166l13.75-6.016-6.875-3.008-3.437-1.504-.43-.188"
                                        ></path>
                                        <path
                                            fill="#1E1D21"
                                            d="m15 19.073-.38.326a.5.5 0 0 0 .76 0zm5.125-9.723c0 .672-.306 1.589-.827 2.635-.512 1.03-1.2 2.125-1.897 3.132a49 49 0 0 1-2.72 3.56l-.045.053-.012.013-.003.004.379.326.38.326v-.002l.004-.003.013-.015a13 13 0 0 0 .23-.274 50.083 50.083 0 0 0 2.597-3.419c.71-1.027 1.428-2.165 1.97-3.255.534-1.074.931-2.166.931-3.081zM15 19.073l.38-.326h-.001l-.003-.004-.012-.013-.045-.054-.176-.21a49.157 49.157 0 0 1-2.544-3.349c-.696-1.007-1.385-2.101-1.897-3.132-.52-1.046-.827-1.963-.827-2.635h-1c0 .915.397 2.007.931 3.08.542 1.09 1.26 2.229 1.97 3.256a50 50 0 0 0 2.827 3.693l.013.014.005.006zM9.875 9.35c0-2.907 2.305-5.246 5.125-5.246v-1c-3.393 0-6.125 2.807-6.125 6.246zM15 4.104c2.82 0 5.125 2.339 5.125 5.246h1c0-3.44-2.732-6.246-6.125-6.246z"
                                        ></path>
                                        <circle
                                            cx="15.001"
                                            cy="9.081"
                                            r="2.347"
                                            fill="#1E1D21"
                                        ></circle>
                                    </svg>
                                    <div class=" ">
                                        <p>
                                            {{ Home.address || "N/A" }}
                                        </p>
                                    </div>
                                </div> -->

                                    <div
                                        v-if="Home.listing_type"
                                        class="col-md-4 icon-hover-effect"
                                    >
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="48"
                                            height="48"
                                            fill="none"
                                        >
                                            <path
                                                stroke="#1E1D21"
                                                stroke-linejoin="round"
                                                d="M.735 14.817 14.998 2.43 29.26 14.817M4.488 11.562v14.39c0 .691.56 1.25 1.25 1.25h18.894c.69 0 1.25-.559 1.25-1.25v-14.07l-10.9-9.451z"
                                            ></path>
                                            <path
                                                stroke="#1E1D21"
                                                stroke-linejoin="round"
                                                d="M10.869 14.817h8.633v12.386h-8.633z"
                                            ></path>
                                        </svg>
                                        <div class="">
                                            <strong>{{
                                                Home.listing_type
                                            }}</strong>
                                        </div>
                                    </div>

                                    <div
                                        v-if="Home.bedrooms"
                                        class="col-md-4 icon-hover-effect"
                                    >
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="48"
                                            height="48"
                                            fill="none"
                                        >
                                            <path
                                                fill="#1E1D21"
                                                d="M2.05 21.334h-.5v.5h.5zm0-6.792v-.5h-.5v.5zm10.614 0h.5v-.5h-.5zm0-6.516h.5zM13.79 6.9v-.5zm13.032 0v.5zm1.126 1.126h.5zm-15.742 6.28v.5h.596l-.103-.586zm-.22-1.25.492-.086-.188-1.07-.69.838zm-1.03 1.25-.386-.317-.674.817h1.06zM2.55 21.334v-6.792h-1v6.792zm-.5-6.292h10.614v-1H2.05zm10.114-.5v6.792h1v-6.792zM2.05 21.834h10.614v-1H2.05zm11.114-.5V8.026h-1v13.308zM13.79 7.4h13.032v-1H13.79zm13.658.626v13.308h1V8.026zM12.664 21.834h15.284v-1H12.664zM26.822 7.4c.346 0 .626.28.626.626h1c0-.898-.728-1.626-1.626-1.626zm-13.658.626c0-.346.28-.626.626-.626v-1c-.898 0-1.626.728-1.626 1.626zm14.284 13.308v5.52h1v-5.52zM1.55 5.626v21.228h1V5.626zm10.614 4.882c0 1.978-1.512 3.534-3.321 3.534v1c2.412 0 4.321-2.056 4.321-4.534zm-3.321 3.534c-1.809 0-3.321-1.556-3.321-3.534h-1c0 2.478 1.91 4.534 4.321 4.534zm-3.321-3.534c0-1.977 1.512-3.533 3.321-3.533v-1c-2.412 0-4.321 2.055-4.321 4.533zm3.321-3.533c1.809 0 3.321 1.556 3.321 3.533h1c0-2.478-1.91-4.533-4.321-4.533zm3.856 7.245-.22-1.25-.985.173.22 1.25zm-.493-.414h-1.25v1h1.25zm-.864.818 1.03-1.25-.772-.636-1.03 1.25z"
                                            ></path>
                                        </svg>
                                        <div class=" ">
                                            <strong>{{ Home.bedrooms }}</strong>
                                            <p>Beds</p>
                                        </div>
                                    </div>
                                    <div
                                        v-if="Home.full_bath || Home.half_bath"
                                        class="col-md-4 icon-hover-effect"
                                    >
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="48"
                                            height="48"
                                            fill="none"
                                        >
                                            <path
                                                stroke="#1E1D21"
                                                stroke-linejoin="round"
                                                d="M13.136 5.217V3.314c0-.621-.504-1.126-1.126-1.126h-6.6c-.623 0-1.127.505-1.127 1.126V14.07M8.96 25.414l-.965 3.332m13.528-3.332.965 3.332m-21-14.443 3.285 10.395c.148.468.583.787 1.074.787h18.307c.491 0 .926-.319 1.074-.787l3.284-10.395zm10.251-9.41L9.874 8.155h6.523l-1.863-3.262z"
                                            ></path>
                                        </svg>
                                        <div class="">
                                            <strong
                                                >{{ Home.full_bath }} -
                                                {{ Home.half_bath }}</strong
                                            >
                                            <p>Baths Full-Half</p>
                                        </div>
                                    </div>
                                    <div
                                        v-if="Home.square_feet"
                                        class="col-md-4 icon-hover-effect"
                                    >
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="48"
                                            height="48"
                                            fill="none"
                                        >
                                            <path
                                                fill="#1E1D21"
                                                d="M3.37 3v-.5h-.5V3zm23.273 0h.5v-.5h-.5zm0 24v.5h.5V27zM3.37 27h-.5v.5h.5zm18.91 0h-.5v.5h.5zm3.635-12.591a.5.5 0 1 0 0-1zm-8-.5h-.5a.5.5 0 0 0 .5.5zm.5-4.364v-.5h-1v.5zm-6.95 8.232a.5.5 0 1 0 0-1zm-8.095-1h-.5v1h.5zm18.909 2.95h.5a.5.5 0 0 0-.457-.498zM13.415 27a.5.5 0 1 0 1 0zM3.37 3.5h23.273v-1H3.37zM26.143 3v24h1V3zM3.87 27V3h-1v24zm10.41-.5H3.37v1h10.91zm12.363 0h-4.364v1h4.364zm-.728-13.091h-8v1h8zm-7.5.5V9.545h-1v4.364zm-6.95 2.868H3.37v1h8.095zM22.779 27v-7.273h-1V27zm-.457-7.77c-1.467-.128-3.67.097-5.528 1.214-1.892 1.14-3.379 3.18-3.379 6.556h1c0-3.024 1.302-4.74 2.895-5.699 1.627-.98 3.605-1.19 4.926-1.076z"
                                            ></path>
                                        </svg>
                                        <div class="">
                                            <strong>{{
                                                Home.square_feet
                                            }}</strong>
                                            <p>SqFt</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Middle Section: Image Carousel and Highlights in Two Columns -->
                            <div
                                class="mt-2 card card-body rounded-5 hover-effect"
                            >
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
                                    <Slide
                                        v-for="(file, index) in Home.files"
                                        :key="index"
                                    >
                                        <img
                                            :src="file.file_name"
                                            :alt="file.file_original_name"
                                            class="img-fluid c-img-filter c-images-border-design"
                                            style="
                                                max-width: 100%;
                                                height: 400px;
                                                object-fit: cover;
                                            "
                                            @error="setAltImg"
                                        />
                                    </Slide>
                                    <template #addons>
                                        <Navigation />
                                        <Pagination />
                                    </template>
                                </Carousel>

                                <!-- Thumbnails Carousel -->
                                <Carousel
                                    id="thumbnails"
                                    :items-to-show="4"
                                    :wrap-around="true"
                                    v-model="currentSlide"
                                    ref="carousel"
                                >
                                    <!-- Thumbnail Images -->
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
                                </Carousel>
                            </div>

                            <div
                                class="card card-body rounded-5 hover-effect mt-2"
                            >
                                <h1 id="overview" class="mb-4 feature-title">
                                    Features
                                </h1>
                                <div class="row">
                                    <!-- Closet Section -->
                                    <div
                                        class="col-md-4 mb-4"
                                        v-if="
                                            Home.feature.reach_in ||
                                            Home.feature.walk_in ||
                                            Home.feature.laundry_closet ||
                                            Home.feature.closet_location
                                        "
                                    >
                                        <h5 class="fw-bold feature-title">
                                            Closets
                                        </h5>
                                        <ul class="list-unstyled">
                                            <li v-if="Home.feature.reach_in">
                                                <strong
                                                    >Reach-In Closet:</strong
                                                >
                                                {{
                                                    Home.feature.reach_in
                                                        ? "Yes"
                                                        : "No"
                                                }}
                                            </li>
                                            <li v-if="Home.feature.walk_in">
                                                <strong>Walk-In Closet:</strong>
                                                {{
                                                    Home.feature.walk_in
                                                        ? "Yes"
                                                        : "No"
                                                }}
                                            </li>
                                            <li
                                                v-if="
                                                    Home.feature.laundry_closet
                                                "
                                            >
                                                <strong>Laundry Closet:</strong>
                                                {{
                                                    Home.feature.laundry_closet
                                                        ? "Yes"
                                                        : "No"
                                                }}
                                            </li>
                                            <li
                                                v-if="
                                                    Home.feature.closet_location
                                                "
                                            >
                                                <strong>Location:</strong>
                                                {{
                                                    Home.feature
                                                        .closet_location ||
                                                    "N/A"
                                                }}
                                            </li>
                                        </ul>
                                    </div>

                                    <!-- Bathroom Section -->
                                    <div
                                        class="col-md-4 mb-4"
                                        v-if="
                                            Home.feature.bathroom_type ||
                                            Home.feature.bathroom_status ||
                                            Home.feature.private_bath ||
                                            Home.feature.outdoor_shower
                                        "
                                    >
                                        <h5 class="fw-bold feature-title">
                                            Bathroom
                                        </h5>
                                        <ul class="list-unstyled">
                                            <li
                                                v-if="
                                                    Home.feature.bathroom_type
                                                "
                                            >
                                                <strong>Type:</strong>
                                                {{
                                                    Home.feature
                                                        .bathroom_type || "N/A"
                                                }}
                                            </li>
                                            <li
                                                v-if="
                                                    Home.feature.bathroom_status
                                                "
                                            >
                                                <strong>Status:</strong>
                                                {{
                                                    Home.feature
                                                        .bathroom_status ||
                                                    "N/A"
                                                }}
                                            </li>
                                            <li
                                                v-if="Home.feature.private_bath"
                                            >
                                                <strong>Private Bath:</strong>
                                                {{
                                                    Home.feature.private_bath
                                                        ? "Yes"
                                                        : "No"
                                                }}
                                            </li>
                                            <li
                                                v-if="
                                                    Home.feature.outdoor_shower
                                                "
                                            >
                                                <strong>Outdoor Shower:</strong>
                                                {{
                                                    Home.feature.outdoor_shower
                                                        ? "Yes"
                                                        : "No"
                                                }}
                                            </li>
                                        </ul>
                                    </div>

                                    <!-- Pool Section -->
                                    <div
                                        class="col-md-4 mb-4"
                                        v-if="
                                            Home.feature.pool_shape ||
                                            Home.feature.water_features ||
                                            Home.feature.pool_status ||
                                            Home.feature.spa
                                        "
                                    >
                                        <h5 class="fw-bold feature-title">
                                            Pool
                                        </h5>
                                        <ul class="list-unstyled">
                                            <li v-if="Home.feature.pool_shape">
                                                <strong>Shape:</strong>
                                                {{
                                                    Home.feature.pool_shape ||
                                                    "N/A"
                                                }}
                                            </li>
                                            <li
                                                v-if="
                                                    Home.feature.water_features
                                                "
                                            >
                                                <strong>Water Features:</strong>
                                                {{
                                                    Home.feature
                                                        .water_features || "N/A"
                                                }}
                                            </li>
                                            <li v-if="Home.feature.pool_status">
                                                <strong>Status:</strong>
                                                {{
                                                    Home.feature.pool_status ||
                                                    "N/A"
                                                }}
                                            </li>
                                            <li v-if="Home.feature.spa">
                                                <strong>Spa:</strong>
                                                {{
                                                    Home.feature.spa
                                                        ? "Yes"
                                                        : "No"
                                                }}
                                            </li>
                                        </ul>
                                    </div>

                                    <!-- Fencing Section -->
                                    <div
                                        class="col-md-4 mb-4"
                                        v-if="
                                            Home.feature.fencing_material ||
                                            Home.feature.fencing_status
                                        "
                                    >
                                        <h5 class="fw-bold feature-title">
                                            Fencing
                                        </h5>
                                        <ul class="list-unstyled">
                                            <li
                                                v-if="
                                                    Home.feature
                                                        .fencing_material
                                                "
                                            >
                                                <strong>Material:</strong>
                                                {{
                                                    Home.feature
                                                        .fencing_material ||
                                                    "N/A"
                                                }}
                                            </li>
                                            <li
                                                v-if="
                                                    Home.feature.fencing_status
                                                "
                                            >
                                                <strong>Status:</strong>
                                                {{
                                                    Home.feature
                                                        .fencing_status || "N/A"
                                                }}
                                            </li>
                                        </ul>
                                    </div>

                                    <!-- Bedroom Section -->
                                    <div
                                        class="col-md-4 mb-4"
                                        v-if="Home.feature.bedroom_location"
                                    >
                                        <h5 class="fw-bold feature-title">
                                            Bedroom
                                        </h5>
                                        <ul class="list-unstyled">
                                            <li
                                                v-if="
                                                    Home.feature
                                                        .bedroom_location
                                                "
                                            >
                                                <strong>Location:</strong>
                                                {{
                                                    Home.feature
                                                        .bedroom_location ||
                                                    "N/A"
                                                }}
                                            </li>
                                        </ul>
                                    </div>

                                    <!-- Fireplace Section -->
                                    <div
                                        class="col-md-4 mb-4"
                                        v-if="Home.feature.fireplace_type"
                                    >
                                        <h5 class="fw-bold feature-title">
                                            Fireplace
                                        </h5>
                                        <ul class="list-unstyled">
                                            <li
                                                v-if="
                                                    Home.feature.fireplace_type
                                                "
                                            >
                                                <strong>Type:</strong>
                                                {{
                                                    Home.feature
                                                        .fireplace_type || "N/A"
                                                }}
                                            </li>
                                        </ul>
                                    </div>

                                    <!-- Kitchen Section -->
                                    <div
                                        class="col-md-4 mb-4"
                                        v-if="Home.feature.kitchen_pantry_type"
                                    >
                                        <h5 class="fw-bold feature-title">
                                            Kitchen
                                        </h5>
                                        <ul class="list-unstyled">
                                            <li
                                                v-if="
                                                    Home.feature
                                                        .kitchen_pantry_type
                                                "
                                            >
                                                <strong>Pantry Type:</strong>
                                                {{
                                                    Home.feature
                                                        .kitchen_pantry_type ||
                                                    "N/A"
                                                }}
                                            </li>
                                        </ul>
                                    </div>

                                    <!-- Parking Section -->
                                    <div
                                        class="col-md-4 mb-4"
                                        v-if="Home.feature.parking_enclosure"
                                    >
                                        <h5 class="fw-bold feature-title">
                                            Parking
                                        </h5>
                                        <ul class="list-unstyled">
                                            <li
                                                v-if="
                                                    Home.feature
                                                        .parking_enclosure
                                                "
                                            >
                                                <strong>Enclosed:</strong>
                                                {{
                                                    Home.feature
                                                        .parking_enclosure
                                                        ? "Yes"
                                                        : "No"
                                                }}
                                            </li>
                                        </ul>
                                    </div>

                                    <!-- Landscape Section -->
                                    <div
                                        class="col-md-4 mb-4"
                                        v-if="
                                            Home.feature.landscape_maintenance
                                        "
                                    >
                                        <h5 class="fw-bold feature-title">
                                            Landscape Maintenance
                                        </h5>
                                        <ul class="list-unstyled">
                                            <li>
                                                {{
                                                    Home.feature
                                                        .landscape_maintenance
                                                        ? "Yes"
                                                        : "No"
                                                }}
                                            </li>
                                        </ul>
                                    </div>

                                    <!-- Foundation Section -->
                                    <div
                                        class="col-md-4 mb-4"
                                        v-if="
                                            Home.feature.foundation_conditions
                                        "
                                    >
                                        <h5 class="fw-bold feature-title">
                                            Foundation
                                        </h5>
                                        <ul class="list-unstyled">
                                            <li>
                                                <strong>Condition:</strong>
                                                {{
                                                    Home.feature
                                                        .foundation_conditions ||
                                                    "N/A"
                                                }}
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- <div
                            class="col-12 col-md-4 mt-5 rounded-5 c-bg-color text-black hover-effect"
                            style="
                                position: sticky;
                                top: 0;
                                height: 550px;
                                overflow: auto;
                                color: black !important;
                            "
                        > -->

                        <div
                            class="col-12 col-md-4 mt-5 rounded-5 c-bg-color text-black hover-effect"
                            style="
                                position: sticky;
                                top: 100px; /* Adjust this value based on your navbar height */
                                height: 550px;
                                overflow: auto;
                                color: black !important;
                            "
                        >
                            <a
                                class="btn c-btn-theme-primary c-theme-rounded-btn mt-5 w-100 p-4 beat"
                                :href="'/homes-agents/' + home_id"
                            >
                                <b class="fs-3">Connect to Agent</b>
                                <i class="bi bi-arrow-right ms-2"></i>
                            </a>
                            <div class="highlights mt-3">
                                <h4 class="feature-title">HIGHLIGHTS</h4>

                                <!-- Show actual data if user is logged in and not a customer -->
                                <!-- <div
                                    v-if="
                                        logged_in_user &&
                                        logged_in_user.role === 'customer' &&
                                        user_home_visiting_history_count < 50
                                    "
                                > -->
                                <div>
                                    <div v-if="Home.incentive">
                                        <div class="banner-content">
                                            <div class="open-house-tag mb-2">
                                                AVAILABLE INCENTIVE
                                            </div>
                                            <div>
                                                <i
                                                    class="bi bi-check-lg text-warning fs-5"
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
                                    </div>
                                    <div class="mt-2" v-if="Community">
                                        <div class="open-house-tag mb-2">
                                            COMMUNITY
                                        </div>
                                        <i
                                            class="bi bi-check-lg text-warning fs-5"
                                        ></i>
                                        {{ Community.name }}<br />
                                        <i
                                            class="bi bi-list text-warning fs-5"
                                        ></i>
                                        {{ Community.description }}<br />
                                        <i
                                            class="bi bi-geo-alt-fill text-warning fs-5"
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
                                                class="bi bi-geo-alt-fill text-warning fs-5"
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
                                            <div class="open-house-tag mb-2">
                                                SCHOOL
                                            </div>
                                            <i
                                                class="bi bi-buildings-fill text-warning fs-5"
                                            ></i>
                                            {{ Home.school_name }}
                                        </div>
                                    </div>
                                    <div
                                        class="highlights mt-2"
                                        v-if="Home.hoa_name"
                                    >
                                        <div>
                                            <div class="open-house-tag mb-2">
                                                HOA
                                            </div>
                                            <i
                                                class="bi bi-house text-warning fs-5"
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
                                        home.is_open_house === 1
                                            ? 'Open House'
                                            : 'Quick Move In'
                                    "
                                    :main_image="
                                        home.main_image ??
                                        '/images/default_image.png'
                                    "
                                    :title="home.title"
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
            return Math.floor(price); // Removes the decimal portion
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
.top-section {
    position: relative;
    height: 300px; /* Adjust height as needed */
    background-size: cover;
    background-position: center;
    color: white;
    display: flex;
    width: 100%;
    align-items: flex-end;
}

.info-overlay {
    background: #01060d9d;
    padding: 10px;
    width: 100%;
    border-radius: 0px !important;
}
.info-card-overlay {
    background: #01060d9d;
    padding: 10px;
    width: 100%;
    border-radius: 0px !important;
}

.price {
    font-size: 20px;
    margin: 5px 0;
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
.carousel {
    border-radius: 25px;
    overflow: hidden;
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
    background-color: rgba(22, 50, 89, 255);
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
    background: #fba638;
    color: white;
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
    background-color: #002855;
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
</style>
