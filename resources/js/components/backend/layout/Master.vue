<template>
    <div>
        <header
            class="navbar sticky-top flex-md-nowrap p-0 shadow bg-white"
            data-bs-theme="light"
        >
            <div
                class="d-flex justify-content-between align-items-center c-navbar-logo-box"
            >
                <a class="c-navbar-brand" href="/dashboard">
                    <img :src="black_logo" alt="" width="150" />
                </a>

                <button
                    class="btn border-0 pe-0"
                    type="button"
                    @click="toggleSidebar"
                >
                    <span class="navbar-toggler-icon"></span>
                </button>
            </div>
            <a
                class="nav-link nav-icon ms-3 c-theme-text-color"
                href="/"
                target="_blank"
                title="Browse Website"
            >
                <i class="bi bi-globe"></i>
            </a>

            <nav class="ms-auto c-theme-text-color">
                <ul class="d-flex align-items-center c-navbar-dropdown">
                    <li class="nav-item dropdown pe-3">
                        <a
                            class="nav-link dropdown-toggle"
                            href="#"
                            role="button"
                            data-bs-toggle="dropdown"
                            aria-expanded="false"
                        >
                            <img
                                :src="user_image ?? '/images/default_image.png'"
                                alt="Profile"
                                class="rounded-circle"
                                height="40px"
                                @error="setAltImg"
                            />
                            {{ user_name }}
                        </a>
                        <ul
                            class="dropdown-menu dropdown-menu-end dropdown-menu-arrow"
                        >
                            <!-- <li>
                                <a class="dropdown-item" href="#">Action</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="#"
                                    >Another action</a
                                >
                            </li>-->
                            <!-- <li><hr class="dropdown-divider" /></li>  -->

                            <li>
                                <a
                                    class="dropdown-item d-flex align-items-center"
                                    href="/profile-settings"
                                >
                                    <i class="bi bi-person me-2"></i>
                                    <span>{{
                                        translate("Profile settings")
                                    }}</span>
                                </a>
                            </li>
                            <li>
                                <a
                                    class="dropdown-item"
                                    href="#"
                                    @click="logOut"
                                    ><i class="bi bi-box-arrow-right me-2"></i
                                    >Log out</a
                                >
                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </header>

        <!-- <aside
            class="sidebar mt-3"
            :class="{ 'sidebar-toggle': isSidebarToggled }"
        >
            <ul class="sidebar-nav">
              
                <li class="nav-item">
                    <a
                        class="nav-link"
                        :class="{ active: isActive('/dashboard') }"
                        href="/dashboard"
                    >
                        <i class="bi bi-speedometer2 me-2"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
 
                <li class="nav-item" v-if="user_role == 'admin'">
                    
                    <a
                        class="nav-link"
                        @click.prevent="toggleDropdown('properties-nav')"
                        href="#"
                    >
                        <i class="bi bi-building me-2"></i>
                        <span>Properties</span>
                        <i class="bi bi-chevron-down ms-5"></i>
                    </a>
                    <ul
                        id="properties-nav"
                        class="collapse nav-content"
                        :class="{ show: openDropdowns['properties-nav'] }"
                    >
                        <li>
                            <a
                                class="nav-link"
                                :class="{ active: isActive('/properties') }"
                                href="/properties"
                                ><i class="bi bi-file-earmark-text me-2"></i>
                                Properties</a
                            >
                        </li>
                        <li>
                            <a
                                class="nav-link"
                                :class="{
                                    active: isActive(
                                        '/scraped-properties-upload'
                                    ),
                                }"
                                href="/scraped-properties-upload"
                                ><i class="bi bi-upload me-2"></i> Scraped Data
                                Upload</a
                            >
                        </li>
                        <li>
                            <a
                                class="nav-link"
                                :class="{ active: isActive('/agents') }"
                                href="/agents"
                                ><i class="bi bi-person-check me-2"></i>
                                Agents</a
                            >
                        </li>
                        <li>
                            <a
                                class="nav-link"
                                :class="{ active: isActive('/homes') }"
                                href="/homes"
                                ><i class="bi bi-house-door me-2"></i> Quick
                                Move In</a
                            >
                        </li>
                    </ul>
                </li>
 
                <li class="nav-item" v-if="user_role == 'admin'">
                    <a
                        class="nav-link"
                        @click.prevent="toggleDropdown('communities-nav')"
                        href="#"
                    >
                        <i class="bi bi-person-heart me-2"></i>
                        <span>Communities</span>
                        <i class="bi bi-chevron-down ms-5"></i>
                    </a>
                    <ul
                        id="communities-nav"
                        class="collapse nav-content"
                        :class="{ show: openDropdowns['communities-nav'] }"
                    >
                        <li>
                            <a
                                class="nav-link"
                                :class="{ active: isActive('/communities') }"
                                href="/communities"
                                ><i class="bi bi-map me-2"></i> Communities</a
                            >
                        </li>
                        <li>
                            <a
                                class="nav-link"
                                :class="{
                                    active: isActive(
                                        '/scraped-communities-upload'
                                    ),
                                }"
                                href="/scraped-communities-upload"
                                ><i class="bi bi-upload me-2"></i> Scraped Data
                                Upload</a
                            >
                        </li>
                        <li>
                            <a
                                class="nav-link"
                                :class="{ active: isActive('/builders') }"
                                href="/builders"
                                ><i class="bi bi-tools me-2"></i> Builders</a
                            >
                        </li>
                    </ul>
                </li>

              
                <li v-if="user_role == 'admin'">
                    <a
                        class="nav-link"
                        :class="{
                            active: isActive('/customer-agreements'),
                        }"
                        href="/customer-agreements"
                        ><i class="bi bi-file-earmark-text me-2"></i> Connected
                        Customers</a
                    >
                </li>
 
                <li class="nav-item" v-if="user_role == 'admin'">
                    <a
                        class="nav-link"
                        @click.prevent="toggleDropdown('hoa-locations-nav')"
                        href="#"
                    >
                        <i class="bi bi-globe me-2"></i>
                        <span>Area & Associations</span>
                        <i class="bi bi-chevron-down ms-5"></i>
                    </a>

                    <ul
                        id="hoa-locations-nav"
                        class="collapse nav-content"
                        :class="{ show: openDropdowns['hoa-locations-nav'] }"
                    >
                        <li>
                            <a
                                class="nav-link"
                                :class="{ active: isActive('/home-owners') }"
                                href="/home-owners"
                                ><i class="bi bi-people me-2"></i> HOA</a
                            >
                        </li>
                        <li>
                            <a
                                class="nav-link"
                                :class="{ active: isActive('/amenities') }"
                                href="/amenities"
                                ><i class="bi bi-bag me-2"></i> Amenities</a
                            >
                        </li>
                        <li>
                            <a
                                class="nav-link"
                                :class="{ active: isActive('/regions') }"
                                href="/regions"
                                ><i class="bi bi-map me-2"></i> Regions</a
                            >
                        </li>
                        <li>
                            <a
                                class="nav-link"
                                :class="{ active: isActive('/schools') }"
                                href="/schools"
                                ><i class="bi bi-book me-2"></i> Schools</a
                            >
                        </li>
                        <li>
                            <a
                                class="nav-link"
                                :class="{ active: isActive('/neighborhoods') }"
                                href="/neighborhoods"
                                ><i class="bi bi-house-door me-2"></i>
                                Neighborhood</a
                            >
                        </li>
                    </ul>
                </li> 

                <li v-if="user_role == 'admin'">
                    <a
                        class="nav-link"
                        :class="{ active: isActive('/blogs/posts') }"
                        href="/blogs/posts"
                        ><i class="bi bi-journal me-2"></i> Blog Posts</a
                    >
                </li>
                <li v-if="user_role == 'admin'">
                    <a
                        class="nav-link"
                        :class="{ active: isActive('/events') }"
                        href="/events"
                        ><i class="bi bi-calendar-check me-2"></i> Events</a
                    >
                </li>
                <li v-if="user_role == 'admin'">
                    <a
                        class="nav-link"
                        :class="{ active: isActive('/incentives') }"
                        href="/incentives"
                        ><i class="bi bi-gift me-2"></i> Incentives</a
                    >
                </li> 

                <li class="nav-item" v-if="user_role == 'admin'">
                    <a
                        class="nav-link"
                        @click.prevent="toggleDropdown('settings-nav')"
                        href="#"
                    >
                        <i class="bi bi-gear me-2"></i>
                        <span>Settings</span>
                        <i class="bi bi-chevron-down ms-5"></i>
                    </a>
                    <ul
                        id="settings-nav"
                        class="collapse nav-content"
                        :class="{ show: openDropdowns['settings-nav'] }"
                    >
                        <li>
                            <a
                                class="nav-link"
                                :class="{ active: isActive('/our-promises') }"
                                href="/our-promises"
                                ><i class="bi bi-question-circle me-2"></i> Why
                                Choose</a
                            >
                        </li>
                        <li>
                            <a
                                class="nav-link"
                                :class="{
                                    active: isActive('/user-contacted-us'),
                                }"
                                href="/user-contacted-us"
                                ><i class="bi bi-person me-2"></i> User
                                Contact</a
                            >
                        </li>
                        <li>
                            <a
                                class="nav-link"
                                :class="{
                                    active: isActive('/external-website'),
                                }"
                                href="/external-website"
                                ><i class="bi bi-gear me-2"></i> Settings</a
                            >
                        </li>
                    </ul>
                </li>
  
                <li class="nav-item" v-if="user_role == 'admin'">
                    <a
                        class="nav-link"
                        @click.prevent="toggleDropdown('emails-nav')"
                        href="#"
                    >
                        <i class="bi bi-envelope me-2"></i>
                        <span>Emails</span>
                        <i class="bi bi-chevron-down ms-5"></i>
                    </a>
                    <ul
                        id="emails-nav"
                        class="collapse nav-content"
                        :class="{ show: openDropdowns['emails-nav'] }"
                    >
                        <li>
                            <a
                                class="nav-link"
                                :class="{ active: isActive('/welcome-email') }"
                                href="/welcome-email"
                                ><i
                                    class="bi bi-envelope-arrow-up-fill me-2"
                                ></i>
                                Welcome Email</a
                            >
                        </li>
                        <li>
                            <a
                                class="nav-link"
                                :class="{
                                    active: isActive('/reset-password-email'),
                                }"
                                href="/reset-password-email"
                                ><i
                                    class="bi bi-envelope-arrow-up-fill me-2"
                                ></i>
                                Reset Password Email</a
                            >
                        </li>
                    </ul>
                </li>
            </ul>
        </aside> -->



        <aside class="sidebar mt-3" :class="{ 'sidebar-toggle': isSidebarToggled }">
    <ul class="sidebar-nav">
        <!-- Dashboard -->
        <li class="nav-item">
            <a class="nav-link" :class="{ active: isActive('/dashboard') }" href="/dashboard">
                <i class="bi bi-speedometer2 me-2 text-primary"></i>
                <span>Dashboard</span>
            </a>
        </li>

        <!-- Properties Dropdown -->
        <li class="nav-item" v-if="user_role == 'admin'">
            <a class="nav-link" @click.prevent="toggleDropdown('properties-nav')" href="#">
                <i class="bi bi-building me-2 text-warning"></i>
                <span>Properties</span>
                <i class="bi bi-chevron-down ms-5 text-info"></i>
            </a>
            <ul id="properties-nav" class="collapse nav-content" :class="{ show: openDropdowns['properties-nav'] }">
                <li>
                    <a class="nav-link" :class="{ active: isActive('/properties') }" href="/properties">
                        <i class="bi bi-file-earmark-text me-2 text-success"></i> Properties
                    </a>
                </li>
                <li>
                    <a class="nav-link" :class="{ active: isActive('/scraped-properties-upload') }" href="/scraped-properties-upload">
                        <i class="bi bi-upload me-2 text-danger"></i> Scraped Data Upload
                    </a>
                </li>
                <li>
                    <a class="nav-link" :class="{ active: isActive('/agents') }" href="/agents">
                        <i class="bi bi-person-check me-2 text-primary"></i> Agents
                    </a>
                </li>
                <li>
                    <a class="nav-link" :class="{ active: isActive('/homes') }" href="/homes">
                        <i class="bi bi-house-door me-2 text-info"></i> Quick Move In
                    </a>
                </li>
            </ul>
        </li>

        <!-- Communities Dropdown -->
        <li class="nav-item" v-if="user_role == 'admin'">
            <a class="nav-link" @click.prevent="toggleDropdown('communities-nav')" href="#">
                <i class="bi bi-person-heart me-2 text-danger"></i>
                <span>Communities</span>
                <i class="bi bi-chevron-down ms-5 text-success"></i>
            </a>
            <ul id="communities-nav" class="collapse nav-content" :class="{ show: openDropdowns['communities-nav'] }">
                <li>
                    <a class="nav-link" :class="{ active: isActive('/communities') }" href="/communities">
                        <i class="bi bi-map me-2 text-info"></i> Communities
                    </a>
                </li>
                <li>
                    <a class="nav-link" :class="{ active: isActive('/scraped-communities-upload') }" href="/scraped-communities-upload">
                        <i class="bi bi-upload me-2 text-warning"></i> Scraped Data Upload
                    </a>
                </li>
                <li>
                    <a class="nav-link" :class="{ active: isActive('/builders') }" href="/builders">
                        <i class="bi bi-tools me-2 text-primary"></i> Builders
                    </a>
                </li>
            </ul>
        </li>

        <!-- Customers Dropdown -->
        <li v-if="user_role == 'admin'">
            <a class="nav-link" :class="{ active: isActive('/customer-agreements') }" href="/customer-agreements">
                <i class="bi bi-file-earmark-text me-2 text-success"></i> Connected Customers
            </a>
        </li>

        <!-- Area & Associations Dropdown -->
        <li class="nav-item" v-if="user_role == 'admin'">
            <a class="nav-link" @click.prevent="toggleDropdown('hoa-locations-nav')" href="#">
                <i class="bi bi-globe me-2 text-primary"></i>
                <span>Area & Associations</span>
                <i class="bi bi-chevron-down ms-5 text-warning"></i>
            </a>
            <ul id="hoa-locations-nav" class="collapse nav-content" :class="{ show: openDropdowns['hoa-locations-nav'] }">
                <li>
                    <a class="nav-link" :class="{ active: isActive('/home-owners') }" href="/home-owners">
                        <i class="bi bi-people me-2 text-info"></i> HOA
                    </a>
                </li>
                <li>
                    <a class="nav-link" :class="{ active: isActive('/amenities') }" href="/amenities">
                        <i class="bi bi-bag me-2 text-success"></i> Amenities
                    </a>
                </li>
                <li>
                    <a class="nav-link" :class="{ active: isActive('/regions') }" href="/regions">
                        <i class="bi bi-map me-2 text-primary"></i> Regions
                    </a>
                </li>
                <li>
                    <a class="nav-link" :class="{ active: isActive('/schools') }" href="/schools">
                        <i class="bi bi-book me-2 text-warning"></i> Schools
                    </a>
                </li>
                <li>
                    <a class="nav-link" :class="{ active: isActive('/neighborhoods') }" href="/neighborhoods">
                        <i class="bi bi-house-door me-2 text-danger"></i> Neighborhood
                    </a>
                </li>
            </ul>
        </li>

        <!-- Blog & Content -->
        <li v-if="user_role == 'admin'">
            <a class="nav-link" :class="{ active: isActive('/blogs/posts') }" href="/blogs/posts">
                <i class="bi bi-journal me-2 text-primary"></i> Blog Posts
            </a>
        </li>
        <li v-if="user_role == 'admin'">
            <a class="nav-link" :class="{ active: isActive('/events') }" href="/events">
                <i class="bi bi-calendar-check me-2 text-success"></i> Events
            </a>
        </li>
        <li v-if="user_role == 'admin'">
            <a class="nav-link" :class="{ active: isActive('/incentives') }" href="/incentives">
                <i class="bi bi-gift me-2 text-info"></i> Incentives
            </a>
        </li>

        <!-- Settings Dropdown -->
        <li class="nav-item" v-if="user_role == 'admin'">
            <a class="nav-link" @click.prevent="toggleDropdown('settings-nav')" href="#">
                <i class="bi bi-gear me-2 text-warning"></i>
                <span>Settings</span>
                <i class="bi bi-chevron-down ms-5 text-danger"></i>
            </a>
            <ul id="settings-nav" class="collapse nav-content" :class="{ show: openDropdowns['settings-nav'] }">
                <li>
                    <a class="nav-link" :class="{ active: isActive('/our-promises') }" href="/our-promises">
                        <i class="bi bi-question-circle me-2 text-primary"></i> Why Choose
                    </a>
                </li>
                <li>
                    <a class="nav-link" :class="{ active: isActive('/user-contacted-us') }" href="/user-contacted-us">
                        <i class="bi bi-person me-2 text-danger"></i> User Contact
                    </a>
                </li>
                <li>
                    <a class="nav-link" :class="{ active: isActive('/external-website') }" href="/external-website">
                        <i class="bi bi-gear me-2 text-success"></i> Settings
                    </a>
                </li>
            </ul>
        </li>

        <!-- Emails Dropdown -->
        <li class="nav-item" v-if="user_role == 'admin'">
            <a class="nav-link" @click.prevent="toggleDropdown('emails-nav')" href="#">
                <i class="bi bi-envelope me-2 text-primary"></i>
                <span>Emails</span>
                <i class="bi bi-chevron-down ms-5 text-success"></i>
            </a>
            <ul id="emails-nav" class="collapse nav-content" :class="{ show: openDropdowns['emails-nav'] }">
                <li>
                    <a class="nav-link" :class="{ active: isActive('/welcome-email') }" href="/welcome-email">
                        <i class="bi bi-envelope-arrow-up-fill me-2 text-info"></i> Welcome Email
                    </a>
                </li>
                <li>
                    <a class="nav-link" :class="{ active: isActive('/reset-password-email') }" href="/reset-password-email">
                        <i class="bi bi-envelope-arrow-up-fill me-2 text-warning"></i> Reset Password Email
                    </a>
                </li>
            </ul>
        </li>
    </ul>
</aside>

        <main
            class="min-vh-100"
            :class="{
                'c-main-toggle': isSidebarToggled,
            }"
        >
            <slot></slot>
        </main>
    </div>
</template>

<script>
export default {
    name: "Master",
    created() {},
    data() {
        return {
            black_logo: external_website.black_logo,
            name: external_website.name,
            user_name: logged_in_user.name,
            user_image: logged_in_user.image,
            user_role: logged_in_user.role,
            isSidebarToggled: false,
            openDropdowns: {}, // Store the open/close state of dropdowns
        };
    },
    methods: {
        isActive(route) {
            return window.location.pathname.includes(route);
        },
        toggleSidebar() {
            this.isSidebarToggled = !this.isSidebarToggled;
        },
        updateSidebarResponsive() {
            this.isSidebarToggled = window.innerWidth <= 1199;
        },
        toggleDropdown(id) {
            // Toggle dropdown state
            this.openDropdowns[id] = !this.openDropdowns[id];
        },
        async logOut() {
            try {
                await axios.post("/api/logout-user");
                window.location.href = "/";
            } catch (error) {
                toastr.error(error.response.data.message);
            }
        },
    },
    mounted() {
        window.addEventListener("resize", this.updateSidebarResponsive);

        // Keep dropdown open if a child link is active
        const dropdowns = {
            "properties-nav": [
                "/properties",
                "/scraped-properties-upload",
                "/agents",
                "/homes",
            ],
            "communities-nav": [
                "/scraped-communities-upload",
                "/communities",
                "/builders",
            ],
            "customers-nav": ["/customer-agreements", "/customer-visits"],
            "hoa-locations-nav": [
                "/home-owners",
                "/amenities",
                "/regions",
                "/schools",
                "/neighborhoods",
            ],
            "settings-nav": [
                "/our-promises",
                "/user-contacted-us",
                "/external-website",
            ],
            "emails-nav": ["/welcome-email", "/reset-password-email"],
        };

        for (const key in dropdowns) {
            if (
                dropdowns[key].some((route) =>
                    window.location.pathname.includes(route)
                )
            ) {
                this.openDropdowns[key] = true;
            }
        }
    },
    beforeUnmount() {
        window.removeEventListener("resize", this.updateSidebarResponsive);
    },
};
</script>
<style scoped>
/*
 * Navbar
 */
.nav-link.active {
    background-color: #f6f9ff; /* Change this to your desired color */
    color: #174696;
}
.c-navbar-logo-box {
    width: 300px;
}
.sidebar {
    position: fixed;
    top: 60px;
    left: 0;
    bottom: 0;
    width: 310px;
    z-index: 996;
    transition: all 0.3s;
    padding: 20px;
    overflow-y: auto;
    scrollbar-width: thin;
    scrollbar-color: #aab7cf transparent;
    box-shadow: 0px 0px 20px rgba(1, 41, 112, 0.1);
    background-color: #fff;
}
.sidebar-nav {
    padding: 0;
    margin: 0;
    list-style: none;
}
.sidebar-nav .nav-item {
    margin-bottom: 5px;
}
.sidebar-nav li {
    padding: 0;
    margin: 0;
    list-style: none;
}
.sidebar .nav-link {
    /* background-color: #0000001f; */
    font-size: 15px;
    font-weight: 600;
    padding: 10px 15px;
    border-radius: 4px;
}
.sidebar .nav-link:hover {
    background-color: #f6f9ff;
}
header {
    height: 60px;
}
.sidebar-toggle {
    left: -300px;
}
.c-navbar-brand {
    text-decoration: none;
    color: black;
    font-size: 15px;
    font-weight: 600;
    padding-left: 1rem !important;
}
.c-navbar-dropdown {
    list-style: none;
    margin: 0 0.5rem 0 0;
}
main {
    margin-left: 300px;
    transition: all 0.3s;
    padding: 20px 30px;
    background: #f6f9ff;
}
.c-main-toggle {
    margin-left: 0;
    transition: all 0.3s;
}

/* Quick Move Homes Css*/
.c-theme-text-color {
    color: #174696 !important;
    text-decoration: none !important;
}

.accordion-button {
    color: #174696 !important;
    font-weight: bold !important;
}

.multiselect-tag {
    background-color: #174696 !important;
}

.multiselect-option.is-selected {
    background-color: #174696 !important;
}
.multiselect-option.is-active {
    box-shadow: #174696 !important;
}
.c-search-box-corners {
    border-radius: 0px;
}

.btn-success {
    background-color: #174696 !important; /* Custom color */
    color: #fff;
    border: #0f356c !important;
}

.btn-success:hover {
    background-color: #0f356c !important; /* Darker shade for hover effect */
    color: #fff !important;
    text-decoration: none !important;
}

.btn-success:focus {
    outline: 0;
    box-shadow: 0 0 0 0.2rem rgba(23, 70, 150, 0.5); /* Focus shadow */
}

.btn-success:active {
    background-color: #122f6e; /* Even darker shade for active state */
    color: #fff;
}

.btn-success.disabled,
.btn-success:disabled {
    opacity: 0.65;
    pointer-events: none;
}

.c-card-border {
    border-radius: 1rem;
}
.c-searchbox-radius {
    border-radius: 0 !important;
}
</style>
<style>
body {
    font-family: Inter, sans-serif !important;

    /* background-color: #f7fafc; */
}
</style>
