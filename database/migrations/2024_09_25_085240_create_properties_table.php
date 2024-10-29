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
        Schema::create('properties', function (Blueprint $table) {
            $table->uuid('property_id')->primary(); // Using UUID as primary key
            $table->unsignedBigInteger('user_id'); // Unsigned Big Integer for user_id
            $table->string('title');
            $table->text('description')->nullable();
            $table->string('address');
            $table->string('city')->nullable();
            $table->string('state')->nullable();
            $table->string('zip_code')->nullable();
            $table->decimal('price', 10, 2)->nullable();
            $table->integer('bedrooms')->nullable();
            $table->decimal('square_feet', 10, 2)->nullable();
            $table->decimal('lot_size', 10, 2)->nullable();
            $table->string('property_type')->nullable();
            $table->string('listing_type')->nullable();
            $table->integer('year_built')->nullable();
            $table->uuid('hoa_id')->nullable(); // Now referencing the correct 'hoa' table with UUID
            $table->decimal('association_fee', 10, 2)->nullable();
            $table->boolean('cic')->nullable();
            $table->char('school_id', 36)->nullable(); // Assuming school is using UUID
            $table->text('files')->nullable(); // New field for files (can store JSON or file paths)
            $table->timestamps();

            // Foreign Key Constraints
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('hoa_id')->references('id')->on('hoa')->onDelete('set null'); // Correct reference to 'hoa'
            $table->foreign('school_id')->references('id')->on('schools')->onDelete('set null');
        });

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('properties');
    }
};
