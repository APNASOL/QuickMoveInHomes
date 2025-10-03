<style scoped>
/* Cookie Policy Page */
.cookie-policy-page {
    background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);
    min-height: 100vh;
}

/* Hero Section */
.cookie-hero-section {
    background: linear-gradient(
        135deg,
        rgba(26, 54, 93, 0.85) 0%,
        rgba(45, 55, 72, 0.75) 100%
    );
    padding: 4rem 0;
    position: relative;
    overflow: hidden;
}

.cookie-hero-section::before {
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
    margin-bottom: 2rem;
    padding-left: 1.5rem;
    border-left: 3px solid hsl(213 71% 45%);
}

/* Policy Sections */
.policy-section {
    margin-bottom: 3rem;
    padding: 2rem;
    background: #f8fafc;
    border-radius: 16px;
    border: 1px solid #e2e8f0;
    transition: all 0.3s ease;
}

.policy-section:hover {
    border-color: hsl(213 71% 45%);
    transform: translateX(5px);
}

.section-title {
    font-size: 1.8rem;
    font-weight: 700;
    color: #1a365d;
    margin-bottom: 1rem;
    position: relative;
    display: flex;
    align-items: center;
    gap: 1rem;
}

.section-title::before {
    content: "";
    width: 4px;
    height: 24px;
    background: linear-gradient(
        to right,
        hsl(213 71% 45%),
        /* lighter */ hsl(213 71% 30%) /* darker */
    );
    border-radius: 2px;
    flex-shrink: 0;
}

.section-content {
    color: #64748b;
    line-height: 1.7;
    font-size: 1.05rem;
    margin: 0;
}

/* Cookie Types Grid */
.cookie-types-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: 1.5rem;
    margin: 2rem 0;
}

.cookie-type-card {
    background: white;
    border-radius: 12px;
    padding: 1.5rem;
    border: 1px solid #e2e8f0;
    transition: all 0.3s ease;
}

.cookie-type-card:hover {
    border-color: hsl(213 71% 45%);
    transform: translateY(-3px);
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
}

.cookie-type-icon {
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
    margin-bottom: 1rem;
    color: white;
    font-size: 1.5rem;
}

.cookie-type-title {
    font-size: 1.2rem;
    font-weight: 600;
    color: #1a365d;
    margin-bottom: 0.75rem;
}

.cookie-type-description {
    color: #64748b;
    line-height: 1.5;
    font-size: 0.95rem;
    margin: 0;
}

/* Cookie Management */
.cookie-management {
    background: linear-gradient(
        to right,
        hsl(213 71% 85%),
        /* lighter */ hsl(213 71% 60%) /* darker */
    );
    border-radius: 16px;
    padding: 2rem;
    margin: 2rem 0;
    border-left: 4px solid #0369a1;
}

.management-title {
    font-weight: 600;
    color: hsl(213 71% 30%);
    margin-bottom: 1rem;
    font-size: 1.1rem;
}

.management-steps {
    list-style: none;
    padding: 0;
    margin: 0;
}

.management-steps li {
    padding: 0.75rem 0;
    color: hsl(213 71% 30%);
    line-height: 1.5;
    position: relative;
    padding-left: 2rem;
}

.management-steps li::before {
    content: "⚙️";
    position: absolute;
    left: 0;
    font-size: 1.1rem;
}

/* Browser Instructions */
.browser-instructions {
    background: #f0f9ff;
    border-radius: 12px;
    padding: 1.5rem;
    margin: 1.5rem 0;
    border: 1px solid #bae6fd;
}

.instructions-title {
    font-weight: 600;
    color: #0369a1;
    margin-bottom: 1rem;
    font-size: 1rem;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.instructions-list {
    list-style: none;
    padding: 0;
    margin: 0;
}

.instructions-list li {
    padding: 0.5rem 0;
    color: #0c4a6e;
    line-height: 1.5;
    position: relative;
    padding-left: 1.5rem;
}

.instructions-list li::before {
    content: "🌐";
    position: absolute;
    left: 0;
}

/* Contact Section */
.contact-section {
    background: linear-gradient(135deg, #1a365d, #2d3748);
    border-radius: 16px;
    padding: 2rem;
    margin-top: 3rem;
    text-align: center;
}

.contact-title {
    color: white;
    font-size: 1.3rem;
    font-weight: 600;
    margin-bottom: 1rem;
}

.contact-text {
    color: rgba(255, 255, 255, 0.8);
    margin-bottom: 1.5rem;
    line-height: 1.6;
}

.contact-link {
    background: linear-gradient(
        to right,
        hsl(213 71% 45%),
        /* lighter */ hsl(213 71% 30%) /* darker */
    );
    color: white;
    padding: 0.75rem 2rem;
    border-radius: 12px;
    text-decoration: none;
    font-weight: 600;
    transition: all 0.3s ease;
    display: inline-block;
}

.contact-link:hover {
    background: linear-gradient(
        to right,
        hsl(213 71% 45%),
        /* lighter */ hsl(213 71% 30%) /* darker */
    );
    transform: translateY(-2px);
    box-shadow: 0 8px 20px hsl(213 71% 55%);
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
    .cookie-hero-section {
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
        padding: 1.5rem;
    }

    .section-title {
        font-size: 1.5rem;
    }

    .cookie-types-grid {
        grid-template-columns: 1fr;
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
        padding: 1.25rem;
    }

    .cookie-management,
    .browser-instructions {
        padding: 1.25rem;
    }

    .contact-section {
        padding: 1.5rem;
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
        <div class="cookie-policy-page">
            <!-- Hero Section -->
            <section class="cookie-hero-section">
                <div class="container position-relative" style="z-index: 1">
                    <div class="hero-content">
                        <h1 class="page-title">Cookie Policy</h1>
                        <p class="page-subtitle">
                            Understanding how we use cookies helps you have a
                            better experience while browsing properties or
                            learning more about real estate services in Las
                            Vegas.
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
                        <div class="policy-section">
                            <p class="intro-text">
                                This Cookie Policy explains how Brand New Homes
                                Vegas uses cookies and similar technologies to
                                recognize you when you visit our website. It
                                explains what these technologies are and why we
                                use them, as well as your rights to control our
                                use of them.
                            </p>
                        </div>

                        <!-- What Are Cookies -->
                        <div class="policy-section">
                            <h2 class="section-title">What Are Cookies?</h2>
                            <p class="section-content">
                                Cookies are small data files that are placed on
                                your computer or mobile device when you visit a
                                website. Cookies are widely used to make
                                websites work more efficiently, as well as to
                                provide reporting information. They do not harm
                                your device and help us provide you with a
                                better browsing experience.
                            </p>
                        </div>

                        <!-- Why We Use Cookies -->
                        <div class="policy-section">
                            <h2 class="section-title">Why We Use Cookies</h2>
                            <p class="section-content">
                                We use cookies to enhance your browsing
                                experience by remembering your preferences,
                                understanding how you use our site, and
                                improving our services. Cookies help us display
                                more relevant real estate listings and marketing
                                material based on your interests, making it
                                easier for you to find your dream home in Las
                                Vegas.
                            </p>
                        </div>

                        <!-- Types of Cookies -->
                        <div class="policy-section">
                            <h2 class="section-title">
                                Types of Cookies We Use
                            </h2>
                            <p class="section-content mb-4">
                                We use both session cookies (which expire once
                                you close your web browser) and persistent
                                cookies (which stay on your device until you
                                delete them). They may be categorized as:
                            </p>

                            <div class="cookie-types-grid">
                                <div class="cookie-type-card">
                                    <div class="cookie-type-icon">
                                        <i class="bi bi-shield-check"></i>
                                    </div>
                                    <h3 class="cookie-type-title">
                                        Essential Cookies
                                    </h3>
                                    <p class="cookie-type-description">
                                        Required for the website to function
                                        properly. They enable basic functions
                                        like page navigation and access to
                                        secure areas.
                                    </p>
                                </div>

                                <div class="cookie-type-card">
                                    <div class="cookie-type-icon">
                                        <i class="bi bi-graph-up"></i>
                                    </div>
                                    <h3 class="cookie-type-title">
                                        Performance Cookies
                                    </h3>
                                    <p class="cookie-type-description">
                                        Help us understand how visitors interact
                                        with our website by collecting and
                                        reporting information anonymously.
                                    </p>
                                </div>

                                <div class="cookie-type-card">
                                    <div class="cookie-type-icon">
                                        <i class="bi bi-person-check"></i>
                                    </div>
                                    <h3 class="cookie-type-title">
                                        Functionality Cookies
                                    </h3>
                                    <p class="cookie-type-description">
                                        Enable enhanced functionality and
                                        personalization, such as remembering
                                        your search preferences and favorite
                                        properties.
                                    </p>
                                </div>

                                <div class="cookie-type-card">
                                    <div class="cookie-type-icon">
                                        <i class="bi bi-megaphone"></i>
                                    </div>
                                    <h3 class="cookie-type-title">
                                        Targeting Cookies
                                    </h3>
                                    <p class="cookie-type-description">
                                        Used to deliver relevant advertisements
                                        and track the effectiveness of our
                                        marketing campaigns.
                                    </p>
                                </div>
                            </div>

                            <p class="section-content mt-3">
                                Third-party cookies, such as those from Google
                                Analytics, may also be used to collect
                                information and generate insights about how
                                users interact with our real estate platform.
                            </p>
                        </div>

                        <!-- Cookie Management -->
                        <div class="policy-section">
                            <h2 class="section-title">
                                Your Choices Regarding Cookies
                            </h2>
                            <p class="section-content">
                                You have the right to accept or reject cookies.
                                You can modify your browser settings to decline
                                cookies if you prefer. Please note that
                                disabling cookies may affect the functionality
                                and features of our site.
                            </p>

                            <div class="cookie-management">
                                <div class="management-title">
                                    How to Manage Cookies
                                </div>
                                <ul class="management-steps">
                                    <li>
                                        Most web browsers automatically accept
                                        cookies, but you can usually modify your
                                        settings to decline them
                                    </li>
                                    <li>
                                        You can delete existing cookies from
                                        your device at any time through your
                                        browser settings
                                    </li>
                                    <li>
                                        If you choose to decline cookies, you
                                        may not be able to fully experience all
                                        features of our website
                                    </li>
                                    <li>
                                        Different browsers have different
                                        methods for managing cookie settings
                                    </li>
                                </ul>
                            </div>

                            <div class="browser-instructions">
                                <div class="instructions-title">
                                    Browser-Specific Instructions
                                </div>
                                <ul class="instructions-list">
                                    <li>
                                        <strong>Chrome:</strong> Settings →
                                        Privacy and security → Cookies and other
                                        site data
                                    </li>
                                    <li>
                                        <strong>Firefox:</strong> Options →
                                        Privacy & Security → Cookies and Site
                                        Data
                                    </li>
                                    <li>
                                        <strong>Safari:</strong> Preferences →
                                        Privacy → Cookies and website data
                                    </li>
                                    <li>
                                        <strong>Edge:</strong> Settings →
                                        Privacy, search, and services → Cookies
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <!-- Policy Changes -->
                        <div class="policy-section">
                            <h2 class="section-title">
                                Changes to This Cookie Policy
                            </h2>
                            <p class="section-content">
                                We may update this Cookie Policy from time to
                                time to reflect changes in our practices or for
                                other operational, legal, or regulatory reasons.
                                Any updates will be posted on this page with an
                                updated effective date. We encourage you to
                                review this policy periodically to stay informed
                                about how we use cookies.
                            </p>
                        </div>

                        <!-- Contact Information -->
                        <div class="contact-section">
                            <h3 class="contact-title">
                                Questions About Our Cookie Policy?
                            </h3>
                            <p class="contact-text">
                                If you have any questions about how we use
                                cookies or your privacy choices, please don't
                                hesitate to contact us.
                            </p>
                            <a href="/contact" class="contact-link">
                                Contact Our Team
                            </a>
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
};
</script>
