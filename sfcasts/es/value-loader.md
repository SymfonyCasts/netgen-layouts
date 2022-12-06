# Cargador de valores + Plantilla de vista previa

Así que nuestro navegador de contenidos funcionaba de maravilla... hasta que seleccionamos un elemento. En ese momento, eligió hacer una cosa extraña: ¡explotar! La llamada Ajax que falló dice

> El cargador de valores para el tipo de valor `doctrine_recipe` no existe.

Para repasar: tenemos un tipo de valor personalizado llamado `doctrine_recipe`, que creamos para poder añadir cuadrículas y listas de entidades `Recipe`. Para que esto funcione, tenemos (1): un conversor de valores para convertir los objetos `Recipe` a un formato que entiendan los diseños. (2) una clase de consulta que nos permita utilizar colecciones dinámicas. (3) una clase de backend de navegador para permitirnos seleccionar elementos manuales. Y ahora (4), necesitamos un cargador de valores que sea capaz de tomar el "id" de estos elementos seleccionados manualmente y convertirlos en objetos`Recipe`. Ésta será la última "cosa" que necesitaremos para nuestro tipo de valor, ¡lo prometo!

## Crear y etiquetar el cargador de valores

Dentro del directorio `src/Layouts/`, crea una nueva clase llamada `RecipeValueLoader`, haz que implemente `ValueLoaderInterface` y genera los dos métodos que necesita:

[[[ code('7cce1d8148') ]]]

Son bastante sencillos. Pero, antes de rellenarlos, vuelve a la ruta Ajax y actualiza para ver... exactamente el mismo error. ¿Por qué? Como hemos visto con otras cosas, necesitamos "asociar" este `RecipeValueLoader` a nuestro tipo de valor `doctrine_recipe`. ¿Cómo? Sin sorpresas Con una etiqueta. Digamos `#[AutoconfigureTag()]` y esta vez se llama`netgen_layouts.cms_value_loader`. Para el segundo argumento, pasa `value_type`ajustado a `doctrine_recipe`:

[[[ code('c159ed4925') ]]]

¡Perfecto! Si recargamos ahora... ¡mejor! Ese error se debe a que aún no hemos rellenado la lógica.

## Añadir la lógica

Muy sencillo, necesitamos tomar el ID y devolver el objeto `Recipe`. Para ello, crea un constructor que acepte un argumento `RecipeRepository $recipeRepository`. Y... déjame limpiar las cosas:

[[[ code('cc9b050ad5') ]]]

Ahora, aquí abajo, devuelve `$this->recipeRepository->find()` y pasa `$id`. Para `loadByRemoteId()`, que sólo necesitamos si vamos a utilizar la función de importación para mover contenido entre bases de datos, sólo `return $this->load($id)`:

[[[ code('b35971e7e8') ]]]

Y ahora... ¡la llamada Ajax funciona! Y lo que es más importante, si actualizamos todo el administrador de diseños... ¡sí! ¡Mira nuestra cuadrícula! ¡Tenemos cuatro elementos manuales! ¡Eso es genial! Podemos reordenarlos si queremos, añadir más, eliminarlos, lo que sea.

Prueba a publicar esta página y luego recarga la página de inicio. ¡Ahí están! Aunque faltan nuestras "últimas recetas". ¡Vaya! Creo que accidentalmente también cambié esto a una colección manual. Vuelve a cambiarla a una colección dinámica, se ve bien, publica y.... ahora... genial: todo está de vuelta.

## Añadir la vista previa

Así que ya podemos seleccionar elementos manuales a través del navegador de contenido... aunque cuando añadimos originalmente la configuración para todo esto, establecimos una plantilla de vista previa... ¡pero nunca la creamos!

Abramos de nuevo el navegador de contenidos. Entonces, en la rejilla manual, pulsa "Añadir elementos". La plantilla de vista previa activa el modo de vista previa aquí arriba. Si hacemos clic en un elemento, nos muestra una vista previa. Bueno, lo haría... excepto porque en realidad no hemos añadido esa plantilla.

Para que esto funcione, tenemos que hacer dos pequeñas cosas. Primero, abrir`RecipeBrowserBackend`. Aquí nos hemos saltado algunos métodos. Por ejemplo, omitimos`getSubLocations()` y `getSubLocationsCount()` porque sólo son necesarios si tienes una jerarquía de ubicaciones.

También nos hemos saltado `loadItem()`. Se utiliza para la vista previa. Nos pasará el ID de lo que se ha cargado y necesitamos devolver un `ItemInterface`. Así de sencillo, podemos devolver un `new RecipeBrowserItem()` -que es la pequeña clase que envuelve al `Recipe` - pasando `$this->recipeRepository->find($value)`:

[[[ code('ad54a52f5a') ]]]

¡Genial! Lo único que tenemos que hacer es... ¡crear la plantilla de vista previa! En `templates/nglayouts/`, añade un nuevo directorio llamado `content_browser/`, y dentro, un nuevo archivo llamado `recipe_preview.html.twig`. Para empezar, sólo tienes que imprimir la función`dump()`:

[[[ code('6205077d71') ]]]

Lo bueno es que ni siquiera necesitamos actualizar. Mientras hagamos clic en un elemento en el que no hayamos hecho ya clic... ¡funciona! Y mira esta variable `item`: es una instancia de `RecipeBrowserItem`... así que una instancia de esta clase de aquí.

Eso es genial... excepto que `RecipeBrowserItem` no tiene una forma de que obtengamos el objeto `Recipe` real. Afortunadamente, podemos arreglar eso nosotros mismos. Después de todo, ¡esta es nuestra clase! Iré a "Código"->"Generar" para generar un método`getRecipe()`:

[[[ code('d9670de56b') ]]]

Ahora, en la plantilla, podemos decir `{{ item.recipe.name }}`. Y para hacerlo más elegante, añade un `<img` cuyo `src` se establezca en `item.recipe.imageUrl`... también con un atributo `alt`:

[[[ code('49417536d9') ]]]

Una vez más, no necesitamos actualizar. Si haces clic en un elemento que ya has previsualizado, lo cargará desde la memoria. Pero si haces clic en uno nuevo... ¡sí! ¡Ahí está nuestra vista previa! Genial.

Vale, ya hemos terminado con los elementos manuales, el navegador de contenidos y todo esto. Por cierto, hay una forma de añadir más columnas a esta tabla, como nombre de archivo, tamaño de archivo, fecha de creación, etc. No vamos a hablar de eso, pero es totalmente posible.

Comprobación de estado: en este punto, tenemos la capacidad de añadir un diseño a cualquier página, reordenar el contenido de la página, añadir título, texto, bloques HTML, o incluso listas y cuadrículas de recetas dinámicas. Eso es mucho poder. ¡Ahora quiero más poder! Quiero que sea posible utilizar la cuadrícula y los bloques de lista para añadir otros elementos a nuestra página... elementos que no viven en absoluto en nuestra base de datos. Eso a continuación.
