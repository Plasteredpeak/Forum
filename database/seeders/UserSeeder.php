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
            'password' => bcrypt('pp'),
            'type' => User::ADMIN,
        ]);
        User::factory()->create([
            'name' => 'Pepe',
            'email' => 'pepe@pp.com',
            'password' => bcrypt('pepe'),
            'type' => User::DEFAULT,
        ]);

        User::factory()->create([
            'name' => 'Ali',
            'email' => 'ali@pp.com',
            'password' => bcrypt('ali'),
            'type' => User::DEFAULT,
        ]);
        User::factory()->create([
            'name' => 'Hamza',
            'email' => 'hamza@pp.com',
            'password' => bcrypt('hamza'),
            'type' => User::DEFAULT,
        ]);
    }
}
