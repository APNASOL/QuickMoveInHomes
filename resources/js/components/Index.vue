<template>
    <Master>
        <HeroSection /> 
        <QuickMoveHomes />
        <Testimonials />
         <OurPromises />
         <OpenHouses />
         <Communities />
     
   
        <!-- <Reviews /> -->  
    </Master>
</template>

<script>
import Master from "@components/layout/Master.vue";
import Carousel from "@components/Carousel.vue";
import HeroSection from "@components/HeroSection.vue";
import QuickMoveHomes from "@components/QuickMoveHomes.vue";
import OurPromises from "@components/OurPromises.vue";

import OpenHouses from "@components/OpenHouses.vue";
import Testimonials from "@components/Testimonials.vue";
import Communities from "@components/Communities.vue";
 
import Reviews from "@components/Reviews.vue";
import Multiselect from "@vueform/multiselect";
import "@vueform/multiselect/themes/default.css";
export default {
    
    components: {
        Master,
        Carousel,
        QuickMoveHomes,
        OurPromises,
        OpenHouses,
        Testimonials,
   
        Communities,
    
        Multiselect,
        Reviews,
        HeroSection
    },
    props: {
        message: {
            type: String,
            default: ''
        }
    },
    created() {
        // this.fetchCountries();
        if (this.message) {
            toastr.success(this.message);
        }
    },
    data() {
        return {
            formStatus: true,
            formErrors: [],
            searching_country: "",
            countriesList: "",
        };
    },
    methods: {
        activeSpinner() {
            this.formStatus = false;
        },
        fetchCountries() {
            axios
                .get("/api/tours-countries-pluck")
                .then((response) => {
                    this.countriesList = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
    },
};
</script>
<style>
p {
    margin: 0;
    padding: 0;
}
.c-top-card {
    background-color: #f8d448;
    padding: 4px 24px;
    font-size: 0.875rem;
    text-align: center;
}

.invalid-feedback {
    display: block !important;
}
.invalid-bg {
    border-color: #f8d4d4 !important;
    background-color: #f8d4d4 !important;
}
</style>
