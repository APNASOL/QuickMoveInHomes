<template>
    <Master>
        <!-- Hero Section -->
        <section class="p-3 bg-white">
            <div class="row align-items-center p-3">
                <div class="col-md-12 text-center">
                    <h1 class="uppercase c-main-title">Help Center</h1>
                    <h4 class="c-tags">
                        Brand New Homes Vegas, we prioritize your satisfaction and safety when viewing properties
                    </h4>
                </div>
            </div>
        </section>

        <!-- Help Content Section -->
        <section class="container mt-3">
            <div class="help-content p-5 shadow rounded-4 mb-5 bg-white">
                <p class="help-info">
                    Welcome to <strong>Brand New Homes Vegas</strong>! Here’s an important reminder: when you sign an agreement with an agent,
                    <strong>you’ll have limited permissions</strong> to visit a select number of homes. Once your viewing permission expires,
                    you’ll need to <strong><a href="/contact">contact the administration</a></strong> to renew your access or for further inquiries.
                    Our agents will reach out to assist with any further arrangements.
                </p>

                <p class="help-info">
                    <strong>Property Viewing Guidelines:</strong> At Brand New Homes Vegas, we prioritize your satisfaction and safety when viewing properties.
                    Upon signing an agreement, you’ll be granted limited permissions. Our agents are here to guide you through renewals and any questions you may have.
                </p>

                <p class="help-info">
                    <strong>Contacting Agents and Administration:</strong> Need assistance? Your agent remains your primary point of contact for property viewings.
                    For renewals or general inquiries, please reach out to our administration team — they’re ready to assist.
                </p>

                <p class="help-info">
                    <strong>Agreement Terms and Conditions:</strong> When arranging viewings with Brand New Homes Vegas, your agreement defines your viewing permissions.
                    Be sure to review the responsibilities and renewal steps clearly outlined for your convenience.
                </p>

                <div class="faq mt-5">
                    <h2 class="c-main-title">Frequently Asked Questions</h2>
                    <ul class="faq-list mt-4">
                        <li>
                            <strong>How many properties can I view with one agreement?</strong><br/>
                            The number of viewings depends on your initial agreement. Contact your agent for more details.
                        </li>
                        <li>
                            <strong>What happens when my viewing permission expires?</strong><br/>
                            Reach out to our administration team — they’ll guide you through renewing your permission.
                        </li>
                        <li>
                            <strong>Can I change my agent if needed?</strong><br/>
                            Yes, we can reassign an agent to better meet your needs. Contact our support team for help.
                        </li>
                    </ul>
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
        data() {
            return {
                logo: external_website.logo,
                name: external_website.name,
                website_address: "",
                website_phone: "",
            };
        },
        methods: {
            setAltImg(event) {
                event.target.src = "/images/default_image.png";
            },
        },
    };
    </script>

    <style scoped>
   .hero-section {
    background-color: rgb(61, 102, 143) !important;
}

.hero-title {
    font-size: 3rem;
    font-weight: 700;
    text-transform: uppercase;
    font-family: 'Poppins', sans-serif;
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