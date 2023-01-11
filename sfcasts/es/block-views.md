# Vistas en bloque y tipos de vista

Vamos a anular completamente otra plantilla. Entra en el Diseño de habilidad individual. Aquí estamos utilizando una entrada de Contentful, que es un "Activo referenciado"... y se está renderizando como esta etiqueta de imagen. ¡Genial!

## Bloque "Tipos de vista" / Plantillas

Este es un gran ejemplo de cómo un único tipo de bloque -por ejemplo, el tipo de bloque "Campo de entrada Contentful"- puede tener varios tipos de Vista, lo que básicamente significa "varias plantillas". Cada uno de estos diferentes tipos de Vista será representado por una plantilla diferente. En realidad vemos esto con muchos tipos de bloque diferentes, incluso con el tipo de bloque Rejilla. Añadiré uno aquí abajo temporalmente. Tiene un tipo de Vista que te permite cambiar entre Lista y Cuadrícula. Sí, los bloques Lista y Cuadrícula son en realidad el mismo tipo de bloque internamente: sólo tienen un tipo de vista diferente, lo que significa que cada uno es representado por una plantilla distinta. Adelante, borra eso.

En cualquier caso, cada tipo de bloque puede tener uno o más tipos de vista. Y en realidad quiero profundizar un poco más en este concepto de "vistas". Busca tu terminal y ejecuta:

```terminal
php ./bin/console debug:config netgen_layouts view
```

Estoy depurando la configuración que podría vivir bajo la tecla `view` debajo de la tecla `netgen_layouts`:

[[[ code('831b81bbff') ]]]

Cuando ejecutes esto, verás un montón de configuraciones. Observa que hay varias claves raíz, como `parameter_view`, `layout_view`, y algunas otras. Pero en realidad sólo hay dos que nos interesen: `block_view`, de la que hablaremos ahora, y `item_view`, que controla cómo se representan los elementos de una Lista o Cuadrícula. En realidad, ya vimos esto antes cuando personalizamos cómo se representaba nuestro "elemento" Receta dentro de una Lista o Cuadrícula. Pronto hablaremos más de ello.

## La configuración de la vista en bloque

De todos modos, para ampliar las vistas de bloque, ejecuta el mismo comando, pero añade `.block_view`

```terminal-silent
php ./bin/console debug:config netgen_layouts view.block_view
```

Las vistas de bloque, en pocas palabras, controlan cómo se muestran los tipos de bloque completos. Por ejemplo, podemos ver cómo se visualiza el "Bloque de título"... o el "Bloque de texto", o cómo se visualiza el "Bloque de lista".

Esta configuración `block_view` puede tener varias claves debajo, como `default`, `app`, y `ajax`. Y sabemos lo que significan. `default` significa que se utilizan en el frontend, `app` significa que se utilizan en la sección de administración y `ajax`, que no es tan común, se utiliza en el frontend para las llamadas AJAX. Así que para anular la plantilla del frontend para un bloque, en realidad queremos decir que queremos anular su "vista" de bloque bajo la clave `default`.

Vamos... a ampliarlo una vez más añadiendo `.default`:

```terminal-silent
php ./bin/console debug:config netgen_layouts view.block_view.default
```

## La configuración "coincidente

Estas son todas las vistas de bloque que se utilizarán en el frontend. Lo más complicado de éstas es la parte `match`.

Cuando defines una "vista de bloque", es bastante habitual definir la plantilla que debe utilizarse cuando dos cosas coinciden. Busca "list\grid": es un gran ejemplo. Tiene dos elementos `match`: `block\definition` se establece en `list` porque, técnicamente, el "Tipo de bloque" para los bloques Lista y Cuadrícula se llama `list`. La segunda condición de coincidencia es `block\view_type` establecido en `grid`.

Juntas significan que si se está renderizando un bloque cuyo `block\definition`es `list` y cuyo `block\view_type` es `grid`, utiliza esto.

Por cierto, ambas cosas pueden verse muy claramente desde la barra de herramientas de depuración web. Ve a la página de inicio, haz clic en la barra de herramientas de depuración web Diseños y ve a "Bloques renderizados". Aquí abajo... ¡mira esto! Puedes ver "Definición de bloque: ¡Lista", "Tipo de vista: cuadrícula"! Y luego apunta a la plantilla que se ha renderizado. En este caso, se refiere a esta cuadrícula de aquí.

Entonces... ¿por qué el bloque Título es renderizado por `title.html.twig`? Podemos verlo en la configuración. Busca "título"... aquí lo tenemos. Esto dice: si el `block\definition`es `title` y el `block\view_type` es `title`, utiliza esta plantilla. Este es un ejemplo de un tipo de Bloque que sólo tiene un tipo de Vista. Así que, en la práctica, ésta es la vista que se utiliza para todos los bloques de título.

## Buscar y anular la vista de activos de campo de Contentful

Bien, recordemos nuestro objetivo original: anular la plantilla que renderiza esta imagen. Sabemos que se trata de un "Campo de entrada Contentful" y que tiene un tipo de Vista "Activos referenciados". Así que... ¡podemos encontrarlo aquí!

Busca "activos" y... ¡ahí está! Así que si `block\definition` es`contentful_entry_field` y `block\view_type` es `assets`, ¡ésta es la plantilla! Esto significa que si queremos anular sólo el tipo de Vista `assets` de la entrada Contentful, ésa es la plantilla que tenemos que anular.

Y sí, podríamos haberlo encontrado muy fácilmente yendo a la barra de herramientas de depuración web y encontrando allí la plantilla. Pero ahora entendemos un poco mejor cómo se representan los bloques y cómo cada bloque puede tener varias vistas para que podamos elegir cómo se representan. Más adelante, añadiremos un "tipo de vista" adicional a un bloque existente.

Bien, manos a la obra. La ruta comienza con la normal`nglayouts/themes/standard/`, luego necesitamos `block/`, seguida de esta ruta. Así que dentro de nuestro directorio `block/`, crea un nuevo subdirectorio llamado`contentful_entry_field/`. Y dentro de éste, un nuevo `assets.html.twig`. Por ahora, sólo diré `ASSET`:

[[[ code('c9fc9a0ef9') ]]]

Vale Gira hacia el frontend y... ¡sí! ¡Lo ve al instante! ¡Ya tenemos el control!

## Hacer la plantilla más elegante

Como antes, probablemente no queramos reemplazar toda la plantilla. En lugar de eso, abre la plantilla principal - `assets.html.twig` - para que podamos robarla, tomarla prestada. Temporalmente, cópiala entera, pégala:

[[[ code('51c983bda4') ]]]

Y... ¡sí! Funciona.

Contentful es bastante avanzado... y puedes ver que admite campos que contienen una sola imagen, así como múltiples imágenes. Puedes mantener esto tan flexible como quieras, pero también puedes hacerlo a tu gusto. Voy a simplificar drásticamente esta plantilla... y a sustituirla por una imagen muy sencilla. Para el `src`, pegaré algo de código:

[[[ code('038afc2340') ]]]

Todas las partes Twig de este código estaban antes en la plantilla. Esto también muestra un superpoder de Contentful en el que puedes controlar el tamaño de la imagen. Llamar a`block.parameter()` nos permite leer las opciones del administrador de diseños, donde antes configuramos este bloque para que tuviera una anchura y una altura de 200.

¡Veamos qué aspecto tiene! Actualiza. ¡Sí! ¡Parece que ha funcionado!

## Elegir si mostrar o no opciones complejas

Pero quiero hacer una pequeña advertencia sobre la personalización de plantillas: asegúrate de no perder la flexibilidad que necesitas. Por ejemplo, sabemos que podemos añadir clases CSS adicionales a cualquier bloque a través del admin.

Si lo hiciéramos ahora, no funcionaría porque... ¡simplemente no renderizaríamos esas clases! Y, eso podría estar bien. Pero si quieres admitirlas, tendrás que asegurarte de añadirlas. En este caso podemos decir `class="{{ css_class }}"`, que es una de las variables que vimos antes. Y ya que estamos aquí, añadamos también un atributo `alt` establecido en `field.value.title`:

[[[ code('a241a5c6a7') ]]]

Cuando probemos esto... ¡Me encanta! Ahí está el atributo `alt` y ahí está nuestra clase, incluidas algunas clases principales que Layouts siempre añade a esa variable.

Vale, acabamos de hablar de las vistas de bloque: cómo se configuran las plantillas para bloques enteros. A continuación, vamos a hablar de las vistas de elementos: cómo personalizamos la plantilla que se utiliza al mostrar un elemento dentro de una cuadrícula o lista. Utilizaremos esto para dar estilo a nuestros elementos de habilidad.
