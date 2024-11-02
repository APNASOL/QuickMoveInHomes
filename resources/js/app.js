import "bootstrap/dist/js/bootstrap.bundle.min.js";
import "./bootstrap";

import { createApp } from "vue";
import toastr from 'toastr';

window.toastr = toastr;
toastr.options = {
    "positionClass": "toast-bottom-right",
    "progressBar": true,
    "timeOut": "2000",
}

const app = createApp({
    methods: {
        // route,
        // translate(value){
        //     return "testing";
        // },
    },
});

app.config.globalProperties.translate = function (value) {
    let tras = translations[value]; 
    if (typeof tras !== "undefined") {
        // checking if the translation found than use it.
        return tras;
        // return 'Changed';
    } else {
        if (value) {
            axios.post("/api/missing-translations-store",{ value });
        }
    }
    return value;
};

import ImageZooming from "@components/global/ImageZooming.vue";
app.component("image-zooming-component", ImageZooming);
import VerificationCode from "@components/global/VerificationCode.vue";
app.component("verification-code-component", VerificationCode);
import ImageCropper from "@components/global/ImageCropper.vue";
app.component("ImageCropper", ImageCropper);
import ExternalWebsitImageCropper from "@components/backend/ExternalWebsite/Cropper.vue";
app.component("ExternalWebsitImageCropper", ExternalWebsitImageCropper);
import DeleteModal from "@components/global/DeleteModal.vue";
app.component("DeleteModal", DeleteModal);
import ImageDropper from "@components/global/ImageDropper.vue";
app.component("ImageDropper", ImageDropper);

import index from "@components/Index.vue";
app.component("index-component", index);


// import external_tour_details from "@components/TourDetails.vue";
// app.component("external-tour-details-component", external_tour_details);

// Booking from external website
import TourPaymentDetails from "@components/TourPaymentDetails.vue";
app.component("tour-payment-details-component", TourPaymentDetails);

import booking_using_account from "@components/BookingAccountOptions.vue";
app.component("booking-using-account-component", booking_using_account);

import booking_payment_options from "@components/BookingPaymentOptions.vue";
app.component("booking-payment-options-component", booking_payment_options);


import register from "@components/Register.vue";
app.component("register-component", register);

import login from "@components/Login.vue";
app.component("login-component", login);

import forgotPassword from "@components/ForgotPassword.vue";
app.component("forgot-password-component", forgotPassword);

import resetPassword from "@components/ResetPassword.vue";
app.component("reset-password-component", resetPassword);

import profileSettings from "@components/backend/Users/Profile.vue";
app.component("profile-settings-component", profileSettings);

// backend components
import dashboard from "@components/backend/Dashboard.vue";
app.component("dashboard-component", dashboard);

import tour from "@components/backend/tour/Index.vue";
app.component("tour-index-component", tour);  
import create_tour from "@components/backend/tour/CreateTour.vue";
app.component("create-tour-component", create_tour);
import details_tour from "@components/backend/tour/Details.vue";
app.component("tour-details-component", details_tour);

// Booked tours
import booked_tours from "@components/backend/tour/BookedTours.vue";
app.component("booked-tours-component", booked_tours);

import review_add from "@components/backend/tour/TourReviewAdd.vue";
app.component("add-review-on-tour-component", review_add);
import review_see from "@components/backend/tour/TourReviewDetails.vue";
app.component("see-review-on-tour-component", review_see);
import user_review_for_super_admin from "@components/backend/tour/AllReviews.vue";
app.component("user-reviews-for-superadmin-component", user_review_for_super_admin);

// our promisese
import our_promises from "@components/backend/OurPromises/Index.vue";
app.component("our-promises-index-component", our_promises);
import create_our_promises from "@components/backend/OurPromises/Create.vue";
app.component("our-promises-create-component", create_our_promises);


// tour countries
import tour_countries from "@components/backend/TourCountries/Index.vue";
app.component("tour-countries", tour_countries);
import tour_countries_details_create from "@components/backend/TourCountries/Create.vue";
app.component("tour-countries-details-create", tour_countries_details_create);
// custom pages 
import custom_pages from "@components/backend/CustomPages/Index.vue";
app.component("custom-pages-component", custom_pages);
import create_custom_page_component from "@components/backend/CustomPages/Create.vue";
app.component("create-custom-page-component", create_custom_page_component);
import custom_page_details from "@components/backend/CustomPages/Details.vue";
app.component("custom-page-details-component", custom_page_details);
// external website custom pages
 
import searchedHomes from  "@components/SearchingFilter.vue";
app.component("search-homes", searchedHomes);
import allHomes from  "@components/AllHomes.vue";
app.component("all-homes", allHomes);

import homeDetails from "@components/HomeDetails.vue";
app.component("front-home-details-component", homeDetails);

import incenticeFrontDetails from "@components/IncentiveHomes.vue";
app.component("front-incentive-details-component", incenticeFrontDetails);

import allIncentives from "@components/IncentiveHomes.vue";
app.component("front-all-incentives-component", allIncentives);

import allEvents from "@components/Events.vue";
app.component("front-all-events-component", allEvents);

import detatiledCommunity from "@components/CommunityDetails.vue";
app.component("front-community-details-component", detatiledCommunity);


// itinerary components
import create_itinerary from "@components/backend/tour/CreateItinerary.vue";
app.component("create-itinerary-component", create_itinerary);


// activities components
import create_activity from "@components/backend/tour/CreateActivity.vue";
app.component("create-activity-component", create_activity);
import details_activity from "@components/backend/tour/DetailsActivity.vue";
app.component("details-activity-component", details_activity);
// accommodation components
import create_accomodation from "@components/backend/tour/CreateAccomodation.vue";
app.component("create-accommodation-component", create_accomodation);
import details_accomodation from "@components/backend/tour/DetailsAccomodation.vue";
app.component("details-accommodation-component", details_accomodation);

// Languages components
import languages from "@components/backend/Language/Index.vue";
app.component("language-component", languages);

import language_create from "@components/backend/Language/Create.vue";
app.component("language-create-component", language_create);

import translation from "@components/backend/Language/Translations.vue";
app.component("translation-component", translation);

// Dynamic emails
import welcome_email from "@components/backend/DynamicEmails/WelcomeEmail.vue";
app.component("welcome-email-component", welcome_email);
import reset_email from "@components/backend/DynamicEmails/ResetEmail.vue";
app.component("reset-email-component", reset_email);

import verificationCode_email from "@components/backend/DynamicEmails/VerificationCodeEmail.vue";
app.component("verification-code-email-component", verificationCode_email);

import external_website from "@components/backend/ExternalWebsite/Index.vue";
app.component("external-website-component", external_website);

// Users
import users_index from "@components/backend/Users/Index.vue";
app.component("users-index-component", users_index);
import users_create from "@components/backend/Users/Create.vue";
app.component("create-user-component", users_create);
import contact_us from "@components/Contact.vue";
app.component("contact-us-component", contact_us);

import blog_component from "@components/Blogs.vue";
app.component("blogs-component", blog_component);
import blog_detail from "@components/BlogDetails.vue";
app.component("blog-details-component", blog_detail);
import detailedIncentive from "@components/IncentiveDetails.vue";
app.component("detailed-incentive-component", detailedIncentive);

// Offices
import office_index from "@components/backend/Offices/Index.vue";
app.component("offices-index-component", office_index);
import office_create from "@components/backend/Offices/Create.vue";
app.component("create-office-component", office_create);

// call-now-component
import call_now from "@components/backend/CallNow/Index.vue";
app.component("call-now-component", call_now);
 
// stories
import story_index from "@components/backend/Stories/Index.vue";
app.component("stories-index-component", story_index);
import story_create from "@components/backend/Stories/Create.vue";
app.component("create-story-component", story_create);
 

import be_contact_us from "@components/backend/Contact/Index.vue";
app.component("admin-side-user-contacted-us-component", be_contact_us);

import be_contact_us_details from "@components/backend/Contact/Details.vue";
app.component("admin-side-user-contacted-us-details-component", be_contact_us_details);

import recommendation from "@components/Recommendation.vue";
app.component("recommendation-component", recommendation);
 


import tour_country_tours_list from "@components/CountryToursDetails.vue";
app.component("tour-countries-tours-listing", tour_country_tours_list);

// Quick Move Homes admin panel 
// HOA's
import HOAList from "@components/backend/Hoas/Index.vue";
app.component("hoa-list-component", HOAList);
import HOAForm from "@components/backend/Hoas/Create.vue";
app.component("hoa-form-component", HOAForm);
// Schools
import SchoolList from "@components/backend/Schools/Index.vue";
app.component("school-list-component", SchoolList);
import SchoolForm from "@components/backend/Schools/Create.vue";
app.component("school-form-component", SchoolForm);
// Regions
import RegionList from "@components/backend/Region/Index.vue";
app.component("region-list-component", RegionList);
import RegionForm from "@components/backend/Region/Create.vue";
app.component("region-form-component", RegionForm);
// Builders
import BuildersList from "@components/backend/Builders/Index.vue";
app.component("builder-list-component", BuildersList);
import BuilderForm from "@components/backend/Builders/Create.vue";
app.component("builder-form-component", BuilderForm);
// Event
import EvntsList from "@components/backend/Events/Index.vue";
app.component("event-list-component", EvntsList);
import EventForm from "@components/backend/Events/Create.vue";
app.component("event-form-component", EventForm);
// Neighborhoods
import NeighborhoodsList from "@components/backend/Neighborhood/Index.vue";
app.component("neighborhoods-list-component", NeighborhoodsList);
import NeighborhoodForm from "@components/backend/Neighborhood/Create.vue";
app.component("neighborhoods-form-component", NeighborhoodForm);
// Amenities
import AmenitiesList from "@components/backend/Amenities/Index.vue";
app.component("amenities-list-component", AmenitiesList);
import AmenityForm from "@components/backend/Amenities/Create.vue";
app.component("amenities-form-component", AmenityForm);

 
// Communities
import communities_index from "@components/backend/Community/Index.vue";
app.component("communities-index-component", communities_index);
import communities_create from "@components/backend/Community/Create.vue";
app.component("communities-create-component", communities_create);
import community_details from "@components/backend/Community/Details.vue";
app.component("community-details-component", community_details);
// Homes
import homes_index from "@components/backend/Homes/Index.vue";
app.component("homes-index-component", homes_index);
import homes_create from "@components/backend/Homes/Create.vue";
app.component("homes-create-component", homes_create);
import homes_details from "@components/backend/Homes/Details.vue";
app.component("home-details-component", homes_details);
// Homes
import property_index from "@components/backend/Property/Index.vue";
app.component("property-index-component", property_index);
import property_create from "@components/backend/Property/Create.vue";
app.component("property-create-component", property_create);
import property_details from "@components/backend/Property/Details.vue";
app.component("property-details-component", property_details);
// Incentives
import incentive_index from "@components/backend/Incentive/Index.vue";
app.component("incentives-index-component", incentive_index);
import incentive_create from "@components/backend/Incentive/Create.vue";
app.component("incentives-create-component", incentive_create);
// Agents
import agent_create from "@components/backend/Agents/Create.vue";
app.component("agent-create-component", agent_create);
import agent_index from "@components/backend/Agents/Index.vue";
app.component("agent-index-component", agent_index);
// blogs 
 
import blog_post_index from '@components/backend/Blogs/Index.vue';
app.component("blog-index-component", blog_post_index);
import blog_post_create from '@components/backend/Blogs/Create.vue';
app.component("blog-create-component",  blog_post_create);
import about_us_create from '@components/About.vue';
app.component("about-us-component",  about_us_create);

import agent_front_end from '@components/Agents.vue';
app.component("agents-component",  agent_front_end);

import map_front_end from '@components/Map.vue';
app.component("map-component",  map_front_end);

// Quick Move Homes external website




app.mount("#app");
