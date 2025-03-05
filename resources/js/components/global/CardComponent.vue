<template>
    <div class="">
        <div class="property-card position-relative rounded-5">
            <span class="badge sale">{{ badge }}</span>
            <!-- <img
            :src="main_image ?? '/images/default_image.png'"
            class="card-img-top c-card-img-border "
            :alt="title"
            /> -->
            <img
            :src="main_image ? main_image : '/images/default_image.png'"
            class="card-img-top c-card-img-border"
            :alt="title"
            />

             
            <div class="card-body ">
                <h5 class="card-title">
                    {{ title }}  - Testing
                </h5>
                <p class="card-text">
                    {{ truncatedAddress }}
                </p>
                <p class="price">${{ formatPrice(price) }}</p>
                <div class="property-icons">
                    <span>
                        <svg
                            fill="#000000"
                            width="15px"
                            height="15px"
                            viewBox="0 0 50 50"
                            xmlns="http://www.w3.org/2000/svg"
                            xmlns:xlink="http://www.w3.org/1999/xlink"
                        >
                            <path
                                d="M5 10C3.347656 10 2 11.347656 2 13L2 26.8125C3.296875 25.6875 4.9375 24.777344 7 24.0625L7 20C7 17.339844 11.542969 17 15.5 17C19.457031 17 24 17.339844 24 20L24 22C24.335938 21.996094 24.65625 22 25 22C25.34375 22 25.664063 21.996094 26 22L26 20C26 17.339844 30.542969 17 34.5 17C38.457031 17 43 17.339844 43 20L43 24.03125C45.058594 24.742188 46.691406 25.671875 48 26.8125L48 13C48 11.347656 46.652344 10 45 10 Z M 25 24C5.90625 24 -0.015625 27.53125 0 37L50 37C50.015625 27.46875 44.09375 24 25 24 Z M 0 39L0 50L7 50L7 46C7 44.5625 7.5625 44 9 44L41 44C42.4375 44 43 44.5625 43 46L43 50L50 50L50 39Z"
                            />
                        </svg>
                        <!-- <b class="fs-6 mt-1">{{ property.bedrooms }}</b> -->
                        <b class="fs-6 mt-1">{{ bedrooms }}</b>
                    </span>
                    <span
                        ><i class="bi bi-bathtub"></i
                        ><svg
                            fill="#000000"
                            width="15px"
                            height="15px"
                            viewBox="0 0 24 24"
                            id="bathroom"
                            data-name="Flat Line"
                            xmlns="http://www.w3.org/2000/svg"
                            class="icon flat-line"
                        >
                            <path
                                id="secondary"
                                d="M11,10H5V9A3,3,0,0,1,8,6H8a3,3,0,0,1,3,3Z"
                                style="fill: rgb(44, 169, 188); stroke-width: 2"
                            ></path>
                            <path
                                id="primary"
                                d="M17,21V5a2,2,0,0,0-2-2H10A2,2,0,0,0,8,5V6"
                                style="
                                    fill: none;
                                    stroke: rgb(0, 0, 0);
                                    stroke-linecap: round;
                                    stroke-linejoin: round;
                                    stroke-width: 2;
                                "
                            ></path>
                            <path
                                id="primary-2"
                                data-name="primary"
                                d="M11,10H5V9A3,3,0,0,1,8,6H8a3,3,0,0,1,3,3Zm4,11h4M6,14v2m4-2v2"
                                style="
                                    fill: none;
                                    stroke: rgb(0, 0, 0);
                                    stroke-linecap: round;
                                    stroke-linejoin: round;
                                    stroke-width: 2;
                                "
                            ></path>
                        </svg>
                        <b class="fs-6 mt-1">{{ bathrooms }}</b>
                        <!-- <b class="fs-6 mt-1">{{ bedrooms }}</b> -->
                    </span>
                    <span
                        ><svg
                            fill="#000000"
                            width="15px"
                            height="15px"
                            viewBox="0 0 32 32"
                            version="1.1"
                            xmlns="http://www.w3.org/2000/svg"
                        >
                            <title>rulers</title>
                            <path
                                d="M0 32h4v-1.984h2.016v-2.016h-2.016v-1.984h2.016v-2.016h-4v-1.984h4v-2.016h-2.016v-1.984h2.016v-2.016h-2.016v-1.984h2.016v-2.016h-2.016v-1.984h2.016v-2.016h-6.016v24zM0 6.016h6.016v-6.016h-6.016v6.016zM8 30.016v1.984h24v-24h-1.984v22.016h-22.016zM8 6.016h2.016v-2.016h1.984v2.016h2.016v-2.016h1.984v2.016h2.016v-2.016h1.984v2.016h2.016v-4h1.984v4h2.016v-2.016h1.984v2.016h2.016v-2.016h1.984v-4h-24v6.016z"
                            ></path>
                        </svg>

                        <b class="fs-6 mt-1">{{ square_feet }}  </b>
                    </span>
                    <span
                        ><i class="bi bi-garage"></i
                        ><svg
                            fill="#000000"
                            version="1.1"
                            id="Capa_1"
                            xmlns="http://www.w3.org/2000/svg"
                            xmlns:xlink="http://www.w3.org/1999/xlink"
                            width="15px"
                            height="15px"
                            viewBox="0 0 45.393 45.393"
                            xml:space="preserve"
                        >
                            <g>
                                <g>
                                    <path
                                        d="M43.518,12.709L25.178,0.728c-1.511-0.978-3.458-0.968-4.96,0.021L1.859,12.719c-1.14,0.751-1.455,2.284-0.705,3.424
			c0.751,1.14,2.283,1.456,3.424,0.704L22.715,5.021L40.83,16.857c0.416,0.269,0.881,0.396,1.341,0.396
			c0.812,0,1.604-0.397,2.077-1.127C44.99,14.98,44.662,13.452,43.518,12.709z"
                                    />
                                    <path
                                        d="M38.879,27.616c-0.151-0.865-0.903-1.505-1.78-1.505h-1.008l-0.383-3.987c-0.409-4.264-3.948-7.49-8.232-7.49H17.92
			c-4.285,0-7.823,3.227-8.233,7.49l-0.382,3.987H8.296c-0.878,0-1.629,0.64-1.782,1.505l-1.5,8.504
			c-0.186,1.054,0.112,2.139,0.8,2.957c0.662,0.788,1.637,1.258,2.657,1.293v1.412c0,1.999,1.602,3.61,3.603,3.61h1.138
			c1.999,0,3.625-1.611,3.625-3.61v-1.389h11.732v1.386c0,2,1.613,3.613,3.612,3.613h1.139c1.999,0,3.614-1.613,3.614-3.613V40.37
			c1.02-0.035,1.989-0.501,2.649-1.288c0.688-0.82,0.982-1.899,0.798-2.955L38.879,27.616z M11.642,37.113
			c-1.687,0-3.055-1.367-3.055-3.056c0-1.689,1.368-3.057,3.055-3.057c1.688,0,3.057,1.367,3.057,3.057
			C14.699,35.746,13.33,37.113,11.642,37.113z M12.404,26.111l0.353-3.678c0.257-2.674,2.476-4.688,5.163-4.688h0.551v1.156
			c0,1.003,0.797,1.802,1.799,1.802h4.856c1.002,0,1.813-0.799,1.813-1.802v-1.155h0.537c2.687,0,4.906,2.014,5.162,4.688
			l0.354,3.678L12.404,26.111L12.404,26.111z M33.75,37.113c-1.687,0-3.055-1.367-3.055-3.056c0-1.689,1.368-3.057,3.055-3.057
			c1.688,0,3.057,1.367,3.057,3.057C36.807,35.746,35.438,37.113,33.75,37.113z"
                                    />
                                </g>
                            </g>
                        </svg>
                        <b class="fs-6 mt-1">{{ garages }}</b>
                        <!-- <b class="fs-6 mt-1">{{ garags }}</b> -->
                    </span>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { defineComponent } from "vue";
export default defineComponent({
    data() {
        return {};
    },
    created() {},
    props: [
        "badge",
        "main_image",
        "title",
        "address",
        "bedrooms",
        "bathrooms",
        "square_feet",
        "garages",
        "price",
    ],
    mounted() {},
    computed: {
        truncatedAddress() {
            // Truncate address to 30 characters and add "..." if longer
            return this.address.length > 30 ? this.address.substring(0, 30) + '...' : this.address;
        }
    },
    methods: {
        
        calculateDiscountPercentage(originalPrice, discountPercentage) {
            const discountAmount = (discountPercentage / 100) * originalPrice;
            const discountedPrice = originalPrice - discountAmount;
            return Math.round(discountedPrice);
        },
        setAltImg(event) {
            event.target.src = "/images/default_image.png";
        },
        formatPrice(price) {
            return Math.floor(price); // Removes the decimal portion
        },
    },
});
</script>
<style scoped>
.c-card-img-overlay-name {
    top: unset;
    bottom: 120px;
    text-align: left;
    color: white;
}
.property-card {
    text-align: left !important;
    border: 1px solid #eaeaea;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    transition: transform 0.2s;
}
.property-card:hover {
    transform: scale(1.02);
}
.property-card img {
    width: 100%;
    height: 180px;
    object-fit: cover;
}
.property-card .badge {
    position: absolute;
    top: 15px;
    left: 15px;
    font-size: 14px;
    padding: 5px 10px;
    border-radius: 5px;
}
.property-card .badge.sale {
    background-color: #163259;
    color: white;
}
.property-card .badge.rent {
    background-color: #6f42c1;
    color: white;
}
.property-card .card-body {
    padding: 15px;
    background-color: white;
}
.property-card .card-title {
    font-weight: bold;
    margin-bottom: 5px;
    font-size: 16px;
}
.property-card .card-text {
    color: #6c757d !important;
    font-size: 14px;
    margin-bottom: 5px;
}
.property-card .price {
    font-weight: bold;
    font-size: 18px;
    margin-bottom: 5px;
    color: black !important;
}
.property-card .property-icons {
    font-size: 14px;
    display: flex;
    justify-content: space-between;
    color: black !important;
}
.property-card .property-icons span {
    display: flex;
    align-items: center;
    gap: 5px;
}
.property-card .property-icons i {
    color: #6c757d !important;
}
</style>
