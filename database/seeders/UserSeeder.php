<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $fixedUsers = [
            [
                'name' => 'Admin',
                'email' => 'admin@pp.com',
                'bio' => 'Forum administrator account for moderation and management.',
                'password' => Hash::make('pp'),
                'type' => User::ADMIN,
            ],
            [
                'name' => 'Guest Tester',
                'email' => 'guest@forum.test',
                'bio' => 'Shared guest account for quickly trying the forum without registration.',
                'password' => Hash::make('guest123'),
                'type' => User::DEFAULT,
            ],
            [
                'name' => 'Pepe',
                'email' => 'pepe@pp.com',
                'bio' => 'Anime fan who hangs out in gaming and movie threads.',
                'password' => Hash::make('pepe'),
                'type' => User::DEFAULT,
            ],
            [
                'name' => 'Ali',
                'email' => 'ali@pp.com',
                'bio' => 'Enjoys coding discussions, debugging tips, and framework comparisons.',
                'password' => Hash::make('ali'),
                'type' => User::DEFAULT,
            ],
            [
                'name' => 'Hamza',
                'email' => 'hamza@pp.com',
                'bio' => 'Community member sharing recommendations across all categories.',
                'password' => Hash::make('hamza'),
                'type' => User::DEFAULT,
            ],
        ];

        foreach ($fixedUsers as $user) {
            User::updateOrCreate(
                ['email' => $user['email']],
                $user + ['email_verified_at' => now()]
            );
        }

        $targetUserCount = 35;
        $currentCount = User::count();

        if ($currentCount < $targetUserCount) {
            User::factory()->count($targetUserCount - $currentCount)->create([
                'bio' => 'Active community member sharing opinions, questions, and tips.',
                'password' => Hash::make('password'),
                'type' => User::DEFAULT,
                'email_verified_at' => now(),
            ]);
        }
    }
}
