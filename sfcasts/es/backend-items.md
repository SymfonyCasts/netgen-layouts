# Navegador de Contenidos: Devolver los elementos

Nuestro Navegador de Contenidos está funcionando más o menos. Podemos ver nuestra única ubicación... sólo que aún no tenemos ningún resultado. Esto se debe a que, para cualquier ubicación seleccionada, el Navegador de Contenidos llama a `getSubItems()`. Nuestro trabajo aquí es devolver los resultados. En este caso, todas nuestras recetas. Si tuviéramos varias ubicaciones, como recetas divididas en categorías, podríamos utilizar la variable `$location` para devolver el subconjunto. Pero haremos la consulta y devolveremos todas las recetas.

## Consulta en getSubItems()

Para ello, ve a la parte superior de la clase y crea un constructor con`private RecipeRepository $recipeRepository`:

[[[ code('ac8781ae47') ]]]

Luego, aquí abajo en `getSubItems()`, di `$recipes = $this->recipeRepository` y utiliza el mismo método de antes: `->createQueryBuilderOrderedByNewest()`. A continuación añade `->setFirstResult($offset)`... y `->setMaxResults($limit)`. El Navegador de Contenidos viene con la paginación incorporada. Nos pasa el desplazamiento y el límite de la página en la que se encuentre el usuario, lo introducimos en la consulta y todos contentos. Termina con `getQuery()` y `getResult()`:

[[[ code('7e8dbe3aac') ]]]

Fíjate en que `getSubItems()` devuelve un `iterable`... en realidad se supone que es un iterable de algo llamado `ItemInterface`. Así que no podemos devolver simplemente estos objetos `Recipe`.

## Crear la clase envolvente ItemInterface

En su lugar, en `src/ContentBrowser/`, crea otra clase llamada, qué tal`RecipeBrowserItem`. Haz que implemente `ItemInterface` -la de`Netgen\ContentBrowser` - y genera los cuatro métodos que necesita:

[[[ code('1a1751cff2') ]]]

Esta clase será una pequeña envoltura de un objeto `Recipe`. Observa: añade un método `__construct()` con `private Recipe $recipe`:

[[[ code('482ed4182d') ]]]

Ahora, para `getValue()`, esto debería devolver el "identificador", así que`return $this->recipe->getId()`. Para `getName()`, sólo necesitamos algo visual que podamos mostrar, como`$this->recipe->getName()`. Y para `isVisible()`, `return true`. Esto es útil si un `Recipe` puede estar publicado o no. Tenemos una situación similar con`isSelectable()`:

[[[ code('b9f0b9a2f0') ]]]

Si tuvieras un conjunto de reglas en las que quisieras mostrar ciertas recetas pero hacer que no se pudieran seleccionar, podrías `return false` aquí.

Y... ¡ya está! ¡Ha sido fácil!

De vuelta a nuestra clase backend, necesitamos convertir estos objetos `Recipe` en objetos`RecipeBrowserItem`. Podemos hacerlo con `array_map()`. Volveré a utilizar la elegante sintaxis `fn()`, que recibirá un argumento `Recipe $recipe`, seguido de `=> new RecipeBrowserItem($recipe)`. Para el segundo arg, pasa `$recipes`:

[[[ code('67963df200') ]]]

Es una forma elegante de decir

> Recorre todas las recetas del sistema, crea un nuevo `RecipeBrowserItem` para
> cada una, y devuelve esa nueva matriz de elementos.

Muy bien, ¡vamos a ver qué aspecto tiene! Actualiza el diseño, haz clic en la Rejilla, vuelve a "Añadir elementos" y... ¡ya está! ¡Vemos diez elementos!

## Implementando getSubItemsCount()

Pero deberíamos tener varias páginas. Ah, eso es porque seguimos devolviendo `0`desde `getSubItemsCount()`. Vamos a arreglarlo. Roba la consulta de arriba... pega, devuelve esto, quita `setFirstResult()` y `setMaxResults()`, añade `->select('COUNT(recipe.id)')`, y luego llama a `getSingleScalarResult()`al final:

[[[ code('fbdd8b5a6c') ]]]

Y así, cuando actualicemos... y abramos el Navegador de Contenidos... ¡tendremos páginas!

## Añadir la función de búsqueda

Vale, pero ¿podemos buscar recetas? Por supuesto. Podemos aprovechar `search()` y`searchCount()`. Esto es muy sencillo. Roba toda la lógica de `getSubItems()`, pégala en `search()` y pasa `$searchText` al método QueryBuilder, que ya permite este argumento:

[[[ code('e5a8eb27e3') ]]]

Si quieres tener un poco menos de duplicación de código, podrías aislar esto en un método `private` en la parte inferior.

Copia también la lógica del otro método de recuento... pégalo en `searchCount()`, y pásalo también a `$searchText`:

[[[ code('39964ac3c8') ]]]

Y así de fácil, si nos movemos hacia aquí e intentamos buscar... funciona. ¡Estupendo!

Muy bien - selecciona algunos elementos, pulsa "Confirmar" y... ¡oh no! ¡Se rompe! Sigue diciendo "Cargando". Si miras hacia abajo en la barra de herramientas de depuración web, tenemos un error 400. Maldita sea. Cuando lo abrimos, vemos

> El cargador de valores para el tipo de valor `doctrine_recipe` no existe.

Sólo nos falta una pieza final: Una clase muy sencilla llamada "cargador de valores". Eso a continuación.
