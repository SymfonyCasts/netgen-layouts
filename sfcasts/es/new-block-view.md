# Vista de bloque personalizada

Éste es el plan. Vamos a añadir un nuevo "tipo de vista" a la definición del bloque de lista. Luego vamos a asignarlo a una plantilla a través de `block_views`.

## Actualizar la "definición de bloque

Para el paso 1, abre nuestro archivo `netgen_layouts.yaml` y, en cualquier lugar, añade`block_definitions`. Esta configuración puede utilizarse para crear bloques totalmente nuevos o para cambiar opciones de bloques existentes, que es lo que queremos. Para ello, tenemos que repetir la configuración aquí: `list` & `view_types`. Así, `list` `view_types` y luego añadir el nuevo. Llamémoslo `one_by_two` -esa clave puede ser cualquier cosa- y démosle un nombre: `1x2 Featured Grid`:

[[[ code('f915c763bf') ]]]

Sólo con eso, si vamos y actualizamos el área de administración... y hacemos clic abajo en la cuadrícula, ¡tenemos un nuevo tipo de vista! Si cambiamos a ella... no aparece nada en el área de administración. Y si pulsamos "Publicar y continuar editando"... en el frontend... tampoco se muestra nada. ¡Sí!

Haz clic en el enlace Diseños de la barra de herramientas web y... cerca de la parte inferior, ah. Se está mostrando`invalid_block.html.twig`. La definición del bloque es `list` y el tipo de vista es `1x2 Featured Grid`. El problema es que aún no hemos definido una "vista de bloque" para esa combinación. Así que vuelve a "bloque no válido".

## Añadir la vista de bloque Admin

Vale, en `view`, ya hemos creado varias "vistas de elemento". Ahora añade `block_view`para que podamos crear la primera de ellas. Vamos a registrar tanto una vista de administrador como una vista de frontend. Porque... en el área de administración, actualmente no se muestra nada. Añade `app` para el admin y la siguiente clave no importa. Para la plantilla, como la vista admin no es demasiado importante, vamos a reutilizar la plantilla "grid" del núcleo admin, que puedes encontrar mediante el comando `debug:config`. Es`@NetgenLayoutsStandard/app/block/list/grid.html.twig`.

Ahora añade `match`. Queremos utilizar esta plantilla si `block\definition` es `list`y `block\view_type` es `one_by_two`... asegurándonos de que coincide con la clave que hemos utilizado antes en la definición del bloque:

[[[ code('ca2aa09e2d') ]]]

¿Cómo sabía que debía utilizar `block\definition` y `block\view_type`? ¡Utilizando nuestro comando favorito`debug:config`! Siempre es una buena guía a seguir.

En cualquier caso, esto debería arreglar el área de administración. Y... ¡lo hace!

## Vista en bloque del frontend

Para la vista del frontend, duplica toda esa sección... pero utiliza `default`. Esta clave está bien, no importa, y cambia la plantilla a, qué tal,`@nglayouts/block/list/one_by_two_list.html.twig`. La sección de coincidencia ya es perfecta:

[[[ code('0aa857f379') ]]]

Vale, ¡vamos a hacer esa plantilla! Ya tenemos`templates/nglayouts/themes/standard/block/`... así que, crea el nuevo subdirectorio `list`y luego el archivo: `one_by_two_list.html.twig`. Empieza diciendo `1x2`:

[[[ code('6f5ab178f7') ]]]

¡Vamos a comprobarlo! En el frontend, actualiza y... ¡ahí está nuestro pequeño 1x2!

## Personalizar la plantilla del frontend

¡Vamos a darle vida! Como esto representa un bloque "lista", nuestra plantilla probablemente tenga acceso a alguna variable que represente los "elementos". Para hacer trampas, lo que siempre es una buena opción para los desarrolladores, echemos un vistazo a la plantilla de rejilla principal:`grid.html.twig` del directorio `themes/`.

¡Vaya! Como muchas plantillas de núcleo, ¡aquí hay un montón de cosas! Puedes elegir lo que quieres conservar o eliminar. Lo más importante es esta variable `collection_html`: hacen un bucle sobre `collections[collection_identifier]`... donde`collection_identifier` es en realidad sólo la palabra `default`. Así que se repite`collections.default`. Luego incluye una plantilla. Esa variable `templateName` se establecerá en algo como `grid/` el número de columnas `.html.twig`. Por ejemplo, si la cuadrícula está configurada para utilizar 3 columnas, utilizaría`3_columns.html.twig`. Esa plantilla añade el `div` necesario para cada columna en una configuración de 3 columnas... y luego llama a `nglayouts_render_result()`. Eso renderiza el "elemento".

De todos modos, si alejas el zoom, la plantilla básicamente hace un bucle sobre la variable `collections`y llama a `nglayouts_render_result()` en cada una de ellas.

De vuelta a nuestra plantilla, voy a pegar un código que hace algo parecido:

[[[ code('59127b2fa6') ]]]

Sí, ampliamos `block.html.twig`, igual que hace la plantilla principal, luego hacemos un bucle sobre `collections.default`, añadimos un `div` y mostramos cada elemento. Así que esto es efectivamente una versión más simple de lo que hace una cuadrícula.

¿Y qué aspecto tiene? Actualiza y... ¡sí! ¡Parece una cuadrícula!

Pero recuerda el objetivo: una gran habilidad a la izquierda con dos habilidades más pequeñas a la derecha. Para conseguirlo, pegaré la versión 2 de mi plantilla. Aquí no hay nada especial. En lugar de hacer un bucle, esto renderiza la tecla 0, luego las teclas 1 y 2:

[[[ code('c6deabab6f') ]]]

Y ahora... ¡sí! ¡Es exactamente lo que quería!

Sin embargo, te haré la misma advertencia que te hice antes cuando modificamos las plantillas de los "elementos" principales. No estamos incluyendo todas las cosas personalizadas que hay en la plantilla principal. Si necesitas soportar una opción personalizada, asegúrate de incluir ese código.

## Ocultar opciones de bloque para un tipo de vista de bloque

Y en realidad, una cosa de aquí -el número de columnas- no es algo que necesitemos. Es algo que podemos configurar para el bloque... pero no es relevante en absoluto cuando utilizamos nuestro nuevo tipo de vista.

¿Podríamos... ocultar esa opción al utilizar nuestro tipo de vista? ¡Sí! Vuelve a tu terminal y depura de nuevo la configuración de `block_definitions`:

```terminal-silent
php ./bin/console debug:config netgen_layouts block_definitions
```

Busca `one_by_two`. Podríamos configurar esta clave `valid_parameters` para eliminar una opción del bloque. El tipo de vista `list` hace exactamente eso. No lo haré, pero así es como se hace.

Vale, vuelve al sitio y ve a la página "Todas las habilidades". Sí... las cosas siguen sin estar bien. En este diseño, utilizamos una cuadrícula para representar los elementos. Y esa cuadrícula se ve bien en otras páginas, pero no aquí, donde se supone que las habilidades son el contenido principal de la página. A continuación, vamos a aprender cómo podemos personalizar la representación de estos elementos sólo para esta cuadrícula.
