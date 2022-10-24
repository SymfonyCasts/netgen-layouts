<?php

namespace App\Layouts;

use Netgen\Layouts\Block\BlockDefinition\BlockDefinitionHandlerInterface;
use Netgen\Layouts\Block\BlockDefinition\Handler\Plugin;

class VerticalWhitespacePlugin extends Plugin
{
    public static function getExtendedHandlers(): iterable
    {
        yield BlockDefinitionHandlerInterface::class;
    }
}
