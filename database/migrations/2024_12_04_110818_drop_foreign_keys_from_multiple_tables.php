<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        DB::statement('ALTER TABLE country_banks DROP FOREIGN KEY IF EXISTS banks_country_id_fk');
        DB::statement('ALTER TABLE recipients DROP FOREIGN KEY IF EXISTS recipients_bank_id_fk');
        DB::statement('ALTER TABLE recipients DROP FOREIGN KEY IF EXISTS recipients_currency_id_foreign_fk');
    }

    public function down(): void
    {
        DB::statement('ALTER TABLE country_banks DROP FOREIGN KEY IF EXISTS banks_country_id_fk');
        DB::statement('ALTER TABLE recipients DROP FOREIGN KEY IF EXISTS recipients_bank_id_fk');
        DB::statement('ALTER TABLE recipients DROP FOREIGN KEY IF EXISTS recipients_currency_id_foreign_fk');

        DB::statement('ALTER TABLE country_banks ADD CONSTRAINT banks_country_id_fk FOREIGN KEY (country_id) REFERENCES countries(id) ON DELETE CASCADE');
        DB::statement('ALTER TABLE recipients ADD CONSTRAINT recipients_bank_id_fk FOREIGN KEY (bank_id) REFERENCES country_banks(id) ON DELETE CASCADE');
        DB::statement('ALTER TABLE recipients ADD CONSTRAINT recipients_currency_id_foreign_fk FOREIGN KEY (bank_id) REFERENCES country_currency(id) ON DELETE CASCADE');
    }
};

