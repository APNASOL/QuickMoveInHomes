<template>
  <Master>
    <HeroSection />

    <QuickMoveHomes v-intersect />
    <Testimonials v-intersect />
    <OurPromises v-intersect />
    <OpenHouses v-intersect />
    <Communities v-intersect />

    <!-- <Reviews v-intersect /> -->
  </Master>
</template>

<script>
import Master from "@components/layout/Master.vue";
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
    HeroSection,
    QuickMoveHomes,
    OurPromises,
    OpenHouses,
    Testimonials,
    Communities,
    Reviews,
    Multiselect,
  },
  props: {
    message: {
      type: String,
      default: '',
    },
  },
  directives: {
    intersect: {
      mounted(el) {
        // Prevent double mount
        if (el.classList.contains("intersected")) return;

        el.classList.add("pre-intersect");

        const observer = new IntersectionObserver(
          ([entry]) => {
            if (entry.isIntersecting) {
              el.classList.add("intersected");
              observer.unobserve(el);
            }
          },
          { threshold: 0.1 }
        );

        observer.observe(el);
      },
    },
  },
  data() {
    return {
      formStatus: true,
      formErrors: [],
      searching_country: "",
      countriesList: "",
    };
  },
  created() {
    if (this.message) {
      toastr.success(this.message);
    }
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
/* Base Reset */
p {
  margin: 0;
  padding: 0;
}

/* Animation */
.pre-intersect {
  opacity: 0;
  transform: translateY(40px);
  transition: all 0.8s ease;
}

.intersected {
  opacity: 1 !important;
  transform: translateY(0px) !important;
}

/* Top Banner */
.c-top-card {
  background-color: #f8d448;
  padding: 4px 24px;
  font-size: 0.875rem;
  text-align: center;
}

/* Validation */
.invalid-feedback {
  display: block !important;
}

.invalid-bg {
  border-color: #f8d4d4 !important;
  background-color: #f8d4d4 !important;
}
</style>
