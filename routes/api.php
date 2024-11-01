<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\IndexController;
use App\Http\Controllers\LanguageController;
use App\Http\Controllers\OfficeController;
use App\Http\Controllers\SettingController;
use App\Http\Controllers\TourController;
use App\Http\Controllers\TourCountriesController;
use App\Http\Controllers\BookingController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\StoryController;
use App\Http\Controllers\OurPromisesController;
use App\Http\Controllers\CustomPagesController;
use App\Http\Controllers\CallMeNowController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

// Homes Quick Move Controllers
use App\Http\Controllers\CommunitiesController;
use App\Http\Controllers\HomesController;
use App\Http\Controllers\IncentivesController;
use App\Http\Controllers\BlogPostsController;
use App\Http\Controllers\LasVegasRegionController;
use App\Http\Controllers\HoaController;
use App\Http\Controllers\BuilderController;
use App\Http\Controllers\SchoolController;
use App\Http\Controllers\NeighborhoodController;
use App\Http\Controllers\AmenityController;
use App\Http\Controllers\PropertyController;
use App\Http\Controllers\AgentController;
use App\Http\Controllers\EventController;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
 */

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::post('/register-submit', [UserController::class, 'register'])->name('register-submit');
Route::post('/login-user', [AdminController::class, 'login'])->name('login-user');
Route::post('/logout-user', [AdminController::class, 'logout'])->name('logout-user');
Route::post('/reset-password', [UserController::class, 'reset_password'])->name('reset-password');
Route::post('/forgot-password', [UserController::class, 'forgot_password'])->name('forgot-password');

Route::get('/front-homes/{type}', [IndexController::class, 'front_homes'])->name('front-homes');
Route::get('/incentives-list', [IndexController::class, 'incentives_list'])->name('incentives-list');
Route::get('/incentives-homes', [IndexController::class, 'incentives_properties'])->name('incentives-homes');
Route::get('/selected-incentives-homes/{id}', [IndexController::class, 'selected_incentives_properties'])->name('selected-incentives-homes');
Route::get('/overall-blogs', [BlogPostsController::class, 'overall_blogs'])->name('overall-blogs');
Route::get('/more-tours-to-discover/{tour_id}', [IndexController::class, 'more_tours_to_discover'])->name('more-tours-to-discover');

Route::get('/communities', [IndexController::class, 'communities_for_navbar'])->name('communities');
Route::get('/open-houses', [IndexController::class, 'openhouses_for_navbar'])->name('open-houses');
Route::get('/blog-details-fetch/{id}', [BlogPostsController::class, 'blog_details_get'])->name('blog-details-fetch');


Route::post('/missing-translations-store', [LanguageController::class, 'missing_translations_store'])->name('missing-translations-store');
Route::get('/front-end-fetch-carousel', [SettingController::class, 'carousel_fetch'])->name('front-end-fetch-carousel');
Route::get('/get-promises', [OurPromisesController::class, 'get_promises'])->name('get-promises');
// Route::get('/front-end-tour-other-image/{tour_id}', [HomeController::class, 'tour_other_images_fetch'])->name('front-end-tour-other-image');
Route::get('/front-end-tour-details/{tour_id}', [HomeController::class, 'tour_details_fetch'])->name('front-end-tour-details');
Route::get('/get-tour-dates/{tour_id}', [HomeController::class, 'tour_dates_fetch'])->name('get-tour-dates');
Route::post('/passenger-quantity-checking', [HomeController::class, 'passenger_quantity_base_tour_details_fetch'])->name('passenger-quantity-checking');
Route::get('/front-end-tour-payment-dates/{dates_id}', [HomeController::class, 'tour_payment_dates_fetch'])->name('front-end-tour-payment-dates');
// Route::get('/front-tours-flash_sale', [HomeController::class, 'flash_sales'])->name('front-tours-flash_sale');
Route::get('/hoas/pluck', [HoaController::class, 'hoas_pluck'])->name('hoas.pluck');
Route::get('/schools/pluck', [SchoolController::class, 'schools_pluck'])->name('schools.pluck');
Route::get('/communities/pluck', [CommunitiesController::class, 'communities_pluck'])->name('communities.pluck');

Route::middleware(['auth:sanctum'])->group(function () {
    Route::get('/user', function (Request $request) {
        return $request->user();
    });
    
    Route::get('/dashboard-data-count', [AdminController::class, 'dashboard_data_count'])->name('dashboard-data-count');
    Route::get('/dashboard-agent-history', [AdminController::class, 'dashboard_agent_history'])->name('dashboard-agent-history');
    Route::get('/dashboard-customer-history', [AdminController::class, 'dashboard_customer_history'])->name('dashboard-customer-history');
    Route::post('/deal-status-change', [AdminController::class, 'deal_status_change'])->name('deal-status-change');
    
     
   // Homes Quick Move routes
   Route::get('/users/pluck', [UserController::class, 'users_pluck'])->name('users.pluck');

   // Hoa's
   Route::post('/fetch-hoas', [HoaController::class, 'hoas'])->name('fetch-hoas');
   Route::post('/hoa/store', [HoaController::class, 'store'])->name('hoa.store');
   Route::get('/get/hoa/{id}', [HoaController::class, 'get'])->name('hoa.edit');
   Route::post('/hoa/delete/{id}', [HoaController::class, 'delete'])->name('hoa.delete');
   // Regions's
   Route::post('/fetch-regions', [LasVegasRegionController::class, 'regions'])->name('fetch-regions');
   Route::post('/region/store', [LasVegasRegionController::class, 'store'])->name('region.store');
   Route::get('/get/region/{id}', [LasVegasRegionController::class, 'get'])->name('region.edit');
   Route::post('/region/delete/{id}', [LasVegasRegionController::class, 'delete'])->name('region.delete');
   Route::get('/regions/pluck', [LasVegasRegionController::class, 'regions_pluck'])->name('regions.pluck');
   // builder's
   Route::post('/fetch-builders', [BuilderController::class, 'builders'])->name('fetch-builders');
   Route::post('/builder/store', [BuilderController::class, 'store'])->name('builder.store');
   Route::get('/get/builder/{id}', [BuilderController::class, 'get'])->name('builder.edit');
   Route::post('/builder/delete/{id}', [BuilderController::class, 'delete'])->name('builder.delete');
   Route::get('/builders/pluck', [BuilderController::class, 'builders_pluck'])->name('builders.pluck');
   // Event's
   Route::get('/fetch-events', [EventController::class, 'events'])->name('fetch-events');
   Route::post('/event/store', [EventController::class, 'store'])->name('event.store');
   Route::get('/get/event/{id}', [EventController::class, 'get'])->name('event.edit');
   Route::post('/event/delete/{id}', [EventController::class, 'delete'])->name('event.delete'); 
   // school's
   Route::post('/fetch-schools', [SchoolController::class, 'schools'])->name('fetch-schools');
   Route::post('/school/store', [SchoolController::class, 'store'])->name('school.store');
   Route::get('/get/school/{id}', [SchoolController::class, 'get'])->name('school.edit');
   Route::post('/school/delete/{id}', [SchoolController::class, 'delete'])->name('school.delete');
   // school's
   Route::post('/fetch-neighborhoods', [NeighborhoodController::class, 'neighborhoods'])->name('fetch-neighborhoods');
   Route::post('/neighborhood/store', [NeighborhoodController::class, 'store'])->name('neighborhood.store');
   Route::get('/get/neighborhood/{id}', [NeighborhoodController::class, 'get'])->name('neighborhood.edit');
   Route::post('/neighborhood/delete/{id}', [NeighborhoodController::class, 'delete'])->name('neighborhood.delete');
   Route::get('/neighborhoods/pluck', [NeighborhoodController::class, 'neighborhoods_pluck'])->name('neighborhoods.pluck');
   // amenities's
   Route::post('/fetch-amenities', [AmenityController::class, 'amenities'])->name('fetch-amenities');
   Route::post('/amenity/store', [AmenityController::class, 'store'])->name('amenity.store');
   Route::get('/get/amenity/{id}', [AmenityController::class, 'get'])->name('amenity.edit');
   Route::post('/amenity/delete/{id}', [AmenityController::class, 'delete'])->name('amenity.delete');
   Route::get('/amenities/pluck', [AmenityController::class, 'amenities_pluck'])->name('amenities.pluck');
   // communities
   Route::post('/fetch-communities', [CommunitiesController::class, 'fetchCommunities'])->name('fetch-communities');
   Route::post('/community/store', [CommunitiesController::class, 'store'])->name('community.store');
   Route::get('/get/community/{id}', [CommunitiesController::class, 'getCommunity'])->name('community.edit');
   Route::post('/community/delete/{id}', [CommunitiesController::class, 'delete'])->name('community.delete');
   Route::get('/get/community/details/{id}', [CommunitiesController::class, 'getCommunityDetails'])->name('get.community.details');

   // homes
   Route::post('/fetch/homes', [PropertyController::class, 'fetchHomes'])->name('fetch.homes');
   Route::post('/home/store', [HomesController::class, 'store'])->name('home.store');
   Route::get('/get/home/{id}', [HomesController::class, 'getHome'])->name('home.edit');
   Route::post('/home/delete/{id}', [HomesController::class, 'delete'])->name('home.delete');
   Route::get('/get/home/details/{id}', [HomesController::class, 'getHomeDetails'])->name('get.home.details');
   Route::get('/homes/pluck', [HomesController::class, 'homes_pluck'])->name('homes.pluck');
   // homes
   Route::post('/fetch/properties', [PropertyController::class, 'fetchProperties'])->name('fetch.properties');
   Route::post('/property/store', [PropertyController::class, 'store'])->name('property.store');
   Route::get('/get/property/{id}', [PropertyController::class, 'getProperty'])->name('property.edit');
   Route::post('/property/delete/{id}', [PropertyController::class, 'delete'])->name('property.delete');
   Route::get('/get/property/details/{id}', [PropertyController::class, 'getPropertyDetails'])->name('get.property.details');
   Route::get('/properties/pluck', [PropertyController::class, 'properties_pluck'])->name('properties.pluck');
   
   // Property as open house
   Route::post('/property/open/house/status/store', [PropertyController::class, 'store_property_as_open_house'])->name('property.open.house.status.store');
   
   Route::get('/get/property/open/house/{id}', [PropertyController::class, 'getPropertyOpenHouse'])->name('get.property.open.house');
   Route::get('/remove/property/open/house/{id}', [PropertyController::class, 'removePropertyOpenHouse'])->name('remove.property.open.house');

   // incentives
   Route::post('/fetch-incentives', [IncentivesController::class, 'fetchIncentives'])->name('fetch-incentives');
   Route::get('/pluck/incentives', [IncentivesController::class, 'incentives_pluck'])->name('pluck.incentives');
   Route::post('/incentive/store', [IncentivesController::class, 'store'])->name('incentive.store');
   Route::get('/get/incentive/{id}', [IncentivesController::class, 'getIncentive'])->name('incentive.edit');
   Route::post('/incentive/delete/{id}', [IncentivesController::class, 'delete'])->name('incentive.delete');
   // incentives
   Route::post('/fetch/blogs/posts', [BlogPostsController::class, 'fetchBlogPosts'])->name('fetch.blogs.posts');
   Route::post('/blog/post/store', [BlogPostsController::class, 'store'])->name('blogs.post.store');
   Route::get('/get/blogs/post/{id}', [BlogPostsController::class, 'getBlogPost'])->name('get.blogs-post');
   Route::post('/blogs/post/delete/{id}', [BlogPostsController::class, 'delete'])->name('blogs-post.delete');
    
//    Agents
Route::post('/agent/store', [AgentController::class, 'store'])->name('agent.store');
// incentives
Route::post('/fetch-agents', [AgentController::class, 'fetchAgents'])->name('fetch-agents');
Route::get('/pluck/agents', [AgentController::class, 'agents_pluck'])->name('pluck.agents');
Route::post('/agent/store', [AgentController::class, 'store'])->name('agent.store');
Route::get('/get/agent/{id}', [AgentController::class, 'getAgent'])->name('agent.edit');
Route::post('/agent/delete/{id}', [AgentController::class, 'delete'])->name('agent.delete');
   
   
    // tours
    Route::post('/tour-save', [TourController::class, 'tour_save'])->name('tour-save');
    Route::post('/fetch-tours', [TourController::class, 'fetch_tours'])->name('fetch-tours');
    Route::post('/tour-delete/{id}', [TourController::class, 'tour_delete'])->name('tour-delete');
    Route::get('/get-tour/{id}', [TourController::class, 'get_tour'])->name('get-tour');
    Route::get('/get-details-tour/{id}', [TourController::class, 'get_details_tour'])->name('get-details-tour');
    Route::post('/tour-other-image-save', [TourController::class, 'tour_other_image_save'])->name('tour-other-image-save');
    Route::post('/tour-other-image-delete/{id}', [TourController::class, 'tour_other_image_delete'])->name('tour-other-image-delete');
    Route::post('/tour-status-change', [TourController::class, 'tour_status_change'])->name('tour-status-change');
    
    
    // booked tours rotues
    Route::post('/fetch-booked-tours', [TourController::class, 'booked_tours_fetch'])->name('fetch-booked-tours');
  

    // itineraries
    Route::get('/get-itineraries-tour/{id}', [TourController::class, 'get_itineraries_tour'])->name('get-itineraries-tour');
    Route::post('/itinerary-save', [TourController::class, 'itinerary_save'])->name('itinerary-save');
    Route::get('/get-itinerary-edit/{id}', [TourController::class, 'get_itinerary'])->name('get-itinerary-edit');
    Route::post('/itinerary-delete/{id}', [TourController::class, 'itinerary_delete'])->name('itinerary-delete');

    // activities

    Route::get('/get-activities-tour/{id}', [TourController::class, 'get_activities_tour'])->name('get-activities-tour');
    Route::post('/activity-save', [TourController::class, 'activity_save'])->name('activity-save');
    Route::get('/get-activity-edit/{id}', [TourController::class, 'get_activity'])->name('get-activity-edit');
    Route::post('/activity-delete/{id}', [TourController::class, 'activity_delete'])->name('activity-delete');
    Route::get('/get-activity-details/{id}', [TourController::class, 'activity_details_fetch'])->name('get-activity-details');

    Route::post('/activity-other-image-save', [TourController::class, 'activity_other_image_save'])->name('activity-other-image-save');
    Route::post('/activity-image-delete/{id}', [TourController::class, 'activity_image_delete'])->name('activity-image-delete');

    // accommodation
    Route::get('/get-accommodations-tour/{id}', [TourController::class, 'get_accommodations_tour'])->name('get-accommodations-tour');
    Route::post('/accommodation-save', [TourController::class, 'accommodation_save'])->name('accommodation-save');
    Route::get('/get-accommodation-edit/{id}', [TourController::class, 'get_accommodation'])->name('get-accommodation-edit');
    Route::post('/accommodation-delete/{id}', [TourController::class, 'accommodation_delete'])->name('accommodation-delete');
    Route::get('/get-accommodation-details/{id}', [TourController::class, 'accommodation_details_fetch'])->name('get-accommodation-details');

    Route::post('/accommodation-other-image-save', [TourController::class, 'accommodation_other_image_save'])->name('accommodation-other-image-save');
    Route::post('/accommodation-image-delete/{id}', [TourController::class, 'accommodation_image_delete'])->name('accommodation-image-delete');

    // Tour dates
    Route::post('/tour-dates-save', [TourController::class, 'tour_dates_save'])->name('tour-dates-save');
    Route::get('/tour-dates-fetch/{tour_id}', [TourController::class, 'fetch_tour_dates'])->name('tour-dates-fetch');
    Route::post('/tour_date-delete/{record_id}', [TourController::class, 'tour_dates_delete'])->name('tour_date-delete');
    Route::get('/edit-tour-date/{record_id}', [TourController::class, 'tour_dates_edit'])->name('/edit-tour-date');
    // Tour trip hightlights
    Route::post('/tour-trip-hightlights-save', [TourController::class, 'tour_trip_hightlights_save'])->name('tour-trip-hightlights-save');
    Route::get('/tour-trip-hightlights-fetch/{tour_id}', [TourController::class, 'fetch_tour_trip_hightlights'])->name('tour-trip-hightlights-fetch');
    Route::post('/tour-trip-hightlight-delete/{record_id}', [TourController::class, 'tour_trip_hightlights_delete'])->name('tour-trip-hightlight-delete');
    Route::get('/edit-tour-trip-hightlight/{record_id}', [TourController::class, 'tour_trip_hightlights_edit'])->name('/edit-tour-trip-hightlight');
    // Tour usefull-information-save
    Route::post('/usefull-information-save', [TourController::class, 'tour_usefull_information_save'])->name('usefull-information-save');
    // Route::get('/get-usefull-information/{tour_id}', [TourController::class, 'get_usefull_information'])->name('get-usefull-information');

    // languages
    Route::get('/get-existing-languges', [LanguageController::class, 'languages_data'])->name('get-existing-languges');

    Route::post('/make-default-language', [LanguageController::class, 'make_default_language'])->name('make-default-language');
    Route::get('/get-default-languge', [LanguageController::class, 'get_default_language'])->name('get-default-languge');

    Route::get('/languages', [LanguageController::class, 'languages'])->name('languages');

    Route::post('/language-save', [LanguageController::class, 'language_save'])->name('language-save');
    Route::get('/fetch-languages', [LanguageController::class, 'fetch_languages'])->name('fetch-languages');
    Route::get('/get-language/{id}', [LanguageController::class, 'get_language'])->name('get-language');
    Route::get('/get-countries', [LanguageController::class, 'countries'])->name('get-countries');
    // Route::post('/languages/update', [LanguageController::class, 'languages_update'])->name('languages.update');
    Route::post('/language-delete/{id}', [LanguageController::class, 'languages_delete'])->name('language-delete');

    Route::post('/translations/show', [LanguageController::class, 'translations'])->name('translations.show');
    Route::post('/translations/store', [LanguageController::class, 'translations_store'])->name('translations.store');
    Route::post('/translations/search', [LanguageController::class, 'translations_search'])->name('translations.search');
    // Route::delete('/translation/delete/{id}', [LanguageController::class, 'translation_delete'])->name('translation.delete');

    Route::post('/get-language/{id}', [LanguageController::class, 'languages_show'])->name('/get-language');
    Route::post('/translations-show', [LanguageController::class, 'translations'])->name('translations-show');
    Route::post('/translations-save', [LanguageController::class, 'translations_store'])->name('translations-save');
    Route::post('/translations-search', [LanguageController::class, 'translations_search'])->name('translations-search');
    Route::post('/translation-delete/{id}', [LanguageController::class, 'translation_delete'])->name('translation-delete');

    // dynamic emails
    Route::post('/welcome-email-save', [SettingController::class, 'welcome_email_store'])->name('welcome-email-save');
    Route::get('/welcome-email-fetch', [SettingController::class, 'welcome_email_fetch'])->name('welcome-email-fetch');

    Route::post('/reset-password-email-save', [SettingController::class, 'reset_password_email_store'])->name('reset-password-email-save');
    Route::get('/reset-email-fetch', [SettingController::class, 'reset_password_email_fetch'])->name('reset-email-fetch');
    
    Route::post('/verification-code-email-save', [SettingController::class, 'verification_code_email_store'])->name('verification-code-email-save');
    Route::get('/verification-code-email-fetch', [SettingController::class, 'verification_code_email_fetch'])->name('verification-code-email-fetch');

    // External website

    Route::post('/website-info-store', [SettingController::class, 'website_info_store'])->name('website-info-store');
    // Route::get('/fetch-website-info', [SettingController::class, 'website_info_fetch'])->name('fetch-website-info');
    // topbar section external website
    // Route::post('/website-top-bar-data-store', [SettingController::class, 'website_top_bar_data_store'])->name('website-top-bar-data-store');

    Route::post('/logo-store', [SettingController::class, 'logo_store'])->name('logo-store');
    Route::get('/logo-fetch', [SettingController::class, 'logo'])->name('logo-fetch');
    // carousel
    Route::post('/carousel-store', [SettingController::class, 'carousel_store'])->name('carousel-store');
    Route::post('/carousel-update', [SettingController::class, 'carousel_text_update'])->name('carousel-update');
    Route::get('/carousel-fetch', [SettingController::class, 'carousel_fetch'])->name('carousel-fetch');
    Route::post('/carousel-delete/{id}', [SettingController::class, 'carousel_delete'])->name('carousel-delete');

    Route::post('/get-website-name-and-logo', [SettingController::class, 'get_website_name_and_logo'])->name('get-website-name-and-logo');

    // Route::post('/carousel-dragging/{newPositions}', [SettingController::class, 'carousel_dragging'])->name('carousel-dragging');
    Route::post('/carousel-dragging/{newPositions}', [SettingController::class, 'carousel_dragging'])->name('carousel-dragging');

    // seo
    Route::get('/seo', [SettingController::class, 'seo'])->name('seo');
    Route::post('/seo-store', [SettingController::class, 'seo_store'])->name('seo-store');

    // users
    Route::post('/user-save', [UserController::class, 'register'])->name('user-save');
    Route::post('/fetch-users', [UserController::class, 'fetch_users'])->name('fetch-users');
    Route::post('/user-delete/{id}', [UserController::class, 'user_delete'])->name('user-delete');
    Route::get('/get-user/{id}', [UserController::class, 'get_user'])->name('get-user');

    // contact
    Route::post('/fetch-users-contacts', [UserController::class, 'fetch_users_contacts'])->name('fetch-users-contacts');
    Route::get('/get-contact-details/{id}', [UserController::class, 'get_users_contacts_details'])->name('get-contact-details');
    Route::post('/admin-reply-to-user', [UserController::class, 'admin_reply_to_user'])->name('admin-reply-to-user');

    // offices
    Route::post('/office-save', [OfficeController::class, 'store'])->name('office-save');
    Route::post('/fetch-offices', [OfficeController::class, 'fetch_offices'])->name('fetch-offices');
    Route::post('/office-delete/{id}', [OfficeController::class, 'office_delete'])->name('office-delete');
    Route::get('/get-office/{id}', [OfficeController::class, 'get_office'])->name('get-office');
    Route::post('/offices-position-change', [OfficeController::class, 'office_position_change'])->name('offices-position-change');
    // stories
    Route::post('/review-save', [StoryController::class, 'store'])->name('review-save');
    Route::post('/fetch-stories', [StoryController::class, 'fetch_stories'])->name('fetch-stories');
    Route::post('/story-delete/{id}', [StoryController::class, 'story_delete'])->name('story-delete');
    Route::get('/get-story/{id}', [StoryController::class, 'get_story'])->name('get-story');
    Route::post('/stories-position-change', [StoryController::class, 'story_position_change'])->name('stories-position-change');
    Route::get('/reviews-on-tour-fetch/{tour_id}', [StoryController::class, 'review_on_tour_fetch'])->name('reviews-on-tour-fetch');
    Route::get('/all-reviews-fetch', [StoryController::class, 'all_reviews_fetch'])->name('all-reviews-fetch');
    Route::post('/review-delete/{review_id}', [StoryController::class, 'review_delete'])->name('review-delete');
    Route::post('/review-status-change', [StoryController::class, 'review_status_change'])->name('review-status-change');

    // tour countries
    Route::post('/tour-countries-save', [TourCountriesController::class, 'countries_store'])->name('tour-countries-save');
    Route::post('/tour-countries-details-save', [TourCountriesController::class, 'details_store'])->name('tour-countries-details-save');
    Route::post('/fetch-tour-countries', [TourCountriesController::class, 'fetch_tour_countries'])->name('fetch-tour-countries');
    Route::post('/tour-countries-delete/{id}', [TourCountriesController::class, 'tour_country_delete'])->name('tour-countries-delete');
    Route::get('/edit-tour-country/{id}', [TourCountriesController::class, 'edit_country'])->name('edit-tour-country');
    
    Route::get('/get-tour-countries/{id}', [TourCountriesController::class, 'get_tour_countries'])->name('get-tour-countries');

     // tour countries faqs
     Route::post('/country-faq-save', [TourCountriesController::class, 'country_faq_save'])->name('country-faq-save');
     Route::get('/country-faqs-fetch/{tour_country_id}', [TourCountriesController::class, 'fetch_country_faqs'])->name('country-faqs-fetch');
     Route::post('/country-faq-delete/{record_id}', [TourCountriesController::class, 'country_faq_delete'])->name('country-faq-delete');
     Route::get('/edit-country-faq/{record_id}', [TourCountriesController::class, 'country_faq_edit'])->name('/edit-country-faq');
     
     
     Route::get('/tours-pluck', [TourController::class, 'tours_pluck'])->name('/tours-pluck');
     
     
    // custom pages
    Route::post('/custom-page-save', [CustomPagesController::class, 'custom_page_store'])->name('custom-page-save');
    Route::post('/custom-pages-details-save', [CustomPagesController::class, 'custom_page_details_store'])->name('custom-pages-details-save');
    Route::post('/fetch-custom-pages', [CustomPagesController::class, 'fetch_custom_pages'])->name('fetch-custom-pages');
    Route::post('/custom-page-delete/{id}', [CustomPagesController::class, 'custom_page_delete'])->name('custom-page-delete');
    Route::get('/edit-custom-page/{id}', [CustomPagesController::class, 'get_custom_page'])->name('edit-custom-page');
    Route::get('/details-fetch-custom-page/{id}', [CustomPagesController::class, 'details_fetch'])->name('details-fetch-custom-page');
    
    // services
    Route::post('/fetch-our-promises', [OurPromisesController::class, 'fetch_our_promises'])->name('fetch-our-promises');
    Route::post('/our-promise-store', [OurPromisesController::class, 'our_promise_store'])->name('our-promise-store');
    Route::post('/our-promise-delete/{id}', [OurPromisesController::class, 'our_promise_delete'])->name('our-promise-delete');
    Route::get('/edit-our-promise/{id}', [OurPromisesController::class, 'services_show'])->name('edit-our-promise');
 

 
    /*profile and password update*/
    Route::post('/password-update', [UserController::class, 'update_password'])->name('password-update');
    Route::get('/user-show', [UserController::class, 'profile_setting_user_record_get'])->name('user-show');
    Route::post('/profile-update', [UserController::class, 'profile_update'])->name('profile-update');

    
    Route::get('/countries-pluck', [HomeController::class, 'countries_pluck'])->name('countries-pluck');
    // call me now admin dashboard
    Route::get('/call-me-now-fetch', [CallMeNowController::class, 'call_me_now_records_fetch'])->name('call-me-now-fetch');
    Route::post('/call-me-now-delete/{id}', [CallMeNowController::class, 'call_me_now_record_delete'])->name('call-me-now-delete');
    
    
    
    


});
 
// common routes
 Route::post('/contact-save', [HomeController::class, 'contact_store'])->name('contact-save');
Route::get('/fetch-website-info', [SettingController::class, 'website_info_fetch'])->name('fetch-website-info');
 Route::get('/get-tour-country-faqs/{tour_country_id}', [TourCountriesController::class, 'external_website_fetch_country_faqs'])->name('get-tour-country-faqs');

 Route::get('/fetch-home-details/{home_id}', [HomeController::class, 'getPropertyDetails'])->name('fetch-home-details');
 Route::get('/fetch-community-all-homes/{community_id}', [HomeController::class, 'community_all_homes'])->name('fetch-community-all-homes');
 Route::get('/get-community-details/{community_id}', [HomeController::class, 'get_community_details'])->name('get-community-details');
 Route::post('/main/filter', [HomeController::class, 'searchProperties'])->name('main.filter');
 Route::post('/homes/sort', [HomeController::class, 'sortProperties'])->name('homes.sort');
 Route::post('/quick/search', [HomeController::class, 'quickSearch'])->name('quick.search');
 Route::get('/fetch-all-agents', [HomeController::class, 'fetchAllAgents'])->name('fetch-all-agents');
 Route::post('connect/customer/agents', [HomeController::class, 'connect_customer_agents'])->name('connect.customer.agents');


// external website communities pages
Route::get('/get-communities', [IndexController::class, 'communities'])->name('get-communities');
Route::get('/get-communities-details/{name}', [CustomPagesController::class, 'get_custom_page_details'])->name('get-communities-details');


// Route::get('/get-communities-details-tours/{custom_page_name}', [CustomPagesController::class, 'get_custom_page_details_tours'])->name('get-communitiesdetails-tours');


// booking routes from external website
Route::post('/user-register', [BookingController::class, 'booking_using_registering_new_account'])->name('user-register');
Route::post('/booking-using-existing-account-login', [BookingController::class, 'booking_using_existing_account_login'])->name('booking-using-existing-account-login');
Route::post('/booking-using-email', [BookingController::class, 'booking_using_email'])->name('booking-using-email');
 
// for external website
Route::get('/tour-reviews-fetch', [StoryController::class, 'external_websit_tour_reviews'])->name('tour-reviews-fetch');

Route::get('/external-website-languages', [LanguageController::class, 'frontend_languages_data'])->name('external-website-languages');
Route::post('/user-default-language', [LanguageController::class, 'make_frontend_default_language'])->name('user-default-language');
Route::post('/call-me-now', [CallMeNowController::class, 'call_me_now'])->name('call-me-now');


// verification code
Route::post('/match-verification-code', [HomeController::class, 'match_verification_code'])->name('match-verification-code');
