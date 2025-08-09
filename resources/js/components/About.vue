<template>
    <Master>
        <section class="container p-3 bg-white">
            <!-- Hero Section -->
            <div class="row align-items-center p-3">
                <!-- Profile Image -->
                <div class="col-md-4 text-center">
                    <div class="profile-image">
                        <img
                            src="/images/about-1.jpg"
                            alt="Yvonne Khoo"
                            class="img-fluid"
                        />
                    </div>
                </div>

                <!-- Profile Details -->
                <div class="col-md-8">
                    <h1 class="uppercase c-main-title">Yvonne Khoo</h1>
                    <h4 class="c-tags">
                        Real Estate Professional | eXp Realty Las Vegas
                    </h4>
                    <p class="c-info">
                        A seasoned real estate professional with over 19 years
                        of experience, currently affiliated with eXp Realty in
                        Las Vegas, Nevada. Yvonne specializes in assisting
                        first-time homebuyers, investors seeking cash flow
                        opportunities, and clients navigating short sales.
                    </p>

                    <!-- Expertise Badges -->
                    <div class="badge-container mt-3">
                        <span class="badge">New Construction Homes</span>
                        <span class="badge">Investment Properties</span>
                        <span class="badge">First-Time Homebuyers</span>
                        <span class="badge">Short Sales</span>
                    </div>

                    <!-- Languages -->
                    <p class="languages c-info">
                        Languages: English, Mandarin, Cantonese, Malay, and
                        Spanish
                    </p>
                </div>
            </div>
        </section>

        <!-- Our Story -->
        <section class="p-3">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-12">
                        <h1 class="profile-name">Professional Background</h1>
                        Yvonne's extensive experience includes working with both
                        new and resale homes, guiding clients through the
                        complexities of the real estate market. She has a
                        background in building houses and collaborating with
                        architectural engineers, providing her with in-depth
                        knowledge of construction costs and services. Her
                        expertise covers various property types, such as
                        single-family homes, condos, and investment properties,
                        across Las Vegas, North Las Vegas, and Henderson.
                    </div>
                </div>
            </div>
        </section>

        <!-- Meet Our Team -->
        <section class="p-3 bg-white">
    <div class="container">
        <h1 class="profile-name py-3">Meet Our Team</h1>
        <div class="row text-center mt-3">
            <div
                class="col-md-4 team-member mb-4"
                v-for="member in team"
                :key="member.id"
            >
                <img
                    :src="member.image"
                    alt="Team Member"
                    class="rounded-circle mb-3"
                    width="150"
                    height="150"
                />
                <h5 class="mt-2">{{ member.name }}</h5>
                <p class="text-muted mb-1">{{ member.position }}</p>

                <!-- Optional bio -->
                <p class="small text-secondary">{{ member.bio }}</p>

                <!-- Contact buttons -->
                <div>
                    <a
                        v-if="member.linkedin"
                        :href="member.linkedin"
                        target="_blank"
                        class="btn btn-sm btn-outline-primary rounded-pill me-2"
                    >
                        <i class="bi bi-linkedin"></i> LinkedIn
                    </a>
                    <a
                        v-if="member.email"
                        :href="'mailto:' + member.email"
                        class="btn btn-sm btn-outline-secondary rounded-pill"
                    >
                        <i class="bi bi-envelope"></i> Contact
                    </a>
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
            team: [
                {
                    id: 1,
                    name: "Yvonne Khoo",
                    position: "CEO & Founder",
                    image: "/images/about-1.jpg",
                    bio: "Passionate about real estate and client success for over 15 years.",
                    linkedin: "https://www.linkedin.com/in/yvonnekhoo",
                    email: "yvonne@example.com"
                },
                {
                    id: 2,
                    name: "Alex Chun",
                    position: "Chief Operations Officer",
                    image: "/images/about-2.jpg",
                    bio: "Expert in operations management and strategic planning.",
                    linkedin: "https://www.linkedin.com/in/alexchun",
                    email: "alex@example.com"
                },
                {
                    id: 3,
                    name: "Naeem Sheheryar",
                    position: "Director of Sales",
                    image: "/images/about-3.jpg",
                    bio: "Leading sales with a focus on customer satisfaction.",
                    linkedin: "https://www.linkedin.com/in/naeem-sheheryar",
                    email: "naeem@example.com"
                },
                {
                    id: 4,
                    name: "Syed Umar Abrar",
                    position: "Digital Marketing & Data Analyst",
                    image: "/images/about-5.jpg",
                    bio: "Driven by data, delivering impactful marketing campaigns.",
                    linkedin: "https://www.linkedin.com/in/syedumarabrar",
                    email: "umar@example.com"
                },
                {
                    id: 5,
                    name: "Abigail William",
                    position: "Product Manager",
                    image: "/images/about-6.jpg",
                    bio: "Ensuring products meet market needs with innovative solutions.",
                    linkedin: "https://www.linkedin.com/in/abigailwilliam",
                    email: "abigail@example.com"
                },
                {
                    id: 6,
                    name: "Benjamin Elijah",
                    position: "Web Developer",
                    image: "/images/about-4.jpg",
                    bio: "Building user-friendly and high-performing websites.",
                    linkedin: "https://www.linkedin.com/in/benjaminelijah",
                    email: "benjamin@example.com"
                },
            ],
        };
    },
};

</script>

<style scoped>
.section-title {
    font-size: 32px;
    font-weight: bold;
    color: #3d668f;
    margin-bottom: 20px;
}

.contact-info {
    font-size: 16px;
    margin-bottom: 15px;
}

.btn {
    margin: 5px;
}

.team-member img {
    border-radius: 50%;
    object-fit: cover;
}
</style>
<style scoped>
.profile-image {
    width: 200px;
    height: 200px;
    overflow: hidden;
    border-radius: 50% 0 0 50%;
    display: flex;
    justify-content: center;
    align-items: flex-end;
    background-color: #f4f4f4;
}
.profile-image img {
    width: 100%;
    height: auto;
}
.profile-name {
    font-family: "Playfair Display", serif !important;
    font-size: 32px;
    font-weight: bold;
    color: #2c3e50;
}
.profile-description {
    font-size: 16px;
    color: #555;
    margin-bottom: 15px;
}
.badge-container {
    display: flex;
    gap: 10px;
    flex-wrap: wrap;
    margin-bottom: 10px;
}
.badge {
    background: #e3efff;
    color: #777;
    padding: 8px 12px;
    border-radius: 20px;
    font-size: 14px;
    font-weight: bold;
}
.languages {
    font-size: 14px;
    color: #777;
    margin-top: 10px;
}
.c-tags {
    font-family: Inter, sans-serif;
    font-size: 20px;
    font-weight: 400;
    line-height: 28px;
    color: rgb(61, 102, 143);
}
.c-info {
    font-family: Inter, sans-serif;
    font-size: 16px;
    font-weight: 400;
    line-height: 24px;
    color: rgb(23, 38, 54);
}
</style>
