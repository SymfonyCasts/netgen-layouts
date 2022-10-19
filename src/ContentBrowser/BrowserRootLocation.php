<?php

namespace App\ContentBrowser;

use Netgen\ContentBrowser\Item\LocationInterface;

class BrowserRootLocation implements LocationInterface
{
    public function getLocationId()
    {
        return 0;
    }

    public function getName(): string
    {
        return 'All';
    }

    public function getParentId()
    {
        return null;
    }
}
