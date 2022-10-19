<?php

namespace App\ContentBrowser;

use App\Entity\Recipe;
use Netgen\ContentBrowser\Item\ItemInterface;

class RecipeBrowserItem implements ItemInterface
{
    public function __construct(private Recipe $recipe)
    {
    }

    public function getValue()
    {
        return $this->recipe->getId();
    }

    public function getName(): string
    {
        return $this->recipe->getName();
    }

    public function isVisible(): bool
    {
        return true;
    }

    public function isSelectable(): bool
    {
        return true;
    }
}
