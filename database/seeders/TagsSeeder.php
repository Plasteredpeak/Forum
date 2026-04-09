<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class TagsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $tags = [
            // Anime
            'Naruto', 'One Piece', 'Attack on Titan', 'Demon Slayer', 'Jujutsu Kaisen', 'Chainsaw Man',
            // Gaming
            'Valorant', 'CS2', 'Minecraft', 'Elden Ring', 'Genshin Impact', 'League of Legends', 'Dota 2',
            // Coding
            'PHP', 'Laravel', 'JavaScript', 'Python', 'React', 'Debugging', 'Algorithms', 'DevOps',
            // Movies
            'Marvel', 'DC', 'Sci-Fi', 'Horror', 'Action', 'Comedy', 'Christopher Nolan',
            // Series
            'Netflix', 'HBO', 'Crime', 'Fantasy', 'Sitcom', 'K-Drama',
            // Global
            'Question', 'Guide', 'Review', 'Recommendation', 'News',
        ];

        $now = Carbon::now();

        foreach ($tags as $tag) {
            DB::table('tags')->updateOrInsert(
                ['name' => $tag],
                [
                    'slug' => Str::slug($tag),
                    'updated_at' => $now,
                    'created_at' => $now,
                ]
            );
        }
    }
}
