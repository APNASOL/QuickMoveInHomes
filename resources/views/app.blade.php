<!-- In your Blade template -->

<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
<meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>QMI </title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCsAFTWVWD88hq9sOtqnYT2pNOTnAJW1R0"></script>

  <!-- <script src="https://cdn.maptiler.com/maptiler-sdk-js/v2.0.3/maptiler-sdk.umd.js"></script>
    <link href="https://cdn.maptiler.com/maptiler-sdk-js/v2.0.3/maptiler-sdk.css" rel="stylesheet" /> -->

  <!-- Vendor CSS Files -->
  <!-- <link href="{{ asset('assets/vendor/bootstrap/css/bootstrap.min.css') }} " rel="stylesheet">
  <link href="{{ asset('assets/vendor/bootstrap-icons/bootstrap-icons.css') }} " rel="stylesheet">
  <link href="{{ asset('assets/vendor/boxicons/css/boxicons.min.css') }} " rel="stylesheet">
  <link href="{{ asset('assets/vendor/quill/quill.snow.css') }} " rel="stylesheet">
  <link href="{{ asset('assets/vendor/quill/quill.bubble.css') }} " rel="stylesheet">
  <link href="{{ asset('assets/vendor/remixicon/remixicon.css') }} " rel="stylesheet">
  <link href="{{ asset('assets/vendor/simple-datatables/style.css') }} " rel="stylesheet"> -->

  <!-- Template Main CSS File -->
  <!-- <link href="{{ asset('assets/css/style.css') }}" rel="stylesheet"> -->


    <!-- <link rel="stylesheet" href="{{ asset('assets/css/custom.css') }}"> -->

    <script src="https://www.paypal.com/sdk/js?client-id=AbDZhpcVKO8GscxzZ2TG2gq7db2Yj3Dlyj2odlAaeVu3iHBVlNQKHSuhS4mj6IzKpo7iP69VwbGsHly4&currency=USD"></script>

    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Best Online Vacation Packages</title>
    @php
    $translations = getTranslations();
    $external_website = getExternalWebsiteData();
    $logged_in_user = logedInUser();
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

    @if (Route::currentRouteName() === 'tour-details')
    <div itemscope itemtype="http://schema.org/Product">
        <meta itemprop="productID" content="{{$tour->id}}">
        <meta itemprop="image" content="{{$tour->image}}">
        <meta itemprop="description" content="{{$tour->name}}">
        <meta itemprop="name" content="{{$tour->name}}">
        <meta itemprop="url" content="{{url('/').'/tour-details/' . $tour->id . '/' . urlencode(str_replace(' ', '-', $tour->name))}}">

        <div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
            <link itemprop="availability" href="http://schema.org/InStock">
            <meta itemprop="price" content="{{$tour->price}}">
            <meta itemprop="priceCurrency" content="USD">
          </div>
    </div>
    @endif

    @vite(['resources/sass/app.scss','resources/js/app.js'])

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
</head>

<body>
    <div id="app">
        @if(Route::currentRouteName() === 'website')
        <index-component />
        @elseif(Route::currentRouteName() === 'tour-details')
        <external-tour-details-component :tour_name="'{{ $tour_name }}'" :tour_id="'{{ $tour_id }}'" />
        {{--
        <booking-details :booking_id="'{{ $booking_id }}'" /> --}}
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
        @elseif(Route::currentRouteName() === 'tours')
        <tour-index-component />
        @elseif(Route::currentRouteName() === 'booked-tours')
        <booked-tours-component />
        @elseif(Route::currentRouteName() === 'add-review-on-tour')
        <add-review-on-tour-component :tour_id="'{{ $tour_id }}'" />

        @elseif(Route::currentRouteName() === 'see-reviews-on-tour')
        <see-review-on-tour-component :tour_id="'{{ $tour_id }}'" />
        @elseif(Route::currentRouteName() === 'user-reviews')
        <user-reviews-for-superadmin-component />

        @elseif(Route::currentRouteName() === 'dashboard')
        <dashboard-component />
        @elseif(Route::currentRouteName() === 'create-tour')
        <create-tour-component />
        @elseif(Route::currentRouteName() === 'edit-tour')
        <create-tour-component :tour_id="'{{ $id }}'" />
        @elseif(Route::currentRouteName() === 'details-tour')
        <tour-details-component :tour_id="'{{ $id }}'" />
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
        @elseif(Route::currentRouteName() === 'itinerary-create' )
        <create-itinerary-component :tour_id="'{{ $tour_id }}'" :process_status="'{{ $status }}'" />
        @elseif(Route::currentRouteName() === 'edit-itinerary')
        <create-itinerary-component :tour_id="'{{ $tour_id }}'" :process_status="'{{ $status }}'"
            :itinerary_id="'{{ $itinerary_id }}'" />

        @elseif(Route::currentRouteName() === 'activity-create' )
        <create-activity-component :tour_id="'{{ $tour_id }}'" :process_status="'{{ $status }}'" />
        @elseif(Route::currentRouteName() === 'edit-activity')
        <create-activity-component :tour_id="'{{ $tour_id }}'" :process_status="'{{ $status }}'"
            :activity_id="'{{ $activity_id }}'" />
        @elseif(Route::currentRouteName() === 'details-activity')
        <details-activity-component :activity_id="'{{ $activity_id }}'" :tour_id="'{{ $tour_id }}'" />

        @elseif(Route::currentRouteName() === 'accommodation-create' )
        <create-accommodation-component :tour_id="'{{ $tour_id }}'" :process_status="'{{ $status }}'" />
        @elseif(Route::currentRouteName() === 'edit-accommodation')
        <create-accommodation-component :tour_id="'{{ $tour_id }}'" :process_status="'{{ $status }}'"
            :accommodation_id="'{{ $accommodation_id }}'" />
        @elseif(Route::currentRouteName() === 'details-accommodation')
        <details-accommodation-component :accommodation_id="'{{ $accommodation_id }}'" :tour_id="'{{ $tour_id }}'" />

        @elseif(Route::currentRouteName() === 'tour-payment-details')
        <tour-payment-details-component :dates_id="'{{ $dates_id }}'" :tour_id="'{{ $tour_id }}'"
            :booking_code="'{{ $booking_code }}'" :infants=" '{{ $infants }}' " :children=" '{{ $children }}' "
            :adults=" '{{ $adults }}' " />
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

        @elseif(Route::currentRouteName() === 'offices')
        <offices-index-component />
        @elseif(Route::currentRouteName() === 'create-office')
        <create-office-component />
        @elseif(Route::currentRouteName() === 'edit-office')
        <create-office-component :office_id="'{{ $id }}'" />
        @elseif(Route::currentRouteName() === 'recommendation')
        <recommendation-component />
        @elseif(Route::currentRouteName() === 'tours-countries')
        <tour-countries />
        @elseif(Route::currentRouteName() === 'tour-country-details')
        <tour-countries-details-create :tour_country_record_id="'{{ $tour_country_id }}'" />
        @elseif(Route::currentRouteName() === 'tour-country-tours-list')
        <tour-countries-tours-listing :country_id="'{{ $country_id }}'" />
        @elseif(Route::currentRouteName() === 'stories')
        <stories-index-component />
        @elseif(Route::currentRouteName() === 'create-story')
        <create-story-component />
        @elseif(Route::currentRouteName() === 'edit-story')
        <create-story-component :story_id="'{{ $id }}'" />
        @elseif(Route::currentRouteName() === 'call-now')
        <call-now-component />
        @elseif(Route::currentRouteName() === 'make-booking')
        <booking-using-account-component :tour_id="'{{ $tour_id }}'" :dates_id="'{{ $dates_id }}'"
            :booking_code="'{{ $booking_code }}'" :infants="'{{ $infants }}'" :children="'{{ $children }}'" :price="'{{ $price }}'" :discount=" '{{ $discount }}'" :adults="'{{ $adults }}'" />
        @elseif(Route::currentRouteName() === 'booking-payment-options')
        <booking-payment-options-component
            :email="'{{ $email }}'"
            :tour_id="'{{ $tour_id }}'"
            :dates_id="'{{ $dates_id }}'"
            :booking_code="'{{ $booking_code }}'"
            :infants="'{{ $infants }}'"
            :children="'{{ $children }}'"
            :adults="'{{ $adults }}'"
            :price="'{{ $price }}'"
            :discount="'{{ $discount }}'"
            :final_amount="'{{ $final_amount }}'"
            :order_code="'{{ $order_code }}'"
            :client_secret="'{{ $client_secret }}'"
        />


        @elseif(Route::currentRouteName() === 'custom-pages')
        <custom-pages-component />
        @elseif(Route::currentRouteName() === 'add-custom-page')
        <create-custom-page-component />
        @elseif(Route::currentRouteName() === 'custom-page-edit')
        <create-custom-page-component :custom_page_id="'{{ $id }}'" />
        @elseif(Route::currentRouteName() === 'custom-page-details')
        <custom-page-details-component :custom_page_id="'{{ $id }}'" />

        @elseif(Route::currentRouteName() === 'pages')
        <external-website-custom-page-details :custom_page_name="'{{ $name }}'" />

        @elseif(Route::currentRouteName() === 'our-promises')
        <our-promises-index-component />
        @elseif(Route::currentRouteName() === 'create-our-promise')
        <our-promises-create-component />
        @elseif(Route::currentRouteName() === 'edit-our-promise')
        <our-promises-create-component :our_promise_id="'{{ $id }}'" />
        <!-- Quick Move Homes  -->
         <!-- HOAs -->
@elseif(Route::currentRouteName() === 'home-owners')
    <home-owners-component />
@elseif(Route::currentRouteName() === 'hoa.create')
    <hoa-form-component />
@elseif(Route::currentRouteName() === 'hoa.edit')
    <hoa-form-component :hoa_id="'{{ $id }}'" />

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
        <!-- Homes -->
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
