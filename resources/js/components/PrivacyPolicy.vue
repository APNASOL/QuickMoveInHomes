<style scoped>
/* Privacy Policy Page */
.privacy-page {
    background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);
    min-height: 100vh;
}

/* Hero Section */
.privacy-hero-section {
    background: linear-gradient(
        135deg,
        rgba(26, 54, 93, 0.85) 0%,
        rgba(45, 55, 72, 0.75) 100%
    );
    padding: 4rem 0;
    position: relative;
    overflow: hidden;
}

.privacy-hero-section::before {
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

/* Policy Sections */
.policy-section {
    margin-bottom: 3rem;
    padding: 2.5rem;
    background: #f8fafc;
    border-radius: 16px;
    border: 1px solid #e2e8f0;
    transition: all 0.3s ease;
    position: relative;
    overflow: hidden;
}

.policy-section:hover {
    border-color: hsl(213 71% 45%);
    transform: translateX(5px);
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
}

.policy-section::before {
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

/* Data Collection Grid */
.data-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: 1.5rem;
    margin: 2rem 0;
}

.data-category {
    background: white;
    border-radius: 12px;
    padding: 1.5rem;
    border: 1px solid #e2e8f0;
    transition: all 0.3s ease;
}

.data-category:hover {
    border-color: hsl(213 71% 45%);
    transform: translateY(-3px);
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
}

.category-icon {
    width: 40px;
    height: 40px;
    background: linear-gradient(135deg, #1a365d, #2d3748);
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-size: 1.2rem;
    margin-bottom: 1rem;
}

.category-title {
    font-size: 1.1rem;
    font-weight: 600;
    color: #1a365d;
    margin-bottom: 0.75rem;
}

.category-items {
    list-style: none;
    padding: 0;
    margin: 0;
}

.category-items li {
    padding: 0.5rem 0;
    color: #64748b;
    line-height: 1.4;
    font-size: 0.9rem;
    position: relative;
    padding-left: 1.25rem;
}

.category-items li::before {
    content: "•";
    color: hsl(213 71% 45%);
    position: absolute;
    left: 0;
    font-weight: bold;
}

/* Usage Examples */
.usage-examples {
    background: linear-gradient(135deg, #f0f9ff, #e0f2fe);
    border-radius: 16px;
    padding: 2rem;
    margin: 1.5rem 0;
    border: 1px solid #bae6fd;
}

.examples-title {
    font-weight: 600;
    color: #0369a1;
    margin-bottom: 1rem;
    font-size: 1rem;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.examples-list {
    list-style: none;
    padding: 0;
    margin: 0;
}

.examples-list li {
    padding: 0.75rem 0;
    color: #0c4a6e;
    line-height: 1.5;
    position: relative;
    padding-left: 2rem;
}

.examples-list li::before {
    content: "🏠";
    position: absolute;
    left: 0;
    font-size: 1.1rem;
}

/* Security Measures */
.security-measures {
    background: linear-gradient(
        to right,
        hsl(213 71% 85%),
        /* lighter */ hsl(213 71% 60%) /* darker */
    );
    border-radius: 16px;
    padding: 2rem;
    margin: 1.5rem 0;
    border: 1px solid #bbf7d0;
}

.security-title {
    font-weight: 600;
    color: hsl(213 71% 30%);
    margin-bottom: 1rem;
    font-size: 1rem;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.security-list {
    list-style: none;
    padding: 0;
    margin: 0;
}

.security-list li {
    padding: 0.75rem 0;
    color: hsl(213 71% 30%);
    line-height: 1.5;
    position: relative;
    padding-left: 2rem;
}

.security-list li::before {
    content: "🔒";
    position: absolute;
    left: 0;
    font-size: 1.1rem;
}

/* Your Rights Section */
.rights-section {
    background: linear-gradient(135deg, #1a365d, #2d3748);
    border-radius: 16px;
    padding: 2.5rem;
    margin-top: 3rem;
    text-align: center;
    position: relative;
    overflow: hidden;
}

.rights-title {
    color: white;
    font-size: 1.5rem;
    font-weight: 600;
    margin-bottom: 1rem;
    position: relative;
    z-index: 1;
}

.rights-text {
    color: rgba(255, 255, 255, 0.8);
    margin-bottom: 1.5rem;
    line-height: 1.6;
    position: relative;
    z-index: 1;
}

.rights-actions {
    display: flex;
    gap: 1rem;
    justify-content: center;
    flex-wrap: wrap;
    position: relative;
    z-index: 1;
}

.rights-btn {
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
    .privacy-hero-section {
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

    .policy-section {
        padding: 2rem;
    }

    .section-header {
        flex-direction: column;
        gap: 1rem;
    }

    .section-title {
        font-size: 1.4rem;
    }

    .data-grid {
        grid-template-columns: 1fr;
    }

    .rights-actions {
        flex-direction: column;
        align-items: center;
    }

    .rights-btn {
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

    .policy-section {
        padding: 1.5rem;
    }

    .section-icon {
        width: 40px;
        height: 40px;
        font-size: 1.2rem;
    }

    .usage-examples,
    .security-measures {
        padding: 1.25rem;
    }

    .rights-section {
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

.policy-section {
    animation: fadeInUp 0.6s ease-out;
}

.policy-section:nth-child(2) {
    animation-delay: 0.1s;
}
.policy-section:nth-child(3) {
    animation-delay: 0.2s;
}
.policy-section:nth-child(4) {
    animation-delay: 0.3s;
}
.policy-section:nth-child(5) {
    animation-delay: 0.4s;
}
.policy-section:nth-child(6) {
    animation-delay: 0.5s;
}
</style>

<template>
    <Master>
        <div class="privacy-page">
            <!-- Hero Section -->
            <section class="privacy-hero-section">
                <div class="container position-relative" style="z-index: 1">
                    <div class="hero-content">
                        <h1 class="page-title">Privacy Policy</h1>
                        <p class="page-subtitle">
                            Your privacy is important to us. Learn how we
                            protect and manage your personal information while
                            providing exceptional real estate services.
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
                            We value and respect the privacy of our clients,
                            prospects, and website visitors. This Privacy Policy
                            explains how we collect, use, store, and protect
                            your personal information in connection with our
                            real estate services in Las Vegas, Nevada. By using
                            our services, including visiting our website,
                            submitting your information, or engaging with us in
                            any way, you agree to the terms outlined in this
                            policy.
                        </div>

                        <!-- Information We Collect -->
                        <div class="policy-section">
                            <div class="section-header">
                                <div class="section-icon">
                                    <i class="bi bi-collection"></i>
                                </div>
                                <h2 class="section-title">
                                    Information We Collect
                                </h2>
                            </div>
                            <p class="section-content">
                                We collect information to provide you with the
                                best possible real estate experience. This
                                includes both personal information you provide
                                and technical information gathered
                                automatically.
                            </p>

                            <div class="data-grid">
                                <div class="data-category">
                                    <div class="category-icon">
                                        <i class="bi bi-person"></i>
                                    </div>
                                    <h3 class="category-title">
                                        Personal Information
                                    </h3>
                                    <ul class="category-items">
                                        <li>Name and contact details</li>
                                        <li>Email address and phone number</li>
                                        <li>Mailing address</li>
                                        <li>Financial information</li>
                                        <li>Property preferences</li>
                                    </ul>
                                </div>

                                <div class="data-category">
                                    <div class="category-icon">
                                        <i class="bi bi-laptop"></i>
                                    </div>
                                    <h3 class="category-title">
                                        Technical Information
                                    </h3>
                                    <ul class="category-items">
                                        <li>IP addresses and device info</li>
                                        <li>Browser types and versions</li>
                                        <li>Referring pages and sites</li>
                                        <li>Visit dates and times</li>
                                        <li>Website interaction data</li>
                                    </ul>
                                </div>
                            </div>

                            <p class="section-content mt-3">
                                This information helps us improve our website
                                functionality, personalize your experience, and
                                provide better real estate services tailored to
                                your needs.
                            </p>
                        </div>

                        <!-- How We Use Your Information -->
                        <div class="policy-section">
                            <div class="section-header">
                                <div class="section-icon">
                                    <i class="bi bi-gear"></i>
                                </div>
                                <h2 class="section-title">
                                    How We Use Your Information
                                </h2>
                            </div>
                            <p class="section-content">
                                Your information is used exclusively to enhance
                                your real estate experience and provide the
                                services you request.
                            </p>

                            <div class="usage-examples">
                                <div class="examples-title">Primary Uses</div>
                                <ul class="examples-list">
                                    <li>
                                        Property searches and customized
                                        listings
                                    </li>
                                    <li>
                                        Scheduling property tours and viewings
                                    </li>
                                    <li>
                                        Facilitating real estate transactions
                                    </li>
                                    <li>
                                        Marketing properties to potential buyers
                                    </li>
                                    <li>
                                        Communicating important updates and
                                        offers
                                    </li>
                                    <li>
                                        Sending newsletters and market reports
                                        (with consent)
                                    </li>
                                </ul>
                            </div>

                            <p class="section-content">
                                We strictly limit the sharing of your
                                information to trusted partners such as mortgage
                                brokers, escrow officers, and inspectors only as
                                necessary to complete real estate transactions.
                            </p>
                        </div>

                        <!-- Sharing and Disclosure -->
                        <div class="policy-section">
                            <div class="section-header">
                                <div class="section-icon">
                                    <i class="bi bi-share"></i>
                                </div>
                                <h2 class="section-title">
                                    Sharing and Disclosure
                                </h2>
                            </div>
                            <p class="section-content">
                                We are committed to protecting your privacy and
                                are transparent about when and why we share your
                                information.
                            </p>

                            <div class="usage-examples">
                                <div class="examples-title">
                                    When We Share Information
                                </div>
                                <ul class="examples-list">
                                    <li>
                                        With trusted service providers under
                                        confidentiality agreements
                                    </li>
                                    <li>
                                        To complete real estate transactions
                                        with necessary parties
                                    </li>
                                    <li>
                                        When required by law, court orders, or
                                        legal processes
                                    </li>
                                    <li>
                                        To protect our rights, property, or
                                        safety
                                    </li>
                                </ul>
                            </div>

                            <p class="section-content mt-3">
                                <strong
                                    >We do not sell, rent, or trade your
                                    personal information</strong
                                >
                                to third parties for their own marketing
                                purposes. Your trust is our most important
                                asset.
                            </p>
                        </div>

                        <!-- Data Protection and Your Choices -->
                        <div class="policy-section">
                            <div class="section-header">
                                <div class="section-icon">
                                    <i class="bi bi-shield-check"></i>
                                </div>
                                <h2 class="section-title">
                                    Data Protection and Your Choices
                                </h2>
                            </div>
                            <p class="section-content">
                                We take the security of your information
                                seriously and provide you with control over your
                                personal data.
                            </p>

                            <div class="security-measures">
                                <div class="security-title">
                                    Security Measures
                                </div>
                                <ul class="security-list">
                                    <li>
                                        Industry-standard encryption and
                                        security protocols
                                    </li>
                                    <li>
                                        Regular security assessments and updates
                                    </li>
                                    <li>
                                        Limited access to personal information
                                    </li>
                                    <li>
                                        Secure data storage and transmission
                                    </li>
                                </ul>
                            </div>

                            <p class="section-content mt-3">
                                Despite our efforts, no data transmission over
                                the internet or electronic storage can be
                                guaranteed to be 100% secure. You have the right
                                to request access to, correction of, or deletion
                                of your personal data. You can also opt out of
                                receiving marketing communications from us at
                                any time by following the unsubscribe link in
                                our emails or contacting us directly.
                            </p>
                        </div>

                        <!-- Changes to This Privacy Policy -->
                        <div class="policy-section">
                            <div class="section-header">
                                <div class="section-icon">
                                    <i class="bi bi-arrow-clockwise"></i>
                                </div>
                                <h2 class="section-title">
                                    Changes to This Privacy Policy
                                </h2>
                            </div>
                            <p class="section-content">
                                We reserve the right to update this Privacy
                                Policy periodically to reflect changes in our
                                practices or for other operational, legal, or
                                regulatory reasons. Any changes will be posted
                                on this page with an updated revision date.
                            </p>
                            <p class="section-content">
                                We encourage you to review this policy
                                periodically to stay informed about how we are
                                protecting your information. Significant changes
                                will be communicated through our website or
                                directly to you when appropriate.
                            </p>
                        </div>

                        <!-- Your Rights Section -->
                        <div class="rights-section">
                            <h3 class="rights-title">
                                Your Privacy Rights Matter
                            </h3>
                            <p class="rights-text">
                                You have control over your personal information.
                                Contact us to exercise your rights or learn more
                                about our privacy practices.
                            </p>
                            <div class="rights-actions">
                                <a
                                    href="/contact"
                                    class="rights-btn btn-primary"
                                >
                                    Contact Our Privacy Team
                                </a>
                                <a
                                    href="/cookie-policy"
                                    class="rights-btn btn-outline"
                                >
                                    View Cookie Policy
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
