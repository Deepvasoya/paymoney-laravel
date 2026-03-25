<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        DB::statement("UPDATE `virtual_card_methods`
            SET `form_field` = '{
                \"FirstName\": {
                    \"field_name\": \"FirstName\",
                    \"field_level\": \"First Name\",
                    \"field_place\": \"John\",
                    \"type\": \"text\",
                    \"validation\": \"required\"
                },
                \"LastName\": {
                    \"field_name\": \"LastName\",
                    \"field_level\": \"Last Name\",
                    \"field_place\": \"Doe\",
                    \"type\": \"text\",
                    \"validation\": \"required\"
                },
                \"CustomerEmail\": {
                    \"field_name\": \"CustomerEmail\",
                    \"field_level\": \"Email\",
                    \"field_place\": \"john.doe@bug2.com\",
                    \"type\": \"email\",
                    \"validation\": \"required\"
                },
                \"PhoneNumber\": {
                    \"field_name\": \"PhoneNumber\",
                    \"field_level\": \"Phone Number\",
                    \"field_place\": \"+14155551234\",
                    \"type\": \"text\",
                    \"validation\": \"required\"
                },
                \"Line1\": {
                    \"field_name\": \"Line1\",
                    \"field_level\": \"Address Line 1\",
                    \"field_place\": \"123 Main St.\",
                    \"type\": \"text\",
                    \"validation\": \"required\"
                },
                \"Line2\": {
                    \"field_name\": \"Line2\",
                    \"field_level\": \"Address Line 2\",
                    \"field_place\": \"123 Main St.\",
                    \"type\": \"text\",
                    \"validation\": \"\"
                },
                \"City\": {
                    \"field_name\": \"City\",
                    \"field_level\": \"City\",
                    \"field_place\": \"San Francisco\",
                    \"type\": \"text\",
                    \"validation\": \"required\"
                },
                \"State\": {
                    \"field_name\": \"State\",
                    \"field_level\": \"State\",
                    \"field_place\": \"CA\",
                    \"type\": \"text\",
                    \"validation\": \"required\"
                },
                \"Country\": {
                    \"field_name\": \"Country\",
                    \"field_level\": \"Country\",
                    \"field_place\": \"USA\",
                    \"type\": \"text\",
                    \"validation\": \"required\"
                },
                \"PostalCode\": {
                    \"field_name\": \"PostalCode\",
                    \"field_level\": \"Postal Code\",
                    \"field_place\": \"\",
                    \"type\": \"text\",
                    \"validation\": \"\"
                },
                \"DateOfBirth\": {
                    \"field_name\": \"DateOfBirth\",
                    \"field_level\": \"Date Of Birth\",
                    \"field_place\": \"1995-05-15\",
                    \"type\": \"date\",
                    \"validation\": \"\"
                }
            }'
            WHERE `virtual_card_methods`.`code` = 'marqeta'");

        DB::statement("UPDATE `virtual_card_methods`
            SET `form_field` = '{
                \"FirstName\": {
                    \"field_name\": \"FirstName\",
                    \"field_level\": \"First Name\",
                    \"field_place\": \"John\",
                    \"type\": \"text\",
                    \"validation\": \"required\"
                },
                \"LastName\": {
                    \"field_name\": \"LastName\",
                    \"field_level\": \"Last Name\",
                    \"field_place\": \"Doe\",
                    \"type\": \"text\",
                    \"validation\": \"required\"
                },
                \"CustomerEmail\": {
                    \"field_name\": \"CustomerEmail\",
                    \"field_level\": \"Email\",
                    \"field_place\": \"john.doe@bug2.com\",
                    \"type\": \"email\",
                    \"validation\": \"required\"
                },
                \"PhoneNumber\": {
                    \"field_name\": \"PhoneNumber\",
                    \"field_level\": \"Phone Number\",
                    \"field_place\": \"+14155551234\",
                    \"type\": \"text\",
                    \"validation\": \"required\"
                },
                \"Line1\": {
                    \"field_name\": \"Line1\",
                    \"field_level\": \"Address Line 1\",
                    \"field_place\": \"123 Main St.\",
                    \"type\": \"text\",
                    \"validation\": \"required\"
                },
                \"Line2\": {
                    \"field_name\": \"Line2\",
                    \"field_level\": \"Address Line 2\",
                    \"field_place\": \"123 Main St.\",
                    \"type\": \"text\",
                    \"validation\": \"\"
                },
                \"City\": {
                    \"field_name\": \"City\",
                    \"field_level\": \"City\",
                    \"field_place\": \"San Francisco\",
                    \"type\": \"text\",
                    \"validation\": \"required\"
                },
                \"State\": {
                    \"field_name\": \"State\",
                    \"field_level\": \"State\",
                    \"field_place\": \"CA\",
                    \"type\": \"text\",
                    \"validation\": \"required\"
                },
                \"Country\": {
                    \"field_name\": \"Country\",
                    \"field_level\": \"Country\",
                    \"field_place\": \"USA\",
                    \"type\": \"text\",
                    \"validation\": \"required\"
                },
                \"PostalCode\": {
                    \"field_name\": \"PostalCode\",
                    \"field_level\": \"Postal Code\",
                    \"field_place\": \"\",
                    \"type\": \"text\",
                    \"validation\": \"required\"
                },
                \"DateOfBirth\": {
                    \"field_name\": \"DateOfBirth\",
                    \"field_level\": \"Date Of Birth\",
                    \"field_place\": \"1995-05-15\",
                    \"type\": \"date\",
                    \"validation\": \"required\"
                },
                \"PassportId\": {
                    \"field_name\": \"PassportId\",
                    \"field_level\": \"Passport Id\",
                    \"field_place\": \"1234567898\",
                    \"type\": \"number\",
                    \"validation\": \"required\"
                }
            }'
            WHERE `virtual_card_methods`.`code` = 'rapyd'");

        DB::statement("UPDATE `virtual_card_methods` SET `form_field` = '{
            \"FirstName\": {
                \"field_name\": \"FirstName\",
                \"field_level\": \"First Name\",
                \"field_place\": \"John\",
                \"type\": \"text\",
                \"validation\": \"required\"
            },
            \"LastName\": {
                \"field_name\": \"LastName\",
                \"field_level\": \"Last Name\",
                \"field_place\": \"Doe\",
                \"type\": \"text\",
                \"validation\": \"required\"
            },
            \"CustomerEmail\": {
                \"field_name\": \"CustomerEmail\",
                \"field_level\": \"Email\",
                \"field_place\": \"john.doe@example.com\",
                \"type\": \"email\",
                \"validation\": \"required\"
            },
            \"PhoneNumber\": {
                \"field_name\": \"PhoneNumber\",
                \"field_level\": \"Phone Number\",
                \"field_place\": \"1234567890\",
                \"type\": \"text\",
                \"validation\": \"required\"
            },
            \"DateOfBirth\": {
                \"field_name\": \"DateOfBirth\",
                \"field_level\": \"Date Of Birth\",
                \"field_place\": \"mm/dd/yyyy\",
                \"type\": \"date\",
                \"validation\": \"required\"
            },
            \"IdImage\": {
                \"field_name\": \"IdImage\",
                \"field_level\": \"ID Card Image URL\",
                \"field_place\": \"http://example.com/idcard.jpg\",
                \"type\": \"url\",
                \"validation\": \"required\"
            },
            \"UserPhoto\": {
                \"field_name\": \"UserPhoto\",
                \"field_level\": \"User Photo URL\",
                \"field_place\": \"http://example.com/photo.jpg\",
                \"type\": \"url\",
                \"validation\": \"required\"
            },
            \"HouseNumber\": {
                \"field_name\": \"HouseNumber\",
                \"field_level\": \"House Number\",
                \"field_place\": \"10A\",
                \"type\": \"text\",
                \"validation\": \"required\"
            },
            \"Line1\": {
                \"field_name\": \"Line1\",
                \"field_level\": \"Address Line 1\",
                \"field_place\": \"Nii Kwabena Bonnie Crescent\",
                \"type\": \"text\",
                \"validation\": \"required\"
            },
            \"City\": {
                \"field_name\": \"City\",
                \"field_level\": \"City\",
                \"field_place\": \"Accra\",
                \"type\": \"text\",
                \"validation\": \"required\"
            },
            \"State\": {
                \"field_name\": \"State\",
                \"field_level\": \"State\",
                \"field_place\": \"Accra\",
                \"type\": \"text\",
                \"validation\": \"required\"
            },
            \"Country\": {
                \"field_name\": \"Country\",
                \"field_level\": \"Country\",
                \"field_place\": \"Ghana\",
                \"type\": \"text\",
                \"validation\": \"required\"
            },
            \"ZipCode\": {
                \"field_name\": \"ZipCode\",
                \"field_level\": \"Zip Code\",
                \"field_place\": \"94105\",
                \"type\": \"text\",
                \"validation\": \"required\"
            },
            \"IdType\": {
                \"field_name\": \"IdType\",
                \"field_level\": \"ID Type\",
                \"field_place\": \"PASSPORT,BVN,NIN\",
                \"type\": \"text\",
                \"validation\": \"required\"
            },
            \"IdNumber\": {
                \"field_name\": \"IdNumber\",
                \"field_level\": \"ID Number\",
                \"field_place\": \"123456789\",
                \"type\": \"text\",
                \"validation\": \"required\"
            }
        }' WHERE `virtual_card_methods`.`code` = 'strowallet'");

    }

    public function down(): void
    {
        //
    }
};
