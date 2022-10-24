<?php

namespace App\Layouts;

use Netgen\Layouts\Block\BlockDefinition\BlockDefinitionHandlerInterface;
use Netgen\Layouts\Block\BlockDefinition\Handler\Plugin;
use Netgen\Layouts\Parameters\ParameterBuilderInterface;
use Netgen\Layouts\Parameters\ParameterType;

class VerticalWhitespacePlugin extends Plugin
{
    public static function getExtendedHandlers(): iterable
    {
        yield BlockDefinitionHandlerInterface::class;
    }

    public function buildParameters(ParameterBuilderInterface $builder): void
    {
        $builder->add(
            'vertical_whitespace:enabled',
            ParameterType\Compound\BooleanType::class,
            [
                'default_value' => false,
                'label' => 'Enable Vertical Whitespace?',
                'groups' => self::GROUP_DESIGN,
            ],
        );
    }
}
