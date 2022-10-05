<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class MainController extends AbstractController
{
    #[Route('/', name: 'app_homepage')]
    public function homepage()
    {
        return $this->render('main/homepage.html.twig');
    }

    #[Route('/recipes', name: 'app_recipes')]
    public function recipes()
    {
        return $this->render('main/recipes.html.twig');
    }

    #[Route('/recipes/doggo-cake', name: 'app_recipes_show')]
    public function recipesShow()
    {
        return $this->render('main/recipes_show.html.twig');
    }

    #[Route('/skills', name: 'app_skills')]
    public function skills()
    {
        return $this->render('main/skills.html.twig');
    }

    #[Route('/skills/drizzle-honey', name: 'app_skills_show')]
    public function skillsShow()
    {
        return $this->render('main/skills_show.html.twig');
    }
}
