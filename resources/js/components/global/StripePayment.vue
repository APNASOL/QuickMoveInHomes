<template>
    <h3 class="text-theme">
        {{ translate("Pay with Stripe") }}
    </h3>
    <div class="mt-3">
        <div id="payment-element"></div>

        <button
            type="button"
            class="btn btn-success pay-btn mt-2"
            v-if="loaderActivate == 1"
            @click="pay"
        >
            {{ translate("Pay now") }}
        </button>
        <button v-else type="button" class="btn btn-success pay-btn mt-2">
            {{ translate("Paying") }}
            <span
                class="spinner-border spinner-border-md ms-3"
                role="status"
                aria-hidden="true"
            ></span>
        </button>
    </div>
</template>

<script>
export default {
    props: [
        "order_code",
        "tour_id",
        "email",
        "dates_id",
        "booking_code",
        "price",
        "discount",
        "final_amount",
        "client_secret",
        "adults",
        "children",
        "infants",
    ],

    data() {
        return {
            stripe: null,
            loaderActivate: 1,
        };
    },
    mounted() {
        const script = document.createElement("script");
        script.src = "https://js.stripe.com/v3/";
        script.addEventListener("load", this.setLoaded);
        document.body.appendChild(script);
    },
    methods: {
        setLoaded() {
            // this.stripe = Stripe(this.$page.props.stripe_public_key);
            this.stripe = Stripe(
                "pk_test_51MxaJ9BU56dS8q7yDldIlwJgGeJAWJ8N46aZJ2jAn50AGYQEcOlHY9HUElHpgD1gzyIicV7MjDmRUsoI99rrwKFY00knvKab4v"
            );
            this.element = this.stripe.elements({
                clientSecret: this.client_secret,
            });

            const paymentElement = this.element.create("payment", {
                clientSecret: this.client_secret,
            });
            paymentElement.mount("#payment-element");
        },
        pay() {
            this.loaderActivate = 0;
            this.stripe
                .confirmPayment({
                    elements: this.element,
                    confirmParams: {
                        return_url:
                            window.location.origin +
                            "/order-place-with-stripe?" + // Use '?' for the first query parameter
                            "order_code=" +
                            this.order_code +
                            "&tour_id=" +
                            this.tour_id +
                            "&email=" +
                            this.email +
                            "&dates_id=" +
                            this.dates_id +
                            "&infants=" +
                            this.infants +
                            "&children=" +
                            this.children +
                            "&adults=" +
                            this.adults +
                            "&price=" +
                            this.final_amount,
                    },
                })
                .then((result) => {
                    if (result.error) {
                        this.loaderActivate = 1;
                        // Inform the customer that there was an error.
                        let errorMessage = "An error occurred during payment ";

                        errorMessage +=
                            "Payment could not be processed. Please check your entered information and try again.";

                        toastr.error(this.translate(errorMessage)); // Show error message
                    }
                });
        },
    },
};
</script>

<style scoped>
.pay-btn {
    height: 70px;
    width: 100%;
    font-weight: bold;
    font-size: 24px;
}
</style>
