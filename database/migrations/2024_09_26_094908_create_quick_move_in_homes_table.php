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
        Schema::create('quick_move_in_homes', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->uuid('property_id');
            $table->date('move_in_date');
            $table->text('incentives')->nullable();
            $table->tinyInteger('main_image')->nullable(); // New field for main_image
            $table->timestamps();

            // Foreign key constraint to reference property_id in the properties table
            $table->foreign('property_id')->references('property_id')->on('properties')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('quick_move_in_homes');
    }
};
