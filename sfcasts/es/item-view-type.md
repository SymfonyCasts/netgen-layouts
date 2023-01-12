# Tipo de vista de elemento personalizado

La cuadrícula de habilidades de la página `/skills` tiene un aspecto terrible. Vamos a buscar el diseño para eso: Diseño de lista de habilidades. Vale, esto es una cuadrícula normal... y se muestra como cualquier otra cuadrícula del sitio. Quiero personalizarlo, pero no quiero que el propio bloque de la cuadrícula se muestre de forma diferente: tenerlo en mosaico así está muy bien. Lo que realmente quiero es cambiar cómo se muestra cada elemento dentro de la cuadrícula... pero sólo en esta situación. ¿Cómo podemos hacerlo?

## Hola "Tipos de vista de elementos"

Ve a tu terminal y ejecuta nuestro comando favorito `debug:config`, esta vez en `block_definitions`:

```terminal-silent
php ./bin/console debug:config netgen_layouts block_definitions
```

Esta es, como hemos aprendido, la configuración de todos los bloques de nuestro sistema. Y ¡mira esto! Una parte de la configuración de la que aún no hemos hablado es `item_view_types`. Para cada "tipo de vista de bloque", como `one_by_two`, `list`, o `grid`, existe también`item_view_types`. Hasta ahora, todas ellas tienen una sola llamada`standard`.

No es muy común, pero para un determinado tipo de vista -como `one_by_two` o `list` - puedes especificar múltiples formas de representar los elementos dentro de ese tipo de vista. Éstas se denominan `item_view_types`. `Standard` es la predeterminada, y significa que los elementos se mostrarán de la forma "normal".

Así que éste es nuestro objetivo: para el tipo de vista `grid` existente, vamos a añadir un nuevo "tipo de vista de elementos". A grandes rasgos, esto nos permitirá, al configurar una cuadrícula, elegir una forma diferente de mostrar los elementos.

Para empezar, en nuestra configuración, busca `block_definitions`. Actualmente tenemos`list`, `view_types`, y `one_by_two`. Ahora añade `grid` para que podamos anular ese tipo de vista existente. Añade `item_view_types` con uno nuevo llamado, qué tal,`skill_big_view`. Verás cómo utilizamos esa clave en un segundo. Dale también un nombre legible por humanos:

[[[ code('ad1c53a9c0') ]]]

¿Qué ha hecho eso? Actualiza el área de administración... haz clic abajo en la Cuadrícula... y asegúrate de que estás en la pestaña "Diseño". Tenemos un nuevo "Tipo de vista de artículo" seleccionado! Aparece "Estándar", que es la predeterminada, y luego nuestra nueva "Gran vista de habilidades"!

Selecciónala y pulsa "Publicar y continuar editando". ¿Qué cambiará esto en el frontend cuando actualicemos? Absolutamente nada Eso es porque ahora necesitamos una nueva "vista de elemento" que coincida con esto.

## Añadiendo la "Vista de elemento" para el nuevo "Tipo de vista de elemento".

De vuelta en nuestra configuración, desplázate hasta `item_views`. Debajo de `default`, copia la sección`contentful_entry/skill` y pégala arriba.

Lo ponemos arriba porque el orden es importante: necesitamos que esta nueva vista de elemento pueda coincidir antes que la otra. Observa. Llama a esto`contentful_entry/skill_big_view` y cambia la plantilla a`@nglayouts/item/contentful_entry/skill_big_view.html.twig`. Seguimos queriendo que coincida cuando `item\value_type` sea `contentful_entry` y `contentful\content_type`sea `skill`... pero sólo si el emparejador llamado `item\view_type` es igual a la clave que creamos antes `skill_big_view`:

[[[ code('9d54512cdc') ]]]

Gracias a esto, si el usuario selecciona este como su "Tipo de vista de elemento" para una cuadrícula de habilidades, entonces los tres coincidirán. Pero si el usuario elige el tipo de vista de elemento por defecto`Standard`, no coincidiría con esto... pero sí con lo de abajo.

Vamos a añadir la plantilla. Dentro de `item/contentful_entry/`, crea el nuevo archivo:`skill_big_view.html.twig`. Dentro, digamos `BIG VIEW`:

[[[ code('800ef5a024') ]]]

¡Vamos a probarlo! Asegúrate de que la plantilla está publicada... y luego en el frontend... ¡ya lo tenemos! ¡El resto es fácil! Como ya hemos creado varias plantillas de vistas de artículos... Me limitaré a pegar el resto. Aquí no hay nada nuevo.

Pero ahora... ¡sí! Este es el aspecto que queremos.

## Cambiar la "vista de artículo" artículo por artículo

Por cierto, ahora que nuestra vista de bloque "Rejilla" tiene múltiples "tipos de vista de elemento" -esa es nuestra configuración aquí arriba- tenemos el poder, elemento por elemento, de controlarlo. ¿Ves este "Anular tipo de vista de ranura"? Esto básicamente dice;

> ¡Yo Layouts! Quiero cambiar el primer elemento de esta lista para que utilice
> el tipo de vista "Estándar".

Pulsaré "Publicar y continuar editando" y ahora... ¡puedes ver que sólo el primer elemento utiliza el tipo de vista Estándar! Eso... obviamente no es lo que queremos en nuestro sitio, así que volveré atrás y utilizaré "Sin anulaciones". Pero es un concepto muy potente.

Y... ¡guau! ¡Sólo queda un capítulo! Un problema común con los Diseños es trabajar con el espaciado vertical: simplemente asegurarnos de que el espaciado es correcto entre todos nuestros componentes. Podríamos controlarlo añadiendo clases CSS a los bloques individuales. Pero, ¿no estaría bien que todos los bloques del sistema tuvieran un bonito desplegable en el que pudiéramos seleccionar los márgenes superior e inferior automáticamente? ¿Cómo podemos modificar un bloque existente, o incluso todos los bloques de nuestra aplicación? Ese es el trabajo de un plugin de bloques, y Eso a continuación.
