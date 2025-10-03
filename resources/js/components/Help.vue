<style scoped>
/* Help Center Styles */
.help-hero-section {
    background: linear-gradient(
        135deg,
        rgba(26, 54, 93, 0.85) 0%,
        rgba(45, 55, 72, 0.75) 100%
    );
    padding: 4rem 0;
    position: relative;
    overflow: hidden;
}

.help-hero-section::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 1px;
    background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
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
    text-transform: uppercase;
    letter-spacing: 1px;
}

.page-subtitle {
    font-size: 1.3rem;
    color: rgba(255, 255, 255, 0.8);
    line-height: 1.6;
    margin: 0 auto;
}

/* Help Content Section */
.help-content-section {
    padding: 5rem 0;
    background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);
}

.help-content-card {
    background: white;
    border-radius: 24px;
    padding: 3rem;
    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.08);
    border: 1px solid #f1f5f9;
}

.welcome-section {
    margin-bottom: 3rem;
}

.welcome-title {
    font-size: 1.8rem;
    font-weight: 700;
    color: #1a365d;
    margin-bottom: 1.5rem;
    position: relative;
}

.welcome-title::after {
    content: '';
    position: absolute;
    bottom: -8px;
    left: 0;
    width: 50px;
    height: 3px;
    background: linear-gradient(
  to right,
  hsl(213 71% 45%),  /* lighter */
  hsl(213 71% 30%)   /* darker */
);
    border-radius: 2px;
}

.help-info {
    font-size: 1.1rem;
    line-height: 1.7;
    color: #64748b;
    margin-bottom: 1.5rem;
    padding-left: 1.5rem;
    border-left: 3px solid #e2e8f0;
}

.help-info strong {
    color: #1a365d;
    font-weight: 600;
}

/* Guidelines Section */
.guidelines-section {
    margin: 3rem 0;
}

.guideline-item {
    background: #f8fafc;
    border-radius: 16px;
    padding: 2rem;
    margin-bottom: 1.5rem;
    border: 1px solid #e2e8f0;
    transition: all 0.3s ease;
}

.guideline-item:hover {
    border-color: hsl(213 71% 45%);
    transform: translateX(5px);
}

.guideline-icon {
    width: 48px;
    height: 48px;
    background: linear-gradient(
  to right,
  hsl(213 71% 45%),  /* lighter */
  hsl(213 71% 30%)   /* darker */
);
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 1rem;
    color: white;
    font-size: 1.5rem;
}

.guideline-title {
    font-size: 1.2rem;
    font-weight: 600;
    color: #1a365d;
    margin-bottom: 0.5rem;
}

.guideline-text {
    color: #64748b;
    line-height: 1.6;
    margin: 0;
}

/* FAQ Section */
.faq-section {
    margin-top: 4rem;
}

.section-title {
    font-size: 2.2rem;
    font-weight: 700;
    color: #1a365d;
    margin-bottom: 2rem;
    position: relative;
}

.section-title::after {
    content: '';
    position: absolute;
    bottom: -10px;
    left: 0;
    width: 60px;
    height: 4px;
    background: linear-gradient(
  to right,
  hsl(213 71% 45%),  /* lighter */
  hsl(213 71% 30%)   /* darker */
);
    border-radius: 2px;
}

/* Search and Filters */
.search-controls {
    background: white;
    border-radius: 16px;
    padding: 2rem;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
    border: 1px solid #f1f5f9;
    margin-bottom: 2rem;
}

.search-input {
    border: 2px solid #e2e8f0;
    border-radius: 12px;
    padding: 1rem 1.5rem;
    font-size: 1rem;
    transition: all 0.3s ease;
    background: #fafafa;
}

.search-input:focus {
    border-color: hsl(213 71% 45%);
    box-shadow: 0 0 0 3px hsl(213 71% 75%);
    background: white;
    outline: none;
}

.remote-toggle {
    display: flex;
    align-items: center;
    gap: 0.75rem;
    padding: 1rem;
    background: #f8fafc;
    border-radius: 12px;
    border: 1px solid #e2e8f0;
}

.form-check-input {
    width: 1.2em;
    height: 1.2em;
    border: 2px solid #cbd5e0;
}

.form-check-input:checked {
    background-color: hsl(213 71% 45%);
    border-color: hsl(213 71% 45%);
}

.form-check-label {
    font-weight: 500;
    color: #374151;
    cursor: pointer;
}

.results-meta {
    color: #64748b;
    font-size: 0.9rem;
    margin-bottom: 1rem;
}

/* Accordion Styles */
.faq-accordion {
    background: transparent;
}

.accordion-item {
    background: white;
    border: 1px solid #e2e8f0;
    border-radius: 12px !important;
    margin-bottom: 1rem;
    overflow: hidden;
    transition: all 0.3s ease;
}

.accordion-item:hover {
    border-color: hsl(213 71% 45%);
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
}

.accordion-button {
    background: white !important;
    border: none !important;
    padding: 1.5rem !important;
    font-weight: 600;
    color: #1a365d !important;
    font-size: 1.1rem;
    transition: all 0.3s ease;
}

.accordion-button:not(.collapsed) {
    background: #f8fafc !important;
    box-shadow: none !important;
}

.accordion-button::after {
    background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%231a365d'%3e%3cpath fill-rule='evenodd' d='M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z'/%3e%3c/svg%3e");
}

.accordion-button:not(.collapsed)::after {
    background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%23e53e3e'%3e%3cpath fill-rule='evenodd' d='M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z'/%3e%3c/svg%3e");
}

.faq-badge {
    background: linear-gradient(
  to right,
  hsl(213 71% 45%),  /* lighter */
  hsl(213 71% 30%)   /* darker */
);
    color: white;
    padding: 0.25rem 0.75rem;
    border-radius: 20px;
    font-size: 0.75rem;
    font-weight: 500;
    margin-left: 0.75rem;
}

.accordion-body {
    padding: 1.5rem !important;
    background: #fafbfc;
}

.faq-answer {
    color: #64748b;
    line-height: 1.6;
    margin-bottom: 1.5rem;
}

.remote-tips {
    background: linear-gradient(135deg, #fff7ed, #fed7aa);
    border-radius: 12px;
    padding: 1.5rem;
    margin: 1.5rem 0;
    border-left: 4px solid #ea580c;
}

.remote-tips-title {
    font-weight: 600;
    color: #9a3412;
    margin-bottom: 0.75rem;
    font-size: 0.9rem;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.remote-tips-list {
    list-style: none;
    padding: 0;
    margin: 0;
}

.remote-tips-list li {
    padding: 0.5rem 0;
    color: #7c2d12;
    line-height: 1.5;
    position: relative;
    padding-left: 1.5rem;
}

.remote-tips-list li::before {
    content: '💡';
    position: absolute;
    left: 0;
}

.faq-cta {
    background: linear-gradient(135deg, #1a365d, #2d3748);
    color: white;
    padding: 0.75rem 1.5rem;
    border-radius: 12px;
    text-decoration: none;
    font-weight: 600;
    display: inline-block;
    transition: all 0.3s ease;
    border: none;
}

.faq-cta:hover {
    background: linear-gradient(135deg, #2d3748, #1a365d);
    transform: translateY(-2px);
    box-shadow: 0 8px 20px rgba(26, 54, 93, 0.3);
    color: white;
    text-decoration: none;
}

/* Empty State */
.empty-state {
    text-align: center;
    padding: 3rem 2rem;
    background: white;
    border-radius: 16px;
    border: 2px dashed #e2e8f0;
}

.empty-state-icon {
    font-size: 3rem;
    color: #cbd5e0;
    margin-bottom: 1rem;
}

.empty-state-text {
    color: #64748b;
    font-size: 1.1rem;
    margin: 0;
}

/* Decorative Elements */
.section-decoration {
    position: absolute;
    width: 150px;
    height: 150px;
    background: linear-gradient(135deg, rgba(229, 62, 62, 0.1), rgba(255, 255, 255, 0.05));
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
    .help-hero-section {
        padding: 3rem 0;
    }

    .page-title {
        font-size: 2.2rem;
    }

    .page-subtitle {
        font-size: 1.1rem;
    }

    .help-content-section {
        padding: 3rem 0;
    }

    .help-content-card {
        padding: 2rem;
        border-radius: 20px;
    }

    .section-title {
        font-size: 1.8rem;
    }

    .search-controls {
        padding: 1.5rem;
    }

    .accordion-button {
        padding: 1.25rem !important;
        font-size: 1rem;
    }

    .accordion-body {
        padding: 1.25rem !important;
    }
}

@media (max-width: 576px) {
    .page-title {
        font-size: 1.8rem;
    }

    .help-content-card {
        padding: 1.5rem;
    }

    .guideline-item {
        padding: 1.5rem;
    }

    .search-input {
        padding: 0.875rem 1.25rem;
    }
}
</style>

<template>
    <Master>
        <!-- Hero Section -->
        <section class="help-hero-section">
            <div class="container position-relative" style="z-index: 1;">
                <div class="hero-content">
                    <h1 class="page-title">Help Center</h1>
                    <p class="page-subtitle">
                        Brand New Homes Vegas, we prioritize your satisfaction
                        and safety when viewing properties
                    </p>
                </div>
            </div>

            <!-- Decorative Elements -->
            <div class="section-decoration decoration-1"></div>
            <div class="section-decoration decoration-2"></div>
        </section>

        <!-- Help Content Section -->
        <section class="help-content-section">
            <div class="container">
                <div class="help-content-card">
                    <!-- Welcome Section -->
                    <div class="welcome-section">
                        <h2 class="welcome-title">Welcome to Our Help Center</h2>
                        <p class="help-info">
                            Welcome to <strong>Brand New Homes Vegas</strong>! We're
                            here to assist you with any inquiries about our services,
                            properties, or the home buying process.
                        </p>
                    </div>

                    <!-- Guidelines Section -->
                    <div class="guidelines-section">
                        <div class="guideline-item">
                            <div class="guideline-icon">
                                <i class="bi bi-eye"></i>
                            </div>
                            <h3 class="guideline-title">Property Viewing Guidelines</h3>
                            <p class="guideline-text">
                                Our team is committed to ensuring your comfort and safety when viewing
                                properties. Your agent will guide you through the process and answer any questions you may have.
                            </p>
                        </div>

                        <div class="guideline-item">
                            <div class="guideline-icon">
                                <i class="bi bi-telephone"></i>
                            </div>
                            <h3 class="guideline-title">Contacting Agents and Administration</h3>
                            <p class="guideline-text">
                                Need help? Your agent is your main point of contact for property
                                viewings. For general inquiries, our administration team is ready to assist.
                            </p>
                        </div>

                        <div class="guideline-item">
                            <div class="guideline-icon">
                                <i class="bi bi-file-text"></i>
                            </div>
                            <h3 class="guideline-title">Agreement Terms and Conditions</h3>
                            <p class="guideline-text">
                                Please review any agreement details carefully to understand
                                responsibilities and steps for moving forward.
                            </p>
                        </div>
                    </div>

                    <!-- FAQ Section -->
                    <div class="faq-section">
                        <h2 class="section-title">Frequently Asked Questions</h2>

                        <!-- Search and Filters -->
                        <div class="search-controls">
                            <div class="row g-3 align-items-center">
                                <div class="col-md-8">
                                    <input
                                        type="search"
                                        v-model.trim="faqSearch"
                                        class="form-control search-input"
                                        placeholder="Search FAQs (e.g., remote tour, agent, renew, Henderson)…"
                                    />
                                </div>
                                <div class="col-md-4">
                                    <div class="remote-toggle">
                                        <input
                                            class="form-check-input"
                                            type="checkbox"
                                            id="remoteMode"
                                            v-model="remoteMode"
                                        />
                                        <label class="form-check-label" for="remoteMode">
                                            Add tips for remote buyers
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <!-- Results Meta -->
                            <div class="results-meta mt-2">
                                Showing {{ filteredFaqs.length }} result(s)
                                <span v-if="faqSearch">for "{{ faqSearch }}"</span>
                            </div>
                        </div>

                        <!-- FAQ Accordion -->
                        <div class="accordion faq-accordion" id="faqAccordion">
                            <div
                                class="accordion-item"
                                v-for="(item, idx) in filteredFaqs"
                                :key="item.id"
                            >
                                <h2 class="accordion-header" :id="'faq-h-' + item.id">
                                    <button
                                        class="accordion-button collapsed"
                                        type="button"
                                        data-bs-toggle="collapse"
                                        :data-bs-target="'#faq-c-' + item.id"
                                        aria-expanded="false"
                                        :aria-controls="'faq-c-' + item.id"
                                    >
                                        {{ item.q }}
                                        <span class="faq-badge" v-if="item.tags?.length">
                                            {{ item.tags.join(" · ") }}
                                        </span>
                                    </button>
                                </h2>

                                <div
                                    class="accordion-collapse collapse"
                                    :id="'faq-c-' + item.id"
                                    :aria-labelledby="'faq-h-' + item.id"
                                    data-bs-parent="#faqAccordion"
                                >
                                    <div class="accordion-body">
                                        <p class="faq-answer">{{ item.a }}</p>

                                        <!-- Remote Buyer Tips -->
                                        <div v-if="remoteMode && item.remoteTips?.length" class="remote-tips">
                                            <div class="remote-tips-title">Remote Buyer Tips</div>
                                            <ul class="remote-tips-list">
                                                <li v-for="(tip, tIdx) in item.remoteTips" :key="tIdx">
                                                    {{ tip }}
                                                </li>
                                            </ul>
                                        </div>

                                        <!-- CTA -->
                                        <div class="mt-3">
                                            <a href="/contact" class="faq-cta">
                                                Contact Administration
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Empty State -->
                            <div v-if="!filteredFaqs.length" class="empty-state">
                                <div class="empty-state-icon">
                                    <i class="bi bi-search"></i>
                                </div>
                                <p class="empty-state-text">
                                    No results found. Try different keywords like "virtual tour", "renew", or "agent".
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </Master>
</template>

<script>
import Master from "@components/layout/Master.vue";

export default {
    components: { Master },
    data() {
        return {
            logo: external_website.logo,
            name: external_website.name,
            website_address: "",
            website_phone: "",

            // FAQ state
            faqSearch: "",
            remoteMode: false,
            faqs: [
                {
                    id: 1,
                    q: "How many properties can I view with one agreement?",
                    a: "The number of viewings depends on your initial agreement. Your agent will confirm the exact count and any limits.",
                    tags: ["agreement", "viewings", "limits"],
                    remoteTips: [
                        "Ask your agent for a recorded walkthrough of additional homes if your in‑person quota is limited.",
                        "Request floorplans and neighborhood videos to shortlist before traveling.",
                    ],
                },
                {
                    id: 2,
                    q: "What happens when my viewing permission expires?",
                    a: "Contact our administration team to renew. We'll verify your agreement and extend access as appropriate.",
                    tags: ["renew", "permission", "admin"],
                    remoteTips: [
                        "Plan renewals 3–5 days ahead to keep virtual tours on schedule across time zones.",
                        "Use e‑signature to avoid delays in paperwork.",
                    ],
                },
                {
                    id: 3,
                    q: "Can I change my agent if needed?",
                    a: "Yes. We can reassign an agent to better meet your needs—reach out to support to start the process.",
                    tags: ["agent", "support", "reassign"],
                    remoteTips: [
                        "If you're remote, request agents who offer live video tours and quick response in your time zone.",
                        "Share your shortlisting criteria (budget, commute, schools) upfront to speed up the match.",
                    ],
                },
                {
                    id: 4,
                    q: "Do you support virtual or remote tours?",
                    a: "Absolutely. We offer live video tours, recorded walkthroughs, and high‑resolution media so you can evaluate homes remotely.",
                    tags: ["remote", "virtual tour", "buyers"],
                    remoteTips: [
                        "Ask for a live call that covers exterior, street noise, cell coverage, and daylight in each room.",
                        "Request utility bills and HOA docs to review remotely.",
                    ],
                },
                {
                    id: 5,
                    q: "Which areas do you serve in Las Vegas?",
                    a: "We cover Las Vegas, North Las Vegas, Henderson, and surrounding communities. Your agent can tailor a shortlist to your preferences.",
                    tags: ["areas", "Henderson", "North Las Vegas"],
                    remoteTips: [
                        "Use a map call to compare commute times and nearby amenities before booking travel.",
                        "Ask for neighborhood sound/traffic checks during live tours.",
                    ],
                },
            ],
        };
    },
    computed: {
        filteredFaqs() {
            if (!this.faqSearch) return this.faqs;

            const q = this.faqSearch.toLowerCase();
            return this.faqs.filter((item) => {
                const haystack = [
                    item.q,
                    item.a,
                    ...(item.tags || []),
                    ...(this.remoteMode ? item.remoteTips || [] : []),
                ]
                    .join(" ")
                    .toLowerCase();

                return haystack.includes(q);
            });
        },
    },
    methods: {
        setAltImg(event) {
            event.target.src = "/images/default_image.png";
        },
    },
};
</script>
