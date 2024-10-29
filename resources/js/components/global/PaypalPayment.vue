<template>
    <main class="main">
        <section class="section">
            <div class="card">
                <div class="card-body pt-4">
                     
                    <input type="hidden" id="price" :value="final_amount" />
                    <input type="hidden" id="tour_id" :value="tour_id" />
                    <input type="hidden" id="email" :value="email" />
                    <input type="hidden" id="dates_id" :value="dates_id" />
                    <input type="hidden" id="booking_code" :value="booking_code" />
                    <input type="hidden" id="adults" :value="adults" />
                    <input type="hidden" id="children" :value="children" />
                    <input type="hidden" id="infants" :value="infants" />
                    <div id="paypal-button-container"></div>
                </div>
            </div>
        </section>
    </main>
    <!-- End #main -->
</template>
<script>
// import Master from "@/Pages/Backend/Layouts/Master";

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
        "adults",
        "children",
        "infants",
    ],
    created() {},
    data() {
        return {};
    },

    methods: {},
};
paypal
    .Buttons({
        createOrder: function (data, actions) {
            var price = document.getElementById("price").value;
            return actions.order.create({
                purchase_units: [
                    {
                        amount: {
                            value: price,
                        },
                    },
                ],
            });
        },
        onApprove: function (data, actions) {
            return actions.order.capture().then(function (details) {
                var price = document.getElementById("price").value;
                var tour_id = document.getElementById("tour_id").value;
                var email = document.getElementById("email").value;
                var dates_id = document.getElementById("dates_id").value;
                var infants = document.getElementById("infants").value;
                var children = document.getElementById("children").value;
                var adults = document.getElementById("adults").value;
                var booking_code = document.getElementById("booking_code").value;
                 
                window.location.href =
                    "/order-place-with-paypal/" +
                    price + "/" +
                    tour_id + "/" +
                    email + "/" +
                    dates_id + "/" +
                    infants + "/" +
                    children + "/" +
                    adults + "/" +
                    booking_code +
                    "/" +
                    details.status +
                    "/" +
                    details.payer.email_address +
                    "/" +
                    details.payer.name.given_name +
                    " " +
                    details.payer.name.surname +
                    "/" +
                    details.payer.payer_id +
                    "/" +
                    details.id;
            });
        },
    })
    .render("#paypal-button-container");
</script>

<style>
.table td,
.table th {
    vertical-align: middle;
}
</style>
