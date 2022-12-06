# Navegador de contenidos

Ahora podemos incrustar listas, cuadrículas o galerías de recetas en miniatura en cualquier diseño de forma dinámica. ¡Es genial! Y siempre podemos crear más tipos de consulta para, por ejemplo, elegir entre las últimas recetas o las recetas más populares.

Pero, ¿y si pudiéramos seleccionar recetas manualmente? Quizá queramos destacar cuatro recetas concretas en la página de inicio. En el área Diseños, en la rejilla, si cambiamos el "Tipo de colección", podemos cambiar a "Colección manual". Pero entonces... en realidad no podemos seleccionar ningún elemento.

## Activar elementos manuales en la configuración

Para permitir que los elementos (en nuestro caso, las recetas) se seleccionen manualmente, primero tenemos que permitirlo en la configuración. Antes, cuando creamos la configuración `value_types`, pusimos `manual_items` en `false`. Cámbialo a `true`:

[[[ code('3aa8d843eb') ]]]

Y ahora, cuando intentamos acceder a la página, ¡nos aparece un error!

> El backend del Navegador de Contenidos Netgen para el tipo de valor `doctrine_recipe` no existe.

¡Sí! Necesitamos implementar una clase que ayude a los Layouts a navegar por nuestras recetas. Eso se llama "navegador de contenido".

## Configurar el "tipo de elemento" en NetgenContentBrowserBundle

En realidad, añadir un navegador de contenidos se hace mediante un bundle completamente distinto, que puedes utilizar fuera de Netgen Layouts. Es útil si necesitas una interfaz agradable para navegar y seleccionar elementos.

Como el navegador de contenidos se encuentra en un bundle diferente, no es necesario, pero voy a configurarlo con un nuevo archivo de configuración llamado `netgen_content_browser.yaml`. Dentro, establece la clave raíz en `netgen_content_browser` para configurar el "NetgenContentBrowserBundle":

[[[ code('1c69ac62ff') ]]]

Dentro de éste, podemos describir todas las diferentes "cosas manuales" que queremos poder navegar. Para ello, añade una clave `item_types` y, para el primer elemento, coge el nombre interno del tipo de valor - `doctrine_recipe` - para que coincidan, pégalo y dale un nombre. Qué te parece... `Recipes` con un bonito icono de fresa:

[[[ code('e9dc48c00b') ]]]

Lo único que necesitamos aquí es una clave `preview` con una subclave `template`, que pondré `nglayouts/content_browser/recipe_preview.html.twig`:

[[[ code('49389371b1') ]]]

Y asegúrate de escribir "plantilla" correctamente. ¡Uy! De todas formas, estamos poniendo este `preview.template` porque la configuración nos lo exige... pero ya nos preocuparemos de crear esa plantilla más adelante.

## Crear la clase backend

Si nos dirigimos y actualizamos... obtenemos el mismo error. Eso es porque necesitamos una clase backend que se conecte a este nuevo tipo de elemento. Crear un backend es un proceso sencillo, pero requiere algunas clases diferentes.

En el directorio `src/`, vamos a crear un nuevo directorio llamado `ContentBrowser/`... y dentro de él, una clase PHP llamada `RecipeBrowserBackend`. Ésta necesita implementar `BackendInterface`: la de `Netgen\ContentBrowser\Backend`:

[[[ code('5d5db8af16') ]]]

A continuación, ve a "Código"->"Generar" (o `Command`+`N` en un Mac) para implementar los nueve métodos que necesita No te preocupes: no es tan malo como parece:

[[[ code('11375f812d') ]]]

Por último, para vincular esta clase backend al tipo de elemento en nuestra configuración, tenemos que dar a este servicio una etiqueta. Haremos esto de la misma forma que hicimos antes para el tipo de consulta: con `AutoconfigureTag`. De hecho, robaré este `AutoconfigureTag`ya que estoy aquí... pegaré eso... y añadiré la declaración `use` para ello. Esta vez, el nombre de la etiqueta es `netgen_content_browser.backend`, y en lugar de `type`, utiliza`item_type`. Ajústalo a la clave que tenemos en la config: `doctrine_recipe`. Pega y... ¡genial!

[[[ code('9ab7ac990b') ]]]

Esta vez cuando actualizamos... el error ha desaparecido. Añadamos temporalmente una nueva Rejilla al diseño... y elijamos "Colección manual". Ahora... ¡compruébalo! Como tenemos un backend, ¡vemos un botón "Añadir elementos"! Y cuando hacemos clic en él... falla. Eso no debería sorprendernos demasiado... ya que nuestra clase backend sigue estando completamente vacía. Si quieres ver el error exacto, puedes abrir la llamada AJAX.

## Creación de la clase de ubicación

El sistema del navegador de contenidos funciona así: en estos métodos, describimos una "estructura de árbol", algo así como un sistema de archivos. las "ubicaciones" son como directorios y los "elementos" son como los "archivos" o, en nuestro caso, las recetas individuales.

Vamos a simplificar mucho las cosas. En lugar de tener diferentes "directorios" o "categorías" de recetas por las que puedas navegar, vamos a tener un único directorio -o "ubicación"- en el que vivirán todas las recetas. Verás qué aspecto tiene esto en la interfaz de usuario dentro de unos minutos.

Para que esto funcione, dentro de `src/ContentBrowser/`, tenemos que crear una clase que represente una ubicación. La llamaré `BrowserRootLocation`. Esta clase... no es superinteresante: es sólo un poco de fontanería de bajo nivel que debemos tener. Haz que implemente `LocationInterface`, y a continuación, genera los tres métodos que necesitamos:

[[[ code('a77c52d614') ]]]

De nuevo, esta clase representará la única "ubicación". Así que para`getLocationId()`, podemos devolver cualquier cosa. Voy a `return 0`. Verás cómo se utiliza en un segundo. Para `getName()`, esto es lo que se mostrará en la sección de administración. Voy a `return 'All'`. Y para `getParentId()`, `return null`:

[[[ code('c22394843d') ]]]

Si tienes un sistema más complejo con múltiples subdirectorios, podrías crear una jerarquía de ubicaciones.

Muy bien, actualicemos nuestra clase backend para utilizar esto. Aquí arriba, `getSections()`será llamado en cuanto el usuario abra el navegador de contenidos. Nuestro trabajo consiste en devolver todos los "directorios" raíz, o "ubicaciones". Nosotros sólo tenemos uno:`return [new BrowserRootLocation()]`:

[[[ code('b10415bc94') ]]]

Después de llamar a éste, el navegador de contenidos llamará a `getLocationId()` en cada uno de ellos y hará una petición AJAX para obtener más información sobre ellos. En nuestro caso, esto ocurrirá una sola vez cuando el ID sea `0`. Parece raro, pero todo lo que tenemos que hacer es devolver esa misma ubicación: `if ($id === '0')`, y luego`return new BrowserRootLocation()`:

[[[ code('688d1810bb') ]]]

Fíjate en que estoy utilizando `'0'` como cadena, pero... en `getLocationId()` devolvimos un número entero:

[[[ code('2da9792ead') ]]]

Eso es porque el id se pasará a JavaScript y se utilizará en una llamada Ajax. Para cuando llegue aquí, será una cadena. Un pequeño detalle a tener en cuenta.

Al final, por si acaso `throw` a `new \InvalidArgumentException()` y pasa un mensaje sobre una ubicación no válida:

[[[ code('9b451f62e0') ]]]

¡Vale! Así que nuestro backend tiene una ubicación. Para los demás métodos, devolvamos lo más sencillo posible. Deja `loadItem()` vacío por un momento, para`getSubLocations()`, `return []`, para `getSubLocationsCount()`, `return 0`, para`getSubItems()`, `return []`, para `getSubItemsCount()`, `return 0`, para `search()`,`return []`... y finalmente, para `searchCount()`, `return 0`:

[[[ code('1e0c025168') ]]]

Uf... Hablaremos de cada uno de esos métodos más adelante. Pero nuestra clase backend ya es, al menos, algo funcional.

Si volvemos a actualizar el área de administración... hacemos clic en nuestra cuadrícula, y vamos a "Añadir elementos"... ¡se carga! ¡Di "hola" al navegador de contenido! Actualmente está vacío, pero puedes ver el "Todo", que es de nuestra única ubicación. Todavía no hay elementos dentro... porque tenemos que devolverlos desde `getSubItems()`. Hagámoslo a continuación
