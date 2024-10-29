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
        Schema::create('community_las_vegas_regions', function (Blueprint $table) {
            $table->char('id', 36)->primary();
            $table->char('community_id', 36);
            $table->char('las_vegas_regions_id', 36);
            $table->timestamps();

            $table->foreign('community_id')->references('id')->on('communities')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('community_las_vegas_regions');
    }
};
