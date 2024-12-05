<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLaravelTable extends Migration
{
    public function up()
    {
        Schema::create('laravel', function (Blueprint $table) {
            $table->id(); // Crea la columna id
            $table->string('name'); // Crea la columna name
            $table->string('email')->unique(); // Crea la columna email, debe ser única
            $table->timestamps(); // Crea las columnas created_at y updated_at
        });
    }

    public function down()
    {
        Schema::dropIfExists('laravel');
    }
}
