# Inmersión profunda en las vistas de elementos

Cuando se trata de personalización, puedes hacer mucho daño mirando qué plantillas se están renderizando y utilizando el sistema de temas para anularlas. Pero hay algunos casos en los que necesitarás ser aún más específico.

Por ejemplo, supongamos que queremos modificar la plantilla "elemento" para ver cómo se muestra la cuadrícula de habilidades en la página de inicio. Si compruebas aquí la barra de herramientas de depuración web y te desplazas hacia abajo... buscaré "contentful"... ah, ya está. Puedes ver`grid.html.twig`... que renderiza `item/contentful_entry.html.twig`. Para personalizar el elemento, podríamos anular esa plantilla. Muy fácil.

El problema es que, en Contentful, tenemos varios tipos de contenido: tenemos Habilidades y Anuncios. Así que si modificamos esta plantilla, la modificaremos tanto para Habilidades como para Anuncios... y probablemente queramos que tengan un aspecto diferente. Entonces, ¿cómo podemos resolver esto?

## Profundizando en item_view Config

Antes hemos ejecutado `debug:config netgen_layouts view` y hemos hablado de las dos secciones principales que hay aquí debajo: `block_view` (que controla cómo se muestran los bloques) y `item_view`.

```terminal-silent
php ./bin/console debug:config netgen_layouts view.item_view
```

Como ya he dicho varias veces, algunos bloques, como Grid y List, muestran elementos individuales. En esta configuración de `item_view` es donde definimos esas plantillas. Y verás algunas claves raíz familiares: `default` para el frontend, `ajax` para las llamadas AJAX y `app` para el admin. Una vez más, esto utiliza la configuración `match` y... ¡eh! ¡Vemos nuestra entrada aquí! ¿Recuerdas `recipes_default`? Lo configuramos dentro de nuestro archivo de configuración, y es una de las dos plantillas de elementos reales que tenemos ahora mismo:

[[[ code('13766103ac') ]]]

Hay una para recetas, y luego Contentful tiene una para todos los elementos de Contentful.

Pero nuestro objetivo es anular esta plantilla sólo cuando el elemento sea una habilidad, como en este caso. ¿Y cómo lo hacemos? Añadiendo nuestro propio `item_view` a esta lista que coincide con ese único tipo de contenido. ¡Vamos a hacerlo!

## Añadir un item_view personalizado

Por aquí... estamos bajo `item_view`, `default` para el frontend y tenemos la única entrada de antes: `recipes_default`. Vamos a añadir otra. Llámala`contentful_entry/skill`, aunque esta clave en concreto no supone ninguna diferencia. Debajo de ella, pon `template` en `@nglayouts/item/contentful_entry`, seguida de `skill.html.twig`:

[[[ code('f2a3ae08af') ]]]

Antes, utilizábamos `nglayouts` sin el `@`... sólo porque te dije que `nglayouts/` era un buen directorio para organizar cosas. Internamente, Layouts utiliza `@nglayouts` en las rutas de sus plantillas. ¿Cuál es la diferencia? Al añadir el `@`, nos estamos enganchando al sistema de temas. Así, como tenemos un directorio `templates/nglayouts/` con `themes/standard/` dentro, utilizará nuestra plantilla. Puedes utilizar `@nglayouts` o simplemente `nglayouts`. Sólo quería que entendieras la diferencia porque verás la sintaxis `@nglayouts` por todas partes.

## Coincidencia con un solo tipo de contenido

La clave realmente importante aquí es `match`. Queremos que coincida sólo cuando estemos trabajando con un `contentful_entry`. Vale, copia `match` de la config... y pega.

Pero tenemos que ser más específicos. También necesitamos coincidir sólo cuando el tipo de contenido sea una habilidad. Pero, ¿cómo lo hacemos? ¿Qué comparadores hay disponibles? Hay una lista básica... pero, ¿ha añadido Contentful algún comparador adicional que podamos aprovechar?

He aquí un pequeño truco para ver la verdadera lista de elementos de `match`. Es un poco técnico, pero funciona de maravilla. Ejecuta:

```terminal
php ./bin/console debug:container --tag=netgen_layouts.view_matcher
```

¿Qué hace esto? Bueno, cualquiera puede crear un comparador personalizado, como `foo\bar`. Para ello, creas una clase y le das esta etiqueta. Buscando todos los servicios con esa etiqueta, podemos encontrar todos los matchers existentes en el sistema.

Y... ¡mira qué lista! Aquí hay uno interesante: `contentful\content_type`. Seguro que podemos utilizarlo. Inténtalo: `contentful\content_type` ajustado a `skill`:

[[[ code('1b98f2ea3f') ]]]

Bien, vamos a crear la plantilla. Dentro de `themes/standard/`, en lugar de`block/`, esta vez, crea un directorio llamado `item/`... luego`contentful_entry/`, y luego `skill.html.twig`. De momento pon un texto ficticio:

[[[ code('c8dec49b61') ]]]

Vale, si esto funciona, cuando actualicemos, estos elementos -que son habilidades de Contentful- deberían volver a renderizarse utilizando nuestra nueva plantilla. Pero cuando lo intentamos... no cambia absolutamente nada. ¿Qué ha ocurrido?

## ¡Orden de configuración incorrecto!

Vuelve a tu terminal y ejecuta

```terminal
php ./bin/console debug:config netgen_layouts view.item_view
```

de nuevo. Todo parece correcto... excepto el orden. Esta de Contentful está al principio de la lista... y las nuestras nuevas están al final. ¿Y adivina qué? Cuando Layouts intenta averiguar qué plantilla debe renderizar, lee la lista de arriba a abajo y encuentra la primera que coincide: exactamente como funciona el sistema de enrutamiento de Symfony.

Así, primero mira `contentful_entry`, ve que la `value_type` es`contentful_entry`... y la utiliza. Nunca llega al`contentful_entry/skill` de la parte inferior.

Para solucionarlo, vamos a utilizar un elegante truco de configuración de prefijo. Hagámoslo a continuación.
