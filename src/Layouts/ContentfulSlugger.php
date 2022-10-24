<?php

namespace App\Layouts;

use Netgen\Layouts\Contentful\Entity\ContentfulEntry;
use Netgen\Layouts\Contentful\Routing\EntrySlugger\FilterSlugTrait;
use Netgen\Layouts\Contentful\Routing\EntrySluggerInterface;
use Symfony\Component\DependencyInjection\Attribute\AutoconfigureTag;

#[AutoconfigureTag('netgen_layouts.contentful.entry_slugger', ['type' => 'skill'])]
class ContentfulSlugger implements EntrySluggerInterface
{
    use FilterSlugTrait;

    public function getSlug(ContentfulEntry $contentfulEntry): string
    {
        return match ($contentfulEntry->getContentType()->getId()) {
            'skill' => '/skills/'.$this->filterSlug($contentfulEntry->get('title')),
            'advertisement' => '/_ad',
            default => throw new \Exception('Invalid type'),
        };
    }
}
