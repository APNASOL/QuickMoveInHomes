<template>
    <Master>
        <div
            class="top-section"
            :style="{ backgroundImage: `url('/images/events-main.jpg')` }"
        >
            <div class="info-overlay">
                <div class="d-flex justify-content-center container">
                    <div>
                        <h2 class="title uppercase">Help</h2>
                    </div>
                </div>
            </div>
        </div>

        <section class="container mt-5">
            <!-- Hero Section -->
            <div class="row p-3">
                <div class="col-md-12">
                    <p class="help-info">
                        Welcome to Brand New Homes Vegas! Here’s an important
                        reminder: when you sign an agreement with an agent,
                        <b>
                            you’ll have limited permissions to visit a select
                            number of homes</b
                        >. Once your viewing permission expires, you’ll need to
                        <b
                            >contact the
                            <a href="/contact"> administration</a></b
                        >
                        to renew your access or for further inquiries. Our
                        agents will reach out to assist with any further
                        arrangements.
                    </p>
                    <p class="help-info">
                        Property Viewing Guidelines "At Brand New Homes Vegas, we
                        prioritize your satisfaction and safety when viewing
                        properties. Please note that upon signing an agreement
                        with one of our agents, you’ll be granted limited
                        permissions to view a select number of homes. Once this
                        permission expires, you will need to renew it through
                        our administration. Our agents are here to help guide
                        you through this process and answer any questions about
                        extending your viewing period."
                    </p>
                    <p class="help-info">
                        Contacting Agents and Administration "Have questions or
                        need support? Your dedicated agent is your primary point
                        of contact for arranging home viewings and handling
                        agreements. If your permission expires, or you’d like to
                        discuss new properties, please contact our
                        administrative team. They’re available to assist with
                        renewals and answer questions about property
                        availability and visit limitations."
                    </p>
                    <p class="help-info">
                        Agreement Terms and Conditions "When you engage with
                        Brand New Homes Vegas, an agreement is necessary to arrange
                        property viewings. This agreement defines your viewing
                        permissions and outlines the responsibilities of both
                        parties. Please review all terms carefully, including
                        the time limits on your viewings and the steps for
                        renewals. Our team is committed to transparency and is
                        available to answer any questions regarding your
                        agreement."
                    </p>
                    <p class="help-info">
                        Frequently Asked Questions (FAQs) How many properties
                        can I view with one agreement? "The number of viewings
                        is limited based on your initial agreement. Contact your
                        agent for details or to discuss additional options."
                        What happens when my viewing permission expires? "When
                        your viewing period expires, simply reach out to our
                        administration team. They’ll guide you through the
                        process to renew your permission." Can I change my agent
                        if needed? "Yes, in cases where a change is necessary,
                        we can reassign an agent to better meet your needs.
                        Contact our support team for assistance."
                    </p>
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
    created() {},
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
            event.target.src = "/images/default-home-image.png";
        },
    },
};
</script>
<style scoped>
html,
body {
    height: 100%;
}
.top-section {
    position: relative;
    height: 300px;
    background-size: cover;
    background-position: center;
    color: white;
    display: flex;
    justify-content: center;
    align-items: flex-end;
    width: 100%;
    overflow: hidden;
}

.uppercase {
    text-transform: uppercase;
}

.info-overlay {
    background: rgba(1, 6, 13, 0.8);
    padding: 20px;
    width: 100%;
    border-radius: 0px !important;
    display: flex;
    flex-direction: column;
    align-items: center;
}

h2,
h3,
h4,
h5 {
    font-family: "Raleway", sans-serif;
    color: #e58b15;
    line-height: 1.55rem;
    font-weight: bold;
}
.help-info {
    padding: 10px;
}
</style>
