# Paginación Ajax y CSS/JS

Ahora que estamos renderizando estos elementos de la receta a través del tipo de bloque de rejilla, comprueba lo que podemos hacer. Haz clic en la cuadrícula, ve a la pestaña de diseño y marca "Activar la paginación". Entonces podrás elegir entre un estilo de paginación con enlaces de página, como 1, 2, 3 y 4, o simplemente un botón de "cargar más". Utilicemos este último.

Muy bien, pulsa "Publicar y continuar editando". Entonces... una vez que se guarde, actualiza para ver... ¡absolutamente nada! La paginación se realiza completamente a través de JavaScript y Ajax. Y no vemos nada porque aún no hemos incluido el JavaScript necesario en nuestra página.

## Incluir las plantillas CSS/JS

Añadirlo es bastante fácil. Ve a `templates/base.html.twig`. Aquí arriba, en la zona de `head`, vamos a incluir dos plantillas. La primera es:`@NetgenLayoutsStandard/page_head.html.twig`... y pasarle una variable extra: `full: true`:

[[[ code('ccfcc0e8fc') ]]]

Esto cargará el CSS y el JavaScript que soportan estos elementos de galería aquí abajo. No voy a hablar de estos bloques de galería en este tutorial, pero son básicamente como un bloque de lista o de cuadrícula, excepto que tienen JavaScript para convertirlos en deslizadores o galerías de miniaturas.

Así que esto incluye el CSS y el JavaScript para ellos, así como un pequeño archivo CSS de cuadrícula para ayudar a representar las columnas de cuadrícula en tu página en caso de que no tengas Bootstrap. El`full: true` le dice que traiga jQuery así como otras dos bibliotecas de JavaScript llamadas `magnific-popup` y `swiper`. Todas ellas son necesarias para los bloques de la galería.

Así que, sí, si no estás usando uno de esos bloques de galería, podrías evitar incluir este archivo por completo. Pero yo lo dejaré.

Pero fíjate, no he dicho nada sobre la paginación. Para eso, necesitamos incluir una segunda plantilla. Copia esta línea, pégala, quita la palabra `Standard` y esto no necesita la variable `full`:

[[[ code('df9e46f97e') ]]]

Esta plantilla es muy sencilla: incorpora un poco de CSS y un poco de JavaScript para potenciar la paginación Ajax. Y éstas son las dos únicas plantillas que necesitarás incluir para las maquetas JavaScript y CSS.

## Añadir la plantilla de elementos "ajax

Actualiza y... ¡ahí está! Y cuando hacemos clic en el nuevo enlace... ¡estalla con un error 500! Ups.

Abre esa URL en una nueva pestaña. Interesante:

> No se ha encontrado ninguna coincidencia de plantilla para la vista "item_view" y el contenido "ajax".

Cuando hacemos clic en "Cargar más", no es de extrañar que esa llamada Ajax muestre los siguientes elementos de la receta. Podrías pensar que esto reutilizaría nuestra plantilla de vista de artículo "frontend", pero... en realidad hay una sección diferente específicamente para cuando el contenido se renderiza a través de Ajax. Copia por completo la sección `default` frontend, pégala y cámbiala por`ajax`:

[[[ code('3f0902ae1b') ]]]

No hay que cambiar nada más: cuando estemos en modo `ajax`, utiliza la plantilla normal del frontend.

Ahora, si refrescamos la ruta Ajax... ¡funciona! Recarga la página de inicio y haz clic en "Cargar más". ¡Esto es muy bonito!

## Traducir el botón de paginación

Aunque, cosa menor, nuestros diseñadores realmente quieren utilizar el texto "Mostrar más". No hay problema: todo lo que renderiza Layouts se procesa a través del traductor. Haz clic en el icono de traducción de la barra de herramientas de depuración web. ¡Ahí está! Al parecer, la clave de traducción es `collection.pager.load_more`.

Cópiala... y luego ve a abrir nuestro archivo de traducción - `nglayouts.en.yaml` - y pégalo. Mi editor cambió el formato... que en realidad funcionaría... pero volveré al formato más plano. Ponlo en "Mostrar más":

[[[ code('34c2089272') ]]]

Gira y... ¡lo tenemos!

## Cambios CSS en la paginación

Vale, un cambio más para contentar a nuestros diseñadores. Inspecciona el elemento del botón. Layouts añade un montón de clases, que se estilizan a través del CSS que hemos incluido. Y, por supuesto, podemos anularlo si es necesario.

En nuestro editor, abre `assets/styles/app.css`. Como recordatorio, ya estamos ejecutando Webpack Encore en segundo plano. Así que, si cambiamos este archivo, ese cambio se reconstruirá automáticamente y se utilizará en el frontend.

En la parte inferior, pegaré algo de CSS para dar más margen a ese botón pero sin borde:

[[[ code('5c438fa21f') ]]]

Volvemos a dar la vuelta, actualizamos y... nuestros diseñadores están contentos.

Así que, gracias a los diseños, obtenemos una paginación Ajax gratuita, que podemos personalizar con bastante facilidad. Eso es genial.

## Rejillas frente a contenido Twig personalizado

Llegados a este punto, ya que somos capaces de renderizar rejillas y listas de recetas, podríamos entrar en el diseño "Lista de recetas" y sustituir este HTML codificado, que proviene de la plantilla: `templates/recipes/list.html.twig`. Sí, en teoría podríamos eliminar esto y sustituirlo por un bloque de lista.

El único problema... es que no se vería del todo bien. En lugar de renderizarse como lo hace ahora, Layouts utilizaría nuestra plantilla de artículos: así que cada artículo se vería como lo hace en la página de inicio.

Ahora, podemos arreglar esto creando una segunda forma de representar los elementos de la receta, y hablaremos de ello más adelante. Pero saco esto a colación por una razón importante. A no ser que pensemos reutilizar esta lista y su aspecto en otras páginas de nuestro sitio, no hay grandes beneficios en hacer el trabajo de convertirla en algo que podamos representar mediante Diseños. Como sólo se utiliza aquí, renderizarla mediante Twig está perfectamente bien.

A continuación: vamos a mejorar el sistema de recetas haciendo posible la selección manual de elementos.
