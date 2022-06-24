<?php

namespace App\Traits;

trait HasTimestamps{
    public function createdAt()
    {
        return $this->created_at->format('d-m-y');
    }

    public function updatedAt()
    {
        return $this->updated_at->format('d-m-y');
    }
}