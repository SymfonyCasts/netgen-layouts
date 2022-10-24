<?php

namespace App;

use Symfony\Component\Config\Resource\FileResource;
use Symfony\Component\DependencyInjection\ContainerBuilder;
use Symfony\Component\DependencyInjection\Extension\Extension;
use Symfony\Component\DependencyInjection\Extension\PrependExtensionInterface;
use Symfony\Component\Yaml\Yaml;

class AppExtension extends Extension implements PrependExtensionInterface
{
    public function load(array $configs, ContainerBuilder $container)
    {
    }

    public function prepend(ContainerBuilder $container)
    {
        $configFile = __DIR__ . '/../config/prepends/netgen_layouts.yaml';
        $config = Yaml::parse((string) file_get_contents($configFile));
        $container->prependExtensionConfig('netgen_layouts', $config['netgen_layouts']);
        $container->addResource(new FileResource($configFile));
    }
}
