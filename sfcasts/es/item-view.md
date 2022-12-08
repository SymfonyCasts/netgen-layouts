# Plantilla de la vista del artículo

Bien, equipo, las cosas tienen buena pinta. Hemos creado un "tipo de valor" de `Recipe`, una consulta personalizada para cargarlos y un convertidor de valores para ayudar a los layouts a entender nuestros objetos de `Recipe`.

Lo que aún no hemos hecho es decirle a Layouts cómo representar un elemento `Recipe`, siendo elemento la palabra que Layouts utiliza para las "cosas" individuales que los bloques de rejilla y lista representan. Y, de hecho, tenemos que decirle a Layouts cómo representar una versión de administrador de un elemento de receta, que se mostrará aquí, así como la versión más importante del elemento en el frontend.

## Añadir una vista de elemento

La forma en que se muestra un elemento se denomina "vista de elemento". Para añadir una nueva vista de artículo, empezaremos en la configuración. Añade una clave `view` con `item_view` debajo y app debajo. Añadiré un comentario, porque en Layouts, `app` significa "admin". Así que lo que vamos a definir bajo la clave `app` será la vista de administrador para nuestro elemento de receta:

[[[ code('5535f7173a') ]]]

A continuación, añade `recipes_app`... con una pequeña nota para decir que esta clave no es importante:

[[[ code('6d55d1ee68') ]]]

A diferencia de otras cosas, como `latest_recipes`, esta clave interna no se utilizará en ningún sitio. A continuación, necesitamos dos cosas importantes. En primer lugar, `template` -no incluyas la "s" como he hecho yo- pon una ruta de acceso a la plantilla, como `nglayouts/` -ese es un nombre de directorio estándar para usar en las plantillas, pero podrías usar cualquier cosa-, y luego, ¿qué tal`admin/recipe_item.html.twig`:

[[[ code('470e1c123b') ]]]

La segunda cosa importante es la clave muy especial `match`. Tenemos que decirle a Layouts que ésta es la plantilla que debe utilizarse cuando se está renderizando un elemento de la receta. Por ejemplo, imagina que tenemos dos tipos de valores: recetas y también entradas de blog. Pues bien, Layouts necesitaría saber que ésta es la plantilla que debe usarse para las recetas... pero que debe usar una plantilla de elemento diferente para las entradas del blog.

## La clave de configuración "match"

Para ello, utilizaremos una sintaxis extraña: `item\value_type` ajustado a `doctrine_recipe`:

[[[ code('3df293972f') ]]]

Donde `doctrine_recipe` hace referencia al nombre de nuestro tipo de valor aquí arriba:

[[[ code('ed9d573d32') ]]]

Vamos a ver esta clave `match` varias veces más en este tutorial. Layouts tiene un montón de "emparejadores" incorporados, que se identifican con cadenas como`item\value_type`. Se utilizan para ayudar a emparejar una pieza de configuración, como esta plantilla, con otra pieza de configuración, como el tipo de valor `doctrine_recipe`. Hay un número finito de estos emparejadores, y vamos a ver los más importantes a lo largo del camino. Así que no te preocupes demasiado por ellos.

Ah, pero déjame que corrija mi error tipográfico: debería ser `template` sin "s".

## Los dos tipos de vista: item_view y block_view

De todos modos, quiero mencionar una cosa rápida sobre la clave de configuración `view`: sólo hay un pequeño número de subclaves que van debajo de ella.

Busca tu terminal y ejecuta:

```terminal
php ./bin/console debug:config netgen_layouts view
```

Esto volcará una enorme lista de config, pero no te abrumes Veremos las partes importantes de esto más adelante. Lo que quiero que mires son las claves raíz que van por debajo de `view`, como `block_view` y `layout_view`.

Resulta que hay seis claves diferentes que puedes poner debajo de la clave`view` en tu configuración, pero sólo nos interesan dos de ellas... y por eso lo menciono. Cuando se trata de personalizar tus vistas, ¡es realmente muy sencillo! La primera clave de la que nos ocupamos es `item_view`, que controla las plantillas que se utilizan cuando se representan "elementos": es decir, cuando se representan cosas dentro de una cuadrícula o una lista. La otra subclave de la que nos ocupamos es `block_view`, que es la forma de configurar la plantilla que se utiliza para representar diferentes tipos de bloques, como el bloque `title` o el bloque`text`.

Sí, o bien estás renderizando un bloque y quieres personalizar su plantilla o bien estás renderizando un elemento dentro de un bloque y quieres personalizar la plantilla de ese elemento. Así que la configuración parece gigantesca, pero la mayoría de estas cosas son internas y nunca tendrás que preocuparte por ellas.

## Creación de la plantilla de administración

Bien: tenemos nuestro `item_view` para nuestro `doctrine_recipe` para el área de administración. Vamos a añadir esa plantilla. En el directorio `templates/`, crea dos nuevos subdirectorios:`nglayouts/admin/`. Y luego, un nuevo archivo llamado `recipe_item.html.twig`. Dentro, escribe `Does it work?` y... usemos también la función `dump()` para poder ver a qué variables tenemos acceso:

[[[ code('01ddc3b046') ]]]

Bien, vuelve a tu navegador, actualiza el administrador de diseños y... ¡funciona! Y, aparentemente, tenemos acceso a varias variables. La más importante es `item`. ¡Se trata de un objeto `CmsItem` de Layouts... y tiene una propiedad llamada `object` establecida a nuestro `Recipe`!

¡Vamos a utilizarlo! Digamos `{{ item.object.name }}`, luego una tubería, y... imprimamos también una fecha: `{{ item.object.createdAt }}` - una de las otras propiedades de `Recipe` canalizada en el filtro `date` con `Y-m-d`:

[[[ code('ec94a08b43') ]]]

¡Vamos a comprobarlo! Muévete, refresca y... ¡ya está! Puedes hacer esto más elegante si quieres, pero esto nos servirá.

A continuación: vamos a crear la vista de artículos del frontend.