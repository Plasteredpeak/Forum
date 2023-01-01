<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::factory()->create([
            'name' => 'Admin',
            'email' => 'admin@pp.com',
            'bio' => 'I am the admin of this forum.',
            'password' => bcrypt('pp'),
            'type' => User::ADMIN,
        ]);
        User::factory()->create([
            'name' => 'Pepe',
            'email' => 'pepe@pp.com',
            'bio' => 'I am the admin of this forum.',
            'password' => bcrypt('pepe'),
            'type' => User::DEFAULT,
        ]);

        User::factory()->create([
            'name' => 'Ali',
            'email' => 'ali@pp.com',
            'bio' => 'I am the admin of this forum.',
            'password' => bcrypt('ali'),
            'type' => User::DEFAULT,
        ]);
        User::factory()->create([
            'name' => 'Hamza',
            'email' => 'hamza@pp.com',
            'bio' => 'I am the admin of this forum.',
            'password' => bcrypt('hamza'),
            'type' => User::DEFAULT,
        ]);
    }
}
