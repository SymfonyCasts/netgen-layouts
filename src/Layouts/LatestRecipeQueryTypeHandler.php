<?php

namespace App\Layouts;

use App\Repository\RecipeRepository;
use Netgen\Layouts\API\Values\Collection\Query;
use Netgen\Layouts\Collection\QueryType\QueryTypeHandlerInterface;
use Netgen\Layouts\Parameters\ParameterBuilderInterface;

class LatestRecipeQueryTypeHandler implements QueryTypeHandlerInterface
{
    public function __construct(private RecipeRepository $recipeRepository)
    {
    }

    public function buildParameters(ParameterBuilderInterface $builder): void
    {
    }

    public function getValues(Query $query, int $offset = 0, ?int $limit = null): iterable
    {
        return $this->recipeRepository->createQueryBuilderOrderedByNewest()
            ->setFirstResult($offset)
            ->setMaxResults($limit)
            ->getQuery()
            ->getResult();
    }

    public function getCount(Query $query): int
    {
        return $this->recipeRepository->createQueryBuilderOrderedByNewest()
            ->select('COUNT(recipe.id)')
            ->getQuery()
            ->getSingleScalarResult();
    }

    public function isContextual(Query $query): bool
    {
        return false;
    }
}
