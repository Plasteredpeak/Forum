<?php

namespace Database\Seeders;

use App\Models\Category;
use App\Models\Reply;
use App\Models\Tag;
use App\Models\Thread;
use App\Models\User;
use Carbon\Carbon;
use Faker\Factory;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

class ThreadSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Factory::create();
        $users = User::all();

        if ($users->isEmpty()) {
            return;
        }

        $categories = Category::query()->get()->keyBy('slug');
        $tags = Tag::query()->get()->keyBy('slug');

        $topicsByCategory = [
            'anime' => [
                'Best new anime this season?',
                'Character development hot takes',
                'Manga vs anime adaptation discussion',
                'Most emotional anime moments',
                'Underrated anime recommendations',
            ],
            'gaming' => [
                'Patch notes discussion',
                'Ranked grind tips for beginners',
                'Is the new update balanced?',
                'Best co-op games right now',
                'Controller vs keyboard debate',
            ],
            'coding' => [
                'How to debug this issue efficiently',
                'Laravel architecture best practices',
                'API design feedback thread',
                'Tips for cleaner code reviews',
                'Beginner roadmap to web development',
            ],
            'movies' => [
                'Most anticipated releases this year',
                'Top 10 plot twists discussion',
                'Favorite movie soundtrack picks',
                'Best sci-fi films to rewatch',
                'Movie recommendations for weekend',
            ],
            'series' => [
                'Series finale reactions',
                'What are you binge-watching now?',
                'Best first episodes ever',
                'Most underrated streaming series',
                'Weekly episode discussion',
            ],
        ];

        $tagsByCategory = [
            'anime' => ['naruto', 'one-piece', 'attack-on-titan', 'demon-slayer', 'jujutsu-kaisen', 'chainsaw-man'],
            'gaming' => ['valorant', 'cs2', 'minecraft', 'elden-ring', 'genshin-impact', 'league-of-legends', 'dota-2'],
            'coding' => ['php', 'laravel', 'javascript', 'python', 'react', 'debugging', 'algorithms', 'devops'],
            'movies' => ['marvel', 'dc', 'sci-fi', 'horror', 'action', 'comedy', 'christopher-nolan'],
            'series' => ['netflix', 'hbo', 'crime', 'fantasy', 'sitcom', 'k-drama'],
        ];

        $globalTagSlugs = ['question', 'guide', 'review', 'recommendation', 'news'];
        $threadCount = 130;

        for ($i = 1; $i <= $threadCount; $i++) {
            $categorySlug = array_rand($topicsByCategory);
            $category = $categories->get($categorySlug);

            if (! $category) {
                continue;
            }

            $baseTitle = $faker->randomElement($topicsByCategory[$categorySlug]);
            $title = $baseTitle . ' #' . $i;
            $threadCreatedAt = Carbon::instance($faker->dateTimeBetween('-8 months', '-1 day'));

            $thread = Thread::create([
                'title' => $title,
                'body' => $this->buildThreadBody($faker, $categorySlug),
                'slug' => Str::slug($title . '-' . Str::lower(Str::random(5))),
                'category_id' => $category->id,
                'author_id' => $users->random()->id,
                'created_at' => $threadCreatedAt,
                'updated_at' => $threadCreatedAt,
            ]);

            $categoryTagIds = collect($tagsByCategory[$categorySlug])
                ->map(function ($slug) use ($tags) {
                    return optional($tags->get($slug))->id;
                })
                ->filter()
                ->values();

            $globalTagIds = collect($globalTagSlugs)
                ->map(function ($slug) use ($tags) {
                    return optional($tags->get($slug))->id;
                })
                ->filter()
                ->values();

            $selectedCategoryTags = $categoryTagIds->isEmpty()
                ? new Collection()
                : $categoryTagIds->shuffle()->take(rand(1, min(3, $categoryTagIds->count())));
            $selectedGlobalTags = $globalTagIds->shuffle()->take(rand(0, min(2, $globalTagIds->count())));

            $thread->syncTags(
                $selectedCategoryTags
                    ->merge($selectedGlobalTags)
                    ->unique()
                    ->values()
                    ->all()
            );

            $replyCount = rand(3, 12);

            for ($r = 0; $r < $replyCount; $r++) {
                $replyCreatedAt = Carbon::instance($faker->dateTimeBetween($threadCreatedAt, 'now'));

                $reply = Reply::create([
                    'body' => $faker->paragraph(rand(2, 4), true),
                    'author_id' => $users->random()->id,
                    'replyable_id' => $thread->id,
                    'replyable_type' => Thread::TABLE,
                    'created_at' => $replyCreatedAt,
                    'updated_at' => $replyCreatedAt,
                ]);

                $replyLikers = $this->pickRandomUsers($users, 0, 8);
                foreach ($replyLikers as $user) {
                    $reply->likesRelation()->create(['user_id' => $user->id]);
                }
            }

            $threadLikers = $this->pickRandomUsers($users, 1, 18);
            foreach ($threadLikers as $user) {
                $thread->likesRelation()->create(['user_id' => $user->id]);
            }
        }
    }

    private function buildThreadBody($faker, string $categorySlug): string
    {
        $openers = [
            'anime' => 'I wanted to start a focused anime discussion with specific examples and recommendations.',
            'gaming' => 'Sharing my current gaming experience and looking for practical advice from active players.',
            'coding' => 'I hit this while coding recently and wanted feedback on cleaner and more scalable approaches.',
            'movies' => 'Posting this movie thread to compare opinions, favorites, and unexpected picks.',
            'series' => 'Starting a series thread for weekly reactions, theories, and binge suggestions.',
        ];

        $opening = isset($openers[$categorySlug]) ? $openers[$categorySlug] : 'Wanted to open this for discussion.';

        return $opening . "\n\n" . $faker->paragraph(rand(3, 6), true);
    }

    private function pickRandomUsers(Collection $users, int $min, int $max): Collection
    {
        if ($users->isEmpty()) {
            return new Collection();
        }

        $cap = min($max, $users->count());
        if ($cap <= 0) {
            return new Collection();
        }

        $amount = rand(min($min, $cap), $cap);

        return $users->shuffle()->take($amount);
    }
}
