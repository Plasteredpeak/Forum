<?php

namespace App\Models;

use App\Traits\HasTags;
use App\Traits\HasLikes;
use App\Traits\HasAuthor;
use App\Traits\HasReplies;
use Illuminate\Support\Str;
use App\Traits\HasSubscriptions;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;
use CyrildeWit\EloquentViewable\Contracts\Viewable;
use CyrildeWit\EloquentViewable\InteractsWithViews;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Thread extends Model implements ReplyAble,SubscriptionAble, Viewable
{
    use HasLikes;
    use HasTags;
    use HasFactory;
    use HasAuthor;
    use HasReplies;
    use HasSubscriptions;
    use InteractsWithViews;
    

    const TABLE = 'threads';
    protected $table = self::TABLE;

    //protected $table = 'threads';

    protected $fillable =[
        'title',
        'body',
        'slug',
        'category_id',
        'author_id',
    ];

    protected $with =[
        'tagsRelation',
        'category',
        'likesRelation',
        'authorRelation',
    ];

    public function category(): BelongsTo
    {
        return $this->belongsTo(Category::class);
    }

    public function except(int $limit = 250): string
    {
        return Str::limit(strip_tags($this->body()),$limit);
    }

    public function replyAbleSubject(): string
    {
        return $this->title();
    }

    public function title(): string
    {
        return $this->title;
    }

    public function slug(): string
    {
        return $this->slug;
    }

    public function id(): int
    {
        return $this->id;
    }

    public function body(): string
    {
        return $this->body;
    }

    public function delete()
    {
        $this->removeTags();

        parent::delete();
    }

    public function scopeForTag(Builder $query,string $tag): Builder
    {
        return $query->whereHas('tagsRelation',function ($query) use ($tag) {
            $query->where('tags.slug',$tag);
        });
    }


}
