# Añadir bloques Twig a tu diseño dinámico

Así que acabamos de sustituir por completo nuestra página de inicio por un diseño dinámico. Pero, eso no es realmente tan interesante. Lo que realmente quiero es poder utilizar mi plantilla de página de inicio existente y todo este buen contenido que he preparado

[[[ code('edcd2bbc72') ]]]

pero luego retocarla añadiendo pequeños trozos de contenido dinámico aquí y allá... o incluso reordenar las cosas. Para ello, en el diseño, debajo de los bloques, en la parte inferior, añade uno especial llamado "Bloque Twig"... y pongámoslo justo debajo del título. Fíjate en que puedes poner tantos bloques como quieras dentro de una misma zona. En realidad, estas zonas no acaban siendo tan importantes.

De todos modos, cuando hagas clic en un bloque, a la derecha verás las opciones de ese bloque, que tiene una importante llamada "Nombre del bloque Twig". Introduce `body` para que coincida con el`{% block body %}` que tenemos en la plantilla:

[[[ code('ef72c4272f') ]]]

Bien, pulsa "publicar y continuar editando"... luego ve y actualiza la página de inicio. ¡Santo hombre murciélago del contenido! Nuestro contenido Twig vive ahora dentro de esta página dinámica. ¡Es increíble! Y todo sigue funcionando: incluso el elegante "componente vivo" en el centro de la página.

## Añadir más bloques a tu plantilla

Vale, esto es genial... pero sigue siendo sólo un montón de contenido dinámico en la parte superior... y luego el contenido de la plantilla Twig en la parte inferior: realmente no podemos mezclar nada en el centro de nuestra página.

A menos que... añadamos más bloques a nuestra plantilla. Por ejemplo, mantener el `block body`... sólo para que la página siga funcionando aunque no mapeemos un diseño... pero luego añadir un`{% block hero %}` alrededor de la sección superior, un bloque llamado, qué tal, `latest_recipes`,`{% endblock %}`, otro llamado `subscribe_newsletter`, `{% endblock  %}` y uno final llamado `featured_skills`, `{% endblock %}`:

[[[ code('7730b7f6c0') ]]]

Si nos detuviéramos ahora, esto no supondría ninguna diferencia para nuestra aplicación: seguimos renderizando el bloque `body` aquí abajo... que incluye todos esos. Pero acabamos de dotarnos de un nuevo poder.

Compruébalo: cambia el nombre del bloque `body` por `hero`. Y luego vamos a añadir unos cuantos bloques Twig más. Renderiza `latest_recipes` para este. Por cierto, las "etiquetas" de los bloques son sólo para nosotros en el área de administración: sólo por claridad. Si introduzco "Últimas recetas", se mostrará encima del bloque. Es totalmente opcional.

Añade dos bloques más: uno que muestre `subscribe_newsletter` y, por último, uno para `featured_skills`. Luego, aquí arriba, voy a eliminar el bloque `title` por ahora.

Por cierto, estoy utilizando la palabra "bloque" para significar dos cosas diferentes a la vez. Los bloques son las "cosas" que añadimos a nuestro diseño, como un título, un mapa de Google o una lista de elementos, pero los bloques también se refieren a los bloques Twig de nuestras plantillas. Y, por supuesto, uno de los tipos de bloques que podemos añadir... es uno que rinde... Bloques Twig. Un poco confuso, pero no puede ser más malo.

De todos modos, di "Publicar y continuar editando"... y luego ve a refrescar el frontend. Y... ¡qué bien! Nuestra página funciona. Lo sé, tiene el mismo aspecto que hace un minuto, pero ahora está siendo representada por los diseños... ¡y podemos reorganizar las piezas!

Observa: Moveré el `subscribe_newsletter` hacia abajo, pulsaré "Publicar y continuar editando", actualizaré y... ¡boom! Esa parte estática de la página se ha movido mágicamente a la parte inferior. Eso es genial.

O bien, podemos volver a moverla hacia arriba... y luego añadir algún contenido dinámico, como texto, entre uno de los otros bloques.

A continuación, vamos a ser aún más agresivos y flexibles permitiendo que la navegación superior y el pie de página inferior sean opcionales, pero fáciles de añadir, dentro del Diseño.
