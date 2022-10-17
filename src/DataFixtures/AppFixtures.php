<?php

namespace App\DataFixtures;

use App\Factory\RecipeFactory;
use App\Factory\UserFactory;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        RecipeFactory::createMany(25);

        UserFactory::createOne([
            'email' => 'doggo_admin@barkbite.com',
            'password' => 'woof',
        ]);

        $manager->flush();
    }
}
