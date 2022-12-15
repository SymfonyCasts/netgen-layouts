# La página de lista de habilidades + una cuadrícula de habilidades

Gracias a la integración con Contentful, además de nuestro tipo de valor `doctrine_recipe`, ahora tenemos un segundo tipo de valor que puede cargar cosas de Contentful. Esto significa que podemos mostrar listas y cuadrículas de habilidades dentro de cualquier diseño, como aquí en nuestra página de inicio.

¡Vamos a probarlo! Publica este diseño... y edita el Diseño de la Página de Inicio. Ah, y podemos eliminar esta antigua cuadrícula con la que estábamos jugando antes.

Abajo, estamos representando el bloque Twig de `featured_skills`. Pero en realidad, si miras nuestra plantilla, ¡están totalmente codificados!

## Añadir una cuadrícula de habilidades

¡No hay problema! Añade un bloque Rejilla... que ya está configurado como "Colección manual" ¡Pero mira esto! ¡Ahora podemos elegir entre seleccionar manualmente "Entradas de contenido" o recetas! Y cuando hacemos clic en "Añadir elementos", ¡el navegador de contenidos ya funciona!

Selecciona unos cuantos... bien... luego publica esto. Actualiza. Um... ¡bien! Sí se muestran... pero sólo el título. Buen comienzo. Para hacerlo un poco mejor, ve a la pestaña "Diseño"... y envuelve esto en un contenedor.

Eso debería, al menos, darnos algunos canalones. Ya está. En última instancia, queremos que se muestren como las habilidades codificadas que hay debajo. Y vamos a trabajar en ello en unos minutos.

## Añadir una página /habilidades

Pero antes de llegar ahí, ¿qué tal una página `/skills` que enumere todas las habilidades? Bueno, la integración de Contentful no nos dio esta URL. Pero, ¡no hay problema! ¡Podemos crearla nosotros mismos en Symfony!

Bueno, en realidad, ¡podríamos hacerlo completamente en Contentful! Podríamos crear un tipo de contenido "Página", crear una página "Habilidades", que podría convertirse en `/skills`, y luego asignarla a un Diseño. Este es el tipo de cosas que harías normalmente cuando tienes un CMS a tu alcance

Pero crearemos esta página de forma manual. Al fin y al cabo, los Diseños en realidad sirven para ayudar a organizar el aspecto de las páginas existentes... en realidad no se trata de añadir páginas dinámicas. Ése es un trabajo para un CMS.

En tu editor, abre `src/Controller/MainController.php`. Copia la acción `homepage()`, pégala, cámbiala a `/skills`, llámala `app_skills` y renombra el método a `skills()`. Para la plantilla, renderiza `main/skills.html.twig`:

[[[ code('970de0c503') ]]]

Ahora, en el directorio `templates/main/`, crea esto: `skills.html.twig`. Empecemos por lo más pequeño posible: extender `nglayouts.layoutTemplate`:

[[[ code('3b3d641f6d') ]]]

Genial. Ya que estamos aquí, abre `base.html.twig` y enlaza con esto. Busca "Habilidades", ahí está el enlace. Establece el `href` en `{{ path('app_skills') }}`:

[[[ code('89d6d3e4a7') ]]]

¡Me gusta! Actualiza, prueba el enlace de la cabecera y... ¡la página funciona!

## ¿Añadir contenido manualmente?

Para poner contenido en esta página, ¡también podríamos hacerlo manualmente escribiendo código en nuestra app! La biblioteca Contentful que instalamos antes tiene un servicio `ClientInterface`que podríamos utilizar para obtener todas estas competencias de Contentful en nuestro controlador.

Pero en lugar de eso, vamos a tomar el camino más fácil y dejar que los diseños obtengan las habilidades por nosotros. Ah, pero antes de hacerlo, vuelve a `skills.html.twig`, añade un`{% block title %}`, escribe "Todas las habilidades" y luego `{% endblock %}`:

[[[ code('6587b84fd7') ]]]

Esto, como probablemente sepas, controla el título de la página. Hago esto aquí porque el bloque `title` en realidad no es algo que puedas controlar a través de Maquetaciones. Recuerda: todo lo que construimos en nuestra maquetación pasa a formar parte de un bloque llamado`layout`.

## Añadir el diseño de la lista de habilidades

Bien, pulsa "Publicar" en el Diseño de la página de inicio... y crea un nuevo diseño. Utilizaré mi "Diseño 2" favorito y lo llamaré "Diseño de lista de habilidades".

Ya sabes cómo funciona. Empieza por enlazar la zona de cabecera... y la zona de pie de página. A continuación, vamos a crear otro héroe. Añade una columna, dale una clase `hero-wrapper` y pon dentro un bloque "Título" con "Todas las habilidades". Para molar aún más, añade un bloque de texto debajo con algún contenido de introducción.

¡Buen comienzo! Publica la maquetación... así podremos ir a enlazarla a la página `/skills`. Pulsa "Añadir nueva maquetación" y enlaza esto a la "Maquetación de la lista de habilidades". Luego ve a "Detalles". Esta vez mapearé a través de la Información de la Ruta, establecida en `/skills`. Pulsa Guardar cambios.

Vamos a ver cómo queda nuestro primer intento. Y... ¡no está mal!

## Añadir la parrilla de habilidades

Ahora vamos a añadir lo importante. Vuelve al administrador de diseños y edita este diseño.

Debajo de la columna, añade una nueva cuadrícula. Cámbiala de colección manual a colección dinámica. El paquete Contentful nos ofrece dos nuevos "tipos de consulta", o formas de "obtener" datos de Contentful. Utiliza la "Búsqueda Contentful". Es la principal.

Esto te permite elegir qué tipos de contenido mostrar, como todos... o sólo habilidades. Luego podemos ordenarlos, añadir una búsqueda, omitir elementos o limitarlos. Es todo lo que queremos, ¡desde el principio!

¿Qué aspecto tiene? Pulsa "Publicar". Seguro que lo adivinas. ¡Sí! "Funciona"... imprimiendo el título de cada habilidad. Oh, déjame al menos añadir esa clase "contenedor"... para obtener el margen izquierdo y derecho.

Pero, ¡obviamente esto no es lo que queremos! Necesitamos poder darle estilo e imprimir más campos aparte del título. Tenemos el mismo problema en la página de inicio.

Y en realidad, ¡esto es aún más complejo de lo que parece! Cuando personalizamos cómo se muestra una cuadrícula de habilidades, quiero poder hacer que esos elementos se vean de una manera en la página de inicio, y de otra diferente en la página "Habilidades", probablemente más grandes y con más campos impresos.

A continuación: vamos a empezar a aprender el importantísimo tema de cómo podemos anular y personalizar las plantillas de Diseños para que podamos hacer que las cosas se vean exactamente como queremos.
