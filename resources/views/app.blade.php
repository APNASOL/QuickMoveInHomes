<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
    <link href="https://cdn.quilljs.com/1.3.6/quill.bubble.css" rel="stylesheet">

    <!-- Standard favicon for most browsers -->
    <link rel="icon" href="/images/favicon.png" type="image/png">

    <!-- Apple Touch Icon for iOS devices -->
    <link rel="apple-touch-icon" href="/images/favicon.png">

    <title>Vegas Properties: Find Your Dream Home | Luxury & Affordable Real Estate in Las Vegas</title>
    <meta name="description" content="Discover the best real estate deals in Las Vegas with Vegas Properties. Explore luxury homes, affordable properties, and exclusive listings tailored to your needs. Your trusted partner for buying, selling, and renting properties in America's entertainment capital. Start your journey today!">
    <meta name="keywords" content="Las Vegas Real Estate, Luxury Homes in Vegas, Affordable Properties in Las Vegas, Vegas Realtors, Exclusive Property Listings, Buy Property in Las Vegas, Sell Your Home in Vegas, Rent Las Vegas Properties, Real Estate Deals in Nevada, Dream Homes in Las Vegas">
    <meta name="author" content="Vegas Properties">
    <meta name="robots" content="index, follow">

    @php

    $translations = getTranslations();
    $external_website = getExternalWebsiteData();
    $logged_in_user = logedInUser();
    $logo = $external_website->white_logo ?? "";
    $user_home_visiting_history_count = user_home_visiting_history_count();

    @endphp
    <script>
        let translations = @json($translations);
        window.translations = JSON.stringify(translations);
        let external_website = @json($external_website);
        window.external_website = JSON.stringify(external_website);
        let logged_in_user = @json($logged_in_user);
        window.logged_in_user = logged_in_user;
        let user_home_visiting_history_count = @json($user_home_visiting_history_count);
        window.user_home_visiting_history_count = user_home_visiting_history_count;
    </script>

    <!-- Google Tag Manager -->
    <script>
        (function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
    new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
    j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
    'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
    })(window,document,'script','dataLayer','GTM-N5HBHXZ4');
    </script>

    <!-- End Google Tag Manager -->

    <!-- Google tag (gtag.js) -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-S75H1XPW9F"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());

    gtag('config', 'G-S75H1XPW9F');
    </script>

    <!-- Meta Pixel Code -->
    <script>
        !function(f,b,e,v,n,t,s)
        {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
        n.callMethod.apply(n,arguments):n.queue.push(arguments)};
        if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
        n.queue=[];t=b.createElement(e);t.async=!0;
        t.src=v;s=b.getElementsByTagName(e)[0];
        s.parentNode.insertBefore(t,s)}(window, document,'script',
        'https://connect.facebook.net/en_US/fbevents.js');
        fbq('init', '443483678328612');
        fbq('track', 'PageView');
    </script>
    <noscript><img height="1" width="1" style="display:none"
            src="https://www.facebook.com/tr?id=443483678328612&ev=PageView&noscript=1" /></noscript>
    <!-- End Meta Pixel Code -->
    @vite(['resources/sass/app.scss','resources/js/app.js'])
</head>

<body>
    <div id="app">
        @if(Route::currentRouteName() === 'website')
        <index-component />

        @elseif(Route::currentRouteName() === 'register')
        <register-component />
        @elseif(Route::currentRouteName() === 'login')
        <login-component :message="'{{ session('loginMessage') }}'" />
        @elseif(Route::currentRouteName() === 'forgot-password')
        <forgot-password-component />
        @elseif(Route::currentRouteName() === 'reset-password')
        <reset-password-component :user_id=" {{ $user_id }} " />
        @elseif(Route::currentRouteName() === 'profile-settings')
        <profile-settings-component :user_id=" {{ $user_id }} " />





        @elseif(Route::currentRouteName() === 'dashboard')
        <dashboard-component />

        @elseif(Route::currentRouteName() === 'languages')
        <language-component />
        @elseif(Route::currentRouteName() === 'create-language')
        <language-create-component />
        @elseif(Route::currentRouteName() === 'edit-language')
        <language-create-component :lang_id="'{{ $id }}'" />
        @elseif(Route::currentRouteName() === 'translations-show')
        <translation-component :language_id="'{{ $id }}'" />

        @elseif(Route::currentRouteName() === 'verification-code-email')
        <verification-code-email-component />
        @elseif(Route::currentRouteName() === 'external-website')
        <external-website-component />






        @elseif(Route::currentRouteName() === 'users')
        <users-index-component />
        @elseif(Route::currentRouteName() === 'create-user')
        <create-user-component />
        @elseif(Route::currentRouteName() === 'edit-user')
        <create-user-component :user_id="'{{ $id }}'" />

        @elseif(Route::currentRouteName() === 'blogs')
        <blogs-component />
        @elseif(Route::currentRouteName() === 'blog-details')
        <blog-details-component :blog_id="'{{ $id }}'" />

        @elseif(Route::currentRouteName() === 'contact')
        <contact-us-component />
        @elseif(Route::currentRouteName() === 'user-contacted-us')
        <admin-side-user-contacted-us-component />
        @elseif(Route::currentRouteName() === 'contact-details')
        <admin-side-user-contacted-us-details-component :contact_id="'{{ $id }}'" />



        @elseif(Route::currentRouteName() === 'call-now')
        <call-now-component />
 
        @elseif(Route::currentRouteName() === 'our-promises')
        <our-promises-index-component />
        @elseif(Route::currentRouteName() === 'create-our-promise')
        <our-promises-create-component />
        @elseif(Route::currentRouteName() === 'edit-our-promise')
        <our-promises-create-component :our_promise_id="'{{ $id }}'" />
        

         <!-- HOAs -->
@elseif(Route::currentRouteName() === 'home-owners')
    <home-owners-component />
@elseif(Route::currentRouteName() === 'home.owners.create')
    <home-owners-create-component />
@elseif(Route::currentRouteName() === 'home.owners.edit')
    <home-owners-create-component :hoa_id="'{{ $id }}'" />

<!-- Schools -->
@elseif(Route::currentRouteName() === 'schools')
    <school-list-component />
@elseif(Route::currentRouteName() === 'school.create')
    <school-form-component />
@elseif(Route::currentRouteName() === 'school.edit')
    <school-form-component :school_id="'{{ $id }}'" />

<!-- Regions -->
@elseif(Route::currentRouteName() === 'regions')
    <region-list-component />
@elseif(Route::currentRouteName() === 'region.create')
    <region-form-component />
@elseif(Route::currentRouteName() === 'region.edit')
    <region-form-component :region_id="'{{ $id }}'" />

<!-- Builders -->
@elseif(Route::currentRouteName() === 'builders')
    <builder-list-component />
@elseif(Route::currentRouteName() === 'builder.create')
    <builder-form-component />
@elseif(Route::currentRouteName() === 'builder.edit')
    <builder-form-component :builder_id="'{{ $id }}'" />
<!-- Events -->
@elseif(Route::currentRouteName() === 'events')
    <event-list-component />
@elseif(Route::currentRouteName() === 'event.create')
    <event-form-component />
@elseif(Route::currentRouteName() === 'event.edit')
    <event-form-component :event_id="'{{ $id }}'" />

<!-- Neighborhoods -->
@elseif(Route::currentRouteName() === 'neighborhoods')
    <neighborhoods-list-component />
@elseif(Route::currentRouteName() === 'neighborhood.create')
    <neighborhoods-form-component />
@elseif(Route::currentRouteName() === 'neighborhood.edit')
    <neighborhoods-form-component :neighborhood_id="'{{ $id }}'" />

<!-- Amenities -->
@elseif(Route::currentRouteName() === 'amenities')
    <amenities-list-component />
@elseif(Route::currentRouteName() === 'amenity.create')
    <amenities-form-component />
@elseif(Route::currentRouteName() === 'amenity.edit')
    <amenities-form-component :amenity_id="'{{ $id }}'" />

        <!-- Communities -->
        @elseif(Route::currentRouteName() === 'communities')
        <communities-index-component  />
        @elseif(Route::currentRouteName() === 'community.create')
        <communities-create-component  />
        @elseif(Route::currentRouteName() === 'community.edit')
        <communities-create-component :community_id="'{{ $id }}'" />
        @elseif(Route::currentRouteName() === 'community.details')
        <community-details-component :community_id="'{{ $id }}'" />
        @elseif(Route::currentRouteName() === 'upload.communities')
        <upload-communities-component  />
        <!-- Homes -->
        @elseif(Route::currentRouteName() === 'upload')
        <upload-properties-component  />
        @elseif(Route::currentRouteName() === 'homes')
        <homes-index-component  />
        @elseif(Route::currentRouteName() === 'home.create')
        <homes-create-component  />
        @elseif(Route::currentRouteName() === 'home.edit')
        <homes-create-component :home_id="'{{ $id }}'" />
        @elseif(Route::currentRouteName() === 'home.details')
        <home-details-component :home_id="'{{ $id }}'" />
        <!-- Properties -->
        @elseif(Route::currentRouteName() === 'properties')
        <property-index-component  />
        @elseif(Route::currentRouteName() === 'property.create')
        <property-create-component  />
        @elseif(Route::currentRouteName() === 'property.edit')
        <property-create-component :property_id="'{{ $id }}'" />
        @elseif(Route::currentRouteName() === 'property.details')
        <property-details-component :property_id="'{{ $id }}'" />
        <!-- Incentives -->
        @elseif(Route::currentRouteName() === 'incentives')
        <incentives-index-component  />
        @elseif(Route::currentRouteName() === 'incentive.create')
        <incentives-create-component  />
        @elseif(Route::currentRouteName() === 'incentive.edit')
        <incentives-create-component :incentive_id="'{{ $id }}'" />
        <!-- Agents -->
        @elseif(Route::currentRouteName() === 'agents')
        <agent-index-component  />
        @elseif(Route::currentRouteName() === 'agent.create')
        <agent-create-component  />
        @elseif(Route::currentRouteName() === 'agent.edit')
        <agent-create-component :agent_id="'{{ $id }}'" />
        <!-- blogs -->
        @elseif(Route::currentRouteName() === 'blogs.posts')
        <blog-index-component  />
        @elseif(Route::currentRouteName() === 'blogs.post.create')
        <blog-create-component  />
        @elseif(Route::currentRouteName() === 'blogs.post.edit')
        <blog-create-component :blog_post_id="'{{ $id }}'" />

        @elseif(Route::currentRouteName() === 'all.homes')
        <all-homes  />
        @elseif(Route::currentRouteName() === 'search.homes')
        <search-homes />

        @elseif(Route::currentRouteName() === 'homes-list')
        <search-homes  :location="'{{ $location }}'"/>

        @elseif(Route::currentRouteName() === 'home-details')
        <front-home-details-component :home_id="'{{ $id }}'" />
        @elseif(Route::currentRouteName() === 'incentive-details')
        <front-incentive-details-component :incentive_id="'{{ $id }}'" />
        @elseif(Route::currentRouteName() === 'all-incentives')
        <front-all-incentives-component />
        @elseif(Route::currentRouteName() === 'detailed-incentive')
        <detailed-incentive-component :incentive_id="'{{ $id }}'" />
        @elseif(Route::currentRouteName() === 'all-events')
        <front-all-events-component />
        @elseif(Route::currentRouteName() === 'detailed.community')
        <front-community-details-component :community_id="'{{ $community_id }}'" />
        @elseif(Route::currentRouteName() === 'all.communities')
        <front-all-communites-component  />

        @elseif(Route::currentRouteName() === 'welcome-email')
        <welcome-email-component />
        @elseif(Route::currentRouteName() === 'reset-password-email')
        <reset-email-component />
        @elseif(Route::currentRouteName() === 'about-us')
        <about-us-component />
        @elseif(Route::currentRouteName() === 'homes-agents')
        <agents-component :property_id="'{{ $property_id }}'" />
        @elseif(Route::currentRouteName() === 'map')
        <map-component />

        @elseif(Route::currentRouteName() === 'customer-visits')
        <customer-visits-component />
        @elseif(Route::currentRouteName() === 'customer-agreements')
        <customer-agreements-component />
        @elseif(Route::currentRouteName() === 'help')
        <customer-help-component />




        @else
        @php
        return abort(404);
        @endphp
        @endif
    </div>

    <!-- Google Tag Manager (noscript) -->
    <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-N5HBHXZ4" height="0" width="0"
            style="display:none;visibility:hidden"></iframe></noscript>
    <!-- End Google Tag Manager (noscript) -->
</body>

</html>
