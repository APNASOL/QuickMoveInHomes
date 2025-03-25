<template>
    <Master>
        <div>
            <Carousel
                ref="carousel"
                :autoplay="3500"
                :wrapAround="true"
                :transition="500"
                :pauseAutoplayOnHover="true"
                v-if="Home.files && Home.files.length > 0"
                @slide-start="onSlideStart"
            >
                <Slide v-for="(file, index) in Home.files" :key="index">
                    <img
                        :src="file.file_name"
                        :alt="file.file_original_name"
                        class="img-fluid c-img-filter c-images-border-design"
                        style="
                            max-width: 100%;
                            height: 400px;
                            object-fit: cover;
                        "
                        @error="setAltImg"
                    />
                </Slide>

                <template v-if="Carousels && Carousels.length > 1" #addons>
                    <navigation />
                </template>
            </Carousel>

            <div
                class="container-fluid c-bg-color d-flex justify-content-center search" 
            >
                <div
                    class="card p-4 c-card-w-responsive c-search-mt c-border-design"
                >
                    <div class="text-center">
                        <h2>Coursey's Point</h2>
                        <p>By <u>Insight Homes</u></p>
                    </div>
                    <div class="row">
                        <div class="col-md-8 col-sm-12">
                            <ul
                                class="nav justify-content-center justify-content-md-start"
                            >
                                
                                <li class="nav-item">
                                    <a
                                        href="#overview"
                                        class="nav-link text-decoration-none link-secondary"
                                        >Overview</a
                                    >
                                </li>
                                <li class="nav-item">
                                    <a
                                        href="#pricing"
                                        class="nav-link text-decoration-none link-secondary"
                                        >Pricing</a
                                    >
                                </li>
                                <li class="nav-item">
                                    <a
                                        href="#homes"
                                        class="nav-link text-decoration-none link-secondary"
                                        >Plans & Homes</a
                                    >
                                </li>
                                <li class="nav-item">
                                    <a
                                        href="#"
                                        class="nav-link disabled text-decoration-none link-secondary"
                                        >Amenities</a
                                    >
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-4 col-sm-12">
                            <ul
                                class="nav justify-content-center justify-content-md-end"
                            >
                            <li>
                                <div class="col-12 col-md-4 p-2">
                            <div v-if="
                                    logged_in_user &&
                                    logged_in_user.role === 'customer' &&
                                    user_home_visiting_history_count < 50
                                ">
                                <h5 class="mt-3 c-theme-color" v-if="
                                        logged_in_user &&
                                        !logged_in_user.agreement
                                    ">
                                    To access all information, please sign a
                                    contract first while selecting your home.
                                </h5>
                                <ProceedComponent :home_id="home_id" :user_status="'logedin'"
                                    :user_name="logged_in_user.name" />
                            </div>
                            <div v-else>
                                <ProceedComponent />
                            </div>
                        </div>
                            </li>
                            <li class="nav-item">
                                    <button
                                        class="btn btn-warning rounded-3 ms-3"
                                    >
                                        Connect to Agent
                                    </button>
                                </li>
                                <li class="nav-item">
                                    <a
                                        href="#"
                                        class="nav-link text-decoration-none link-secondary"
                                        >Get Updates</a
                                    >
                                </li>
                                <li class="nav-item">
                                    <a
                                        href="#"
                                        class="nav-link text-decoration-none link-secondary"
                                        >Save</a
                                    >
                                </li>
                                
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Section 1: Header with Image and Navigation -->

        <div class="container">
            <!-- <div
                @mouseover="stopMarquee"
                @mouseout="startMarquee"
                class="c-marquee"
            > -->
            <!-- <div class="c-marquee-inner" ref="imageMarquee"> -->
            <div id="overview" >
                <div class="mt-5">
                    <div class="row text-center">
                        <div class="col">
                            <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="48"
                                height="48"
                                fill="none"
                            >
                                <path
                                    stroke="#1E1D21"
                                    stroke-linejoin="round"
                                    stroke-width="1.5"
                                    d="M36.79 23.002v-6.675L22.578 4.002 8.894 15.908v18.394a2 2 0 0 0 2 2h11.948M4 20.152l18.597-16.15 18.597 16.15"
                                ></path>
                                <path
                                    stroke="#1E1D21"
                                    stroke-linecap="square"
                                    stroke-width="1.5"
                                    d="m37 37.002 6 6M36.484 22.83c3.77 3.771 3.77 9.885 0 13.656-3.771 3.77-9.885 3.77-13.656 0-3.77-3.771-3.77-9.885 0-13.656 3.771-3.77 9.885-3.77 13.656 0Z"
                                ></path>
                            </svg>
                            <br />
                            <b>Selling </b>
                            <br />
                            <small style="font-size: 12px"
                                >Listing status</small
                            >
                        </div>
                        <div class="col">
                            <!-- end -->
                            <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="48"
                                height="48"
                                fill="none"
                            >
                                <path
                                    stroke="#1E1D21"
                                    stroke-linejoin="round"
                                    stroke-width="1.5"
                                    d="M4 41.002h40m-32-11h24m-21-9h18m-14.765-13h11.53l8.235 33H10z"
                                ></path>
                            </svg>
                            <br />
                            <b>Completed </b>
                            <br />
                            <small style="font-size: 12px"
                                >Building status</small
                            >
                        </div>
                        <div class="col">
                            <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="48"
                                height="48"
                                fill="none"
                            >
                                <path
                                    stroke="#1E1D21"
                                    stroke-linejoin="round"
                                    stroke-width="1.5"
                                    d="M24 4.002 7.005 18.612v23.025a2 2 0 0 0 2 2h30.23a2 2 0 0 0 2-2V19.125zm0 0L1 23.819M24 4.002l22.64 19.817"
                                ></path>
                                <path
                                    stroke="#1E1D21"
                                    stroke-width="1.5"
                                    d="M28 22.502a4.5 4.5 0 1 0-9 0c0 2.485 1.929 3.214 4.5 4.5s4.5 2.015 4.5 4.5a4.5 4.5 0 0 1-9 0m5-13.929v-2.571m0 23.786v-2.572"
                                ></path>
                            </svg>
                            <br />
                            <!-- end -->
                            <small style="font-size: 12px"
                                ><b>From $1,230,000 to $6,500,000 </b>Price
                                USD</small
                            >
                        </div>
                        <div class="col">
                            <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="48"
                                height="48"
                                fill="none"
                            >
                                <path
                                    stroke="#1E1D21"
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    stroke-width="1.5"
                                    d="m19.188 24.72-.688.302-5.5 2.406L2 32.24l22 9.625 22-9.625-11-4.812-5.5-2.407-.687-.3"
                                ></path>
                                <path
                                    fill="#1E1D21"
                                    d="m24 30.518-.569.488a.75.75 0 0 0 1.138 0zm8.25-15.558c0 1.087-.494 2.563-1.328 4.24-.821 1.65-1.924 3.404-3.039 5.016a79 79 0 0 1-4.428 5.785l-.018.021-.005.006h-.001l.569.49.57.488.001-.002.005-.007.02-.023a27 27 0 0 0 .368-.438 80.07 80.07 0 0 0 4.153-5.467c1.135-1.642 2.282-3.46 3.148-5.202.854-1.717 1.485-3.455 1.485-4.907zM24 30.517l.569-.488-.001-.002-.005-.005-.018-.021a25 25 0 0 1-.355-.423 78.6 78.6 0 0 1-4.073-5.362c-1.115-1.612-2.218-3.365-3.04-5.017-.833-1.676-1.327-3.152-1.327-4.239h-1.5c0 1.452.63 3.19 1.485 4.907.866 1.741 2.013 3.56 3.148 5.202a80 80 0 0 0 4.52 5.905l.02.023.006.007.001.001c0 .001.001.001.57-.488M15.75 14.96c0-4.677 3.709-8.442 8.25-8.442v-1.5c-5.4 0-9.75 4.466-9.75 9.942zM24 6.518c4.541 0 8.25 3.765 8.25 8.442h1.5c0-5.476-4.35-9.942-9.75-9.942z"
                                ></path>
                                <circle
                                    cx="24.001"
                                    cy="14.53"
                                    r="3.755"
                                    fill="#1E1D21"
                                ></circle>
                            </svg>
                            <br />

                            <small style="font-size: 12px"
                                >225 Cherry Street, New York, NY 10002</small
                            >
                            <!-- end -->
                        </div>

                        <div class="col">
                            <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="48"
                                height="48"
                                fill="none"
                            >
                                <path
                                    stroke="#1E1D21"
                                    stroke-linejoin="round"
                                    stroke-width="1.5"
                                    d="M29.429 41.05V6.668H5v32.57c0 1 .81 1.81 1.81 1.81z"
                                ></path>
                                <path
                                    stroke="#1E1D21"
                                    stroke-linejoin="round"
                                    stroke-width="1.5"
                                    d="M19.137 20.862h5.768v5.768h-5.768zM19.137 10.287h5.768v5.768h-5.768zM9.524 20.862h5.768v5.768H9.524zM9.524 10.287h5.768v5.768H9.524zM19.137 31.436h5.768v5.768h-5.768zM9.524 31.436h5.768v5.768H9.524zM43 39.24V18.43l-13.571-5.88v28.5H41.19c.999 0 1.809-.811 1.809-1.81Z"
                                ></path>
                                <path
                                    stroke="#1E1D21"
                                    stroke-linejoin="round"
                                    stroke-width="1.5"
                                    d="M33.048 20.862h5.767v5.767h-5.767zM33.048 31.436h5.767v5.768h-5.767z"
                                ></path>
                            </svg>
                            <br />

                            <small style="font-size: 12px"
                                >815 Total units, 80 Stories</small
                            >
                            <!-- end -->
                        </div>

                        <div class="col">
                            <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="48"
                                height="48"
                                fill="none"
                            >
                                <path
                                    stroke="#1E1D21"
                                    stroke-linejoin="round"
                                    stroke-width="1.5"
                                    d="M17 43.848H8a2 2 0 0 1-2-2V4.002h18v10.346"
                                ></path>
                                <path
                                    stroke="#1E1D21"
                                    stroke-linejoin="round"
                                    stroke-width="1.5"
                                    d="M36.5 21.847v-13.5l-20.5 10v25.5h20.5v-8"
                                ></path>
                                <path
                                    stroke="#1E1D21"
                                    stroke-linecap="square"
                                    stroke-width="1.5"
                                    d="m37 35.848 6 6m-6.516-20.172c3.77 3.77 3.77 9.884 0 13.655s-9.885 3.771-13.656 0c-3.77-3.77-3.77-9.885 0-13.655 3.771-3.771 9.885-3.771 13.656 0Z"
                                ></path>
                                <path
                                    stroke="#1E1D21"
                                    stroke-linejoin="round"
                                    stroke-width="1.5"
                                    d="m23.5 29.02 6.197-5.173L36 29.02m-9.916-2.033v5.705h7.355v-5.595l-3.747-3.25zM12 25.847v3.5M12 31.847v3.5M12 13.847v3.5M12 19.847v3.5M18 13.847v3.5M12 7.847v3.5M18 7.847v3.5"
                                ></path>
                            </svg>
                            <br />
                            <b>Condo</b>
                        </div>
                        <div class="col">
                            <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="48"
                                height="48"
                                fill="none"
                            >
                                <path
                                    fill="#1E1D21"
                                    d="M3.28 34.135h-.75v.75h.75zm0-10.868v-.75h-.75v.75zm16.982 0h.75v-.75h-.75zm0-10.426h.75zm1.802-1.801v-.75zm20.851 0v.75zm1.802 1.801h.75zm-25.04 9.881v.75h.75v-.75zm0-1.5h.75v-1.81l-1.28 1.28zm-1.5 1.5-.53-.53-1.28 1.28h1.81zM4.03 34.135V23.267h-1.5v10.868zm-.75-10.118h16.982v-1.5H3.28zm16.232-.75v10.868h1.5V23.267zM3.28 34.885h16.982v-1.5H3.28zm17.732-.75V12.841h-1.5v21.294zm1.052-22.345h20.851v-1.5h-20.85zm21.903 1.051v21.294h1.5V12.841zM20.262 34.885h24.455v-1.5H20.262zM42.915 11.79c.581 0 1.052.47 1.052 1.051h1.5a2.55 2.55 0 0 0-2.552-2.551zM21.013 12.84c0-.58.47-1.051 1.051-1.051v-1.5a2.55 2.55 0 0 0-2.551 2.551zm22.954 21.294v8.831h1.5v-8.83zM2.53 9.002v33.964h1.5V9.002zm16.982 7.812c0 3.188-2.439 5.703-5.363 5.703v1.5c3.828 0 6.864-3.264 6.864-7.203zm-5.363 5.703c-2.925 0-5.364-2.515-5.364-5.703h-1.5c0 3.939 3.036 7.203 6.864 7.203zm-5.364-5.703c0-3.19 2.44-5.704 5.364-5.704v-1.5c-3.828 0-6.864 3.264-6.864 7.204zm5.364-5.704c2.925 0 5.364 2.515 5.364 5.704h1.5c0-3.94-3.036-7.204-6.864-7.204zm6.278 11.612v-1.5h-1.5v1.5zm-.75-.75h-1.5v1.5h1.5zm-.97 1.28 1.5-1.5-1.06-1.06-1.5 1.5z"
                                ></path>
                            </svg>
                            <!-- end -->
                            <br />
                            <b>1 - 3 </b>
                            <br />
                            <small style="font-size: 12px">Beds</small>
                        </div>

                        <div class="col">
                            <!-- Repeat the above structure for each icon section -->

                            <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="48"
                                height="48"
                                fill="none"
                            >
                                <path
                                    stroke="#1E1D21"
                                    stroke-linejoin="round"
                                    stroke-width="1.5"
                                    d="M21.04 9.123V6.079c0-.995-.807-1.802-1.802-1.802H8.677c-.995 0-1.802.807-1.802 1.802v17.208m7.481 18.15-1.543 5.333m21.645-5.333 1.544 5.333m-33.6-23.11 5.256 16.632c.237.75.932 1.26 1.718 1.26h29.291c.786 0 1.481-.51 1.718-1.26L45.64 23.66zM18.803 8.605l-2.982 5.218h10.437l-2.982-5.218z"
                                ></path>
                            </svg>
                            <br />
                            <b>1 - 3 </b>
                            <br />
                            <small style="font-size: 12px">Baths</small>
                            <!-- end -->
                        </div>
                        <div class="col">
                            <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="48"
                                height="48"
                                fill="none"
                            >
                                <path
                                    fill="#1E1D21"
                                    d="M6.06 5.002v-.75h-.75v.75zm35.879 0h.75v-.75h-.75zm0 37v.75h.75v-.75zm-35.879 0h-.75v.75h.75zm29.152 0h-.75v.75h.75zm5.605-19.432a.75.75 0 1 0 0-1.5zm-12.333-.75h-.75c0 .414.336.75.75.75zm.75-6.728v-.75h-1.5v.75zM18.54 27.763a.75.75 0 0 0 0-1.5zm-12.48-1.5h-.75v1.5h.75zm29.151 4.528h.75a.75.75 0 0 0-.685-.747zM21.568 42.002a.75.75 0 0 0 1.5 0zM6.06 5.752H41.94v-1.5H6.06zm35.129-.75v37h1.5v-37zm-34.379 37v-37h-1.5v37zm16.068-.75H6.06v1.5h16.818zm19.06 0h-6.727v1.5h6.728zm-1.12-20.182H28.483v1.5h12.333zm-11.584.75v-6.728h-1.5v6.728zM18.54 26.262H6.06v1.5h12.48zm17.422 15.74V30.79h-1.5v11.212zm-.686-11.96c-2.258-.196-5.652.151-8.51 1.87-2.911 1.753-5.198 4.893-5.198 10.09h1.5c0-4.67 2.01-7.323 4.471-8.804 2.515-1.513 5.568-1.838 7.607-1.661z"
                                ></path>
                            </svg>
                            <br />
                            <b>679 - 2,347 </b>
                            <br />
                            <small style="font-size: 12px">SqFt</small>

                            <!-- end -->
                        </div>
                        <div class="col">
                            <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="48"
                                height="48"
                                fill="none"
                            >
                                <path
                                    fill="#1E1D21"
                                    d="M6.06 5.002v-.75h-.75v.75zm35.879 0h.75v-.75h-.75zm0 37v.75h.75v-.75zm-35.879 0h-.75v.75h.75zm29.152 0h-.75v.75h.75zm6.605-22.432a.75.75 0 1 0 0-1.5zm-13.333-.75h-.75c0 .414.336.75.75.75zm.75-6.728v-.75h-1.5v.75zM18.54 33.763a.75.75 0 0 0 0-1.5zm-12.48-1.5h-.75v1.5h.75zm29.151-1.472h.75a.75.75 0 0 0-.685-.747zM21.568 42.002a.75.75 0 0 0 1.5 0zM6.06 5.752H41.94v-1.5H6.06zm35.129-.75v37h1.5v-37zm-34.379 37v-37h-1.5v37zm16.068-.75H6.06v1.5h16.818zm19.06 0h-6.727v1.5h6.728zm-.12-23.182H28.483v1.5h13.333zm-12.584.75v-6.728h-1.5v6.728zM18.54 32.26H6.06v1.5h12.48zm17.422 9.74V30.79h-1.5v11.212zm-.686-11.958c-2.258-.197-5.652.15-8.51 1.87-2.911 1.752-5.198 4.892-5.198 10.089h1.5c0-4.67 2.01-7.323 4.471-8.804 2.515-1.513 5.568-1.838 7.607-1.661z"
                                ></path>
                                <path
                                    stroke="#1E1D21"
                                    stroke-width="1.5"
                                    d="M21 14.939c0-2.3-1.79-4.162-4-4.162s-4 1.863-4 4.162 1.714 2.973 4 4.162 4 1.863 4 4.162-1.79 4.162-4 4.162-4-1.863-4-4.162m4.444-12.883V8.002m0 22v-2.379"
                                ></path>
                            </svg>
                            <br />
                            <b>$2,127 </b>
                            <br />
                            <small style="font-size: 12px"
                                >Per SqFt (Avg)</small
                            >
                            <!-- end -->
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Section 3: Overview Section -->
        <div >
            <div
                class="container bg-light p-5 shadow-lg rounded-2 mt-4 text-justify"
                style="
                    box-shadow: 10px 10px 15px rgba(0, 0, 0, 0.3),
                        5px 5px 10px rgba(0, 0, 0, 0.15);
                "
            >
                <h1 id="overview ">Overview</h1>
                <p class="py-4">
                    {{ Home.description }}
                </p>
            </div>
        </div>

        <!-- ssection 4 -->
        <div class="container py-5" id="pricing">
            <div class="row">
                <div class="col-md-6 col-sm-12 text-justify">
                    <h2>Property details</h2>
                    <p>
                        {{ Home.description }}
                    </p>
                </div>
                <div class="col-md-6 col-sm-12 p-5">
                    <p><strong>Bed rooms:</strong>{{ Home.bedrooms }}</p>npm
                    <hr />
                    <p><strong>Baths:</strong>2-3</p>
                    <hr />
                    <p><strong>Ownership:</strong>Fee Simple</p>
                    <hr />
                    <p><strong>Listing status:</strong>Selling</p>
                    <hr />
                    <p><strong>Construction status:</strong>Construction</p>
                    <hr />
                    <p><strong>Builder:</strong>Insight Homes</p>
                    <hr />
                </div>
            </div>
        </div>

        <!-- section 5 -->
        <div
            class="shadow-lg container bg-white rounded"
            data-bs-spy="scroll"
            data-bs-target="#navbar-example2"
            data-bs-offset="0"
            
            tabindex="0"

        >
            <!-- <div class="row p-3">
                <h2>Pricing and fees</h2>

                <div class="col-md-3 col-sm-12">
                    <br />
                    <b>Available unit price</b>

                    <p class="mt-3">From $451,900 to $524,900</p>
                </div>
                <div class="col-md-3 col-sm-12">
                    <br />
                    <b> Monthly C.C./maint per sqft</b>

                    <p class="mt-3">$217.29</p>
                </div>
                <div class="col-md-3 col-sm-12">
                    <br />
                    <b>Parking cost </b>

                    <p class="mt-3">-</p>
                </div>
                <div class="col-md-3 col-sm-12">
                    <br />
                    <b>Storage cost </b>

                    <p class="mt-3">-</p>
                </div>
            </div> -->
        </div>

        <!-- section 6 -->

        <div
            class=" text-white text-center p-5 mt-4"
            style="
                background-image: url('https://i.pinimg.com/736x/14/be/cd/14becdfe227736f82eb102c427a4d914.jpg');
                background-size: cover;
                background-position: center;
            "
        >
            <h1>Contact Sales Center</h1>
            <p>
                Request additional information including price lists and floor
                plans.
            </p>
            <button type="button" class="btn btn-black bg-white p-2 mt-4">
                Request Info
            </button>
        </div>

        <!-- section 7 -->

        <div class="container-fluid interactive-banner mt-3">
                    <h1>RELATED COMMUNITY MOVE IN HOMES</h1>
                </div>
                <div class="container pt-3">
                    <div class="row">
                        <div v-for="home in community_homes" :key="home.id" class="col-md-3 mb-3">
                            <a class="text-decoration-none" :href="'/home-details/' + home.property_id">


                                <GlobalCard :badge="home.is_open_house === 1 ? 'Open House' : 'Quick Move In'"
                                    :main_image="home.main_image ?? '/images/default_image.png'"
                                    :title="home.title" :address="home.address" :bedrooms="home.bedrooms"
                                    :price="home.price" :bathrooms="home.bathrooms" :square_feet="home.square_feet"
                                    :garages="home.garages" />


                               
                            </a>
                        </div>
                    </div>
                </div>
        
 

        
    </Master>
</template>

<script>
import Master from "@components/layout/Master.vue";
import CarouselVue from "@components/Carousel.vue";
import ProceedComponent from "@components/ProceedComponent.vue";
import Multiselect from "@vueform/multiselect";
import { addMonths, startOfMonth, endOfMonth } from "date-fns";

import { Carousel, Slide, Pagination, Navigation } from "vue3-carousel";

import "vue3-carousel/dist/carousel.css";
export default {
    components: {
        Master,
        ProceedComponent,
        CarouselVue,
        Carousel,
        Slide,
        Pagination,
        Navigation,
        Multiselect,
    },
    props: ["home_id"],

    created() {
        this.fetchHomeDetails();
        this.backgroundImage = this.Home.property_main_image;
        if (this.user_home_visiting_history_count > 2) {
            window.location.href = "/help";
        }
    },

    data() {
        return {
            Home: [],

            logo: external_website.white_logo,
            name: external_website.name,
            logged_in_user: logged_in_user,
            user_home_visiting_history_count: user_home_visiting_history_count,
            settings: {
                itemsToShow: 1,
                autoplay: 3500,
                wrapAround: true,
                dir: "rtl",
                // snapAlign: 'center',
            },

            backgroundImage: "",
            maxWords: 50,

            Community: [],
            community_homes: [],
            incentive: [],

            formErrors: [],
            currentSlide: 0,
        };
    },

    methods: {
        // Method to set the current image based on thumbnail click
        setCurrentSlide(index) {
            this.currentIndex = index;
        },
        // Go to the previous image
        prevSlide() {
            if (this.currentIndex > 0) {
                this.currentIndex--;
            }
        },
        // Go to the next image
        nextSlide() {
            if (this.currentIndex < this.Home.files.length - 1) {
                this.currentIndex++;
            }
        },
        fetchHomeDetails() {
            axios
                .get("/api/fetch-home-details/" + this.home_id)

                .then((response) => {
                    this.Home = response.data.property_info;

                    this.Community = response.data.community_info;
                    this.incentive = response.data.incentive;
                    this.getThisCommunityAllHomes();
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        getThisCommunityAllHomes() {
            axios
                .get(`/api/fetch-community-all-homes/${this.Community.id}`)
                .then((response) => {
                    this.community_homes = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },

        setAltImg(event) {
            event.target.src = "/images/default_image.png";
        },
        formatDate(date) {
            const options = { year: "numeric", month: "long", day: "numeric" };
            return new Date(date).toLocaleDateString(undefined, options);
        },
        formatTime(time) {
            const [hours, minutes, seconds] = time.split(":");
            let formattedHours = parseInt(hours, 10);
            const period = formattedHours >= 12 ? "PM" : "AM";

            // Convert hours to 12-hour format
            formattedHours = formattedHours % 12 || 12;

            // Return the formatted time with AM/PM
            return `${formattedHours}:${minutes}:${seconds} ${period}`;
        },
        formatPrice(price) {
            return Math.floor(price).toLocaleString(); // Removes the decimal portion
        },
        stopMarquee() {
            const marquee = this.$refs.imageMarquee;
            marquee.style.animationPlayState = "paused";
        },
        startMarquee() {
            const marquee = this.$refs.imageMarquee;
            marquee.style.animationPlayState = "running";
        },
    },
};
</script>

<style>
body {
    font-family: "Oakes Grotesk", sans-serif !important;
    background-color: white !important;
}
.c-search-mt {
    transform: translate(0%, -40%);
}
.c-marquee {
    overflow: hidden;
    white-space: nowrap;
    position: relative;
    width: 100%; /* Or a fixed width if preferred */
}

.c-marquee-inner {
    display: inline-flex;
    animation: scroll 10s linear infinite;
}

@keyframes scroll {
    from {
        transform: translateX(0);
    }
    to {
        transform: translateX(-100%);
    }
}
.text-justify {
    text-align: justify;
}
</style>
