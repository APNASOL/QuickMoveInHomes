<template>
    <Master>
        <!-- Hero Section -->
        <section class="p-3 bg-white">
            <div class="row align-items-center p-3">
                <div class="col-md-12 text-center">
                    <h1 class="uppercase c-main-title">Help Center</h1>
                    <h4 class="c-tags">
                        Brand New Homes Vegas, we prioritize your satisfaction
                        and safety when viewing properties
                    </h4>
                </div>
            </div>
        </section>

        <!-- Help Content Section -->
        <section class="container mt-3">
            <div class="help-content p-5 shadow rounded-4 mb-5 bg-white">
                <p class="help-info">
                    Welcome to <strong>Brand New Homes Vegas</strong>! We’re
                    here to assist you with any inquiries about our services,
                    properties, or the home buying process.
                </p>

                <p class="help-info">
                    <strong>Property Viewing Guidelines:</strong> Our team is
                    committed to ensuring your comfort and safety when viewing
                    properties. Your agent will guide you through the process
                    and answer any questions you may have.
                </p>

                <p class="help-info">
                    <strong>Contacting Agents and Administration:</strong> Need
                    help? Your agent is your main point of contact for property
                    viewings. For general inquiries, our administration team is
                    ready to assist.
                </p>

                <p class="help-info">
                    <strong>Agreement Terms and Conditions:</strong> Please
                    review any agreement details carefully to understand
                    responsibilities and steps for moving forward.
                </p>

                <div class="faq mt-5">
                    <h2 class="c-main-title">Frequently Asked Questions</h2>
                    <ul class="faq-list mt-4">
                        <li>
                            <strong
                                >How many properties can I view with one
                                agreement?</strong
                            ><br />
                            The number of viewings depends on your initial
                            agreement. Contact your agent for more details.
                        </li>
                        <li>
                            <strong
                                >What happens when my viewing permission
                                expires?</strong
                            ><br />
                            Reach out to our administration team — they’ll guide
                            you through renewing your permission.
                        </li>
                        <li>
                            <strong>Can I change my agent if needed?</strong
                            ><br />
                            Yes, we can reassign an agent to better meet your
                            needs. Contact our support team for help.
                        </li>
                    </ul>
                </div>

                <div class="faq mt-5">
                    <h2 class="c-main-title">Frequently Asked Questions</h2>

                    <!-- Search + Controls -->
                    <div class="row g-2 align-items-center mt-3">
                        <div class="col-md-8">
                            <input
                                type="search"
                                v-model.trim="faqSearch"
                                class="form-control form-control-lg"
                                placeholder="Search FAQs (e.g., remote tour, agent, renew, Henderson)…"
                            />
                        </div>
                        <div
                            class="col-md-4 d-flex gap-3 justify-content-md-end"
                        >
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="remoteMode"
                                    v-model="remoteMode"
                                />
                                <label
                                    class="form-check-label"
                                    for="remoteMode"
                                >
                                    Add tips for remote buyers
                                </label>
                            </div>
                        </div>
                    </div>

                    <!-- Result meta -->
                    <div class="mt-2 text-muted small">
                        Showing {{ filteredFaqs.length }} result(s)
                        <span v-if="faqSearch">for “{{ faqSearch }}”</span>
                    </div>

                    <!-- Accordion -->
                    <div class="accordion mt-3" id="faqAccordion">
                        <div
                            class="accordion-item"
                            v-for="(item, idx) in filteredFaqs"
                            :key="item.id"
                        >
                            <h2
                                class="accordion-header"
                                :id="'faq-h-' + item.id"
                            >
                                <button
                                    class="accordion-button collapsed"
                                    type="button"
                                    data-bs-toggle="collapse"
                                    :data-bs-target="'#faq-c-' + item.id"
                                    aria-expanded="false"
                                    :aria-controls="'faq-c-' + item.id"
                                >
                                    {{ item.q }}
                                    <span
                                        class="ms-2 badge bg-light text-dark"
                                        v-if="item.tags?.length"
                                    >
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
                                    <p class="mb-2">{{ item.a }}</p>

                                    <!-- Extra tips for remote buyers -->
                                    <div
                                        v-if="
                                            remoteMode &&
                                            item.remoteTips?.length
                                        "
                                        class="mt-3"
                                    >
                                        <div class="fw-semibold mb-1">
                                            Remote Buyer Tips
                                        </div>
                                        <ul class="mb-0">
                                            <li
                                                v-for="(
                                                    tip, tIdx
                                                ) in item.remoteTips"
                                                :key="tIdx"
                                            >
                                                {{ tip }}
                                            </li>
                                        </ul>
                                    </div>

                                    <!-- Optional CTA -->
                                    <div class="mt-3">
                                        <a
                                            href="/contact"
                                             
                                        >
                                            Contact Administration
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Empty state -->
                        <div
                            v-if="!filteredFaqs.length"
                            class="text-center text-muted py-4"
                        >
                            No results. Try different keywords like “virtual
                            tour”, “renew”, or “agent”.
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
                    a: "Contact our administration team to renew. We’ll verify your agreement and extend access as appropriate.",
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
                        "If you’re remote, request agents who offer live video tours and quick response in your time zone.",
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

<style scoped>
.accordion-button .badge {
    font-weight: 500;
}
.hero-section {
    background-color: rgb(61, 102, 143) !important;
}

.hero-title {
    font-size: 3rem;
    font-weight: 700;
    text-transform: uppercase;
    font-family: "Poppins", sans-serif;
    letter-spacing: 1.5px;
}

.hero-subtitle {
    font-size: 1.2rem;
    margin-top: 10px;
    font-weight: 400;
}

.help-content {
    background-color: #ffffff;
    border-radius: 16px;
    padding: 40px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
}

.help-info {
    font-size: 1.125rem;
    line-height: 1.8;
    color: #444;
    margin-bottom: 1.5rem;
}

.faq {
    margin-top: 40px;
}

.faq-list {
    list-style-type: none;
    padding: 0;
    margin-top: 20px;
}

.faq-list li {
    margin-bottom: 20px;
    font-size: 1.05rem;
    color: #555;
    line-height: 1.7;
}

a {
    color: rgb(61, 102, 143);
    text-decoration: underline;
    font-weight: 500;
}

a:hover {
    color: #274c73;
}

/* Responsive adjustments */
@media (max-width: 768px) {
    .hero-title {
        font-size: 2.2rem;
    }

    .help-content {
        padding: 25px;
    }
}
</style>
