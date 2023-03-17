# Añadir bloques Twig a tu diseño dinámico

Acabamos de sustituir por completo nuestra página de inicio por un diseño dinámico. Pero, eso no es realmente tan interesante. Lo que realmente quiero es poder utilizar mi plantilla de página de inicio existente y todo este buen contenido que he preparado:

[[[ code('edcd2bbc72') ]]]

pero luego retocarla añadiendo pequeños fragmentos de contenido dinámico aquí y allá... o incluso reorganizar las cosas. Para ello, en el diseño, debajo de los bloques, en la parte inferior, añade uno especial llamado "Bloque Twig"... y pongámoslo justo debajo del título. Fíjate en que puedes poner tantos bloques como quieras dentro de una misma zona. En realidad, estas zonas no acaban siendo tan importantes.

De todas formas, cuando hagas clic en un bloque, en la parte derecha verás las opciones de ese bloque, que tiene una importante llamada "Nombre del bloque Twig". Introduce `body` para que coincida con el`{% block body %}` que tenemos en la plantilla:

[[[ code('ef72c4272f') ]]]

Vale, dale a "publicar y continuar editando"... luego ve a actualizar la página de inicio. ¡Santo hombre murciélago del contenido! Nuestro contenido Twig vive ahora dentro de esta página dinámica. ¡Es increíble! Y todo sigue funcionando: incluso el elegante "componente vivo" del centro de la página.

## Añadir más bloques a tu plantilla

Vale, esto es genial... pero sigue siendo sólo un montón de contenido dinámico en la parte superior... y luego contenido de plantilla Twig en la parte inferior: realmente no podemos mezclar nada en el centro de nuestra página.

A menos que... añadamos más bloques a nuestra plantilla. Por ejemplo, mantener el `block body`... sólo para que la página siga funcionando aunque no mapeemos un diseño... pero luego añadir un`{% block hero %}` alrededor de la sección superior, un bloque llamado, qué tal, `latest_recipes`,`{% endblock %}`, otro llamado `subscribe_newsletter`, `{% endblock  %}` y uno final llamado `featured_skills`, `{% endblock %}`:

[[[ code('7730b7f6c0') ]]]

Si nos detuviéramos ahora, esto no supondría ninguna diferencia para nuestra app: seguimos renderizando el bloque `body` aquí abajo... que incluye todos esos. Pero acabamos de darnos un montón de poder nuevo.

Compruébalo: cambia el nombre del bloque `body` por `hero`. Y luego vamos a añadir unos cuantos bloques Twig más. Renderiza `latest_recipes` para éste. Por cierto, las "etiquetas" de los bloques son sólo para nosotros en el área de administración: sólo para mayor claridad. Si introduzco "Últimas recetas", aparecerá encima del bloque. Totalmente opcional.

Añade dos bloques más: uno que muestre `subscribe_newsletter` y, por último, uno para `featured_skills`. Luego, aquí arriba, voy a eliminar por ahora el bloque `title`.

Por cierto, estoy utilizando la palabra "bloque" para referirme a dos cosas distintas a la vez. Los bloques son las "cosas" que añadimos a nuestro diseño, como un título, un mapa de Google o una lista de elementos. Pero los bloques también se refieren a los bloques Twig de nuestras plantillas. Y, por supuesto, uno de los tipos de bloques que podemos añadir... es uno que renderiza... bloques Twig. Bloques Twig. Un poco confuso, pero no puede ser peor.

De todos modos, di "Publicar y continuar editando"... y luego ve a actualizar el frontend. Y... ¡genial! Nuestra página funciona. Lo sé, tiene exactamente el mismo aspecto que hace un minuto, pero ahora está siendo renderizada por layouts... ¡y podemos reorganizar las piezas!

Observa: Moveré el `subscribe_newsletter` hacia abajo, le daré a "Publicar y continuar editando", actualizaré y... ¡boom! Esa parte estática de la página se ha movido mágicamente a la parte inferior. Es genial.

O podríamos volver a subirla... y luego añadir algo de contenido dinámico, como texto, entre uno de los otros bloques.

A continuación, vamos a ser aún más agresivos y flexibles permitiendo que la navegación superior y el pie de página inferior sean opcionales, pero fáciles de añadir, dentro del Diseño.
