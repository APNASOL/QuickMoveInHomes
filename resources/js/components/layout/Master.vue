<template>
    <div class="c-top-bar-section">
        <div class="c-top-bar-content">
            <div class="contact-info">
                <a :href="'mailto:' + email" class="contact-item">
                    <i class="bi bi-envelope contact-icon"></i>
                    <span>{{ email }}</span>
                </a>
                <a
                    class="contact-item c-dec-none"
                    :href="'tel:' + website_phone"
                >
                    <i class="bi bi-telephone-outbound contact-icon"></i>
                    <span>{{ website_phone }}</span>
                </a>
            </div>

            <div class="social-links">
                <span v-if="youtube_link">
                    <a
                        :href="youtube_link"
                        target="_blank"
                        class="social-link youtube"
                    >
                        <i class="bi bi-youtube"></i>
                    </a>
                </span>
                <span v-if="instagram_link">
                    <a
                        :href="instagram_link"
                        target="_blank"
                        class="social-link instagram"
                    >
                        <i class="bi bi-instagram"></i>
                    </a>
                </span>
                <span v-if="facebook_link">
                    <a
                        :href="facebook_link"
                        target="_blank"
                        class="social-link facebook"
                    >
                        <i class="bi bi-facebook"></i>
                    </a>
                </span>
            </div>
        </div>
    </div>

    <nav class="navbar navbar-expand-lg bg-theme c-navbar-color sticky-top">
        <div class="container position-relative">
            <!-- Mobile logo -->
            <h1 class="c-site-main-title d-lg-none">
                <a href="/" class="c-link-style">
                    <img :src="logo" :alt="name" width="110" />
                </a>
            </h1>

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
                <!-- Left side navigation -->
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="/" role="button"> Home </a>
                    </li>
                    <li class="nav-item">
                        <a
                            class="nav-link"
                            href="/all/communities/"
                            role="button"
                        >
                            Communities
                        </a>
                    </li>
                    <li class="nav-item">
                        <a
                            class="nav-link"
                            href="/all/open/houses/"
                            role="button"
                        >
                            Open Houses
                        </a>
                    </li>
                    <li class="nav-item">
                        <a
                            class="nav-link"
                            href="/all-incentives"
                            role="button"
                        >
                            Incentives
                        </a>
                    </li>
                </ul>

                <!-- Centered logo for desktop -->
                <!-- <h1 class="navbar-brand-center d-none d-lg-block">
                <a href="/" class="c-link-style">
                    <img :src="logo" :alt="name" width="150" />
                </a>
            </h1> -->

                <!-- Right side navigation -->
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="/all-events" role="button">
                            Events
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/about-us" role="button">
                            About us
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/contact" role="button">
                            Contact us
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/blogs" role="button">
                            Blogs
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/help" role="button">
                            Help
                        </a>
                    </li>

                    <!-- User account section -->
                    <li class="nav-item dropdown">
                        <a
                            v-if="logged_in_user"
                            class="nav-link dropdown-toggle d-flex align-items-center"
                            href="#"
                            role="button"
                            id="dropdownMenuLink"
                            data-bs-toggle="dropdown"
                            aria-expanded="false"
                        >
                            <i class="bi bi-person-circle me-1"></i>
                            {{ logged_in_user.name }}
                        </a>
                        <a
                            v-else
                            ref="openLoginModal"
                            data-bs-toggle="modal"
                            data-bs-target="#loginModal"
                            class="nav-link d-flex align-items-center"
                            @click="clearFields"
                        >
                            <i class="bi bi-box-arrow-in-right me-1"></i>
                            {{ translate("Login") }}
                        </a>

                        <ul
                            class="dropdown-menu dropdown-menu-end"
                            aria-labelledby="dropdownMenuLink"
                        >
                            <li v-if="logged_in_user">
                                <a class="dropdown-item" href="/dashboard">
                                    <i class="bi bi-speedometer me-2"></i>
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

                    <li class="nav-item ms-lg-2">
                        <button
                            v-if="!logged_in_user"
                            ref="openRegisterModal"
                            data-bs-toggle="modal"
                            data-bs-target="#registerusermodal"
                            class="btn c-btn-theme-primary-register text-white c-pointer"
                            @click="clearFields"
                        >
                            {{ translate("Register") }}
                        </button>
                    </li>

                    <!-- Social links for mobile -->
                    <li class="c-top-bar-section-inside-navbar d-lg-none">
                        <div class="d-flex justify-content-center mb-2">
                            <span v-if="youtube_link">
                                <a :href="youtube_link" class="me-3">
                                    <i
                                        class="bi bi-youtube text-danger fs-5"
                                    ></i>
                                </a>
                            </span>
                            <span v-if="instagram_link">
                                <a :href="instagram_link" class="me-3">
                                    <i
                                        class="bi bi-instagram fs-5"
                                        style="color: #c13584"
                                    ></i>
                                </a>
                            </span>
                            <span v-if="facebook_link">
                                <a :href="facebook_link" class="me-3">
                                    <i
                                        class="bi bi-facebook text-primary fs-5"
                                    ></i>
                                </a>
                            </span>
                        </div>
                        <div class="text-center">
                            <a
                                :href="'mailto:' + email"
                                class="text-white contact d-block"
                            >
                                <i class="bi bi-envelope me-1"></i>{{ email }}
                            </a>
                            <a
                                class="text-white d-block mt-1"
                                :href="'tel:' + website_phone"
                            >
                                <i class="bi bi-telephone me-1"></i
                                >{{ website_phone }}
                            </a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <main>
        <slot></slot>
    </main>
    <div class="modal fade" id="loginModal" tabindex="-1">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <!-- Close Button -->
                <button
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                ></button>

                <div class="modal-body">
                    <!-- Header Section -->
                    <div class="login-header">
                        <img
                            :src="logo"
                            @error="setAltImg"
                            alt="Logo"
                            class="login-logo mb-3"
                            width="130"
                        />
                        <h2 class="login-title">{{ name }}</h2>
                        <p class="login-subtitle">
                            Welcome back! Please login to your account.
                        </p>
                    </div>

                    <!-- Login Form -->
                    <div class="block-content">
                        <form @submit.prevent="login">
                            <div class="mb-3">
                                <label
                                    for="loginEmail"
                                    class="form-label small text-muted"
                                    >Email Address</label
                                >
                                <input
                                    id="loginEmail"
                                    type="email"
                                    class="form-control"
                                    placeholder="Enter your email"
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

                            <div class="mb-4">
                                <label
                                    for="loginPassword"
                                    class="form-label small text-muted"
                                    >Password</label
                                >
                                <input
                                    id="loginPassword"
                                    type="password"
                                    class="form-control"
                                    placeholder="Enter your password"
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

                            <div class="d-grid gap-2">
                                <button
                                    v-if="formStatus == 1"
                                    class="btn c-btn-theme-primary py-2"
                                    type="submit"
                                >
                                    {{ translate("Login") }}
                                </button>

                                <button
                                    v-else
                                    class="btn c-btn-theme-primary py-2"
                                    type="submit"
                                    disabled
                                >
                                    <span
                                        class="spinner-border spinner-border-sm me-2"
                                        role="status"
                                        aria-hidden="true"
                                    ></span>
                                    {{ translate("Logging in...") }}
                                </button>
                            </div>
                        </form>

                        <!-- Additional Links -->
                        <div class="login-links">
                            <a
                                ref="forgotPasswordModal"
                                data-bs-toggle="modal"
                                data-bs-target="#forgotpasswordmodal"
                                class="login-link c-pointer"
                            >
                                {{ translate("Forgot password?") }}
                            </a>

                            <span class="text-muted">|</span>

                            <a
                                data-bs-toggle="modal"
                                data-bs-target="#registerusermodal"
                                class="login-link c-pointer"
                            >
                                {{ translate("Create new account") }}
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="forgotpasswordmodal" tabindex="-1">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <!-- Close Button -->
                <button
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                ></button>

                <div class="modal-body">
                    <!-- Reset Password Form (Step 2) -->
                    <div v-if="reset_password_status == 1">
                        <div class="reset-header">
                            <img
                                :src="logo"
                                @error="setAltImg"
                                alt="Logo"
                                class="reset-logo mb-3"
                                width="130"
                            />
                            <h2 class="reset-title">
                                {{ translate("Reset Your Password") }}
                            </h2>
                            <p class="reset-subtitle">
                                Create a new password for your account.
                            </p>
                        </div>

                        <form class="row g-3">
                            <div class="col-12">
                                <label for="password" class="form-label">
                                    {{ translate("New Password") }}
                                </label>
                                <input
                                    type="password"
                                    class="form-control"
                                    placeholder="Enter new password"
                                    :class="{
                                        'invalid-bg': resetFormErrors.password,
                                    }"
                                    v-model="resetForm.password"
                                    @input="checkPasswordStrength"
                                />
                                <div
                                    v-if="resetFormErrors.password"
                                    class="invalid-feedback"
                                >
                                    {{ resetFormErrors.password[0] }}
                                </div>
                                <div
                                    class="password-strength"
                                    v-if="resetForm.password"
                                >
                                    <div>
                                        Password strength:
                                        <span :class="passwordStrengthClass">{{
                                            passwordStrengthText
                                        }}</span>
                                    </div>
                                    <div class="strength-bar">
                                        <div
                                            class="strength-fill"
                                            :class="passwordStrengthBarClass"
                                        ></div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-12">
                                <label
                                    for="confirm_password"
                                    class="form-label"
                                >
                                    {{ translate("Confirm New Password") }}
                                </label>
                                <input
                                    type="password"
                                    class="form-control"
                                    placeholder="Confirm new password"
                                    :class="{
                                        'invalid-bg':
                                            resetFormErrors.confirm_password,
                                    }"
                                    id="confirm_password"
                                    v-model="resetForm.confirm_password"
                                    @input="checkPasswordMatch"
                                />
                                <div
                                    v-if="resetFormErrors.confirm_password"
                                    class="invalid-feedback"
                                >
                                    {{ resetFormErrors.confirm_password[0] }}
                                </div>
                                <div
                                    v-if="resetForm.confirm_password"
                                    :class="passwordMatchClass"
                                >
                                    {{ passwordMatchText }}
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="d-grid gap-2 mt-3">
                                    <button
                                        type="button"
                                        @click="resetPassword"
                                        class="btn c-btn-theme-primary py-2"
                                        v-if="resetFormStatus == 1"
                                    >
                                        {{ translate("Reset Password") }}
                                    </button>
                                    <button
                                        class="btn c-btn-theme-primary py-2"
                                        type="button"
                                        v-else
                                        disabled
                                    >
                                        <span
                                            class="spinner-border spinner-border-sm me-2"
                                            role="status"
                                            aria-hidden="true"
                                        ></span>
                                        {{ translate("Resetting...") }}
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>

                    <!-- Forgot Password Form (Step 1) -->
                    <div v-else>
                        <div class="reset-header">
                            <img
                                :src="logo"
                                @error="setAltImg"
                                alt="Logo"
                                class="reset-logo mb-3"
                                width="130"
                            />
                            <h2 class="reset-title">{{ name }}</h2>
                            <p class="reset-subtitle">
                                Enter your email address and we'll send you a
                                link to reset your password.
                            </p>
                        </div>

                        <form class="row g-0">
                            <div class="col-12 mb-3">
                                <label for="forgotEmail" class="form-label"
                                    >Email Address</label
                                >
                                <input
                                    id="forgotEmail"
                                    type="email"
                                    class="form-control"
                                    placeholder="Enter your email"
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
                                <div class="d-grid gap-2">
                                    <button
                                        v-if="forgotPasswordFormStatus == 1"
                                        class="btn c-btn-theme-primary py-2"
                                        type="button"
                                        @click="forgotPassword"
                                    >
                                        {{ translate("Send Reset Link") }}
                                    </button>

                                    <button
                                        class="btn c-btn-theme-primary py-2"
                                        type="button"
                                        v-else
                                        disabled
                                    >
                                        <span
                                            class="spinner-border spinner-border-sm me-2"
                                            role="status"
                                            aria-hidden="true"
                                        ></span>
                                        {{ translate("Sending...") }}
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>

                    <!-- Back to Login Link -->
                    <div class="reset-links">
                        <a
                            data-bs-toggle="modal"
                            data-bs-target="#loginModal"
                            class="reset-link c-pointer"
                        >
                            ← {{ translate("Back to Login") }}
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="registerusermodal" tabindex="-1">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <!-- Close Button -->
                <button
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                ></button>

                <div class="modal-body">
                    <!-- Header Section -->
                    <div class="register-header">
                        <img
                            :src="logo"
                            @error="setAltImg"
                            alt="Logo"
                            class="register-logo mb-2"
                            width="130"
                        />
                        <h2 class="register-title">{{ name }}</h2>
                        <p class="register-subtitle">
                            Create your account to get started
                        </p>
                    </div>

                    <!-- Registration Form -->
                    <div class="block-content">
                        <form @submit.prevent="register">
                            <div class="form-group">
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

                            <div class="form-group">
                                <input
                                    type="email"
                                    class="form-control"
                                    :class="{
                                        'invalid-bg': registerFormErrors.email,
                                    }"
                                    v-model="registerForm.email"
                                    :placeholder="translate('Email address')"
                                />
                                <div
                                    v-if="registerFormErrors.email"
                                    class="invalid-feedback"
                                >
                                    {{ registerFormErrors.email[0] }}
                                </div>
                            </div>

                            <div class="form-group">
                                <input
                                    type="text"
                                    class="form-control"
                                    :class="{
                                        'invalid-bg': registerFormErrors.phone,
                                    }"
                                    v-model="registerForm.phone"
                                    :placeholder="translate('Phone number')"
                                />
                                <div
                                    v-if="registerFormErrors.phone"
                                    class="invalid-feedback"
                                >
                                    {{ registerFormErrors.phone[0] }}
                                </div>
                            </div>

                            <div class="form-group">
                                <input
                                    type="password"
                                    class="form-control"
                                    :class="{
                                        'invalid-bg':
                                            registerFormErrors.password,
                                    }"
                                    v-model="registerForm.password"
                                    :placeholder="translate('Password')"
                                    @input="checkPasswordStrength"
                                />
                                <div
                                    v-if="registerFormErrors.password"
                                    class="invalid-feedback"
                                >
                                    {{ registerFormErrors.password[0] }}
                                </div>
                                <div
                                    class="password-strength"
                                    v-if="registerForm.password"
                                >
                                    <div>
                                        Password strength:
                                        <span :class="passwordStrengthClass">{{
                                            passwordStrengthText
                                        }}</span>
                                    </div>
                                    <div class="strength-bar">
                                        <div
                                            class="strength-fill"
                                            :class="passwordStrengthBarClass"
                                        ></div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <input
                                    type="password"
                                    class="form-control"
                                    :class="{
                                        'invalid-bg':
                                            registerFormErrors.confirm_password,
                                    }"
                                    v-model="registerForm.confirm_password"
                                    :placeholder="translate('Confirm password')"
                                    @input="checkPasswordMatch"
                                />
                                <div
                                    v-if="registerFormErrors.confirm_password"
                                    class="invalid-feedback"
                                >
                                    {{ registerFormErrors.confirm_password[0] }}
                                </div>
                                <div
                                    v-if="registerForm.confirm_password"
                                    :class="passwordMatchClass"
                                >
                                    {{ passwordMatchText }}
                                </div>
                            </div>

                            <div class="d-grid gap-2 mt-3">
                                <button
                                    v-if="registerFormStatus == 1"
                                    class="btn c-btn-theme-primary py-2"
                                    type="submit"
                                >
                                    {{ translate("Create Account") }}
                                </button>

                                <button
                                    class="btn c-btn-theme-primary py-2"
                                    type="submit"
                                    v-else
                                    disabled
                                >
                                    <span
                                        class="spinner-border spinner-border-sm me-2"
                                        role="status"
                                        aria-hidden="true"
                                    ></span>
                                    {{ translate("Creating Account...") }}
                                </button>
                            </div>
                        </form>

                        <!-- Login Link -->
                        <div class="register-links">
                            <p class="small mb-0">
                                Already have an account?
                                <a
                                    data-bs-toggle="modal"
                                    data-bs-target="#loginModal"
                                    class="register-link c-pointer ms-1"
                                >
                                    {{ translate("Sign in here") }}
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
                <!-- Brand and Social Links -->
                <div class="col-lg-4 col-md-6 mb-5">
                    <div class="mb-4">
                        <h5 class="fw-bold">BrandNewHomesVegas</h5>
                        <p class="text-white opacity-80">
                            Your trusted partner in real estate, helping you
                            find the perfect place to call home. Discover new
                            communities and exclusive properties in Las Vegas.
                        </p>
                    </div>

                    <div>
                        <h6 class="mb-3">Follow Us</h6>
                        <div class="social-links">
                            <a
                                :href="facebook_link"
                                target="_blank"
                                class="social-link"
                                title="Facebook"
                            >
                                <i class="bi bi-facebook fs-5"></i>
                            </a>
                            <a href="#" class="social-link" title="Twitter">
                                <i class="bi bi-twitter fs-5"></i>
                            </a>
                            <a
                                :href="instagram_link"
                                target="_blank"
                                class="social-link"
                                title="Instagram"
                            >
                                <i class="bi bi-instagram fs-5"></i>
                            </a>
                            <a href="#" class="social-link" title="LinkedIn">
                                <i class="bi bi-linkedin fs-5"></i>
                            </a>
                            <a
                                :href="youtube_link"
                                target="_blank"
                                class="social-link"
                                title="YouTube"
                            >
                                <i class="bi bi-youtube fs-5"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Quick Links -->
                <div class="col-lg-2 col-md-6 mb-5">
                    <h6 class="fw-bold">Quick Links</h6>
                    <ul class="list-unstyled">
                        <li class="mb-2">
                            <a href="/" class="text-white text-decoration-none">
                                Home
                            </a>
                        </li>
                        <li class="mb-2">
                            <a
                                href="/all/communities"
                                class="text-white text-decoration-none"
                            >
                                Communities
                            </a>
                        </li>
                        <li class="mb-2">
                            <a
                                href="/all/open/houses/"
                                class="text-white text-decoration-none"
                            >
                                Open Houses
                            </a>
                        </li>
                        <li class="mb-2">
                            <a
                                href="/all-incentives"
                                class="text-white text-decoration-none"
                            >
                                Incentives
                            </a>
                        </li>
                        <li class="mb-2">
                            <a
                                href="/all-events"
                                class="text-white text-decoration-none"
                            >
                                Events
                            </a>
                        </li>
                    </ul>
                </div>

                <!-- Company -->
                <div class="col-lg-2 col-md-6 mb-5">
                    <h6 class="fw-bold">Company</h6>
                    <ul class="list-unstyled">
                        <li class="mb-2">
                            <a
                                href="/about"
                                class="text-white text-decoration-none"
                            >
                                About Us
                            </a>
                        </li>
                        <li class="mb-2">
                            <a
                                href="/contact"
                                class="text-white text-decoration-none"
                            >
                                Contact
                            </a>
                        </li>
                        <li class="mb-2">
                            <a
                                href="/blogs"
                                class="text-white text-decoration-none"
                            >
                                Blog
                            </a>
                        </li>
                        <li class="mb-2">
                            <a
                                href="/help"
                                class="text-white text-decoration-none"
                            >
                                Help Center
                            </a>
                        </li>
                    </ul>
                </div>

                <!-- Legal -->
                <div class="col-lg-2 col-md-6 mb-5">
                    <h6 class="fw-bold">Legal</h6>
                    <ul class="list-unstyled">
                        <li class="mb-2">
                            <a
                                href="/privacy-policy"
                                class="text-white text-decoration-none"
                            >
                                Privacy Policy
                            </a>
                        </li>
                        <li class="mb-2">
                            <a
                                href="/terms-of-services"
                                class="text-white text-decoration-none"
                            >
                                Terms of Service
                            </a>
                        </li>
                        <li class="mb-2">
                            <a
                                href="/cookie-policy"
                                class="text-white text-decoration-none"
                            >
                                Cookie Policy
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

            <!-- Bottom Bar -->
            <div class="footer-bottom">
                <div class="row align-items-center">
                    <div class="col-md-6 text-center text-md-start">
                        <div class="text-white opacity-70">
                            © 2025 BrandNewHomesVegas. All rights reserved.
                        </div>
                    </div>
                    <div class="col-md-6 text-center text-md-end">
                        <div
                            class="d-flex justify-content-center justify-content-md-end gap-3"
                        >
                            <a
                                href="/privacy-policy"
                                class="text-white text-decoration-none"
                            >
                                Privacy Policy
                            </a>
                            <a
                                href="/terms-of-services"
                                class="text-white text-decoration-none"
                            >
                                Terms of Service
                            </a>
                            <a
                                href="/cookie-policy"
                                class="text-white text-decoration-none"
                            >
                                Cookie Policy
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <div v-if="openConfirmCodeModal == true">
        <verification-code-component
            :email="user_confirmation_email"
            @parentProcesses="parentProcesses"
        />
    </div>

    <button
        type="button"
        class="btn btn-secondary"
        data-bs-dismiss="modal"
        style="display: none"
        ref="closeModal"
    >
        Close
    </button>
    <button
        type="button"
        class="btn btn-secondary"
        data-bs-dismiss="modal"
        style="display: none"
        ref="closeResetModal"
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
                phone: "",
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
                        "Thank you! Your account has been successfully verified and activated. Welcome to Brand New Homes Vegas — you can now log in and start exploring exclusive properties."
                    )
                );
                this.$refs.openLoginModal.click();
            } else if (this.processing == "reset-password") {
                this.$refs.forgotPasswordModal.click();
                this.reset_password_status = 1;
                toastr.success(
                    this.translate(
                        "Your confirmation code has been verified successfully. You may now proceed to reset your password."
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
        selectRole(type) {
            this.registerForm.role = type;
        },
        register() {
            this.registerFormStatus = 0;
            this.registerForm.role = "customer";
            this.registerForm.process_status = "New";
            this.registerFormStatus = 0;
            axios
                .post("/api/register-submit", this.registerForm)
                .then((response) => {
                    toastr.success(
                        this.translate("New account registered succesfully!")
                    );
                    this.processing = "register-new-user";
                    this.openConfirmCodeModal = true;
                    this.user_confirmation_email = this.registerForm.email;

                    this.$refs.closeModal.click();
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
            this.registerForm.phone = "";
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

<style scoped>
:root {
    --primary-color: #1a365d;
    --accent-color: hsl(213 71% 45%);
    --text-color: #2d3748;
    --light-bg: #f7fafc;
    --border-color: #e2e8f0;
}

body {
    font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
    color: var(--text-color);
}

.c-top-bar-section {
    background-color: var(--light-bg);
    border-bottom: 1px solid var(--border-color);
    padding: 8px 0;
    font-size: 0.9rem;
}

.c-top-bar-content {
    display: flex;
    justify-content: space-between;
    align-items: center;
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 15px;
}

.contact-info {
    display: flex;
    align-items: center;
    gap: 20px;
}

.contact-item {
    display: flex;
    align-items: center;
    gap: 5px;
    color: var(--text-color);
    text-decoration: none;
    transition: color 0.3s ease;
}

.contact-item:hover {
    color: hsl(213 71% 30%);
}

.contact-icon {
    font-size: 1rem;
    color: hsl(213 71% 45%);
}

.social-links {
    display: flex;
    align-items: center;
    gap: 15px;
}

.social-link {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 30px;
    height: 30px;
    border-radius: 50%;
    background-color: white;
    color: var(--text-color);
    text-decoration: none;
    transition: all 0.3s ease;
    border: 1px solid var(--border-color);
}

.social-link:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.social-link.youtube:hover {
    background-color: #ff0000;
    color: white;
}

.social-link.instagram:hover {
    background: radial-gradient(
        circle at 30% 107%,
        #fdf497 0%,
        #fdf497 5%,
        #fd5949 45%,
        #d6249f 60%,
        #285aeb 90%
    );
    color: white;
}

.social-link.facebook:hover {
    background-color: #1877f2;
    color: white;
}

.c-dec-none {
    text-decoration: none;
}

/* Responsive adjustments */
@media (max-width: 768px) {
    .c-top-bar-content {
        flex-direction: column;
        gap: 10px;
    }

    .contact-info {
        flex-direction: column;
        gap: 8px;
        text-align: center;
    }
}

/* Navigation Styles */
.c-navbar-color {
    background: linear-gradient(135deg, #1a365d 0%, #2d3748 100%);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    padding: 0.5rem 0;
    transition: all 0.3s ease;
}

.navbar-brand-center {
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
}

.c-site-main-title img,
.c-site-secondary-title img {
    transition: transform 0.3s ease;
    filter: brightness(0) invert(1);
}

.c-site-main-title img:hover,
.c-site-secondary-title img:hover {
    transform: scale(1.05);
}

.navbar-nav {
    align-items: center;
}

.nav-link {
    color: rgba(255, 255, 255, 0.85) !important;
    font-weight: 500;
    padding: 0.5rem 1rem !important;
    margin: 0 0.1rem;
    border-radius: 4px;
    transition: all 0.3s ease;
    position: relative;
    font-size: 0.95rem;
    cursor: pointer;
}

.nav-link:hover {
    color: white !important;
    background-color: rgba(255, 255, 255, 0.1);
    transform: translateY(-1px);
}

.nav-link::after {
    content: "";
    position: absolute;
    width: 0;
    height: 2px;
    bottom: 0;
    left: 50%;
    background-color: hsl(213 71% 45%);
    transition: all 0.3s ease;
    transform: translateX(-50%);
}

.nav-link:hover::after {
    width: 70%;
}

.navbar-toggler {
    border: 1px solid rgba(255, 255, 255, 0.2);
    padding: 0.25rem 0.5rem;
}

.navbar-toggler-icon {
    background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 30 30'%3e%3cpath stroke='rgba%28255, 255, 255, 0.8%29' stroke-linecap='round' stroke-miterlimit='10' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
}

.c-btn-theme-primary-register {
    background: linear-gradient(
        to right,
        hsl(213 71% 45%),
        /* lighter */ hsl(213 71% 30%) /* darker */
    );

    border: none;
    border-radius: 4px;
    padding: 0.4rem 1.2rem;
    font-weight: 500;
    transition: all 0.3s ease;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.c-btn-theme-primary-register:hover {
    background: linear-gradient(
        to right,
        hsl(213 71% 45%),
        /* lighter */ hsl(213 71% 30%) /* darker */
    );
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
}

.dropdown-menu {
    border: none;
    border-radius: 8px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
    padding: 0.5rem;
    margin-top: 0.5rem;
}

.dropdown-item {
    border-radius: 4px;
    padding: 0.5rem 1rem;
    transition: all 0.2s ease;
}

.dropdown-item:hover {
    background-color: #f7fafc;
    color: #1a365d;
}

.c-top-bar-section-inside-navbar {
    display: none;
}

/* Responsive adjustments */
@media (max-width: 991.98px) {
    .navbar-brand-center {
        position: static;
        transform: none;
        text-align: center;
        margin: 0.5rem 0;
    }

    .c-site-secondary-title {
        display: none;
    }

    .navbar-collapse {
        padding: 1rem 0;
    }

    .nav-link {
        padding: 0.75rem 1rem !important;
        margin: 0.1rem 0;
    }

    .c-top-bar-section-inside-navbar {
        display: block;
        padding: 1rem;
        margin-top: 1rem;
        border-top: 1px solid rgba(255, 255, 255, 0.1);
    }

    .c-top-bar-section-inside-navbar a {
        margin-right: 1rem;
    }
}

@media (min-width: 992px) {
    .c-site-main-title {
        display: none;
    }
}

/* Login Modal Styles */
.modal-content {
    border: none;
    border-radius: 12px;
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
    overflow: hidden;
}

.modal-header {
    border-bottom: none;
    padding: 2rem 2rem 0;
    position: relative;
}

.modal-body {
    padding: 0 2rem 2rem;
}

.btn-close {
    position: absolute;
    right: 1rem;
    top: 1rem;
    z-index: 10;
}

.login-logo {
    transition: transform 0.3s ease;
}

.login-logo:hover {
    transform: scale(1.05);
}

.login-header {
    text-align: center;
    margin-bottom: 1.5rem;
}

.login-title {
    color: #1a365d;
    font-weight: 700;
    margin: 1rem 0 0.5rem;
    font-size: 1.5rem;
}

.login-subtitle {
    color: #718096;
    font-size: 0.9rem;
}

.form-control {
    border: 1px solid #e2e8f0;
    border-radius: 8px;
    padding: 0.75rem 1rem;
    font-size: 0.95rem;
    transition: all 0.3s ease;
    background-color: #fafafa;
}

.form-control:focus {
    border-color: #4299e1;
    box-shadow: 0 0 0 3px rgba(66, 153, 225, 0.15);
    background-color: white;
}

.invalid-bg {
    border-color: #e53e3e !important;
    background-color: #fed7d7 !important;
}

.invalid-feedback {
    font-size: 0.85rem;
    margin-top: 0.25rem;
}

.c-btn-theme-primary {
    background: linear-gradient(
        to right,
        hsl(213 71% 45%),
        /* lighter */ hsl(213 71% 30%) /* darker */
    );
    border: none;
    border-radius: 8px;
    padding: 0.75rem 1.5rem;
    font-weight: 600;
    font-size: 1rem;
    transition: all 0.3s ease;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    color: white;
}

.c-btn-theme-primary:hover {
    background: linear-gradient(
        to right,
        hsl(213 71% 45%),
        /* lighter */ hsl(213 71% 30%) /* darker */
    );
    transform: translateY(-2px);
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
}

.c-btn-theme-primary:active {
    transform: translateY(0);
}

.spinner-border-sm {
    width: 1rem;
    height: 1rem;
}

.login-links {
    margin-top: 1.5rem;
    text-align: center;
}

.login-link {
    color: #718096;
    text-decoration: none;
    font-size: 0.9rem;
    transition: color 0.3s ease;
    display: inline-block;
    margin: 0 0.5rem;
    padding: 0.5rem 0;
}

.login-link:hover {
    color: hsl(213 71% 45%);
}

.divider {
    display: flex;
    align-items: center;
    margin: 1.5rem 0;
}

.divider::before,
.divider::after {
    content: "";
    flex: 1;
    height: 1px;
    background-color: #e2e8f0;
}

.divider-text {
    padding: 0 1rem;
    color: #718096;
    font-size: 0.85rem;
}

/* Animation for modal appearance */
@keyframes modalSlideIn {
    from {
        opacity: 0;
        transform: translateY(-20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.modal.fade .modal-dialog {
    animation: modalSlideIn 0.3s ease-out;
}

/* Responsive adjustments */
@media (max-width: 576px) {
    .modal-body {
        padding: 0 1.5rem 1.5rem;
    }

    .modal-header {
        padding: 1.5rem 1.5rem 0;
    }

    .login-title {
        font-size: 1.3rem;
    }
}

/* Forgot Password Modal Styles */
#forgotpasswordmodal .modal-content {
    border: none;
    border-radius: 12px;
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
    overflow: hidden;
}

#forgotpasswordmodal .modal-header {
    border-bottom: none;
    padding: 2rem 2rem 0;
    position: relative;
}

#forgotpasswordmodal .modal-body {
    padding: 0 2rem 2rem;
}

#forgotpasswordmodal .btn-close {
    position: absolute;
    right: 1rem;
    top: 1rem;
    z-index: 10;
}

#forgotpasswordmodal .reset-logo {
    transition: transform 0.3s ease;
}

#forgotpasswordmodal .reset-logo:hover {
    transform: scale(1.05);
}

#forgotpasswordmodal .reset-header {
    text-align: center;
    margin-bottom: 1.5rem;
}

#forgotpasswordmodal .reset-title {
    color: #1a365d;
    font-weight: 700;
    margin: 1rem 0 0.5rem;
    font-size: 1.5rem;
}

#forgotpasswordmodal .reset-subtitle {
    color: #718096;
    font-size: 0.9rem;
    line-height: 1.4;
}

#forgotpasswordmodal .form-label {
    color: #4a5568;
    font-weight: 600;
    margin-bottom: 0.5rem;
    font-size: 0.9rem;
}

#forgotpasswordmodal .form-control {
    border: 1px solid #e2e8f0;
    border-radius: 8px;
    padding: 0.75rem 1rem;
    font-size: 0.95rem;
    transition: all 0.3s ease;
    background-color: #fafafa;
}

#forgotpasswordmodal .form-control:focus {
    border-color: #4299e1;
    box-shadow: 0 0 0 3px rgba(66, 153, 225, 0.15);
    background-color: white;
}

#forgotpasswordmodal .invalid-bg {
    border-color: #e53e3e !important;
    background-color: #fed7d7 !important;
}

#forgotpasswordmodal .invalid-feedback {
    font-size: 0.85rem;
    margin-top: 0.25rem;
    color: #e53e3e;
}

#forgotpasswordmodal .c-btn-theme-primary {
    background: linear-gradient(
        to right,
        hsl(213 71% 45%),
        /* lighter */ hsl(213 71% 30%) /* darker */
    );
    border: none;
    border-radius: 8px;
    padding: 0.75rem 1.5rem;
    font-weight: 600;
    font-size: 1rem;
    transition: all 0.3s ease;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

#forgotpasswordmodal .c-btn-theme-primary:hover {
    background: linear-gradient(
        to right,
        hsl(213 71% 45%),
        /* lighter */ hsl(213 71% 30%) /* darker */
    );
    transform: translateY(-2px);
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
}

#forgotpasswordmodal .c-btn-theme-primary:active {
    transform: translateY(0);
}

#forgotpasswordmodal .spinner-border-sm {
    width: 1rem;
    height: 1rem;
}

#forgotpasswordmodal .reset-links {
    margin-top: 1.5rem;
    text-align: center;
    padding-top: 1rem;
    border-top: 1px solid #e2e8f0;
}

#forgotpasswordmodal .reset-link {
    color: #718096;
    text-decoration: none;
    font-size: 0.9rem;
    transition: color 0.3s ease;
    display: inline-block;
    padding: 0.5rem 0;
}

#forgotpasswordmodal .reset-link:hover {
    color: hsl(213 71% 45%);
}

#forgotpasswordmodal .password-strength {
    margin-top: 0.5rem;
    font-size: 0.8rem;
}

#forgotpasswordmodal .strength-bar {
    height: 4px;
    border-radius: 2px;
    background-color: #e2e8f0;
    margin-top: 0.25rem;
    overflow: hidden;
}

#forgotpasswordmodal .strength-fill {
    height: 100%;
    border-radius: 2px;
    transition: all 0.3s ease;
}

#forgotpasswordmodal .strength-weak {
    background-color: #e53e3e;
    width: 33%;
}

#forgotpasswordmodal .strength-medium {
    background-color: #d69e2e;
    width: 66%;
}

#forgotpasswordmodal .strength-strong {
    background-color: #38a169;
    width: 100%;
}

#forgotpasswordmodal .password-match {
    color: #38a169;
    font-size: 0.8rem;
    margin-top: 0.25rem;
}

#forgotpasswordmodal .password-mismatch {
    color: #e53e3e;
    font-size: 0.8rem;
    margin-top: 0.25rem;
}

/* Animation for modal appearance */
@keyframes modalSlideIn {
    from {
        opacity: 0;
        transform: translateY(-20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

#forgotpasswordmodal .modal.fade .modal-dialog {
    animation: modalSlideIn 0.3s ease-out;
}

/* Responsive adjustments */
@media (max-width: 576px) {
    #forgotpasswordmodal .modal-body {
        padding: 0 1.5rem 1.5rem;
    }

    #forgotpasswordmodal .reset-title {
        font-size: 1.3rem;
    }
}

/* Registration Modal Styles */
#registerusermodal .modal-content {
    border: none;
    border-radius: 12px;
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
    overflow: hidden;
}

#registerusermodal .modal-header {
    border-bottom: none;
    padding: 2rem 2rem 0;
    position: relative;
}

#registerusermodal .modal-body {
    padding: 0 2rem 2rem;
}

#registerusermodal .btn-close {
    position: absolute;
    right: 1rem;
    top: 1rem;
    z-index: 10;
}

#registerusermodal .register-logo {
    transition: transform 0.3s ease;
}

#registerusermodal .register-logo:hover {
    transform: scale(1.05);
}

#registerusermodal .register-header {
    text-align: center;
    margin-bottom: 1.5rem;
}

#registerusermodal .register-title {
    color: #1a365d;
    font-weight: 700;
    margin: 1rem 0 0.5rem;
    font-size: 1.5rem;
}

#registerusermodal .register-subtitle {
    color: #718096;
    font-size: 0.9rem;
}

#registerusermodal .form-control {
    border: 1px solid #e2e8f0;
    border-radius: 8px;
    padding: 0.75rem 1rem;
    font-size: 0.95rem;
    transition: all 0.3s ease;
    background-color: #fafafa;
    margin-bottom: 1rem;
}

#registerusermodal .form-control:focus {
    border-color: #4299e1;
    box-shadow: 0 0 0 3px rgba(66, 153, 225, 0.15);
    background-color: white;
}

#registerusermodal .invalid-bg {
    border-color: #e53e3e !important;
    background-color: #fed7d7 !important;
}

#registerusermodal .invalid-feedback {
    font-size: 0.85rem;
    margin-top: -0.5rem;
    margin-bottom: 0.5rem;
    color: #e53e3e;
}

#registerusermodal .c-btn-theme-primary {
    background: linear-gradient(
        to right,
        hsl(213 71% 45%),
        /* lighter */ hsl(213 71% 30%) /* darker */
    );
    border: none;
    border-radius: 8px;
    padding: 0.75rem 1.5rem;
    font-weight: 600;
    font-size: 1rem;
    transition: all 0.3s ease;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    width: 100%;
}

#registerusermodal .c-btn-theme-primary:hover {
    background: linear-gradient(
        to right,
        hsl(213 71% 45%),
        /* lighter */ hsl(213 71% 30%) /* darker */
    );
    transform: translateY(-2px);
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
}

#registerusermodal .c-btn-theme-primary:active {
    transform: translateY(0);
}

#registerusermodal .spinner-border-sm {
    width: 1rem;
    height: 1rem;
}

#registerusermodal .register-links {
    margin-top: 1.5rem;
    text-align: center;
    padding-top: 1rem;
    border-top: 1px solid #e2e8f0;
}

#registerusermodal .register-link {
    color: #718096;
    text-decoration: none;
    font-size: 0.9rem;
    transition: color 0.3s ease;
    display: inline-block;
    padding: 0.5rem 0;
}

#registerusermodal .register-link:hover {
    color: hsl(213 71% 45%);
}

#registerusermodal .password-strength {
    margin-top: -0.75rem;
    margin-bottom: 0.5rem;
    font-size: 0.8rem;
}

#registerusermodal .strength-bar {
    height: 4px;
    border-radius: 2px;
    background-color: #e2e8f0;
    margin-top: 0.25rem;
    overflow: hidden;
}

#registerusermodal .strength-fill {
    height: 100%;
    border-radius: 2px;
    transition: all 0.3s ease;
}

#registerusermodal .strength-weak {
    background-color: #e53e3e;
    width: 33%;
}

#registerusermodal .strength-medium {
    background-color: #d69e2e;
    width: 66%;
}

#registerusermodal .strength-strong {
    background-color: #38a169;
    width: 100%;
}

#registerusermodal .password-match {
    color: #38a169;
    font-size: 0.8rem;
    margin-top: -0.75rem;
    margin-bottom: 0.5rem;
}

#registerusermodal .password-mismatch {
    color: #e53e3e;
    font-size: 0.8rem;
    margin-top: -0.75rem;
    margin-bottom: 0.5rem;
}

#registerusermodal .form-group {
    position: relative;
}

#registerusermodal .password-toggle {
    position: absolute;
    right: 1rem;
    top: 50%;
    transform: translateY(-50%);
    background: none;
    border: none;
    color: #718096;
    cursor: pointer;
}

/* Animation for modal appearance */
@keyframes modalSlideIn {
    from {
        opacity: 0;
        transform: translateY(-20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

#registerusermodal .modal.fade .modal-dialog {
    animation: modalSlideIn 0.3s ease-out;
}

/* Responsive adjustments */
@media (max-width: 576px) {
    #registerusermodal .modal-body {
        padding: 0 1.5rem 1.5rem;
    }

    #registerusermodal .register-title {
        font-size: 1.3rem;
    }
}
/* Footer Styles - More Specific Selectors */
footer.footer {
    background: linear-gradient(135deg, #1a365d 0%, #2d3748 100%);
    position: relative;
    overflow: hidden;
    margin-top: auto; /* Ensure footer stays at bottom */
}

footer.footer::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 1px;
    background: linear-gradient(
        90deg,
        transparent,
        rgba(255, 255, 255, 0.3),
        transparent
    );
}

/* Specific footer headings */
footer.footer h5,
footer.footer h6 {
    color: #fff;
    font-weight: 600;
    margin-bottom: 1.5rem;
    position: relative;
}

footer.footer h5::after,
footer.footer h6::after {
    content: "";
    position: absolute;
    left: 0;
    bottom: -0.5rem;
    width: 30px;
    height: 2px;
    background: linear-gradient(
        to right,
        hsl(213 71% 45%),
        /* lighter */ hsl(213 71% 30%) /* darker */
    );
    border-radius: 2px;
}

footer.footer p {
    color: rgba(255, 255, 255, 0.8);
    line-height: 1.6;
    margin-bottom: 1.5rem;
}

/* Specific footer lists */
footer.footer .list-unstyled li {
    margin-bottom: 0.75rem;
}

footer.footer .list-unstyled a {
    color: rgba(255, 255, 255, 0.7);
    text-decoration: none;
    transition: all 0.3s ease;
    position: relative;
    padding-left: 0;
    display: inline-block;
}

footer.footer .list-unstyled a::before {
    content: "";
    position: absolute;
    left: 0;
    bottom: -2px;
    width: 0;
    height: 1px;
    background: hsl(213 71% 45%);
    transition: width 0.3s ease;
}

footer.footer .list-unstyled a:hover {
    color: #fff;
    transform: translateX(5px);
}

footer.footer .list-unstyled a:hover::before {
    width: 15px;
}

/* Social Links - Footer Specific */
footer.footer .social-links {
    display: flex;
    gap: 1rem;
    margin-top: 1rem;
}

footer.footer .social-link {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 40px;
    height: 40px;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.1);
    color: rgba(255, 255, 255, 0.8);
    text-decoration: none;
    transition: all 0.3s ease;
    border: 1px solid rgba(255, 255, 255, 0.2);
}

footer.footer .social-link:hover {
    background: #e53e3e;
    color: white;
    transform: translateY(-3px);
    box-shadow: 0 5px 15px rgba(229, 62, 62, 0.3);
}

/* Footer Bottom - Specific */
footer.footer .footer-bottom {
    border-top: 1px solid rgba(255, 255, 255, 0.1);
    padding: 1.5rem 0;
}

footer.footer .footer-bottom a {
    color: rgba(255, 255, 255, 0.7);
    text-decoration: none;
    transition: color 0.3s ease;
    position: relative;
}

footer.footer .footer-bottom a::after {
    content: "•";
    margin: 0 0.75rem;
    color: rgba(255, 255, 255, 0.3);
}

footer.footer .footer-bottom a:last-child::after {
    display: none;
}

footer.footer .footer-bottom a:hover {
    color: #fff;
}

/* Ensure top bar styles are not affected */
.c-top-bar-section {
    z-index: 1030; /* Higher than footer */
    position: relative;
    background: var(--light-bg);
    border-bottom: 1px solid var(--border-color);
}

/* Reset any potential footer styles affecting top bar */
.c-top-bar-section * {
    box-sizing: border-box;
}

.c-top-bar-section .contact-info,
.c-top-bar-section .social-links {
    /* Ensure these don't inherit footer styles */
    display: flex;
    align-items: center;
}

/* Responsive Design - Footer Specific */
@media (max-width: 768px) {
    footer.footer .row > div {
        margin-bottom: 2rem;
        text-align: center;
    }

    footer.footer h5::after,
    footer.footer h6::after {
        left: 50%;
        transform: translateX(-50%);
    }

    footer.footer .social-links {
        justify-content: center;
    }

    footer.footer .footer-bottom {
        text-align: center;
    }

    footer.footer .footer-bottom .d-flex {
        justify-content: center;
        margin-top: 1rem;
    }

    footer.footer .footer-bottom a::after {
        margin: 0 0.5rem;
    }
}

@media (max-width: 576px) {
    footer.footer {
        padding: 2rem 0 !important;
    }

    footer.footer .footer-bottom {
        flex-direction: column;
        gap: 1rem;
    }

    footer.footer .footer-bottom a::after {
        display: none;
    }

    footer.footer .footer-bottom .d-flex {
        flex-wrap: wrap;
        gap: 1rem;
    }
}

/* Animation for social icons - Footer only */
@keyframes footerFloat {
    0%,
    100% {
        transform: translateY(0);
    }
    50% {
        transform: translateY(-5px);
    }
}

footer.footer .social-link:hover {
    animation: footerFloat 1s ease-in-out infinite;
}

/* Ensure body has proper layout */
body {
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}

main {
    flex: 1; /* Push footer to bottom */
}
</style>
