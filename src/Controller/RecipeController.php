<?php

namespace App\Controller;

use App\Entity\Recipe;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class RecipeController extends AbstractController
{
    #[Route('/recipes', name: 'app_recipes')]
    public function recipes(): Response
    {
        return $this->render('recipes/list.html.twig');
    }

    #[Route('/recipes/{slug}', name: 'app_recipes_show')]
    public function recipesShow(Recipe $recipe): Response
    {
        return $this->render('recipes/show.html.twig', [
            'recipe' => $recipe
        ]);
    }
}
