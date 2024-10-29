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
        Schema::create('builders_communities', function (Blueprint $table) {
            $table->uuid('id')->primary(); // UUID as primary key
            $table->uuid('community_id'); // Foreign key for community
            $table->uuid('builder_id'); // Foreign key for builder
            $table->timestamps(); // Adds `created_at` and `updated_at` columns

            // Foreign key constraint
            $table->foreign('community_id')->references('id')->on('communities')->onDelete('cascade');
            $table->foreign('builder_id')->references('id')->on('builders')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('builders_communities');
    }
};
