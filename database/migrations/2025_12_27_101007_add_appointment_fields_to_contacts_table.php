<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::table('contacts', function (Blueprint $table) {
            $table->date('appointment_date')->nullable()->after('contacted_from');
            $table->string('appointment_time', 10)->nullable()->after('appointment_date');
            $table->index(['appointment_date', 'appointment_time']); // For faster queries
        });
    }

    public function down()
    {
        Schema::table('contacts', function (Blueprint $table) {
            $table->dropIndex(['appointment_date', 'appointment_time']);
            $table->dropColumn(['appointment_date', 'appointment_time', 'appointment_reference']);
        });
    }
};
