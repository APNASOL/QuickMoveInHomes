<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('property_features', function (Blueprint $table) {
            $table->uuid('feature_id')->primary(); // UUID as primary key
            $table->uuid('property_id'); // UUID for foreign key reference
            $table->string('name')->nullable();
            $table->text('description')->nullable();
            $table->string('fireplace_type', 50)->nullable(); // YK’s Requirement
            $table->string('kitchen_pantry_type', 50)->nullable(); // YK’s Requirement
            $table->boolean('reach_in')->nullable(); // YK’s Requirement
            $table->boolean('walk_in')->nullable(); // YK’s Requirement
            $table->boolean('laundry_closet')->nullable(); // YK’s Requirement
            $table->string('closet_location', 50)->nullable(); // YK’s Requirement
            $table->string('bedroom_location', 50)->nullable(); // YK’s Requirement
            $table->string('bathroom_type', 50)->nullable(); // YK’s Requirement
            $table->string('bathroom_status', 50)->nullable(); // YK’s Requirement
            $table->string('pool_shape', 50)->nullable(); // YK’s Requirement
            $table->string('water_features', 100)->nullable(); // YK’s Requirement
            $table->string('pool_status', 50)->nullable(); // YK’s Requirement
            $table->boolean('spa')->nullable(); // YK’s Requirement
            $table->string('fencing_material', 50)->nullable(); // YK’s Requirement
            $table->string('fencing_status', 50)->nullable(); // YK’s Requirement
            $table->boolean('parking_enclosure')->nullable(); // YK’s Requirement
            $table->boolean('private_bath')->nullable(); // YK’s Requirement
            $table->boolean('outdoor_shower')->nullable(); // YK’s Requirement
            $table->string('landscape_maintenance', 50)->nullable(); // YK’s Requirement
            $table->string('foundation_conditions', 50)->nullable(); // YK’s Requirement
            $table->timestamps();

            // Foreign Key Constraints
            $table->foreign('property_id')->references('property_id')->on('properties')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('property_features');
    }
};
