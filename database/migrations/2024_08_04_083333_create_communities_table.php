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
        Schema::create('communities', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->string('name');
            $table->text('description')->nullable();
            $table->text('location')->nullable();
            $table->uuid('amenity_id')->nullable();
            $table->uuid('hoa_id')->nullable();
            $table->uuid('neighborhood_id')->nullable();
            $table->uuid('las_vegas_region_id')->nullable();
            $table->text('files')->nullable();
            $table->text('map_location')->nullable();
            $table->string('legal_subdivision', 100)->nullable();
            $table->text('nearby_properties')->nullable();
            $table->string('masterplan', 100)->nullable();
            $table->string('sub_association', 100)->nullable();
            $table->string('cic', 100)->nullable();
            $table->string('lid', 100)->nullable();
            $table->string('cid', 100)->nullable();
            $table->decimal('sid_lid_fee', 10, 2)->nullable();
            $table->text('sid_lid_payment_frequency')->nullable();
            $table->decimal('proximity_to_strip', 8, 2)->nullable();
            $table->decimal('proximity_to_airport', 8, 2)->nullable();
            $table->text('nearby_attractions')->nullable();
            $table->timestamps();

            // Define foreign key constraints
            $table->foreign('amenity_id')->references('id')->on('amenities')->onDelete('set null');
            $table->foreign('hoa_id')->references('id')->on('hoa')->onDelete('set null');
 
            $table->foreign('neighborhood_id')->references('id')->on('neighborhoods')->onDelete('set null');
            $table->foreign('las_vegas_region_id')->references('id')->on('las_vegas_regions')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('communities');
    }
};
