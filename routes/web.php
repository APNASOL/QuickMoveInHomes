<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\AgentController;
use App\Http\Controllers\AmenityController;
use App\Http\Controllers\BlogPostsController;
use App\Http\Controllers\BuilderController;
use App\Http\Controllers\CallMeNowController;
use App\Http\Controllers\IndexController;
use App\Http\Controllers\CommunitiesController;
use App\Http\Controllers\HoaController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\HomesController;
use App\Http\Controllers\IncentivesController;
use App\Http\Controllers\OurPromisesController;
use App\Http\Controllers\LanguageController;
use App\Http\Controllers\LasVegasRegionController;

// Homes Quick Move Controllers
use App\Http\Controllers\NeighborhoodController;
use App\Http\Controllers\PropertyController;
use App\Http\Controllers\SchoolController;
use App\Http\Controllers\SettingController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\EventController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
 */

// Route::get('/test', function(){
//     dd("test");
// });

Route::get('/', function ($message = null) {
    return view('app');
})->name('website');

Route::get('/tour-details/{tour_id}/{tour_name}', [HomeController::class, 'tour_details'])->name('tour-details');

Route::get('/recommendation', function () {
    return view('app');
})->name('recommendation');
Route::get('/login', function () {
    return view('app');
})->name('login');

Route::get('/register', function () {
    return view('app');
})->name('register');

Route::get('/forgot-password', function () {
    return view('app');
})->name('forgot-password');
Route::get('/password-reset/{token?}', [UserController::class, 'resetPasswordVue']);
Route::get('/reset-password/{user_id}', function ($user_id) {
    return view('app', compact('user_id'));
})->name('reset-password');

Route::get('/external-website', function () {
    return view('app');
})->name('external-website');

Route::get('/profile-settings', [UserController::class, 'profile_settings'])->name('profile-settings');

Route::get('/tour-payment-details/{dates_id}/{tour_id}/{adults}/{children}/{infants}', [HomeController::class, 'tour_payment'])->name('tour-payment-details');
Route::get('/contact', [HomeController::class, 'contact_us'])->name('contact');
Route::get('/blogs', [HomeController::class, 'blogs'])->name('blogs');

Route::get('/verify-email/{token?}', [UserController::class, 'verify_email']);

// making the route name main.dashboard and url /admin/dashboard
Route::middleware(['auth:sanctum'])->group(function () {
    Route::get('/dashboard', [AdminController::class, 'dashboard'])->name('dashboard');

    //  Home Quick Move Routes
    //  Hoas
    Route::get('/hoas', [HoaController::class, 'index'])->name('hoas');
    Route::get('/hoa/create', [HoaController::class, 'create'])->name('hoa.create');
    Route::get('/hoa/edit/{id}', [HoaController::class, 'edit'])->name('hoa.edit');
    //  regions
    Route::get('/regions', [LasVegasRegionController::class, 'index'])->name('regions');
    Route::get('/region/create', [LasVegasRegionController::class, 'create'])->name('region.create');
    Route::get('/region/edit/{id}', [LasVegasRegionController::class, 'edit'])->name('region.edit');
    //  builders
    Route::get('/builders', [BuilderController::class, 'index'])->name('builders');
    Route::get('/builder/create', [BuilderController::class, 'create'])->name('builder.create');
    Route::get('/builder/edit/{id}', [BuilderController::class, 'edit'])->name('builder.edit');
    //  events
    Route::get('/events', [EventController::class, 'index'])->name('events');
    Route::get('/event/create', [EventController::class, 'create'])->name('event.create');
    Route::get('/event/edit/{id}', [EventController::class, 'edit'])->name('event.edit');
    //  schools
    Route::get('/schools', [SchoolController::class, 'index'])->name('schools');
    Route::get('/school/create', [SchoolController::class, 'create'])->name('school.create');
    Route::get('/school/edit/{id}', [SchoolController::class, 'edit'])->name('school.edit');
    //  neighborhoods
    Route::get('/neighborhoods', [NeighborhoodController::class, 'index'])->name('neighborhoods');
    Route::get('/neighborhood/create', [NeighborhoodController::class, 'create'])->name('neighborhood.create');
    Route::get('/neighborhood/edit/{id}', [NeighborhoodController::class, 'edit'])->name('neighborhood.edit');
    //  neighborhoods
    Route::get('/amenities', [AmenityController::class, 'index'])->name('amenities');
    Route::get('/amenity/create', [AmenityController::class, 'create'])->name('amenity.create');
    Route::get('/amenity/edit/{id}', [AmenityController::class, 'edit'])->name('amenity.edit');

    //  communities
    Route::get('/communities', [CommunitiesController::class, 'index'])->name('communities');
    Route::get('/community/create', [CommunitiesController::class, 'create'])->name('community.create');
    Route::get('/community/edit/{id}', [CommunitiesController::class, 'edit'])->name('community.edit');
    Route::get('/community/details/{id}', [CommunitiesController::class, 'details'])->name('community.details');

    //  homes
    Route::get('/homes', [HomesController::class, 'index'])->name('homes');
    Route::get('/home/create', [HomesController::class, 'create'])->name('home.create');
    Route::get('/home/edit/{id}', [HomesController::class, 'edit'])->name('home.edit');
    Route::get('/home/details/{id}', [HomesController::class, 'details'])->name('home.details');
    //  agents
    Route::get('/agents', [AgentController::class, 'index'])->name('agents');
    Route::get('/agent/create', [AgentController::class, 'create'])->name('agent.create');
    Route::get('/agent/edit/{id}', [AgentController::class, 'edit'])->name('agent.edit');
    Route::get('/agent/details/{id}', [AgentController::class, 'details'])->name('agent.details');
    //  dynamic emails
    Route::get('/welcome-email', [SettingController::class, 'welcome_email'])->name('welcome-email');
    Route::get('/reset-password-email', [SettingController::class, 'reset_password_email'])->name('reset-password-email');

    //  homes
    Route::get('/properties', [PropertyController::class, 'index'])->name('properties');
    Route::get('/property/create', [PropertyController::class, 'create'])->name('property.create');
    Route::get('/property/edit/{id}', [PropertyController::class, 'edit'])->name('property.edit');
    Route::get('/property/details/{id}', [PropertyController::class, 'details'])->name('property.details');
    //  incentives
    Route::get('/incentives', [IncentivesController::class, 'index'])->name('incentives');
    Route::get('/incentive/create', [IncentivesController::class, 'create'])->name('incentive.create');
    Route::get('/incentive/edit/{id}', [IncentivesController::class, 'edit'])->name('incentive.edit');
    //  blog-post

    Route::get('/blogs/posts', [BlogPostsController::class, 'index'])->name('blogs.posts');
    Route::get('/blogs/post/create', [BlogPostsController::class, 'create'])->name('blogs.post.create');
    Route::get('/blogs/post/edit/{id}', [BlogPostsController::class, 'edit'])->name('blogs.post.edit');

    // promises Routes
    Route::get('/our-promises', [OurPromisesController::class, 'index'])->name('our-promises');
    Route::get('/create-our-promise', [OurPromisesController::class, 'create'])->name('create-our-promise');
    Route::get('/edit-our-promise/{id}', [OurPromisesController::class, 'edit'])->name('edit-our-promise');


    /////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////  Below are the old routes ...................
    /////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////

    // languages Routes
    Route::get('/languages', [LanguageController::class, 'index'])->name('languages');
    Route::get('/create-language', [LanguageController::class, 'languages_add'])->name('create-language');
    Route::get('/edit-language/{id}', [LanguageController::class, 'edit_language'])->name('edit-language');

    // Translation Routes
    Route::get('/translations-show/{id}', [LanguageController::class, 'translations_show'])->name('translations-show');

    // Dynamic emails
    // email test

    //  Users
    Route::get('/users', [UserController::class, 'users'])->name('users');
    Route::get('/create-user', [UserController::class, 'create'])->name('create-user');
    Route::get('/edit-user/{id}', [UserController::class, 'edit_user'])->name('edit-user');
    Route::get('/details-user/{id}', [UserController::class, 'details_user'])->name('details-user');
    //  contacts
    Route::get('/user-contacted-us', [UserController::class, 'users_contacted_us'])->name('user-contacted-us');
    Route::get('/contact-details/{id}', [UserController::class, 'contact_details'])->name('contact-details');

    //  call-now
    Route::get('/call-now', [CallMeNowController::class, 'index'])->name('call-now');

});

Route::get('/all/homes', [HomeController::class, 'visit_all_homes'])->name('all.homes');
Route::get('/search/homes', [HomeController::class, 'search_homes'])->name('search.homes');
Route::get('/home-details/{id}', [HomeController::class, 'home_details'])->name('home-details');
Route::get('/incentive-details/{id}', [IndexController::class, 'incentive_details'])->name('incentive-details');
Route::get('/all-events', [HomeController::class, 'all_events'])->name('all-events');
Route::get('/all-incentives', [HomeController::class, 'all_incentvives'])->name('all-incentives');
Route::get('/detailed/community/{id}', [HomeController::class, 'detailed_community'])->name('detailed.community');
Route::get('/about-us', [HomeController::class, 'about_us'])->name('about-us');
Route::get('/homes-agents/{property_id}', [HomeController::class, 'agents'])->name('homes-agents');
Route::get('/blog-details/{id}', [BlogPostsController::class, 'blog_details'])->name('blog-details');
Route::get('/detailed-incentive/{id}', [IndexController::class, 'detailed_incentive'])->name('detailed-incentive');
Route::get('/homes-list/{location?}', [HomeController::class, 'homes_search_by_location'])->name('homes-list');
 
Route::get('/map', function () {
    return view('app');
})->name('map');
