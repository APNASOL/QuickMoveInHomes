<style scoped>
/* About Page Styles */
.about-hero-section {
    background: linear-gradient(
        135deg,
        rgba(26, 54, 93, 0.85) 0%,
        rgba(45, 55, 72, 0.75) 100%
    );
    padding: 4rem 0;
    position: relative;
    overflow: hidden;
}

.about-hero-section::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 1px;
    background: linear-gradient(90deg, transparent, #e2e8f0, transparent);
}

.hero-content {
    display: flex;
    align-items: center;
    gap: 4rem;
}

.profile-image-container {
    flex: 0 0 300px;
    position: relative;
}

.profile-image {
    width: 300px;
    height: 300px;
    border-radius: 20px;
    overflow: hidden;
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
    position: relative;
}

.profile-image::before {
    content: '';
    position: absolute;
    top: -10px;
    left: -10px;
    right: -10px;
    bottom: -10px;
    background: linear-gradient(135deg, #e53e3e, #1a365d);
    border-radius: 25px;
    z-index: -1;
    opacity: 0.1;
}

.profile-image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.5s ease;
}

.profile-image:hover img {
    transform: scale(1.05);
}

.profile-details {
    flex: 1;
}

.profile-name {
    font-size: 3rem;
    font-weight: 700;
    background: white;
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    margin-bottom: 1rem;
    line-height: 1.1;
}

.profile-tagline {
    font-size: 1.4rem;
    color: white;
    font-weight: 600;
    margin-bottom: 1.5rem;
    line-height: 1.4;
}

.profile-description {
    font-size: 1.1rem;
    color: white;
    line-height: 1.7;
    margin-bottom: 2rem;
}

.expertise-badges {
    display: flex;
    flex-wrap: wrap;
    gap: 0.75rem;
    margin-bottom: 2rem;
}

.expertise-badge {
    background: linear-gradient(
  to right,
  hsl(213 71% 45%),  /* lighter */
  hsl(213 71% 30%)   /* darker */
);
    color: white;
    padding: 0.5rem 1rem;
    border-radius: 20px;
    font-size: 0.85rem;
    font-weight: 600;
    transition: all 0.3s ease;
}

.expertise-badge:hover {
    transform: translateY(-2px);
    box-shadow: 0 5px 15px hsl(213 71% 45%);
}

.languages {
    font-size: 1rem;
    color: white;
    font-weight: 500;
}

.languages strong {
    color: hsl(213 71% 20%);
}

/* Professional Background Section */
.professional-background {
    background: white;
    padding: 5rem 0;
    position: relative;
}

.section-title {
    font-size: 2.5rem;
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

.background-content {
    font-size: 1.1rem;
    color: #64748b;
    line-height: 1.8;
    max-width: 800px;
}

/* Team Section */
.team-section {
    background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);
    padding: 5rem 0;
    position: relative;
}

.team-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 2rem;
    margin-top: 3rem;
}

.team-member-card {
    background: white;
    border-radius: 20px;
    padding: 2rem;
    text-align: center;
    transition: all 0.3s ease;
    border: 1px solid #f1f5f9;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
}

.team-member-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
    border-color: hsl(213 71% 45%);
}

.team-member-image {
    width: 120px;
    height: 120px;
    border-radius: 50%;
    overflow: hidden;
    margin: 0 auto 1.5rem;
    border: 4px solid #f1f5f9;
    transition: all 0.3s ease;
}

.team-member-card:hover .team-member-image {
    border-color: hsl(213 71% 30%);
    transform: scale(1.1);
}

.team-member-image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.team-member-name {
    font-size: 1.3rem;
    font-weight: 700;
    color: #1a365d;
    margin-bottom: 0.5rem;
}

.team-member-position {
    font-size: 1rem;
    color: hsl(213 71% 45%);
    font-weight: 600;
    margin-bottom: 1rem;
}

.team-member-bio {
    font-size: 0.9rem;
    color: #64748b;
    line-height: 1.5;
    margin-bottom: 1.5rem;
}

.team-member-actions {
    display: flex;
    justify-content: center;
    gap: 0.75rem;
    flex-wrap: wrap;
}

.team-btn {
    padding: 0.5rem 1rem;
    border-radius: 20px;
    font-size: 0.85rem;
    font-weight: 600;
    text-decoration: none;
    transition: all 0.3s ease;
    border: 2px solid transparent;
}

.btn-linkedin {
    background: linear-gradient(135deg, #0077b5, #005885);
    color: white;
}

.btn-linkedin:hover {
    background: linear-gradient(135deg, #005885, #004670);
    transform: translateY(-2px);
    color: white;
}

.btn-contact {
    background: transparent;
    border-color: #64748b;
    color: #64748b;
}

.btn-contact:hover {
    border-color: hsl(213 71% 30%);
    background: hsl(213 71% 45%);
    color: white;
    transform: translateY(-2px);
}

/* Decorative Elements */
.section-decoration {
    position: absolute;
    width: 200px;
    height: 200px;
    background: linear-gradient(135deg, rgba(229, 62, 62, 0.1), rgba(26, 54, 93, 0.1));
    border-radius: 50%;
    filter: blur(40px);
    z-index: 0;
}

.decoration-1 {
    top: -50px;
    right: -50px;
}

.decoration-2 {
    bottom: -50px;
    left: -50px;
}

/* Responsive Design */
@media (max-width: 992px) {
    .hero-content {
        flex-direction: column;
        text-align: center;
        gap: 2rem;
    }

    .profile-image-container {
        flex: none;
    }

    .profile-name {
        font-size: 2.5rem;
    }

    .expertise-badges {
        justify-content: center;
    }
}

@media (max-width: 768px) {
    .about-hero-section,
    .professional-background,
    .team-section {
        padding: 3rem 0;
    }

    .profile-name {
        font-size: 2rem;
    }

    .profile-tagline {
        font-size: 1.2rem;
    }

    .section-title {
        font-size: 2rem;
    }

    .team-grid {
        grid-template-columns: 1fr;
        gap: 1.5rem;
    }

    .team-member-card {
        padding: 1.5rem;
    }
}

@media (max-width: 576px) {
    .profile-name {
        font-size: 1.8rem;
    }

    .profile-image {
        width: 250px;
        height: 250px;
    }

    .team-member-actions {
        flex-direction: column;
        align-items: center;
    }

    .team-btn {
        width: 100%;
        max-width: 200px;
    }
}
</style>

<template>
    <Master>
        <!-- Hero Section -->
        <section class="about-hero-section">
            <div class="container position-relative" style="z-index: 1;">
                <div class="hero-content">
                    <!-- Profile Image -->
                    <div class="profile-image-container">
                        <div class="profile-image">
                            <img
                                src="/images/about-1.jpg"
                                alt="Yvonne Khoo"
                            />
                        </div>
                    </div>

                    <!-- Profile Details -->
                    <div class="profile-details">
                        <h1 class="profile-name">Yvonne Khoo</h1>
                        <h2 class="profile-tagline">
                            Real Estate Professional | eXp Realty Las Vegas
                        </h2>
                        <p class="profile-description">
                            A seasoned real estate professional with over 19 years
                            of experience, currently affiliated with eXp Realty in
                            Las Vegas, Nevada. Yvonne specializes in assisting
                            first-time homebuyers, investors seeking cash flow
                            opportunities, and clients navigating short sales.
                        </p>

                        <!-- Expertise Badges -->
                        <div class="expertise-badges">
                            <span class="expertise-badge">New Construction Homes</span>
                            <span class="expertise-badge">Investment Properties</span>
                            <span class="expertise-badge">First-Time Homebuyers</span>
                            <span class="expertise-badge">Short Sales</span>
                        </div>

                        <!-- Languages -->
                        <p class="languages">
                            <strong>Languages:</strong> English, Mandarin, Cantonese, Malay, and Spanish
                        </p>
                    </div>
                </div>
            </div>

            <!-- Decorative Elements -->
            <div class="section-decoration decoration-1"></div>
            <div class="section-decoration decoration-2"></div>
        </section>

        <!-- Professional Background -->
        <section class="professional-background">
            <div class="container">
                <h1 class="section-title">Professional Background</h1>
                <div class="background-content">
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
        </section>

        <!-- Meet Our Team -->
        <section class="team-section">
            <div class="container position-relative" style="z-index: 1;">
                <h1 class="section-title text-center">Meet Our Team</h1>
                <div class="team-grid">
                    <div
                        class="team-member-card"
                        v-for="member in team"
                        :key="member.id"
                    >
                        <div class="team-member-image">
                            <img
                                :src="member.image"
                                :alt="member.name"
                            />
                        </div>
                        <h3 class="team-member-name">{{ member.name }}</h3>
                        <p class="team-member-position">{{ member.position }}</p>
                        <p class="team-member-bio">{{ member.bio }}</p>

                        <!-- Contact buttons -->
                        <div class="team-member-actions">
                            <a
                                v-if="member.linkedin"
                                :href="member.linkedin"
                                target="_blank"
                                class="team-btn btn-linkedin"
                            >
                                <i class="bi bi-linkedin me-1"></i> LinkedIn
                            </a>
                            <a
                                v-if="member.email"
                                :href="'mailto:' + member.email"
                                class="team-btn btn-contact"
                            >
                                <i class="bi bi-envelope me-1"></i> Contact
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Decorative Elements -->
            <div class="section-decoration decoration-1"></div>
            <div class="section-decoration decoration-2"></div>
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
