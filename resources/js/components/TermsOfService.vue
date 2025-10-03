<style scoped>
/* Terms of Service Page */
.terms-page {
    background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);
    min-height: 100vh;
}

/* Hero Section */
.terms-hero-section {
    background: linear-gradient(
        135deg,
        rgba(26, 54, 93, 0.85) 0%,
        rgba(45, 55, 72, 0.75) 100%
    );
    padding: 4rem 0;
    position: relative;
    overflow: hidden;
}

.terms-hero-section::before {
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
    position: relative;
}

.page-title::after {
    content: "";
    position: absolute;
    bottom: -10px;
    left: 50%;
    transform: translateX(-50%);
    width: 60px;
    height: 4px;
    background: linear-gradient(
        to right,
        hsl(213 71% 45%),
        /* lighter */ hsl(213 71% 30%) /* darker */
    );
    border-radius: 2px;
}

.page-subtitle {
    font-size: 1.3rem;
    color: rgba(255, 255, 255, 0.8);
    line-height: 1.6;
    margin: 0 auto;
}

/* Content Section */
.content-section {
    padding: 5rem 0;
}

.content-card {
    background: white;
    border-radius: 24px;
    padding: 3rem;
    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.08);
    border: 1px solid #f1f5f9;
}

.intro-text {
    font-size: 1.1rem;
    color: #64748b;
    line-height: 1.7;
    margin-bottom: 3rem;
    padding: 2rem;
    background: #f8fafc;
    border-radius: 16px;
    border-left: 4px solid hsl(213 71% 45%);
}

/* Terms Sections */
.terms-section {
    margin-bottom: 3rem;
    padding: 2.5rem;
    background: #f8fafc;
    border-radius: 16px;
    border: 1px solid #e2e8f0;
    transition: all 0.3s ease;
    position: relative;
    overflow: hidden;
}

.terms-section:hover {
    border-color: hsl(213 71% 45%);
    transform: translateX(5px);
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
}

.terms-section::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 4px;
    height: 100%;
    background: linear-gradient(
        to right,
        hsl(213 71% 45%),
        /* lighter */ hsl(213 71% 30%) /* darker */
    );
    border-radius: 2px 0 0 2px;
}

.section-header {
    display: flex;
    align-items: flex-start;
    gap: 1rem;
    margin-bottom: 1.5rem;
}

.section-icon {
    width: 48px;
    height: 48px;
    background: linear-gradient(
        to right,
        hsl(213 71% 45%),
        /* lighter */ hsl(213 71% 30%) /* darker */
    );
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
    line-height: 1.2;
}

.section-content {
    color: #64748b;
    line-height: 1.7;
    font-size: 1.05rem;
    margin: 0;
}

/* Important Notice */
.important-notice {
    background: linear-gradient(
        to right,
        hsl(213 71% 85%),
        /* lighter */ hsl(213 71% 60%) /* darker */
    );
    border-radius: 16px;
    padding: 2rem;
    margin: 2rem 0;
    border: 1px solid hsl(213 71% 45%);
    position: relative;
}

.notice-icon {
    position: absolute;
    top: -15px;
    left: 2rem;
    background: hsl(213 71% 45%);
    color: white;
    padding: 0.5rem 1rem;
    border-radius: 20px;
    font-size: 0.9rem;
    font-weight: 600;
}

.notice-content {
    margin-top: 1rem;
    color: hsl(213 71% 30%);
    line-height: 1.6;
}

.notice-content strong {
    color: hsl(213 71% 30%);
}

/* Legal Points */
.legal-points {
    background: #f0f9ff;
    border-radius: 12px;
    padding: 1.5rem;
    margin: 1.5rem 0;
    border: 1px solid #bae6fd;
}

.legal-title {
    font-weight: 600;
    color: #0369a1;
    margin-bottom: 1rem;
    font-size: 1rem;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.legal-list {
    list-style: none;
    padding: 0;
    margin: 0;
}

.legal-list li {
    padding: 0.75rem 0;
    color: #0c4a6e;
    line-height: 1.5;
    position: relative;
    padding-left: 2rem;
    border-bottom: 1px solid #e0f2fe;
}

.legal-list li:last-child {
    border-bottom: none;
}

.legal-list li::before {
    content: "⚖️";
    position: absolute;
    left: 0;
    font-size: 1.1rem;
}

/* Acceptance Section */
.acceptance-section {
    background: linear-gradient(135deg, #1a365d, #2d3748);
    border-radius: 16px;
    padding: 2.5rem;
    margin-top: 3rem;
    text-align: center;
    position: relative;
    overflow: hidden;
}

.acceptance-section::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(
        45deg,
        transparent,
        rgba(255, 255, 255, 0.1),
        transparent
    );
    animation: shimmer 3s infinite;
}

@keyframes shimmer {
    0% {
        transform: translateX(-100%);
    }
    100% {
        transform: translateX(100%);
    }
}

.acceptance-title {
    color: white;
    font-size: 1.5rem;
    font-weight: 600;
    margin-bottom: 1rem;
    position: relative;
    z-index: 1;
}

.acceptance-text {
    color: rgba(255, 255, 255, 0.8);
    margin-bottom: 1.5rem;
    line-height: 1.6;
    position: relative;
    z-index: 1;
}

.acceptance-actions {
    display: flex;
    gap: 1rem;
    justify-content: center;
    flex-wrap: wrap;
    position: relative;
    z-index: 1;
}

.action-btn {
    padding: 0.75rem 2rem;
    border-radius: 12px;
    font-weight: 600;
    text-decoration: none;
    transition: all 0.3s ease;
    border: 2px solid transparent;
}

.btn-primary {
    background: linear-gradient(
        to right,
        hsl(213 71% 45%),
        /* lighter */ hsl(213 71% 30%) /* darker */
    );
    color: white;
}

.btn-primary:hover {
    background: linear-gradient(
        to right,
        hsl(213 71% 45%),
        /* lighter */ hsl(213 71% 30%) /* darker */
    );
    transform: translateY(-2px);
    box-shadow: 0 8px 20px hsl(213 71% 45%);
    color: white;
    text-decoration: none;
}

.btn-outline {
    background: transparent;
    border-color: rgba(255, 255, 255, 0.3);
    color: white;
}

.btn-outline:hover {
    background: rgba(255, 255, 255, 0.1);
    border-color: white;
    transform: translateY(-2px);
    color: white;
    text-decoration: none;
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
@media (max-width: 768px) {
    .terms-hero-section {
        padding: 3rem 0;
    }

    .page-title {
        font-size: 2.2rem;
    }

    .page-subtitle {
        font-size: 1.1rem;
    }

    .content-section {
        padding: 3rem 0;
    }

    .content-card {
        padding: 2rem;
        border-radius: 20px;
    }

    .terms-section {
        padding: 2rem;
    }

    .section-header {
        flex-direction: column;
        gap: 1rem;
    }

    .section-title {
        font-size: 1.4rem;
    }

    .acceptance-actions {
        flex-direction: column;
        align-items: center;
    }

    .action-btn {
        width: 100%;
        max-width: 250px;
    }
}

@media (max-width: 576px) {
    .page-title {
        font-size: 1.8rem;
    }

    .content-card {
        padding: 1.5rem;
    }

    .terms-section {
        padding: 1.5rem;
    }

    .section-icon {
        width: 40px;
        height: 40px;
        font-size: 1.2rem;
    }

    .important-notice,
    .legal-points {
        padding: 1.25rem;
    }

    .acceptance-section {
        padding: 2rem 1.5rem;
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

.terms-section {
    animation: fadeInUp 0.6s ease-out;
}

.terms-section:nth-child(2) {
    animation-delay: 0.1s;
}
.terms-section:nth-child(3) {
    animation-delay: 0.2s;
}
.terms-section:nth-child(4) {
    animation-delay: 0.3s;
}
.terms-section:nth-child(5) {
    animation-delay: 0.4s;
}
.terms-section:nth-child(6) {
    animation-delay: 0.5s;
}
</style>

<template>
    <Master>
        <div class="terms-page">
            <!-- Hero Section -->
            <section class="terms-hero-section">
                <div class="container position-relative" style="z-index: 1">
                    <div class="hero-content">
                        <h1 class="page-title">Terms of Service</h1>
                        <p class="page-subtitle">
                            Please read these Terms of Service carefully before
                            using our website or engaging with our real estate
                            services in Las Vegas.
                        </p>
                    </div>
                </div>

                <!-- Decorative Elements -->
                <div class="section-decoration decoration-1"></div>
                <div class="section-decoration decoration-2"></div>
            </section>

            <!-- Content Section -->
            <section class="content-section">
                <div class="container">
                    <div class="content-card">
                        <!-- Introduction -->
                        <div class="intro-text">
                            These Terms of Service ("Terms") govern your access
                            to and use of
                            <strong>{{ external_website.name }}</strong
                            >'s website and services. By using our website or
                            engaging with us for real estate services, you agree
                            to be bound by these Terms. If you do not agree,
                            please do not use our website or services.
                        </div>

                        <!-- Use of Our Services -->
                        <div class="terms-section">
                            <div class="section-header">
                                <div class="section-icon">
                                    <i class="bi bi-house-check"></i>
                                </div>
                                <h2 class="section-title">
                                    Use of Our Services
                                </h2>
                            </div>
                            <p class="section-content">
                                Our services are intended for individuals
                                seeking real estate assistance, including
                                buying, selling, or renting properties in Las
                                Vegas, Nevada. You agree to provide accurate
                                information and to use our services only for
                                lawful purposes.
                            </p>
                            <div class="legal-points">
                                <div class="legal-title">
                                    Prohibited Activities
                                </div>
                                <ul class="legal-list">
                                    <li>
                                        Unauthorized data scraping or automated
                                        access
                                    </li>
                                    <li>
                                        Hacking or attempting to compromise
                                        system security
                                    </li>
                                    <li>
                                        Posting false or misleading property
                                        information
                                    </li>
                                    <li>
                                        Engaging in fraudulent or unlawful
                                        activities
                                    </li>
                                    <li>
                                        Violating any applicable laws or
                                        regulations
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <!-- Intellectual Property Rights -->
                        <div class="terms-section">
                            <div class="section-header">
                                <div class="section-icon">
                                    <i class="bi bi-c-circle"></i>
                                </div>
                                <h2 class="section-title">
                                    Intellectual Property Rights
                                </h2>
                            </div>
                            <p class="section-content">
                                All content on this website, including text,
                                graphics, logos, and images, is the property of
                                <strong>{{ external_website.name }}</strong> or
                                its content suppliers and is protected by
                                copyright, trademark, and other laws.
                            </p>
                            <div class="important-notice">
                                <div class="notice-icon">Important</div>
                                <p class="notice-content">
                                    <strong>You may not</strong> reproduce,
                                    distribute, or create derivative works from
                                    any content without our prior written
                                    permission. This includes property listings,
                                    photographs, virtual tours, and all other
                                    website content.
                                </p>
                            </div>
                        </div>

                        <!-- Disclaimers and Limitation of Liability -->
                        <div class="terms-section">
                            <div class="section-header">
                                <div class="section-icon">
                                    <i class="bi bi-shield-exclamation"></i>
                                </div>
                                <h2 class="section-title">
                                    Disclaimers and Limitation of Liability
                                </h2>
                            </div>
                            <p class="section-content">
                                We strive to provide accurate and up-to-date
                                information, but we make no guarantees regarding
                                the completeness, accuracy, or reliability of
                                any content. Our services are provided "as is"
                                without warranties of any kind.
                            </p>
                            <div class="legal-points">
                                <div class="legal-title">
                                    Limitation of Liability
                                </div>
                                <ul class="legal-list">
                                    <li>
                                        <strong>{{
                                            external_website.name
                                        }}</strong>
                                        shall not be liable for any direct,
                                        indirect, or consequential damages
                                    </li>
                                    <li>
                                        We are not responsible for errors in
                                        property information or pricing
                                    </li>
                                    <li>
                                        We do not guarantee the availability of
                                        listed properties
                                    </li>
                                    <li>
                                        Users should verify all property details
                                        independently
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <!-- Governing Law -->
                        <div class="terms-section">
                            <div class="section-header">
                                <div class="section-icon">
                                    <i class="bi bi-geo-alt"></i>
                                </div>
                                <h2 class="section-title">Governing Law</h2>
                            </div>
                            <p class="section-content">
                                These Terms shall be governed by and construed
                                in accordance with the laws of the State of
                                Nevada. Any disputes arising out of or relating
                                to these Terms or our services shall be resolved
                                in the courts located in Clark County, Nevada.
                            </p>
                        </div>

                        <!-- Changes to These Terms -->
                        <div class="terms-section">
                            <div class="section-header">
                                <div class="section-icon">
                                    <i class="bi bi-arrow-clockwise"></i>
                                </div>
                                <h2 class="section-title">
                                    Changes to These Terms
                                </h2>
                            </div>
                            <p class="section-content">
                                We reserve the right to update or modify these
                                Terms at any time. Changes will be effective
                                immediately upon posting on our website. Your
                                continued use of our website or services after
                                any changes indicates your acceptance of the
                                revised Terms.
                            </p>
                            <div class="important-notice">
                                <div class="notice-icon">Notice</div>
                                <p class="notice-content">
                                    <strong>We recommend</strong> reviewing
                                    these Terms periodically to stay informed
                                    about any updates. Significant changes will
                                    be highlighted on our website for your
                                    convenience.
                                </p>
                            </div>
                        </div>

                        <!-- Acceptance Section -->
                        <div class="acceptance-section">
                            <h3 class="acceptance-title">
                                Understanding Your Agreement
                            </h3>
                            <p class="acceptance-text">
                                By using our website and services, you
                                acknowledge that you have read, understood, and
                                agree to be bound by these Terms of Service.
                            </p>
                            <div class="acceptance-actions">
                                <a
                                    href="/contact"
                                    class="action-btn btn-primary"
                                >
                                    Contact Us with Questions
                                </a>
                                <a
                                    href="/privacy-policy"
                                    class="action-btn btn-outline"
                                >
                                    View Privacy Policy
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </Master>
</template>

<script>
import Master from "@components/layout/Master.vue";
export default {
    components: {
        Master,
    },
    data() {
        return {
            external_website: external_website,
        };
    },
};
</script>
