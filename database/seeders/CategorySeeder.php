<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $categories = ['Anime', 'Gaming', 'Coding', 'Movies', 'Series'];
        $now = Carbon::now();

        foreach ($categories as $category) {
            DB::table('categories')->updateOrInsert(
                ['name' => $category],
                [
                    'slug' => Str::slug($category),
                    'updated_at' => $now,
                    'created_at' => $now,
                ]
            );
        }
    }
}
