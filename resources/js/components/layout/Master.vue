<template>
    <div class="c-top-bar-section">
        <div class="c-top-bar-section d-flex justify-content-between">
            <div>
                <!-- Left-aligned social links -->
                <div class="row d-flex">
                    <div class="text-black">
                        <a :href="'mailto:' + email" class="contact">
                            {{ email }}
                        </a>
                        <i class="bi bi-telephone-outbound"></i>

                        <a
                            class="text-black ms-1 c-dec-none"
                            :href="'tel:' + website_phone"
                        >
                            {{ website_phone }}
                        </a>
                    </div>
                </div>
            </div>
            <!-- Phone number aligned to the right -->
            <div class="ms-auto text-black">
                <span v-if="youtube_link">
                    <a :href="youtube_link" target="_blank">
                        <i class="bi bi-youtube text-danger"></i>
                    </a>
                </span>
                <span v-if="instagram_link">
                    <a :href="instagram_link" target="_blank">
                        <i class="bi bi-instagram" style="color: #c13584"></i>
                    </a>
                </span>
                <span v-if="facebook_link">
                    <a :href="facebook_link" target="_blank">
                        <i class="bi bi-facebook me-3 text-primary"></i>
                    </a>
                </span>
            </div>
        </div>
    </div>

    <nav class="navbar navbar-expand-lg bg-theme c-navbar-color sticky-top">
        <!-- <nav class="navbar navbar-expand-lg  bg-theme c-navbar-color"> -->
        <div class="container">
            <!-- Navbar brand -->

            <!-- Navbar toggle button -->
            <button
                class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent"
                aria-expanded="false"
                aria-label="Toggle navigation"
            >
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Navbar links -->
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <!-- Dropdown menus -->
                    <li class="nav-item dropdown">
                        <a
                            class="nav-link"
                            href="/"
                            id="navbarDropdownDeals"
                            role="button"
                        >
                            Home
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a
                            class="nav-link"
                            href="/all/communities/"
                            id="navbarDropdownDeals"
                            role="button"
                        >
                            Communities
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a
                            class="nav-link"
                            href="/all/open/houses/"
                            id="navbarDropdownDeals"
                            role="button"
                        >
                            Open Houses
                        </a>
                    </li>

                    <!-- <li class="nav-item dropdown">
                       
                        <a
                            class="nav-link dropdown-toggle"
                            href="#"
                            id="navbarDropdownDestinations"
                            role="button"
                            data-bs-toggle="dropdown"
                            aria-expanded="false"
                        >
                            Communities
                        </a>
 
                        <ul
                            class="dropdown-menu"
                            aria-labelledby="navbarDropdownDestinations"
                        >
                            <li
                                v-if="!communities.length"
                                class="dropdown-item"
                            >
                                Loading...
                            </li>
                            <li
                                v-for="community in communities"
                                :key="community.id"
                            >
                                <a
                                    class="dropdown-item"
                                    :href="`/detailed/community/${community.id}`"
                                >
                                    {{ community.name }}
                                </a>
                            </li>
                        </ul>
                    </li> -->

                    <!-- <li class="nav-item dropdown"> 
                        <a
                            class="nav-link dropdown-toggle"
                            href="#"
                            id="navbarDropdownOpenHouses"
                            role="button"
                            data-bs-toggle="dropdown"
                            aria-expanded="false"
                        >
                            Open Houses
                        </a>
 
                        <ul
                            class="dropdown-menu"
                            aria-labelledby="navbarDropdownOpenHouses"
                        >
                            <li v-if="!openHouses.length" class="dropdown-item">
                                Loading...
                            </li>
                            <li
                                v-for="openHouse in openHouses"
                                :key="openHouse.id"
                            >
                                <a
                                    class="dropdown-item"
                                    :href="`/home-details/${openHouse.property_id}`"
                                >
                                    {{ openHouse.title }}
                                </a>
                            </li>
                        </ul>
                    </li> -->
                    <!-- <li class="nav-item dropdown">
                       
                        <a
                            class="nav-link dropdown-toggle"
                            href="#"
                            id="navbarDropdownOpenHouses"
                            role="button"
                            data-bs-toggle="dropdown"
                            aria-expanded="false"
                        >
                            Incentives
                        </a>

                        
                        <ul
                            class="dropdown-menu"
                            aria-labelledby="navbarDropdownOpenHouses"
                        >
                            <li
                                v-for="incentive in incentives_list"
                                :key="incentive.id"
                            >
                                <a
                                    class="dropdown-item"
                                    :href="`/incentive-details/${incentive.id}`"
                                >
                                    {{ incentive.title }}
                                </a>
                            </li>
                        </ul>
                    </li> -->

                    <li class="nav-item dropdown">
                        <a
                            class="nav-link"
                            href="/all-incentives"
                            id="navbarDropdownDeals"
                            role="button"
                        >
                            Incentives
                        </a>
                    </li>
                    <!-- <li class="nav-item dropdown"> 
                        <a
                            class="nav-link"
                            href="/all-incentives"
                            id="navbarDropdownDeals"
                            role="button"
                        >
                        Search
                        </a> 
                    </li> -->

                    <!-- <li class="nav-item dropdown">
                        
                        <a
                            class="nav-link"
                            href="/search/homes"
                            id="navbarDropdownDeals"
                            role="button"
                        >
                            <i class="bi bi-search"></i>
                        </a>
                         
                    </li> -->
                </ul>
                <h1 class="mx-auto c-site-main-title">
                    <a href="/" class="c-link-style">
                        <!-- {{ name }} -->
                        <img :src="logo" :alt="name" width="110" />
                    </a>
                </h1>
                <!-- Right side dropdowns -->
                <ul class="navbar-nav mb-2 mb-lg-0">
                    <li class="nav-item dropdown">
                        <a
                            class="nav-link"
                            href="/all-events"
                            id="navbarDropdownDeals"
                            role="button"
                        >
                            Events
                        </a>
                    </li>

                    <li class="nav-item dropdown">
                        <!-- Dropdown trigger -->
                        <a
                            class="nav-link"
                            href="/about-us"
                            id="navbarDropdownDeals"
                            role="button"
                        >
                            About us
                        </a>
                        <!-- Dropdown menu -->
                    </li>
                    <li class="nav-item dropdown">
                        <!-- Dropdown trigger -->
                        <a
                            class="nav-link"
                            href="/contact"
                            id="navbarDropdownDeals"
                            role="button"
                        >
                            Contact us
                        </a>
                        <!-- Dropdown menu -->
                    </li>
                    <li class="nav-item dropdown">
                        <!-- Dropdown trigger -->
                        <a
                            class="nav-link"
                            href="/blogs"
                            id="navbarDropdownDeals"
                            role="button"
                        >
                            Blogs
                        </a>
                        <!-- Dropdown menu -->
                    </li>
                    <li class="nav-item dropdown">
                        <a
                            class="nav-link"
                            href="/help"
                            id="navbarDropdownDeals"
                            role="button"
                        >
                            Help
                        </a>
                    </li>

                    <!-- Login dropdown -->
                    <li class="nav-item dropdown">
                        <!-- Dropdown trigger -->
                        <a
                            v-if="logged_in_user"
                            class="nav-link dropdown-toggle"
                            href="#"
                            role="button"
                            id="dropdownMenuLink"
                            data-bs-toggle="dropdown"
                            aria-expanded="false"
                        >
                            {{ logged_in_user.name }}
                        </a>
                        <a
                            v-else
                            ref="openLoginModal"
                            data-bs-toggle="modal"
                            data-bs-target="#loginModal"
                            class="nav-link text-decoration-none c-pointer"
                            @click="clearFields"
                        >
                            {{ translate("Login") }}
                        </a>

                        <!-- Dropdown menu -->
                        <ul
                            class="dropdown-menu dropdown-menu-end"
                            aria-labelledby="dropdownMenuLink"
                        >
                            <li v-if="logged_in_user">
                                <a class="dropdown-item" href="/dashboard">
                                    <i class="bi bi-speedometer me-1"></i>
                                    Dashboard
                                </a>
                            </li>
                            <li v-if="logged_in_user">
                                <a
                                    class="dropdown-item"
                                    href="#"
                                    @click="logOut"
                                >
                                    <i class="bi bi-box-arrow-right me-2"></i>
                                    Log out
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <!-- create a button with a title Register to opne register modal data-bs-toggle="modal"
                                    data-bs-target="#registerusermodal" -->
                        <button
                            v-if="!logged_in_user"
                            ref="openRegisterModal"
                            data-bs-toggle="modal"
                            data-bs-target="#registerusermodal"
                            class="btn btn-sm c-btn-theme-primary text-white mt-1 c-pointer"
                            @click="clearFields"
                        >
                            {{ translate("Register") }}
                        </button>
                    </li>

                    <li class="c-top-bar-section-inside-navbar">
                        <span v-if="youtube_link">
                            <a :href="youtube_link">
                                <i class="bi bi-youtube me-4 text-danger"></i>
                            </a>
                        </span>
                        <span v-if="instagram_link">
                            <a :href="instagram_link">
                                <i
                                    class="bi bi-instagram me-4"
                                    style="color: #c13584"
                                ></i>
                            </a>
                        </span>
                        <span v-if="facebook_link">
                            <a :href="facebook_link">
                                <i class="bi bi-facebook me-3 text-primary"></i>
                            </a>
                        </span>

                        <a :href="'mailto:' + email" class="text-white contact">
                            {{ email }}
                        </a>

                        <br />

                        <a
                            class="text-white ms-1"
                            :href="'tel:' + website_phone"
                        >
                            {{ website_phone }}
                        </a>
                    </li>
                </ul>
                <h1 class="mx-auto c-site-secondary-title">
                    <a href="/" class="c-link-style">
                        <!-- {{ name }} -->
                        <img :src="logo" :alt="name" width="150" />
                    </a>
                </h1>
            </div>
        </div>
    </nav>

    <main>
        <slot></slot>
    </main>
    <div class="modal fade" id="loginModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="text-center text-black mt-4">
                        <div class="text-center mb-4">
                            <img
                                :src="logo"
                                @error="setAltImg"
                                alt="Logo"
                                class="logo mb-3"
                                width="130"
                            />
                            <h2 class="h5 fw-bold">{{ name }}</h2>
                            <p class="text-muted small">
                                Welcome back! Please login.
                            </p>
                        </div>
                    </div>
                    <div class="block-content p-4">
                        <form @submit.prevent="login">
                            <!-- <h1 class="h3 mb-3 fw-normal">Please sign in</h1> -->

                            <div class="mb-3">
                                <input
                                    type="Email"
                                    class="form-control"
                                    placeholder="Email"
                                    v-model="form.email"
                                    :class="{
                                        'invalid-bg': formErrors.email,
                                    }"
                                />
                                <div
                                    v-if="formErrors.email"
                                    class="invalid-feedback d-block"
                                >
                                    {{ formErrors.email[0] }}
                                </div>
                            </div>
                            <div class="mb-3">
                                <input
                                    type="password"
                                    class="form-control"
                                    placeholder="Password"
                                    v-model="form.password"
                                    :class="{
                                        'invalid-bg': formErrors.password,
                                    }"
                                />
                                <div
                                    v-if="formErrors.password"
                                    class="invalid-feedback d-block"
                                >
                                    {{ formErrors.password[0] }}
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="mt-2">
                                    <button
                                        v-if="formStatus == 1"
                                        class="btn c-btn-theme-primary w-100"
                                        type="submit"
                                    >
                                        {{ translate("Login") }}
                                    </button>

                                    <button
                                        v-else
                                        class="btn c-btn-theme-primary w-100"
                                        type="submit"
                                    >
                                        {{ translate("Login") }}
                                        <span
                                            class="spinner-border spinner-border-sm"
                                            role="status"
                                            aria-hidden="true"
                                        ></span>
                                    </button>
                                </div>
                            </div>
                        </form>
                        <!-- <div class="col-12 theme-color-red">
                            <p class="small mb-0 theme-color-red">
                                <br />

                                <a
                                    data-bs-toggle="modal"
                                    data-bs-target="#registerusermodal"
                                    class="text-decoration-none text-black c-pointer"
                                >
                                    {{ translate("Register new user") }}
                                </a>
                            </p>
                        </div> -->
                        <div class="col-12 theme-color-red">
                            <p class="small mb-0 theme-color-red">
                                <br />

                                <a
                                    ref="forgotPasswordModal"
                                    data-bs-toggle="modal"
                                    data-bs-target="#forgotpasswordmodal"
                                    class="text-decoration-none text-black c-pointer"
                                >
                                    {{ translate("Forgot password") }}
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="forgotpasswordmodal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="block-content p-4">
                        <div v-if="reset_password_status == 1">
                            <div class="text-center text-black mt-4">
                                <h5 class="card-title text-center pb-0 fs-4">
                                    {{ translate("Reset your password") }}
                                </h5>
                            </div>

                            <form class="row g-3">
                                <div class="col-12">
                                    <label for="password" class="form-label"
                                        >{{ translate("Password") }}
                                    </label>
                                    <input
                                        type="password"
                                        class="form-control"
                                        placeholder="Password"
                                        :class="{
                                            'invalid-bg':
                                                resetFormErrors.password,
                                        }"
                                        v-model="resetForm.password"
                                    />

                                    <div
                                        v-if="resetFormErrors.password"
                                        class="invalid-feedback"
                                    >
                                        {{ resetFormErrors.password[0] }}
                                    </div>
                                </div>

                                <div class="col-12">
                                    <label for="password" class="form-label"
                                        >{{ translate("Confirm password") }}
                                    </label>
                                    <input
                                        type="password"
                                        class="form-control"
                                        placeholder="Confirm password"
                                        :class="{
                                            'invalid-bg':
                                                resetFormErrors.confirm_password,
                                        }"
                                        id="confirm_password"
                                        v-model="resetForm.confirm_password"
                                    />
                                    <div
                                        v-if="resetFormErrors.confirm_password"
                                        class="invalid-feedback"
                                    >
                                        {{
                                            resetFormErrors.confirm_password[0]
                                        }}
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="col-12 mt-2">
                                        <button
                                            type="button"
                                            @click="resetPassword"
                                            class="btn c-btn-theme-primary w-100"
                                            v-if="resetFormStatus == 1"
                                        >
                                            {{ translate("Reset") }}
                                        </button>
                                        <button
                                            class="btn c-btn-theme-primary w-100"
                                            type="button"
                                            v-else
                                        >
                                            {{ translate("Reseting") }}
                                            <span
                                                class="spinner-border spinner-border-sm"
                                                role="status"
                                                aria-hidden="true"
                                            ></span>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div v-else>
                            <div class="text-center text-black mt-4">
                                <div class="text-center text-black mt-4">
                                    <div class="text-center mb-4">
                                        <img
                                            :src="logo"
                                            @error="setAltImg"
                                            alt="Logo"
                                            class="logo mb-3"
                                            width="130"
                                        />
                                        <h2 class="h5 fw-bold">{{ name }}</h2>
                                        <p class="text-muted small">
                                            Reset your password.
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <form class="row g-0">
                                <!-- <h1 class="h3 mb-3 fw-normal">Please sign in</h1> -->

                                <div class="col-md-12 mt-3">
                                    <input
                                        type="Email"
                                        class="form-control"
                                        placeholder="Email"
                                        :class="{
                                            'invalid-bg':
                                                forgotPasswordFormErrors.email,
                                        }"
                                        v-model="forgotPasswordForm.email"
                                    />
                                    <div
                                        v-if="forgotPasswordFormErrors.email"
                                        class="invalid-feedback d-block"
                                    >
                                        {{ forgotPasswordFormErrors.email[0] }}
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="mt-2">
                                        <button
                                            v-if="forgotPasswordFormStatus == 1"
                                            class="btn c-btn-theme-primary w-100"
                                            type="submit"
                                            @click="forgotPassword"
                                        >
                                            {{ translate("Submit") }}
                                        </button>

                                        <button
                                            class="btn c-btn-theme-primary w-100"
                                            type="submit"
                                            v-else
                                        >
                                            {{ translate("Submit") }}
                                            <span
                                                class="spinner-border spinner-border-sm"
                                                role="status"
                                                aria-hidden="true"
                                            ></span>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="col-12 theme-color-red">
                            <p class="small mb-0 theme-color-red">
                                <br />

                                <a
                                    data-bs-toggle="modal"
                                    data-bs-target="#loginModal"
                                    class="text-decoration-none text-black c-pointer"
                                >
                                    {{ translate("Login") }}
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="registerusermodal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="text-center text-black mt-4">
                        <div class="text-center mb-4">
                            <img
                                :src="logo"
                                @error="setAltImg"
                                alt="Logo"
                                class="logo mb-2"
                                width="130"
                            />
                            <h2 class="h5 fw-bold">{{ name }}</h2>
                            <p class="text-muted small">Create a new account</p>
                        </div>
                    </div>
                    <div class="block-content p-4">
                        <div class="row g-2">
                            <div class="col-12">
                                <input
                                    type="text"
                                    class="form-control"
                                    :class="{
                                        'invalid-bg':
                                            registerFormErrors.user_name,
                                    }"
                                    v-model="registerForm.user_name"
                                    :placeholder="translate('Full name')"
                                />
                                <div
                                    v-if="registerFormErrors.user_name"
                                    class="invalid-feedback"
                                >
                                    {{ registerFormErrors.user_name[0] }}
                                </div>
                            </div>

                            <div class="col-12">
                                <input
                                    type="text"
                                    class="form-control"
                                    :class="{
                                        'invalid-bg': registerFormErrors.email,
                                    }"
                                    v-model="registerForm.email"
                                    :placeholder="translate('Email')"
                                />
                                <div
                                    v-if="registerFormErrors.email"
                                    class="invalid-feedback"
                                >
                                    {{ registerFormErrors.email[0] }}
                                </div>
                            </div>

                            <div class="col-12">
                                <input
                                    type="password"
                                    class="form-control"
                                    :class="{
                                        'invalid-bg':
                                            registerFormErrors.password,
                                    }"
                                    v-model="registerForm.password"
                                    :placeholder="translate('Password')"
                                />
                                <div
                                    v-if="registerFormErrors.password"
                                    class="invalid-feedback"
                                >
                                    {{ registerFormErrors.password[0] }}
                                </div>
                            </div>

                            <div class="col-12">
                                <input
                                    type="password"
                                    class="form-control"
                                    :class="{
                                        'invalid-bg':
                                            registerFormErrors.confirm_password,
                                    }"
                                    v-model="registerForm.confirm_password"
                                    :placeholder="translate('Confirm password')"
                                />
                                <div
                                    v-if="registerFormErrors.confirm_password"
                                    class="invalid-feedback"
                                >
                                    {{ registerFormErrors.confirm_password[0] }}
                                </div>
                            </div>

                            <br />
                            <div class="col-12">
                                <div class="mt-2">
                                    <button
                                        v-if="registerFormStatus == 1"
                                        class="btn c-btn-theme-primary w-100"
                                        type="submit"
                                        @click="register"
                                    >
                                        {{ translate("Register") }}
                                    </button>

                                    <button
                                        class="btn c-btn-theme-primary w-100"
                                        type="submit"
                                        v-else
                                    >
                                        {{ translate("Register") }}
                                        <span
                                            class="spinner-border spinner-border-sm"
                                            role="status"
                                            aria-hidden="true"
                                        ></span>
                                    </button>

                                    <button
                                        type="button"
                                        class="btn btn-secondary"
                                        data-bs-dismiss="modal"
                                        style="display: none"
                                        ref="registerModalClose"
                                    >
                                        Close
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 theme-color-red">
                            <p class="small mb-0 theme-color-red">
                                <br />

                                <a
                                    data-bs-toggle="modal"
                                    data-bs-target="#loginModal"
                                    class="text-decoration-none text-black c-pointer"
                                >
                                    {{ translate("Login") }}
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <button ref="closeModal" hidden="hidden" data-bs-dismiss="modal"></button>
    <!-- footer -->

    <footer class="footer c-bg-color text-white pt-5">
        <div class="container">
            <div class="row">
                <!-- Brand and Newsletter -->
                <div class="offset-md-1 col-md-4 mb-4">
                    <!-- <a href="/">
                        <img :src="logo" :alt="name" width="200" class="mb-3" />
                    </a> -->

                    <h5 class="fw-bold">BrandNewHomesVegas</h5>
                    <p class="text-white">
                        Your trusted partner in real estate, helping you find
                        the perfect place to call home.
                    </p>

                    <h6 class="mt-4 mb-2">Follow Us</h6>
                    <div class="d-flex gap-3">
                        <a
                            :href="facebook_link"
                            target="_blank"
                            class="text-light"
                            ><i class="bi bi-facebook fs-4"></i
                        ></a>
                        <a href="#" class="text-light"
                            ><i class="bi bi-twitter fs-4"></i
                        ></a>
                        <a
                            :href="instagram_link"
                            target="_blank"
                            class="text-light"
                            ><i class="bi bi-instagram fs-4"></i
                        ></a>
                        <a href="#" class="text-light"
                            ><i class="bi bi-linkedin fs-4"></i
                        ></a>
                        <a
                            :href="youtube_link"
                            target="_blank"
                            class="text-light"
                            ><i class="bi bi-youtube fs-4"></i
                        ></a>
                    </div>
                </div>
                <!-- About -->
                <div class="col-md-2 mb-4">
                    <h6 class="fw-bold">About</h6>
                    <ul class="list-unstyled">
                        <li class="mb-2">
                            <a
                                href="/about"
                                class="text-white text-decoration-none"
                                >About Us</a
                            >
                        </li>
                        <li class="mb-2">
                            <a
                                href="/help"
                                class="text-white text-decoration-none"
                                >Help Center</a
                            >
                        </li>
                        <li class="mb-2">
                            <a
                                href="/contact"
                                class="text-white text-decoration-none"
                                >Contact</a
                            >
                        </li>
                        <li class="mb-2">
                            <a
                                href="/privacy-policy"
                                class="text-white text-decoration-none"
                                >Privacy Policy</a
                            >
                        </li>
                        <li class="mb-2">
                            <a
                                href="/terms-of-services"
                                class="text-white text-decoration-none"
                                >Terms of Service</a
                            >
                        </li>
                    </ul>
                </div>
                <!-- Discover -->
                <div class="col-md-2 mb-4">
                    <h6 class="fw-bold">Discover</h6>
                    <ul class="list-unstyled">
                        <li class="mb-2">
                            <a href="/" class="text-white text-decoration-none"
                                >Home</a
                            >
                        </li>
                        <li class="mb-2">
                            <a
                                href="all/communities"
                                class="text-white text-decoration-none"
                                >Communities</a
                            >
                        </li>
                        <li class="mb-2">
                            <a
                                href="/all/open/houses/"
                                class="text-white text-decoration-none"
                                >Open Houses</a
                            >
                        </li>
                        <li class="mb-2">
                            <a
                                href="/all-incentives"
                                class="text-white text-decoration-none"
                                >Incentives</a
                            >
                        </li>
                    </ul>
                </div>

                <!-- Resources -->
                <div class="col-md-2 mb-4">
                    <h6 class="fw-bold">Resources</h6>
                    <ul class="list-unstyled">
                        <li class="mb-2">
                            <a
                                href="/blogs"
                                class="text-white text-decoration-none"
                                >Blog</a
                            >
                        </li>
                        <li class="mb-2">
                            <a
                                href="/all-events"
                                class="text-white text-decoration-none"
                                >Events</a
                            >
                        </li>
                        <!-- <li><a href="#" class="text-white text-decoration-none">Guides</a></li>
            <li><a href="#" class="text-white text-decoration-none">Help Center</a></li> -->
                    </ul>
                </div>
            </div>

            <hr class="border-secondary" />

            <!-- Bottom Bar -->
            <div
                class="offset-md-1 d-flex flex-column flex-md-row justify-content-between py-3 text-whitesmall"
            >
                <div>© 2025 BrandNewHomesVegas. All rights reserved.</div>
                <div class="d-flex gap-3">
                    <a
                        href="/privacy-policy"
                        class="text-white text-decoration-none"
                        >Privacy Policy</a
                    >
                    <a
                        href="/terms-of-services"
                        class="text-white text-decoration-none"
                        >Terms of Service</a
                    >
                    <a
                        href="/cookie-policy"
                        class="text-white text-decoration-none"
                        >Cookie Policy</a
                    >
                </div>
            </div>
        </div>
    </footer>

    <button
        type="button"
        class="btn btn-secondary"
        data-bs-dismiss="modal"
        style="display: none"
        ref="closeModal"
    >
        Close
    </button>
</template>

<script>
export default {
    data() {
        return {
            communities: [],
            openHouses: [],
            preLoader: true,
            logo: external_website.white_logo,
            name: external_website.name,
            external_website: external_website,
            logged_in_user: logged_in_user,
            youtube_link: "",
            instagram_link: "",
            facebook_link: "",
            email: "",
            form: {
                email: "",
                password: "",
            },
            formErrors: [],
            formStatus: 1,

            registerForm: {
                user_name: "",
                email: "",
                password: "",
                confirm_password: "",
                role: "customer",
                process_by: "User",
                process_status: "New",
            },
            registerFormErrors: [],
            registerFormStatus: 1,

            forgotPasswordForm: {
                email: "",
            },
            subscribeForm: {
                email: "",
            },
            forgotPasswordFormErrors: [],
            forgotPasswordFormStatus: 1,
            user_language_name: "",
            already_selected_language: "",
            languages: [],
            processing: "",
            user_confirmation_email: "",
            openConfirmCodeModal: false,
            reset_password_status: 0,
            resetForm: {
                user_email: "",
                password: "",
                confirm_password: "",
            },
            resetFormErrors: [],
            resetFormStatus: 1,

            call_me: {
                contact_number: "",
                agreement: "",
            },
            subscribeFormErrors: [],
            callmeformErrors: [],
            callNowBtnStatus: 1,
            callNowRequestGranted: false,
            website_phone: "",
            email: "",
            website_address: "",
            incentives_list: "",
        };
    },
    mounted() {
        this.getHomes();
        this.fetchCommunities();
        this.fetchOpenHouses();
    },
    components: {},
    created() {
        this.fatchLanguages();
        this.fetchWesiteInfo();
    },
    methods: {
        async getHomes() {
            await axios
                .get("/api/incentives-list")
                .then((response) => {
                    this.incentives_list = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        async fetchOpenHouses() {
            try {
                const response = await axios.get("/api/open-houses");
                this.openHouses = response.data;
            } catch (error) {
                console.error("Error fetching open houses:", error);
            }
        },
        async fetchCommunities() {
            try {
                const response = await axios.get("/api/communities");
                this.communities = response.data;
            } catch (error) {
                console.error("Error fetching communities:", error);
            }
        },
        callmeNow() {
            this.callNowBtnStatus = 0;
            axios
                .post("/api/call-me-now", this.call_me)
                .then((response) => {
                    this.callNowRequestGranted = true;
                    this.callNowBtnStatus = 1;
                })
                .catch((error) => {
                    this.callNowBtnStatus = 1;

                    toastr.error(error.response.data.message);
                    if (error.response.data.errors) {
                        this.callmeformErrors = 1;
                        this.callmeformErrors = error.response.data.errors;
                    }
                });
        },
        parentProcesses() {
            if (
                this.processing == "login" ||
                this.processing == "register-new-user"
            ) {
                toastr.success(
                    this.translate(
                        "Thank you! Your account has been successfully verified and is now active. Welcome aboard! You may now log in."
                    )
                );
                this.$refs.openLoginModal.click();
            } else if (this.processing == "reset-password") {
                this.$refs.forgotPasswordModal.click();
                this.reset_password_status = 1;
                toastr.success(
                    this.translate(
                        "Confirmation code matched successfully. Please proceed to reset your password."
                    )
                );
            }
        },
        fatchLanguages() {
            axios
                .get("/api/external-website-languages")
                .then((response) => {
                    this.languages = response.data.languages;
                    this.already_selected_language =
                        response.data.user_language;
                    // getting user default language name from langauges array
                    this.user_language_name = response.data.languages.filter(
                        (p) => p.code == this.already_selected_language
                    )[0].name;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        changeLang(code) {
            let formData = new FormData();
            formData.append("default_language", code);

            axios
                .post("/api/user-default-language", formData)
                .then((data) => {
                    window.location.reload();
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);

                    if (error.response.data.errors) {
                        this.formErrors = error.response.data.errors;
                    }
                });
        },
        fetchWesiteInfo() {
            axios
                .get("/api/fetch-website-info")
                .then((response) => {
                    this.website_name = response.data.website_name;
                    this.youtube_link = response.data.youtube_link;
                    this.instagram_link = response.data.instagram_link;
                    this.facebook_link = response.data.facebook_link;
                    this.email = response.data.email;
                    this.website_address = response.data.website_address;
                    this.website_phone = response.data.website_phone;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        async logOut() {
            await axios
                .post("/api/logout-user")
                .then((response) => {
                    this.formErrors = [];
                    window.location.href = "/";
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        login() {
            this.formStatus = 0;
            axios
                .post("/api/login-user", this.form)
                .then((response) => {
                    this.formErrors = [];
                    this.formStatus = 1;
                    this.processing = "login";

                    if (response.data == "not-verified") {
                        this.openConfirmCodeModal = true;
                        this.user_confirmation_email = this.form.email;
                    } else {
                        window.location.href = "/dashboard";
                        // window.location.reload();
                    }
                })
                .catch((error) => {
                    this.formStatus = 1;
                    toastr.error(error.response.data.message);
                    if (error.response.data.errors) {
                        this.formErrors = error.response.data.errors;
                    }
                });
        },

        // Registering user

        register() {
            this.registerFormStatus = 0;
            this.registerForm.role = "customer";
            this.registerForm.process_status = "New";
            axios
                .post("/api/register-submit", this.registerForm)
                .then((response) => {
                    toastr.success(
                        this.translate("New account registered succesfully!")
                    );
                    this.processing = "register-new-user";
                    this.openConfirmCodeModal = true;
                    this.user_confirmation_email = this.registerForm.email;

                    this.$refs.openLoginModal.click();

                    this.registerFormErrors = [];
                })
                .catch((error) => {
                    this.registerFormStatus = 1;

                    toastr.error(error.response.data.message);
                    if (error.response.data.errors) {
                        this.registerFormStatus = 1;
                        this.registerFormErrors = error.response.data.errors;
                    }
                });
        },
        // forgot password
        async forgotPassword() {
            this.forgotPasswordFormStatus = 0;
            await axios
                .post("/api/forgot-password", this.forgotPasswordForm)
                .then((response) => {
                    this.forgotPasswordFormErrors = [];
                    this.forgotPasswordFormStatus = 1;

                    this.formStatus = 1;
                    this.processing = "reset-password";
                    this.openConfirmCodeModal = true;
                    this.$refs.closeModal.click();
                    this.user_confirmation_email =
                        this.forgotPasswordForm.email;
                    this.resetForm.user_email = this.forgotPasswordForm.email;
                })
                .catch((error) => {
                    this.forgotPasswordFormStatus = 1;

                    toastr.error(error.response.data.message);
                    if (error.response.data.errors) {
                        this.forgotPasswordFormErrors =
                            error.response.data.errors;
                    }
                });
        },
        resetPassword() {
            this.resetFormStatus = 0;
            axios
                .post("/api/reset-password", this.resetForm)
                .then(() => {
                    toastr.success(
                        "Password successfully reset. You can now log in using the new password."
                    );

                    this.resetFormErrors = [];
                    this.process = "";
                    this.resetFormStatus = 1;
                    this.$refs.closeModal.click();
                    this.$refs.openLoginModal.click();
                })
                .catch((error) => {
                    this.resetFormStatus = 1;
                    toastr.error(error.response.data.message);

                    if (error.response.data.errors) {
                        this.resetFormErrors = error.response.data.errors;
                    }
                });
        },
        clearFields() {
            this.resetFormErrors = [];
            this.resetForm.user_email = "";
            this.resetForm.password = "";
            this.resetForm.confirm_password = "";

            this.forgotPasswordForm.email = "";
            this.forgotPasswordFormErrors = [];

            this.registerForm.user_name = "";
            this.registerForm.email = "";
            this.registerForm.password = "";
            this.registerForm.confirm_password = "";
            this.registerForm.role = "";
            this.registerForm.process_status = "";
            this.registerFormErrors = [];

            this.form.email = "";
            this.form.password = "";
            this.formErrors = [];
        },
        subscribe() {
            axios
                .post("/api/subscribe", this.subscribeForm)
                .then((response) => {
                    toastr.success(this.translate("Subscribed succesfully!"));

                    this.subscribeForm.email = "";
                    this.subscribeFormErrors = [];
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                    if (error.response.data.errors) {
                        this.subscribeFormErrors = error.response.data.errors;
                    }
                });
        },
    },
};
</script>
<style>
body {
    font-family: Inter, sans-serif !important;
    background-color: #f7fafc;
}
p {
    margin: 0;
    padding: 0;
}
.c-top-bar-section {
    background-color: rgba(218, 224, 231, 1);
    text-indent: 20px;
    font-size: 0.875rem;
    color: white;
}
.c-top-bar-section-inside-navbar {
    display: none !important;
}
.c-theme-color {
    color: rgb(61, 102, 143);
}
.c-bg-color {
    background-color: #e7ebef !important;
    color: white !important;
}
.c-image-brightness {
    filter: brightness(60%);
}

.c-top-card {
    background-color: rgb(61, 102, 143);
    padding: 4px 24px;
    font-size: 0.875rem;
    text-align: center;
    height: 31px;
}
.carousel__prev,
.carousel__next {
    background: #163259 !important;
    border-radius: 50% !important;
    transform: unset !important;
    color: white !important;
}
.c-payment-methods .list-inline-item {
    font-size: 50px;
    margin-left: 15px;
}
.c-follow-us .list-inline-item {
    font-size: 20px;
    margin-left: 15px;
}
.c-website-footer-name {
    text-align: center;
    font-weight: bold;
    font-family: "Oakes Grotesk", sans-serif !important;
}
.flag {
    width: 20px;
    border-radius: 2px;
}
.contact {
    color: black;
    text-decoration: none;
}
.c-pointer {
    cursor: pointer;
}

.form-signin {
    max-width: 330px;
    padding: 1rem;
    margin-top: 10% !important;
}

.form-signin .form-floating:focus-within {
    z-index: 2;
}
.dropdown-menu.show {
    position: absolute;
    width: 150% !important;
    z-index: 1;
    animation: 100ms linear 0s 1 normal none running fadein;
    margin-top: -2px;
    right: 0px;
    border-color: rgb(113, 113, 113);
    overflow: hidden;
    text-overflow: ellipsis; /* Truncate text with ellipsis */
    white-space: normal;
}

.select-field {
    border: 1px solid black;
    border-radius: 20px;
    padding: 8px;
}

.c-font-size {
    font-size: 0.9rem;
}

.c-border-design {
    margin-bottom: 1rem !important;

    border: none;
    box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 15px -3px,
        rgba(0, 0, 0, 0.05) 0px 4px 6px -2px;
}
.c-card-border-design {
    border-radius: 0.25rem !important;
}

.c-site-main-title {
    display: block !important;
}
.c-site-secondary-title {
    display: none !important;
}

.navbar {
    height: 80px !important;
    color: white !important;
    font-weight: bold !important;
}
/* Media query for screens smaller than or equal to 768px (typically mobile devices) */
@media (max-width: 576px) {
    .navbar {
        height: auto !important;
        background-color: #163259 !important;
    }
    .dropdown-menu.show {
        position: absolute;
        width: 100% !important;
        z-index: 1;
        animation: 100ms linear 0s 1 normal none running fadein;
        margin-top: -2px;
        right: 0px;
        border-color: rgb(113, 113, 113);
        overflow: hidden;
        text-overflow: ellipsis; /* Truncate text with ellipsis */
        white-space: normal;
    }

    /* Hide c-top-bar-section on smaller screens */
    .c-top-bar-section {
        display: none !important;
    }
    /* Show c-top-bar-section-inside-navbar on smaller screens */
    .c-top-bar-section-inside-navbar {
        display: block !important;
    }

    .c-site-main-title {
        display: none !important;
    }
    .c-site-secondary-title {
        display: block !important;
    }
    .c-phone-icon {
        margin-top: 20px !important;
    }
}

@media (min-width: 577px) and (max-width: 768px) {
    .navbar {
        height: auto !important;
        background-color: #163259 !important;
    }
    .dropdown-menu.show {
        position: absolute;
        width: 50% !important;
        z-index: 1;
        animation: 100ms linear 0s 1 normal none running fadein;
        margin-top: -2px;
        right: 0px;
        border-color: rgb(113, 113, 113);
        overflow: hidden;
        text-overflow: ellipsis; /* Truncate text with ellipsis */
        white-space: normal;
    }

    /* Hide c-top-bar-section within this range */
    .c-top-bar-section {
        display: none !important;
    }

    /* Show c-top-bar-section-inside-navbar within this range */
    .c-top-bar-section-inside-navbar {
        display: block !important;
    }

    .c-site-main-title {
        display: none !important;
    }
    .c-site-secondary-title {
        display: block !important;
    }
    .c-phone-icon {
        margin-top: 20px !important;
    }
}

/* Media query for screens larger than 768px (typically larger devices) */
@media (min-width: 769px) and (max-width: 991px) {
    .navbar {
        height: auto !important;
        background-color: #163259 !important;
    }
    .dropdown-menu.show {
        position: absolute;
        width: 40% !important;
        z-index: 1;
        animation: 100ms linear 0s 1 normal none running fadein;
        margin-top: -2px;
        right: 0px;
        border-color: rgb(113, 113, 113);
        overflow: hidden;
        text-overflow: ellipsis; /* Truncate text with ellipsis */
        white-space: normal;
    }

    /* Show c-top-bar-section on larger screens */
    .c-top-bar-section {
        display: none !important;
    }

    /* Hide c-top-bar-section-inside-navbar on larger screens */
    .c-top-bar-section-inside-navbar {
        display: block !important;
    }
    .c-site-main-title {
        display: none !important;
    }
    .c-site-secondary-title {
        display: block !important;
    }
    .c-phone-icon {
        margin-top: 0px !important;
    }
    .c-phone-icon {
        margin-top: 0px !important;
    }
    .c-details-book-expert {
        width: 220px;
    }
    .c-details-book-expert-download {
        width: 220px;
    }
}

.c-link-style {
    text-decoration: none;
    color: white;
}

/* Global Css ////////////////////////////////////////////////////////////////////// */
/* Global Css ////////////////////////////////////////////////////////////////////// */
/* Global Css ////////////////////////////////////////////////////////////////////// */
.c-btn-theme-primary {
    background-color: rgb(61, 102, 143);
    color: white !important;
}
.c-btn-theme-primary:hover,
.c-btn-theme-primary:active,
.c-btn-theme-primary:visited {
    background-color: rgb(61, 102, 143) !important;
}

.c-btn-theme-primary:focus {
    box-shadow: 0 0 0 0.2rem rgb(61, 102, 143) !important;
}
.c-btn-theme-primary:active {
    box-shadow: 0 0 0 0.2rem rgb(61, 102, 143) !important;
}

.c-btn-theme-primary-outline {
    color: rgb(61, 102, 143) !important;
    border: 1px solid rgb(61, 102, 143) !important;
}

.c-btn-theme-primary-outline:hover {
    background-color: rgb(61, 102, 143) !important;
    color: white !important;
}

.c-btn-theme-primary-outline:focus,
.c-btn-theme-primary-outline.focus {
    background: rgb(61, 102, 143) !important;
    border-color: rgb(61, 102, 143) !important;
    color: white !important;
    box-shadow: 0 0 0 0.25rem rgb(61, 102, 143) !important;
}

.c-btn-theme-primary-outline:active,
.c-btn-theme-primary-outline.active,
.show > .c-btn-theme-primary-outline.dropdown-toggle {
    background: rgb(61, 102, 143) !important;
    border-color: rgb(61, 102, 143) !important;
}

.c-btn-theme-primary-outline:active:focus,
.c-btn-theme-primary-outline.active:focus,
.show > .c-btn-theme-primary-outline.dropdown-toggle:focus {
    box-shadow: 0 0 0 0.25rem rgb(61, 102, 143) !important;
}

.c-btn-theme-primary-outline :active:focus,
.c-btn-theme-primary-outline .active:focus,
.show > .c-btn-theme-primary-outline .dropdown-toggle:focus {
    box-shadow: 0 0 0 0.25rem rgb(61, 102, 143) !important;
}

/* //////////////////////////////////////////////////////////////////////////////////// */
/* TourDetails page css ////////////////////////////////////////////////////////////////*/
/* //////////////////////////////////////////////////////////////////////////////////// */
.fc-title {
    white-space: normal;
    overflow: visible;
    text-overflow: clip;
    background-color: rgb(61, 102, 143);
    color: black !important;
}

.calendar-container .fc-h-event .fc-event-main:hover {
    background-color: rgb(61, 102, 143) !important;
    border: rgb(61, 102, 143) !important;
    cursor: pointer;
}

.fc-h-event {
    border: 0px solid rgb(61, 102, 143);
    background-color: white;
}

.calendar-container .fc-h-event .fc-event-main {
    color: black !important;
    background-color: rgb(61, 102, 143) !important;
    font-weight: bold;

    text-align: center;
}
.calendar-container a {
    color: black !important;
    text-decoration: none;
}

.calendar {
    color: black !important;
}
label {
    font-weight: bold;
}
.c-content-radius {
    /* border: 1px solid grey; */
    border-radius: 25px;
}

.fc .fc-multimonth {
    border-radius: 30px;
    justify-content: space-between;
}

.fc .fc-button-primary:disabled {
    background-color: rgb(61, 102, 143) !important;
}
.fc .fc-button-primary {
    background-color: rgb(61, 102, 143) !important;
    color: black !important;
}
.fc .fc-button-primary:hover {
    background-color: rgb(61, 102, 143) !important;
}

.fc .fc-button-primary {
    border: 0px solid rgb(61, 102, 143);
}

.c-step-dropdown {
    width: 100% !important;
    background-color: rgb(61, 102, 143) !important;
    color: black !important;
}

.c-step-dropdown:hover,
.c-step-dropdown:active,
.c-step-dropdown:visited {
    background-color: rgb(61, 102, 143) !important;
    color: black !important;
}

.c-step-dropdown:focus {
    box-shadow: 0 0 0 0.2rem rgb(61, 102, 143) !important;
}
.c-step-dropdown:active {
    box-shadow: 0 0 0 0.2rem rgb(61, 102, 143) !important;
}
.dropdown-menu {
    width: 100% !important;
}

.accordion-button:not(.collapsed) {
    background-color: white !important;
}

.justify-text {
    text-align: justify;
}

.c-btn-border {
    border: 1px solid white;
    color: white;
}
.inline-elements {
    display: flex;
    align-items: baseline;
}
.inline-elements h1 {
    margin: 0;
}
.inline-elements small {
    margin-left: 5px;
    font-size: smaller;
}
.inline-elements .badge {
    margin-left: 10px;
}
.accordion-button:focus {
    box-shadow: none !important;
}
.accordion-button:not(.collapsed) {
    color: unset !important;
}
.c-card-img-overlay-name h3 {
    font-size: 24px;
    margin-bottom: 0px !important;
}
.c-card-img-overlay-name h5 {
    font-size: 14px;
}
.c-card-img-overlay-name + .card-body .card-title {
    height: 50px !important;
    display: -webkit-box;
    -webkit-line-clamp: 2; /* Limits to 2 lines */
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
}
.c-l-corner-radius {
    border-radius: 25px 0px 0px 25px;
}

.card-title {
    color: black !important;
}

.info-card-overlay {
    background: #bcd6f5b2;
    padding: 10px;
    width: 100%;
    color: black !important;
    font-weight: bold;
}

.bg-theme {
    background-color: #ffffff !important;
}
.c-navbar-color {
    color: #172636 !important;
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

.c-gradient-color {
    background: linear-gradient(#c2a01e 9%, #debf46, #c2a01e 84%);
}
.btn-primary {
    background: rgb(61, 102, 143);
}
.btn-primary:hover {
    background: #023f86;
}
.c-anchor-decoration {
    text-decoration: none;
    color: white;
    cursor: pointer;
}
/* Customize dropdown menu styling for the navbar */

.dropdown-menu {
    min-width: 200px; /* Adjust this value as needed */
}
.dropdown-item {
    white-space: normal;
}
.dropdown-menu {
    width: 200px; /* Set to a comfortable width */
    overflow-x: auto; /* Allows horizontal scrolling */
}
.dropdown-item:hover {
    background-color: rgb(61, 102, 143);
    color: white; /* Adjust text color for better readability, if needed */
}
.c-dec-none {
    text-decoration: none;
}

.c-main-title {
    font-family: "Playfair Display", serif !important;
    color: rgb(61, 102, 143);
    font-weight: 700 !important;
    line-height: 60px !important;

    z-index: 3 !important;
    width: 100% !important;
}
.c-sub-title {
    font-family: Inter, sans-serif !important;
    font-size: 24px !important;
    font-weight: 400 !important;
    line-height: 32px !important;
    color: #596773;
}

.c-custom-btn {
    border: 2px solid rgb(61, 102, 143); /* Primary color border */
    color: rgb(61, 102, 143); /* Primary text color */
}

.c-custom-btn:hover {
    background-color: rgb(61, 102, 143); /* Primary color on hover */
    color: white; /* White text on hover */
}
.multiselect-option.is-selected {
    background: rgb(61, 102, 143) !important;
    color: var(--ms-option-color-selected, #fff);
}
.multiselect-option.is-selected.is-pointed {
    background: rgb(61, 102, 143) !important;
    color: var(--ms-option-color-selected, #fff);
}

.uppercase {
    text-transform: uppercase;
}
.footer {
    background-color: #163259 !important;
    color: white !important;
    padding: 20px 0;
    font-size: 14px;
}
</style>
