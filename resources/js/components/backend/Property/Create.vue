<template>
    <Master>
        <div class="d-flex justify-content-between align-items-center">
            <div class="pagetitle">
                <h3 class="mb-0 c-theme-text-color">
                    <span v-if="property_id">{{
                        translate("Edit Property")
                    }}</span>
                    <span v-else>{{ translate("Create Property") }}</span>
                </h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="#">Property</a>
                        </li>
                        <li class="breadcrumb-item" aria-current="page">
                            <span>{{ translate("Properties") }}</span>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <span v-if="property_id">{{
                                translate("Update")
                            }}</span>
                            <span v-else>{{ translate("Create") }}</span>
                        </li>
                    </ol>
                </nav>
            </div>

            <div class="mb-3 d-flex justify-content-end">
                <a
                    class="btn btn-success justify-content-end"
                    href="/properties"
                >
                    <i class="bi bi-list"></i> {{ translate("Properties") }}</a
                >
            </div>
        </div>

        <div class="card c-card-border">
            <div class="card-body pt-4">
                <form @submit.prevent="submit">
                    <div class="row g-3">
                        <!-- Main Property Fields -->
                        <div class="col-12 col-md-6">
                            <label for="title">{{ translate("Title") }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="title"
                                v-model="form.title"
                                :class="{ 'is-invalid': formErrors.title }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.title"
                            >
                                {{ formErrors.title[0] }}
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label for="community_id">{{
                                translate("Community")
                            }}</label>

                            <Multiselect
                                v-model="form.community_id"
                                :options="communities_options"
                                :placeholder="translate('Search by Community')"
                                :searchable="true"
                                :class="{
                                    'invalid-bg': formErrors.community_id,
                                }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.community_id"
                            >
                                {{ formErrors.community_id[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="incentives">{{
                                translate("Incentives")
                            }}</label>
                            <Multiselect
                                v-model="form.incentives"
                                :options="incentivesOptions"
                                :placeholder="translate('Search by incentives')"
                                :searchable="true"
                                mode="tags"
                                :class="{
                                    'invalid-bg': formErrors.incentives,
                                }"
                            />
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.incentives"
                            >
                                {{ formErrors.incentives[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="description">{{
                                translate("Description")
                            }}</label>
                            <textarea
                                class="form-control"
                                id="description"
                                v-model="form.description"
                                rows="2"
                                :class="{
                                    'is-invalid': formErrors.description,
                                }"
                            ></textarea>
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.description"
                            >
                                {{ formErrors.description[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="address">{{
                                translate("Address")
                            }}</label>
                            <textarea
                                class="form-control"
                                id="address"
                                v-model="form.address"
                                rows="2"
                                :class="{
                                    'is-invalid': formErrors.address,
                                }"
                            ></textarea>
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.address"
                            >
                                {{ formErrors.address[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="city">{{ translate("City") }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="city"
                                v-model="form.city"
                                :class="{ 'is-invalid': formErrors.city }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.city"
                            >
                                {{ formErrors.city[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="state">{{ translate("State") }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="state"
                                v-model="form.state"
                                :class="{ 'is-invalid': formErrors.state }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.state"
                            >
                                {{ formErrors.state[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="zip_code">{{
                                translate("ZIP Code")
                            }}</label>
                            <input
                                type="number"
                                class="form-control"
                                id="zip_code"
                                v-model="form.zip_code"
                                :class="{ 'is-invalid': formErrors.zip_code }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.zip_code"
                            >
                                {{ formErrors.zip_code[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="latitude">{{
                                translate("Latitude")
                            }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="latitude"
                                :class="{ 'invalid-bg': formErrors.latitude }"
                                v-model="form.latitude"
                            />
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.latitude"
                            >
                                {{ formErrors.latitude[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="longitude">{{
                                translate("Longitude")
                            }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="longitude"
                                :class="{ 'invalid-bg': formErrors.longitude }"
                                v-model="form.longitude"
                            />
                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.longitude"
                            >
                                {{ formErrors.longitude[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="price">{{ translate("Price") }}</label>
                            <input
                                type="number"
                                class="form-control"
                                id="price"
                                v-model="form.price"
                                :class="{ 'is-invalid': formErrors.price }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.price"
                            >
                                {{ formErrors.price[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="bedrooms">{{
                                translate("Bedrooms")
                            }}</label>
                            <input
                                type="number"
                                class="form-control"
                                id="bedrooms"
                                v-model="form.bedrooms"
                                :class="{ 'is-invalid': formErrors.bedrooms }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.bedrooms"
                            >
                                {{ formErrors.bedrooms[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="square_feet">{{
                                translate("Square Feet")
                            }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="square_feet"
                                v-model="form.square_feet"
                                :class="{
                                    'is-invalid': formErrors.square_feet,
                                }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.square_feet"
                            >
                                {{ formErrors.square_feet[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="lot_size">{{
                                translate("Lot Size")
                            }}</label>
                            <input
                                type="number"
                                class="form-control"
                                id="lot_size"
                                v-model="form.lot_size"
                                :class="{ 'is-invalid': formErrors.lot_size }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.lot_size"
                            >
                                {{ formErrors.lot_size[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="property_type">{{
                                translate("Property Type")
                            }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="property_type"
                                v-model="form.property_type"
                                :class="{
                                    'is-invalid': formErrors.property_type,
                                }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.property_type"
                            >
                                {{ formErrors.property_type[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="listing_type">{{
                                translate("Listing Type")
                            }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="listing_type"
                                v-model="form.listing_type"
                                :class="{
                                    'is-invalid': formErrors.listing_type,
                                }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.listing_type"
                            >
                                {{ formErrors.listing_type[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="year_built">{{
                                translate("Year Built")
                            }}</label>
                            <input
                                type="number"
                                class="form-control"
                                id="year_built"
                                v-model="form.year_built"
                                :class="{ 'is-invalid': formErrors.year_built }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.year_built"
                            >
                                {{ formErrors.year_built[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="hoa_id">{{ translate("HOA") }}</label>

                            <Multiselect
                                v-model="form.hoa_id"
                                :options="hoasOptions"
                                :placeholder="translate('Search by HOA')"
                                :searchable="true"
                                :class="{
                                    'invalid-bg': formErrors.hoa_id,
                                }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.hoa_id"
                            >
                                {{ formErrors.hoa_id[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="association_fee">{{
                                translate("Association Fee")
                            }}</label>
                            <input
                                type="number"
                                class="form-control"
                                id="association_fee"
                                v-model="form.association_fee"
                                :class="{
                                    'is-invalid': formErrors.association_fee,
                                }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.association_fee"
                            >
                                {{ formErrors.association_fee[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="cic">{{ translate("CIC") }}</label>

                            <Multiselect
                                v-model="form.cic"
                                :options="YesNoOptions"
                                :placeholder="translate('Select option')"
                                :searchable="true"
                                :class="{
                                    'invalid-bg': formErrors.cic,
                                }"
                            />

                            <div class="invalid-feedback" v-if="formErrors.cic">
                                {{ formErrors.cic[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="school_id">{{
                                translate("School")
                            }}</label>
                            <Multiselect
                                v-model="form.school_id"
                                :options="schoolOptions"
                                :placeholder="translate('Search by School')"
                                :searchable="true"
                                :class="{
                                    'invalid-bg': formErrors.school_id,
                                }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.school_id"
                            >
                                {{ formErrors.school_id[0] }}
                            </div>
                        </div>

                        <!-- New Fields  -->

                        <div class="col-12 col-md-6">
                            <label for="school_id">{{
                                translate("Price from")
                            }}</label>
                            <input
                                type="number"
                                class="form-control"
                                id="price_from"
                                v-model="form.price_from"
                                :class="{
                                    'is-invalid': formErrors.price_from,
                                }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.price_from"
                            >
                                {{ formErrors.price_from[0] }}
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label for="price to">{{
                                translate("Price to")
                            }}</label>
                            <input
                                type="number"
                                class="form-control"
                                id="price_to"
                                v-model="form.price_to"
                                :class="{
                                    'is-invalid': formErrors.price_to,
                                }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.price_to"
                            >
                                {{ formErrors.price_to[0] }}
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label for="price to">{{
                                translate("Stories")
                            }}</label>
                            <input
                                type="number"
                                class="form-control"
                                id="stories"
                                v-model="form.stories"
                                :class="{
                                    'is-invalid': formErrors.stories,
                                }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.stories"
                            >
                                {{ formErrors.stories[0] }}
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label for="price to">{{
                                translate("Full bath")
                            }}</label>
                            <input
                                type="number"
                                class="form-control"
                                id="full_bath"
                                v-model="form.full_bath"
                                :class="{
                                    'is-invalid': formErrors.full_bath,
                                }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.full_bath"
                            >
                                {{ formErrors.full_bath[0] }}
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label for="price to">{{
                                translate("Half bath")
                            }}</label>
                            <input
                                type="number"
                                class="form-control"
                                id="half_bath"
                                v-model="form.half_bath"
                                :class="{
                                    'is-invalid': formErrors.half_bath,
                                }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.half_bath"
                            >
                                {{ formErrors.half_bath[0] }}
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label for="size_from">{{
                                translate("Size from")
                            }}</label>
                            <input
                                type="number"
                                class="form-control"
                                id="size_from"
                                v-model="form.size_from"
                                :class="{
                                    'is-invalid': formErrors.size_from,
                                }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.size_from"
                            >
                                {{ formErrors.size_from[0] }}
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label for="size_to">{{
                                translate("Size to")
                            }}</label>
                            <input
                                type="number"
                                class="form-control"
                                id="size_to"
                                v-model="form.size_to"
                                :class="{
                                    'is-invalid': formErrors.size_to,
                                }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.size_to"
                            >
                                {{ formErrors.size_to[0] }}
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label for="construction_status">{{
                                translate("Construction status")
                            }}</label>
                            <Multiselect
                                v-model="form.construction_status"
                                :options="construction_statusOptions"
                                :placeholder="translate('Choose')"
                                :searchable="true"
                                :class="{
                                    'invalid-bg':
                                        formErrors.construction_status,
                                }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.construction_status"
                            >
                                {{ formErrors.construction_status[0] }}
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label for="listing_status">{{
                                translate("Listing status")
                            }}</label>
                            <Multiselect
                                v-model="form.listing_status"
                                :options="listing_statusOptions"
                                :placeholder="translate('Choose')"
                                :searchable="true"
                                :class="{
                                    'invalid-bg': formErrors.listing_status,
                                }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.listing_status"
                            >
                                {{ formErrors.listing_status[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="average_price_per_square">{{
                                translate("Average price per square")
                            }}</label>
                            <input
                                type="number"
                                class="form-control"
                                id="average_price_per_square"
                                v-model="form.average_price_per_square"
                                :class="{
                                    'is-invalid':
                                        formErrors.average_price_per_square,
                                }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.average_price_per_square"
                            >
                                {{ formErrors.average_price_per_square[0] }}
                            </div>
                        </div>

                        <!-- New Fields  -->
                        <!-- Property Features Section -->
                        <div class="col-12">
                            <h3 class="mt-4">
                                {{ translate("Property Features") }}
                            </h3>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="fireplace_type">{{
                                translate("Fireplace Type")
                            }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="fireplace_type"
                                v-model="form.fireplace_type"
                                :class="{
                                    'is-invalid': formErrors.fireplace_type,
                                }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.fireplace_type"
                            >
                                {{ formErrors.fireplace_type[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="kitchen_pantry_type">{{
                                translate("Kitchen Pantry Type")
                            }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="kitchen_pantry_type"
                                v-model="form.kitchen_pantry_type"
                                :class="{
                                    'is-invalid':
                                        formErrors.kitchen_pantry_type,
                                }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.kitchen_pantry_type"
                            >
                                {{ formErrors.kitchen_pantry_type[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="reach_in">{{
                                translate("Reach In")
                            }}</label>
                            <Multiselect
                                v-model="form.reach_in"
                                :options="YesNoOptions"
                                :placeholder="translate('Select Option')"
                                :searchable="true"
                                :class="{
                                    'invalid-bg': formErrors.reach_in,
                                }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.reach_in"
                            >
                                {{ formErrors.reach_in[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="walk_in">{{
                                translate("Walk In")
                            }}</label>
                            <Multiselect
                                v-model="form.walk_in"
                                :options="YesNoOptions"
                                :placeholder="translate('Select Option')"
                                :searchable="true"
                                :class="{
                                    'invalid-bg': formErrors.walk_in,
                                }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.walk_in"
                            >
                                {{ formErrors.walk_in[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="laundry_closet">{{
                                translate("Laundry Closet")
                            }}</label>
                            <Multiselect
                                v-model="form.laundry_closet"
                                :options="YesNoOptions"
                                :placeholder="translate('Select Option')"
                                :searchable="true"
                                :class="{
                                    'invalid-bg': formErrors.laundry_closet,
                                }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.laundry_closet"
                            >
                                {{ formErrors.laundry_closet[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="closet_location">{{
                                translate("Closet Location")
                            }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="closet_location"
                                v-model="form.closet_location"
                                :class="{
                                    'is-invalid': formErrors.closet_location,
                                }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.closet_location"
                            >
                                {{ formErrors.closet_location[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="bedroom_location">{{
                                translate("Bedroom Location")
                            }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="bedroom_location"
                                v-model="form.bedroom_location"
                                :class="{
                                    'is-invalid': formErrors.bedroom_location,
                                }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.bedroom_location"
                            >
                                {{ formErrors.bedroom_location[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="bathroom_type">{{
                                translate("Bathroom Type")
                            }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="bathroom_type"
                                v-model="form.bathroom_type"
                                :class="{
                                    'is-invalid': formErrors.bathroom_type,
                                }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.bathroom_type"
                            >
                                {{ formErrors.bathroom_type[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="bathroom_status">{{
                                translate("Bathroom Status")
                            }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="bathroom_status"
                                v-model="form.bathroom_status"
                                :class="{
                                    'is-invalid': formErrors.bathroom_status,
                                }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.bathroom_status"
                            >
                                {{ formErrors.bathroom_status[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="pool_shape">{{
                                translate("Pool Shape")
                            }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="pool_shape"
                                v-model="form.pool_shape"
                                :class="{ 'is-invalid': formErrors.pool_shape }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.pool_shape"
                            >
                                {{ formErrors.pool_shape[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="water_features">{{
                                translate("Water Features")
                            }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="water_features"
                                v-model="form.water_features"
                                :class="{
                                    'is-invalid': formErrors.water_features,
                                }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.water_features"
                            >
                                {{ formErrors.water_features[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="pool_status">{{
                                translate("Pool Status")
                            }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="pool_status"
                                v-model="form.pool_status"
                                :class="{
                                    'is-invalid': formErrors.pool_status,
                                }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.pool_status"
                            >
                                {{ formErrors.pool_status[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="spa">{{ translate("Spa") }}</label>
                            <Multiselect
                                v-model="form.spa"
                                :options="YesNoOptions"
                                :placeholder="translate('Select Option')"
                                :searchable="true"
                                :class="{
                                    'invalid-bg': formErrors.spa,
                                }"
                            />
                            <div class="invalid-feedback" v-if="formErrors.spa">
                                {{ formErrors.spa[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="fencing_material">{{
                                translate("Fencing Material")
                            }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="fencing_material"
                                v-model="form.fencing_material"
                                :class="{
                                    'is-invalid': formErrors.fencing_material,
                                }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.fencing_material"
                            >
                                {{ formErrors.fencing_material[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="fencing_status">{{
                                translate("Fencing Status")
                            }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="fencing_status"
                                v-model="form.fencing_status"
                                :class="{
                                    'is-invalid': formErrors.fencing_status,
                                }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.fencing_status"
                            >
                                {{ formErrors.fencing_status[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="parking_enclosure">{{
                                translate("Parking Enclosure")
                            }}</label>
                            <Multiselect
                                v-model="form.parking_enclosure"
                                :options="YesNoOptions"
                                :placeholder="translate('Select Option')"
                                :searchable="true"
                                :class="{
                                    'invalid-bg': formErrors.parking_enclosure,
                                }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.parking_enclosure"
                            >
                                {{ formErrors.parking_enclosure[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="private_bath">{{
                                translate("Private Bath")
                            }}</label>
                            <Multiselect
                                v-model="form.private_bath"
                                :options="YesNoOptions"
                                :placeholder="translate('Select Option')"
                                :searchable="true"
                                :class="{
                                    'invalid-bg': formErrors.private_bath,
                                }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.private_bath"
                            >
                                {{ formErrors.private_bath[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label for="outdoor_shower">{{
                                translate("Outdoor Shower")
                            }}</label>
                            <Multiselect
                                v-model="form.outdoor_shower"
                                :options="YesNoOptions"
                                :placeholder="translate('Select Option')"
                                :searchable="true"
                                :class="{
                                    'invalid-bg': formErrors.outdoor_shower,
                                }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.outdoor_shower"
                            >
                                {{ formErrors.outdoor_shower[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-4">
                            <label for="landscape_maintenance">{{
                                translate("Landscape Maintenance")
                            }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="landscape_maintenance"
                                v-model="form.landscape_maintenance"
                                :class="{
                                    'is-invalid':
                                        formErrors.landscape_maintenance,
                                }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.landscape_maintenance"
                            >
                                {{ formErrors.landscape_maintenance[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-4">
                            <label for="foundation_conditions">{{
                                translate("Foundation Conditions")
                            }}</label>
                            <input
                                type="text"
                                class="form-control"
                                id="foundation_conditions"
                                v-model="form.foundation_conditions"
                                :class="{
                                    'is-invalid':
                                        formErrors.foundation_conditions,
                                }"
                            />
                            <div
                                class="invalid-feedback"
                                v-if="formErrors.foundation_conditions"
                            >
                                {{ formErrors.foundation_conditions[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-4">
                            <label for="listing_date">{{
                                translate("Listing Date")
                            }}</label>

                            <Datepicker
                                autoApply
                                :multiple="false"
                                :range="false"
                                :enableTimePicker="false"
                                :class="{
                                    'invalid-bg': formErrors.listing_date,
                                }"
                                v-model="form.listing_date"
                            >
                            </Datepicker>

                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.listing_date"
                            >
                                {{ formErrors.listing_date[0] }}
                            </div>
                        </div>

                        <!-- The plans code -->
                        <!-- The plans code -->
                        <div class="mt-5">
                            <h2>Floor Plans</h2>
                            <div
                                class="row mb-3"
                                v-for="(plan, index) in FloorPlanList"
                                :key="index"
                            >
                                <hr />
                                <div class="col-12">
                                    <h2>Floor Plan {{ index + 1 }}</h2>
                                </div>
                                <!-- Name -->
                                <div class="col-12 col-md-4">
                                    <label>{{ translate("Name") }}</label>
                                    <div class="c-input-group">
                                        <input
                                            type="text"
                                            class="form-control"
                                            v-model="plan.name"
                                        />
                                    </div>
                                </div>

                                <!-- Size -->
                                <div class="col-12 col-md-4">
                                    <label>{{
                                        translate("Size (sq ft)")
                                    }}</label>
                                    <div class="c-input-group">
                                        <input
                                            type="number"
                                            class="form-control"
                                            v-model="plan.size"
                                        />
                                    </div>
                                </div>

                                <!-- Beds -->
                                <div class="col-12 col-md-4">
                                    <label>{{ translate("Beds") }}</label>
                                    <div class="c-input-group">
                                        <input
                                            type="number"
                                            class="form-control"
                                            v-model="plan.beds"
                                        />
                                    </div>
                                </div>

                                <!-- Full Baths -->
                                <div class="col-12 col-md-4">
                                    <label>{{ translate("Full Baths") }}</label>
                                    <div class="c-input-group">
                                        <input
                                            type="number"
                                            class="form-control"
                                            v-model="plan.full_baths"
                                        />
                                    </div>
                                </div>

                                <!-- Half Baths -->
                                <div class="col-12 col-md-4">
                                    <label>{{ translate("Half Baths") }}</label>
                                    <div class="c-input-group">
                                        <input
                                            type="number"
                                            class="form-control"
                                            v-model="plan.half_baths"
                                        />
                                    </div>
                                </div>

                                <!-- Price -->
                                <div class="col-12 col-md-4">
                                    <label>{{ translate("Price") }}</label>
                                    <div class="c-input-group">
                                        <input
                                            type="number"
                                            class="form-control"
                                            v-model="plan.price"
                                        />
                                    </div>
                                </div>

                                <!-- Special Features -->
                                <div class="col-12 col-md-12">
                                    <label>{{
                                        translate("Special Features")
                                    }}</label>
                                    <div class="c-input-group">
                                        <textarea
                                            class="form-control"
                                            v-model="plan.special_features"
                                        ></textarea>
                                    </div>
                                </div>

                                <!-- Images -->
                                <div class="col-12 col-md-12">
                                    <label>{{ translate("Images") }}</label>
                                    <div class="c-input-group">
                                        <input
                                            type="file"
                                            class="form-control"
                                            single
                                            @change="
                                                handleImageUpload($event, index)
                                            "
                                        />
                                    </div>
                                </div>

                                <!-- Actions -->
                                <div class="col-12 col-md-1">
                                    <label>&nbsp;</label>
                                    <button
                                        type="button"
                                        class="btn mt-4"
                                        v-if="index != FloorPlanList.length - 1"
                                        @click="removeFloorPlan(index, plan)"
                                    >
                                        <i class="bi bi-trash"></i>
                                    </button>

                                    <div
                                        class="c-input-group"
                                        v-if="
                                            index === FloorPlanList.length - 1
                                        "
                                    >
                                        <span
                                            @click="addFloorPlan"
                                            class="btn btn-success ms-1"
                                            >+</span
                                        >
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- The plans  code -->
                        <hr />
                        <div class="col-12 col-md-6">
                            <label for="home_main_image">{{
                                translate("Main image")
                            }}</label>

                            <div class="mt-3 mb-2">
                                <img
                                    v-if="form.home_main_image"
                                    :src="
                                        form.home_main_image ??
                                        '/images/default_image.png'
                                    "
                                    :custom_class="'img-fluid img-thumbnail rounded'"
                                    :width="125"
                                />
                                <img
                                    v-else
                                    :src="
                                        existing_home_main_image ??
                                        '/images/default_image.png'
                                    "
                                    :custom_class="'img-fluid img-thumbnail rounded'"
                                    :width="125"
                                />
                            </div>
                            <ImageCropper
                                @croppedImg="croppedImgSubmit"
                                :ratio="1"
                            />
                            <div></div>

                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.home_main_image"
                            >
                                {{ formErrors.home_main_image[0] }}
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label for="banner">{{
                                translate("Banner")
                            }}</label>

                            <div class="mt-3 mb-2">
                                <img
                                    v-if="form.banner"
                                    :src="
                                        form.banner ??
                                        '/images/default_image.png'
                                    "
                                    :custom_class="'img-fluid img-thumbnail rounded'"
                                    :width="125"
                                />
                                <img
                                    v-else
                                    :src="
                                        existing_banner ??
                                        '/images/default_image.png'
                                    "
                                    :custom_class="'img-fluid img-thumbnail rounded'"
                                    :width="125"
                                />
                            </div>
                            <ImageCropper
                                @croppedImg="croppedBannerSubmit"
                                :ratio="3"
                            />
                            <div></div>

                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.banner"
                            >
                                {{ formErrors.banner[0] }}
                            </div>
                        </div>

                        <div class="col-12 col-md-12">
                            <label for="files">{{
                                translate(
                                    "Upload Images/Videos for the property"
                                )
                            }}</label>
                            <ImageDropper
                                DropperType="multiple"
                                fileTypes=".jpg,.jpeg,.png"
                                @emitMethod="moreInfoDropperDataPassing"
                            />

                            <div
                                class="invalid-feedback animated fadeIn"
                                v-if="formErrors.files"
                            >
                                {{ formErrors.files[0] }}
                            </div>
                        </div>

                        <div class="mt-3">
                            <button
                                type="submit"
                                class="btn btn-success"
                                v-if="formStatus"
                            >
                                {{ translate("Save") }}
                            </button>
                            <button
                                class="btn btn-success"
                                type="button"
                                disabled
                                v-else
                            >
                                {{ translate("Save") }}
                                <span
                                    class="spinner-border spinner-border-sm"
                                    role="status"
                                    aria-hidden="true"
                                ></span>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </Master>
</template>

<script>
import Master from "@components/backend/layout/Master.vue";
import ImageCropper from "@components/global/ImageCropper.vue";
import Multiselect from "@vueform/multiselect";
import axios from "axios";
import Datepicker from "@vuepic/vue-datepicker";

export default {
    props: ["property_id"],
    components: {
        Master,
        ImageCropper,
        Multiselect,
        Datepicker,
    },
    created() {
        if (this.property_id) {
            this.getProperty();
        }
        this.pluckCommunities();
        this.pluckHoas();
        this.pluckSchools();
        this.pluckIncentives();
    },
    data() {
        return {
            YesNoOptions: ["Yes", "No"],
            FloorPlanList: [
                {
                    name: "",
                    size: "",
                    beds: "",
                    full_baths: "",
                    half_baths: "",
                    price: "",
                    special_features: "",
                    image: "",
                },
            ],
            form: {
                property_id: this.property_id ?? "",

                // Main Property Fields

                user_id: null,
                title: "",
                description: "",
                address: "",
                city: "",
                state: "",
                zip_code: "",
                longitude: "",
                latitude: "",
                price: null,
                bedrooms: null,
                square_feet: null,
                lot_size: null,
                property_type: "",
                listing_type: "",
                year_built: null,
                hoa_id: null,
                association_fee: null,
                cic: null,
                school_id: null,
                community_id: null,
                incentives: [],
                // Property Features Fields
                feature_id: null,
                name: "",
                fireplace_type: "",
                kitchen_pantry_type: "",
                reach_in: null,
                walk_in: null,
                laundry_closet: "",
                closet_location: "",
                bedroom_location: "",
                bathroom_type: "",
                bathroom_status: "",
                pool_shape: "",
                water_features: "",
                pool_status: "",
                spa: null,
                fencing_material: "",
                fencing_status: "",
                parking_enclosure: "",
                private_bath: null,
                outdoor_shower: null,
                landscape_maintenance: "",
                foundation_conditions: "",
                listing_date: "",
                files: [],
                home_main_image: "",
                banner: "",
                price_from: "",
                price_to: "",
                stories: "",
                full_bath: "",
                half_bath: "",
                size_from: "",
                size_to: "",
                construction_status: "",
                listing_status: "",
                average_price_per_square: "",
            },

            construction_statusOptions: [
                "Under Construction",
                "Completed",
                "Not Started",
            ],
            listing_statusOptions: ["Active", "Sold", "Pending", "Expired"],

            existing_home_main_image: "",
            existing_banner: "",
            formErrors: [],
            formStatus: true,
            property_image: "",
            communities_options: [],
            schoolOptions: [],
            hoasOptions: [],
            incentivesOptions: [],
        };
    },
    methods: {
        handleImageUpload(event, index) {
            const files = event.target.files;
            if (files && files.length) {
                const fileList = Array.from(files); // Convert FileList to Array
                this.FloorPlanList[index].images.push(...fileList); // Add files to the specific plan's images array
            }
        },
        addFloorPlan() {
            this.FloorPlanList.push({
                name: "",
                size: "",
                beds: "",
                full_baths: "",
                half_baths: "",
                price: "",
                special_features: "",
                image: "",
            });
        },
        removeFloorPlan(index, list) {
            var idx = this.FloorPlanList.indexOf(list);

            if (idx > -1) {
                this.FloorPlanList.splice(idx, 1);
            }
        },
        moreInfoDropperDataPassing(files) {
            this.form.files = files;
        },
        getProperty() {
            axios
                .get("/api/get/property/" + this.property_id)
                .then((response) => {
                    const property = response.data;
                    this.form.id = property.id;
                    this.form.property_id = property.property_id || null;
                    this.form.user_id = property.user_id || null;
                    this.form.title = property.title;
                    this.form.description = property.description;
                    this.form.address = property.address;
                    this.form.city = property.city || ""; // Add if applicable
                    this.form.state = property.state || ""; // Add if applicable
                    this.form.zip_code = property.zip_code || ""; // Add if applicable
                    this.form.longitude = property.longitude || ""; // Add if applicable
                    this.form.latitude = property.latitude || ""; // Add if applicable
                    this.form.price = property.price;
                    this.form.bedrooms = property.bedrooms || null; // Add if applicable
                    this.form.square_feet = property.square_feet || null; // Add if applicable
                    this.form.lot_size = property.lot_size || null; // Add if applicable
                    this.form.property_type = property.property_type || ""; // Add if applicable
                    this.form.listing_type = property.listing_type || ""; // Add if applicable
                    this.form.year_built = property.year_built || null; // Add if applicable
                    this.form.hoa_id = property.hoa_id || null; // Add if applicable
                    this.form.association_fee =
                        property.association_fee || null; // Add if applicable
                    this.form.cic = property.cic || null; // Add if applicable
                    this.form.school_id = property.school_id || null; // Add if applicable
                    this.form.community_id = property.community_id || ""; // Add if applicable
                    //this.form.home_main_image = property.home_main_image;
                    this.existing_home_main_image = property.home_main_image;
                    this.existing_banner = property.banner;
                    // Populate Property Features
                    this.form.incentives = property.incentives; // Ensure this is an array
                    if (response.data.tour_price_includes.length) {
                        this.FloorPlanList = response.data.tour_price_includes;
                    }

                    if (property.feature) {
                        this.form.feature_id = property.feature.id || null;
                        this.form.name = property.feature.name || "";
                        this.form.fireplace_type =
                            property.feature.fireplace_type || "";
                        this.form.kitchen_pantry_type =
                            property.feature.kitchen_pantry_type || "";
                        this.form.reach_in = property.feature.reach_in || null;
                        this.form.walk_in = property.feature.walk_in || null;
                        this.form.laundry_closet =
                            property.feature.laundry_closet || "";
                        this.form.closet_location =
                            property.feature.closet_location || "";
                        this.form.bedroom_location =
                            property.feature.bedroom_location || "";
                        this.form.bathroom_type =
                            property.feature.bathroom_type || "";
                        this.form.bathroom_status =
                            property.feature.bathroom_status || "";
                        this.form.pool_shape =
                            property.feature.pool_shape || "";
                        this.form.water_features =
                            property.feature.water_features || "";
                        this.form.pool_status =
                            property.feature.pool_status || "";
                        this.form.spa = property.feature.spa || null;
                        this.form.fencing_material =
                            property.feature.fencing_material || "";
                        this.form.fencing_status =
                            property.feature.fencing_status || "";
                        this.form.parking_enclosure =
                            property.feature.parking_enclosure || "";
                        this.form.private_bath =
                            property.feature.private_bath || null;
                        this.form.outdoor_shower =
                            property.feature.outdoor_shower || null;
                        this.form.landscape_maintenance =
                            property.feature.landscape_maintenance || "";
                        this.form.foundation_conditions =
                            property.feature.foundation_conditions || "";

                            this.form.price_from = response.data.price_from || "";
                            this.form.price_to = response.data.price_to || "";
                            this.form.stories = response.data.stories || "";
                            this.form.full_bath = response.data.full_bath || "";
                            this.form.half_bath = response.data.half_bath || "";
                            this.form.size_from = response.data.size_from || "";
                            this.form.size_to = response.data.size_to || "";
                            this.form.construction_status = response.data.construction_status || "";
                            this.form.listing_status = response.data.listing_status || "";
                            this.form.average_price_per_square = response.data.average_price_per_square || "";
                    }

                    // Optional: If there's an image field
                    // this.home_main_image = property.home_main_image || ""; // Assign image if applicable
                    this.form.listing_date = property.listing_date || ""; // Assign image if applicable
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },

        pluckCommunities() {
            axios
                .get("/api/communities/pluck")
                .then((response) => {
                    this.communities_options = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        pluckIncentives() {
            axios
                .get("/api/pluck/incentives")
                .then((response) => {
                    this.incentivesOptions = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },

        croppedImgSubmit(img) {
            this.form.home_main_image = img;
        },
        croppedBannerSubmit(img) {
            this.form.banner = img;
        },

        submit() {
            this.formStatus = false;

            // Create a FormData object
            let formData = new FormData();
            function isFieldEmpty(field) {
                return (
                    field === null ||
                    field === undefined ||
                    field === "" ||
                    (Array.isArray(field) && field.length === 0)
                );
            }
            // Append each form field individually
            formData.append("property_id", this.form.property_id ?? "");
            formData.append("user_id", this.form.user_id ?? null);
            formData.append("title", this.form.title ?? "");
            formData.append("description", this.form.description ?? "");
            formData.append("address", this.form.address ?? "");
            formData.append("city", this.form.city ?? "");
            formData.append("state", this.form.state ?? "");
            formData.append("zip_code", this.form.zip_code ?? "");
            formData.append("latitude", this.form.latitude ?? "");
            formData.append("longitude", this.form.longitude ?? "");
            formData.append("price", this.form.price ?? null);
            formData.append("bedrooms", this.form.bedrooms ?? null);
            formData.append("square_feet", this.form.square_feet ?? null);
            formData.append("lot_size", this.form.lot_size ?? null);
            formData.append("property_type", this.form.property_type ?? "");
            formData.append("listing_type", this.form.listing_type ?? "");
            formData.append("year_built", this.form.year_built ?? null);
            formData.append("hoa_id", this.form.hoa_id ?? null);
            formData.append("price_from", this.form.price_from ?? null);
            formData.append("price_to", this.form.price_to ?? null);
            formData.append("stories", this.form.stories ?? null);
            formData.append("full_bath", this.form.full_bath ?? null);
            formData.append("half_bath", this.form.half_bath ?? null);
            formData.append("size_from", this.form.size_from ?? null);
            formData.append("size_to", this.form.size_to ?? null);
            formData.append("construction_status", this.form.construction_status ?? null);
            formData.append("listing_status", this.form.listing_status ?? null);
            formData.append("average_price_per_square", this.form.average_price_per_square ?? null);

            formData.append(
                "association_fee",
                this.form.association_fee ?? null
            );
            formData.append("cic", this.form.cic ?? null);
            formData.append("school_id", this.form.school_id ?? null);
            formData.append("community_id", this.form.community_id ?? null);

            // Property Features Fields
            formData.append("feature_id", this.form.feature_id ?? null);
            formData.append("name", this.form.name ?? "");
            formData.append("fireplace_type", this.form.fireplace_type ?? "");
            formData.append(
                "kitchen_pantry_type",
                this.form.kitchen_pantry_type ?? ""
            );
            formData.append("reach_in", this.form.reach_in ?? null);
            formData.append("walk_in", this.form.walk_in ?? null);
            formData.append("laundry_closet", this.form.laundry_closet ?? "");
            formData.append("closet_location", this.form.closet_location ?? "");
            formData.append(
                "bedroom_location",
                this.form.bedroom_location ?? ""
            );
            formData.append("bathroom_type", this.form.bathroom_type ?? "");
            formData.append("bathroom_status", this.form.bathroom_status ?? "");
            formData.append("pool_shape", this.form.pool_shape ?? "");
            formData.append("water_features", this.form.water_features ?? "");
            formData.append("pool_status", this.form.pool_status ?? "");
            formData.append("spa", this.form.spa ?? null);
            formData.append(
                "fencing_material",
                this.form.fencing_material ?? ""
            );
            formData.append("fencing_status", this.form.fencing_status ?? "");
            formData.append(
                "parking_enclosure",
                this.form.parking_enclosure ?? ""
            );
            formData.append("private_bath", this.form.private_bath ?? null);
            formData.append("outdoor_shower", this.form.outdoor_shower ?? null);
            formData.append(
                "landscape_maintenance",
                this.form.landscape_maintenance ?? ""
            );
            formData.append(
                "foundation_conditions",
                this.form.foundation_conditions ?? ""
            );
            formData.append("listing_date", this.form.listing_date ?? "");
            formData.append("files", this.form.files ?? null); // Assuming `files` can be a File or Blob
            formData.append("home_main_image", this.form.home_main_image ?? "");
            formData.append("banner", this.form.banner ?? "");

            if (!isFieldEmpty(this.FloorPlanList)) {
                formData.append(
                    "price_includes",
                    JSON.stringify(this.FloorPlanList)
                );
            }

            // Append all selected files to FormData
            if (this.form.files && this.form.files.length > 0) {
                this.form.files.forEach((file) => {
                    formData.append("files[]", file); // Append each file
                });
            }

            formData.append(
                "incentives",
                this.form.incentives.length > 0
                    ? JSON.stringify(this.form.incentives)
                    : ""
            );

            // Submit the form data using axios
            axios
                .post("/api/property/store", formData, {
                    headers: {
                        "Content-Type": "multipart/form-data", // Set the content type for file uploads
                    },
                })
                .then((response) => {
                    this.formStatus = true;
                    toastr.success(
                        this.translate("Property saved successfully")
                    );
                    this.formErrors = [];
                    // Redirect after a brief delay
                    if (this.property_id) {
                        // Use backticks for template literals and concatenate the property_id properly
                        window.location.href = `/property/details/${this.property_id}`;
                    } else {
                        window.location.href = "/properties";
                    }
                })
                .catch((error) => {
                    this.formStatus = true;
                    // Display error messages
                    toastr.error(
                        error.response?.data?.message || "An error occurred."
                    );
                    if (error.response?.data?.errors) {
                        this.formErrors = error.response.data.errors;
                    }
                });
        },
        pluckSchools() {
            axios
                .get("/api/schools/pluck/")
                .then((response) => {
                    this.schoolOptions = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
        pluckHoas() {
            axios
                .get("/api/home/owners/pluck/")
                .then((response) => {
                    this.hoasOptions = response.data;
                })
                .catch((error) => {
                    toastr.error(error.response.data.message);
                });
        },
    },
};
</script>
