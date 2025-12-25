<style scoped>
/* Contact Page Styles */
.contact-hero-section {
    background: linear-gradient(
        135deg,
        rgba(26, 54, 93, 0.85) 0%,
        rgba(45, 55, 72, 0.75) 100%
    );
    padding: 4rem 0;
    position: relative;
    overflow: hidden;
}

.contact-hero-section::before {
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

.contact-title-main {
    font-size: 3rem;
    font-weight: 700;
    color: white;
    margin-bottom: 1rem;
    text-align: center;
}

.contact-subtitle {
    font-size: 1.2rem;
    color: rgba(255, 255, 255, 0.8);
    text-align: center;
    max-width: 600px;
    margin: 0 auto;
    line-height: 1.6;
}

/* Contact Content */
.contact-content {
    background: white;
    padding: 5rem 0;
}

.contact-grid {
    display: flow;
    grid-template-columns: 1fr 1fr;
    gap: 4rem;
    align-items: start;
}

/* Contact Info Card */
.contact-info-card {
    background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);
    border-radius: 20px;
    padding: 2.5rem;
    border: 1px solid #e2e8f0;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
}

.contact-info-title {
    font-size: 1.8rem;
    font-weight: 700;
    color: #1a365d;
    margin-bottom: 1rem;
}

.contact-info-text {
    font-size: 1.1rem;
    color: #64748b;
    line-height: 1.6;
    margin-bottom: 2rem;
}

.contact-detail {
    margin-bottom: 1.5rem;
}

.contact-detail-title {
    font-size: 1.1rem;
    font-weight: 600;
    color: #1a365d;
    margin-bottom: 0.5rem;
}

.contact-detail-text {
    font-size: 1rem;
    color: #64748b;
    line-height: 1.5;
}

/* Accordion Styles */
.contact-accordion {
    background: white;
    border-radius: 16px;
    overflow: hidden;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
    border: 1px solid #f1f5f9;
}

.accordion-button {
    background: linear-gradient(135deg, #1a365d, #2d3748) !important;
    color: white !important;
    font-weight: 600;
    font-size: 1.1rem;
    border: none !important;
    padding: 1.5rem !important;
}

.accordion-button:not(.collapsed) {
    background: linear-gradient(135deg, #1a365d, #2d3748) !important;
    color: white !important;
    box-shadow: none !important;
}

.accordion-button::after {
    filter: brightness(0) invert(1);
}

.accordion-body {
    padding: 2rem !important;
    background: #fafbfc;
}

.office-hours-list {
    list-style: none;
    padding: 0;
    margin: 0;
}

.office-hours-list li {
    display: flex;
    justify-content: space-between;
    padding: 0.75rem 0;
    border-bottom: 1px solid #e2e8f0;
}

.office-hours-list li:last-child {
    border-bottom: none;
}

.office-hours-list strong {
    color: #1a365d;
}

/* Form Toggle Buttons */
.form-toggle-buttons {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 1rem;
    margin: 2rem 0;
}

.toggle-btn {
    background: linear-gradient(
        to right,
        hsl(213 71% 45%),
        /* lighter */ hsl(213 71% 30%) /* darker */
    );
    border: none;
    border-radius: 12px;
    padding: 1rem 1.5rem;
    color: white;
    font-weight: 600;
    transition: all 0.3s ease;
    text-align: center;
}

.toggle-btn:hover {
    background: linear-gradient(
        to right,
        hsl(213 71% 45%),
        /* lighter */ hsl(213 71% 30%) /* darker */
    );
    transform: translateY(-2px);
    box-shadow: 0 8px 20px hsl(213 71% 45%);
}

/* Contact Form */
.contact-form-card {
    background: white;
    border-radius: 20px;
    padding: 2.5rem;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
    border: 1px solid #f1f5f9;
}

.form-header {
    text-align: center;
    margin-bottom: 2rem;
}

.form-title {
    font-size: 1.5rem;
    font-weight: 700;
    color: #1a365d;
    margin-bottom: 0.5rem;
}

.form-subtitle {
    color: #64748b;
    font-size: 1rem;
}

.form-group {
    margin-bottom: 1.5rem;
}

.form-label {
    font-weight: 600;
    color: #374151;
    margin-bottom: 0.5rem;
    display: block;
}

.form-control {
    border: 2px solid #e2e8f0;
    border-radius: 12px;
    padding: 0.75rem 1rem;
    font-size: 1rem;
    transition: all 0.3s ease;
    background: #fafafa;
}

.form-control:focus {
    border-color: #e53e3e;
    box-shadow: 0 0 0 3px rgba(229, 62, 62, 0.1);
    background: white;
}

.invalid-bg {
    border-color: #e53e3e !important;
    background-color: #fed7d7 !important;
}

.invalid-feedback {
    color: #e53e3e;
    font-size: 0.875rem;
    margin-top: 0.25rem;
}

/* Form Actions */
.form-actions {
    display: flex;
    gap: 1rem;
    margin-top: 2rem;
}

.btn-send {
    background: linear-gradient(135deg, #e53e3e, #c53030);
    border: none;
    border-radius: 12px;
    padding: 0.75rem 2rem;
    color: white;
    font-weight: 600;
    transition: all 0.3s ease;
    flex: 1;
}

.btn-send:hover:not(:disabled) {
    background: linear-gradient(135deg, #c53030, #9b2c2c);
    transform: translateY(-2px);
    box-shadow: 0 8px 20px rgba(229, 62, 62, 0.3);
}

.btn-send:disabled {
    opacity: 0.7;
    cursor: not-allowed;
}

.btn-cancel {
    background: #64748b;
    border: none;
    border-radius: 12px;
    padding: 0.75rem 2rem;
    color: white;
    font-weight: 600;
    transition: all 0.3s ease;
}

.btn-cancel:hover {
    background: #475569;
    transform: translateY(-2px);
}

/* FAQ Section */
.faq-section {
    background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);
    padding: 5rem 0;
}

.faq-title {
    font-size: 2.5rem;
    font-weight: 700;
    color: #1a365d;
    text-align: center;
    margin-bottom: 3rem;
}

.faq-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
    gap: 2rem;
}

.faq-item {
    background: white;
    border-radius: 16px;
    padding: 2rem;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
    border: 1px solid #f1f5f9;
    transition: all 0.3s ease;
}

.faq-item:hover {
    transform: translateY(-5px);
    box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15);
}

.faq-question {
    font-size: 1.2rem;
    font-weight: 600;
    color: #1a365d;
    margin-bottom: 1rem;
}

.faq-answer {
    color: #64748b;
    line-height: 1.6;
}

/* Decorative Elements */
.section-decoration {
    position: absolute;
    width: 150px;
    height: 150px;
    background: linear-gradient(
        135deg,
        rgba(229, 62, 62, 0.1),
        rgba(255, 255, 255, 0.05)
    );
    border-radius: 50%;
    filter: blur(30px);
    z-index: 0;
}

.decoration-1 {
    top: -30px;
    right: -30px;
}

.decoration-2 {
    bottom: -30px;
    left: -30px;
}

/* Responsive Design */
@media (max-width: 992px) {
    .contact-grid {
        grid-template-columns: 1fr;
        gap: 2rem;
    }

    .contact-title-main {
        font-size: 2.5rem;
    }

    .form-toggle-buttons {
        grid-template-columns: 1fr;
    }
}

@media (max-width: 768px) {
    .contact-hero-section,
    .contact-content,
    .faq-section {
        padding: 3rem 0;
    }

    .contact-title-main {
        font-size: 2rem;
    }

    .contact-subtitle {
        font-size: 1.1rem;
    }

    .contact-info-card,
    .contact-form-card {
        padding: 2rem;
    }

    .faq-grid {
        grid-template-columns: 1fr;
    }

    .faq-item {
        padding: 1.5rem;
    }

    .form-actions {
        flex-direction: column;
    }
}

@media (max-width: 576px) {
    .contact-title-main {
        font-size: 1.8rem;
    }

    .contact-info-card,
    .contact-form-card {
        padding: 1.5rem;
    }

    .accordion-button {
        padding: 1.25rem !important;
        font-size: 1rem;
    }

    .accordion-body {
        padding: 1.5rem !important;
    }
}

/* Loading Animation */
.spinner-border-sm {
    width: 1rem;
    height: 1rem;
    border-width: 0.15em;
}
/* Visual indicator for required fields */
.form-label .text-danger {
    margin-left: 2px;
}

/* Enhanced validation states */
.form-control.is-valid {
    border-color: #28a745;
    padding-right: calc(1.5em + 0.75rem);
    background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 8 8'%3e%3cpath fill='%2328a745' d='M2.3 6.73L.6 4.53c-.4-1.04.46-1.4 1.1-.8l1.1 1.4 3.4-3.8c.6-.63 1.6-.27 1.2.7l-4 4.6c-.43.5-.8.4-1.1.1z'/%3e%3c/svg%3e");
    background-repeat: no-repeat;
    background-position: right calc(0.375em + 0.1875rem) center;
    background-size: calc(0.75em + 0.375rem) calc(0.75em + 0.375rem);
}

.form-control.is-invalid {
    border-color: #dc3545;
    padding-right: calc(1.5em + 0.75rem);
    background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 12 12' width='12' height='12' fill='none' stroke='%23dc3545'%3e%3ccircle cx='6' cy='6' r='4.5'/%3e%3cpath stroke-linejoin='round' d='M5.8 3.6h.4L6 6.5z'/%3e%3ccircle cx='6' cy='8.2' r='.6' fill='%23dc3545' stroke='none'/%3e%3c/svg%3e");
    background-repeat: no-repeat;
    background-position: right calc(0.375em + 0.1875rem) center;
    background-size: calc(0.75em + 0.375rem) calc(0.75em + 0.375rem);
}

.invalid-feedback {
    display: block;
    margin-top: 0.25rem;
    font-size: 0.875em;
    color: #dc3545;
}
</style>

<template>
    <Master>
        <!-- Hero Section -->
        <section class="contact-hero-section">
            <div class="container position-relative" style="z-index: 1">
                <h1 class="contact-title-main">Contact Yvonne Khoo</h1>
                <p class="contact-subtitle">
                    Ready to start your real estate journey? Whether you're
                    buying, selling, or just have questions, I'm here to help
                    you every step of the way.
                </p>
            </div>

            <!-- Decorative Elements -->
            <div class="section-decoration decoration-1"></div>
            <div class="section-decoration decoration-2"></div>
        </section>

        <!-- Contact Content -->
        <section class="contact-content">
            <div class="container">
                <div class="contact-grid">
                    <!-- Left Column - Contact Info -->
                    <div>
                        <div class="contact-info-card">
                            <h3 class="contact-info-title">
                                Better yet, see us in person!
                            </h3>
                            <p class="contact-info-text">
                                We love our customers, so feel free to visit
                                during normal business hours.
                            </p>

                            <div class="contact-detail">
                                <h5 class="contact-detail-title">
                                    Brand New Homes Vegas
                                </h5>
                                <p class="contact-detail-text">
                                    10845 Griffith Peak Drive, Suite 2, Las
                                    Vegas, NV 89135
                                </p>
                            </div>

                            <div class="contact-detail">
                                <h5 class="contact-detail-title">
                                    Phone | 24-Hour Emergency Assistance
                                </h5>
                                <p class="contact-detail-text">
                                    USA & Canada: (702) 819-0035 <br />
                                    Overseas: +1 (702) 819-0035
                                </p>
                            </div>
                        </div>
                        <!-- Office Hours Accordion -->
                        <div class="contact-accordion mt-4">
                            <div class="accordion-item border-0">
                                <h2 class="accordion-header">
                                    <button
                                        class="accordion-button collapsed"
                                        type="button"
                                        data-bs-toggle="collapse"
                                        data-bs-target="#officeHours"
                                    >
                                        OFFICE HOURS
                                    </button>
                                </h2>
                                <div
                                    id="officeHours"
                                    class="accordion-collapse collapse show"
                                >
                                    <div class="accordion-body">
                                        <ul class="office-hours-list">
                                            <li>
                                                <strong>Mon-Fri:</strong>
                                                <span>10:00 AM - 06:00 PM</span>
                                            </li>
                                            <li>
                                                <strong>Sat:</strong>
                                                <span>11:00 AM - 03:00 PM</span>
                                            </li>
                                            <li>
                                                <strong>Sun:</strong>
                                                <span>Closed</span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Form Toggle Buttons -->
                        <div class="form-toggle-buttons">
                            <button
                                class="toggle-btn"
                                @click="initializeForm('Agent')"
                                data-bs-toggle="collapse"
                                data-bs-target=".multi-collapse"
                            >
                                {{ translate("DROP US A LINE AS AN AGENT") }}
                            </button>
                            <button
                                class="toggle-btn"
                                @click="initializeForm('Customer')"
                                data-bs-toggle="collapse"
                                data-bs-target=".multi-collapse"
                            >
                                {{ translate("DROP US A LINE AS A CUSTOMER") }}
                            </button>
                        </div>
                    </div>

                    <!-- Right Column - Contact Form -->
                    <div>
                        <div class="contact-form-card">
                            <div class="form-header">
                                <h3 class="form-title">Drop us a line</h3>
                                <p class="form-subtitle">
                                    We'll get back to you as soon as possible
                                </p>
                            </div>

                            <div class="row g-3">
                                <div class="col-12">
                                    <label class="form-label">
                                        {{ translate("Your Full Name") }}
                                        <span class="text-danger">*</span>
                                    </label>
                                    <input
                                        type="text"
                                        class="form-control"
                                        :class="{
                                            'invalid-bg': formErrors.name,
                                            'is-invalid': formErrors.name,
                                            'is-valid':
                                                form.name &&
                                                !formErrors.name &&
                                                formTouched.name,
                                        }"
                                        v-model="form.name"
                                        @blur="formTouched.name = true"
                                        @input="clearFieldError('name')"
                                        placeholder="Enter your full name"
                                    />
                                    <div
                                        class="invalid-feedback d-block"
                                        v-if="formErrors.name"
                                    >
                                        {{ formErrors.name[0] }}
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label">
                                        Email
                                        <span class="text-danger">*</span>
                                    </label>
                                    <input
                                        type="email"
                                        class="form-control"
                                        :class="{
                                            'invalid-bg': formErrors.email,
                                            'is-invalid': formErrors.email,
                                            'is-valid':
                                                form.email &&
                                                !formErrors.email &&
                                                formTouched.email,
                                        }"
                                        v-model="form.email"
                                        @blur="formTouched.email = true"
                                        @input="clearFieldError('email')"
                                        placeholder="your.email@example.com"
                                    />
                                    <div
                                        class="invalid-feedback d-block"
                                        v-if="formErrors.email"
                                    >
                                        {{ formErrors.email[0] }}
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label">
                                        Phone
                                        <span class="text-danger">*</span>
                                    </label>
                                    <input
                                        type="tel"
                                        class="form-control"
                                        v-model.trim="form.phone"
                                        inputmode="tel"
                                        placeholder="+1 7021234567 or 7021234567"
                                        :class="{
                                            'invalid-bg': formErrors.phone,
                                            'is-invalid': formErrors.phone,
                                            'is-valid':
                                                form.phone &&
                                                !formErrors.phone &&
                                                formTouched.phone,
                                        }"
                                        @blur="formTouched.phone = true"
                                        @input="clearFieldError('phone')"
                                    />
                                    <div
                                        class="invalid-feedback d-block"
                                        v-if="formErrors.phone"
                                    >
                                        {{ formErrors.phone[0] }}
                                    </div>
                                </div>

                                <div class="col-12">
                                    <label class="form-label">
                                        Message
                                        <span class="text-danger">*</span>
                                    </label>
                                    <textarea
                                        class="form-control"
                                        :class="{
                                            'invalid-bg': formErrors.message,
                                            'is-invalid': formErrors.message,
                                            'is-valid':
                                                form.message &&
                                                !formErrors.message &&
                                                formTouched.message,
                                        }"
                                        v-model="form.message"
                                        rows="4"
                                        @blur="formTouched.message = true"
                                        @input="clearFieldError('message')"
                                        placeholder="Tell us how we can help you..."
                                    ></textarea>
                                    <div
                                        class="invalid-feedback d-block"
                                        v-if="formErrors.message"
                                    >
                                        {{ formErrors.message[0] }}
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="form-actions">
                                        <button
                                            class="btn-send"
                                            :disabled="!formStatus"
                                            @click="save"
                                        >
                                            <span v-if="formStatus">{{
                                                translate("Send Message")
                                            }}</span>
                                            <span v-else>
                                                {{ translate("Sending") }}
                                                <span
                                                    class="spinner-border spinner-border-sm"
                                                    aria-hidden="true"
                                                ></span>
                                            </span>
                                        </button>
                                        <button
                                            class="btn-cancel"
                                            type="button"
                                            @click="cancelForm"
                                        >
                                            Clear Form
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- FAQ Section -->
        <section class="faq-section">
            <div class="container">
                <h2 class="faq-title">Frequently Asked Questions</h2>
                <div class="faq-grid">
                    <div class="faq-item">
                        <h4 class="faq-question">
                            How quickly can I expect a response?
                        </h4>
                        <p class="faq-answer">
                            I typically respond to all inquiries within 24
                            hours, often much sooner during business hours.
                        </p>
                    </div>
                    <div class="faq-item">
                        <h4 class="faq-question">
                            Do you work with out-of-state buyers?
                        </h4>
                        <p class="faq-answer">
                            Yes! I frequently work with clients relocating to
                            Las Vegas and can facilitate virtual tours and
                            remote transactions.
                        </p>
                    </div>
                    <div class="faq-item">
                        <h4 class="faq-question">
                            What areas of Las Vegas do you serve?
                        </h4>
                        <p class="faq-answer">
                            I work throughout the entire Las Vegas Valley,
                            including Las Vegas, North Las Vegas, Henderson, and
                            surrounding areas.
                        </p>
                    </div>
                    <div class="faq-item">
                        <h4 class="faq-question">
                            Do you charge for initial consultations?
                        </h4>
                        <p class="faq-answer">
                            No, I offer complimentary initial consultations to
                            discuss your real estate needs and how I can help.
                        </p>
                    </div>
                </div>
            </div>
        </section>
    </Master>
</template>

<script>
import Master from "@components/layout/Master.vue";

export default {
    components: {
        Master,
    },
    created() {
        this.fetchWesiteInfo();
        this.contactFormBtnStatus = 1;
        this.isFormInitialized = true;
    },
    watch: {
        "form.phone"(val) {
            if (val) {
                this.form.phone = val
                    .replace(/(?!^)\+/g, "")
                    .replace(/[^\d+]/g, "");
            }
        },
    },
    data() {
        return {
            logo: external_website.logo,
            name: external_website.name,
            website_address: "",
            website_phone: "",
            form: {
                name: "",
                phone: "",
                email: "",
                message: "",
                contacted_from: "",
            },
            formErrors: {},
            formTouched: {
                name: false,
                email: false,
                phone: false,
                message: false,
            },
            formStatus: 1,
            contactFormBtnStatus: 1,
            contacting_user: "",
            isFormInitialized: true,
        };
    },
    methods: {
        initializeForm(user) {
            this.contactFormBtnStatus = 1;
            this.contacting_user = user;

            if (!this.isFormInitialized) {
                this.form = {
                    name: "",
                    phone: "",
                    email: "",
                    message: "",
                    contacted_from: user,
                };
                this.isFormInitialized = true;
            } else {
                this.form.contacted_from = user;
            }

            this.formErrors = {};
        },

        cancelForm() {
            this.form = {
                name: "",
                phone: "",
                email: "",
                message: "",
                contacted_from: "",
            };
            this.formErrors = {};
            this.formTouched = {
                name: false,
                email: false,
                phone: false,
                message: false,
            };
        },

        clearFieldError(field) {
            if (this.formErrors[field]) {
                this.$delete(this.formErrors, field);
            }
        },

        fetchWesiteInfo() {
            axios
                .get("/api/fetch-website-info")
                .then((response) => {
                    this.email = response.data.email;
                    this.website_address = response.data.website_address;
                    this.website_phone = response.data.website_phone;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },

        save() {
            this.formStatus = 0;
            axios
                .post("/api/contact-save", this.form)
                .then((response) => {
                    toastr.success(
                        "Thank you! An agent will contact you shortly",
                        "Message Sent",
                        {
                            timeOut: 5000,
                            closeButton: true,
                            progressBar: true,
                            positionClass: "toast-top-right",
                        }
                    );

                    this.form = {
                        name: "",
                        email: "",
                        phone: "",
                        message: "",
                        contacted_from: "",
                    };
                    this.formErrors = {};
                    this.formTouched = {
                        name: false,
                        email: false,
                        phone: false,
                        message: false,
                    };
                    this.formStatus = 1;
                })
                .catch((error) => {
                    this.formStatus = 1;

                    const errorMessage =
                        error.response?.data?.message ||
                        "An error occurred. Please try again.";
                    toastr.error(errorMessage, "Error", {
                        timeOut: 5000,
                        closeButton: true,
                        progressBar: true,
                        positionClass: "toast-top-right",
                    });

                    if (error.response?.data?.errors) {
                        this.formErrors = error.response.data.errors;
                    }
                });
        },
    },
};
</script>
