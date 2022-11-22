# Crear y mapear diseños

Bien, veamos de qué se trata Layouts. En este capítulo, crearemos y utilizaremos, paso a paso, un "diseño", aprendiendo cómo funciona exactamente la magia de los Diseños.

Para comprobar la sección de administración de los Diseños, dirígete a `/nglayouts/admin` y encontrarás... ¡un formulario de acceso! El formulario de inicio de sesión no tiene nada que ver con los Layouts... es que el área de administración de los Layouts requiere que estés conectado... y ya he añadido un formulario de inicio de sesión a nuestro sitio. ¡Incluso hay un usuario en la base de datos! Inicia sesión con`doggo@barkbite.com`, contraseña `woof`.

## El rol de seguridad necesario para el área de administración

Y cuando lo enviamos... ¡acceso denegado! No te preocupes: haz clic abajo en el icono de seguridad de la barra de herramientas de la web... y ve a "Decisión de acceso". Sí: nos han denegado el acceso porque buscaba un rol llamado `ROLE_NGLAYOUTS_ADMIN`. Para acceder al área de administración de los diseños, necesitamos tener este rol.

La forma más sencilla de añadirlo es ir a `config/packages/security.yaml`. El usuario con el que estamos conectados ahora mismo tiene `ROLE_ADMIN`. Por lo tanto, en `role_hierarchy` también le damos a nuestro usuario `ROLE_NGLAYOUTS_ADMIN`:

[[[ code('e46ba5fe4a') ]]]

## Creando nuestro primer diseño

Y ahora si volvemos a hacer clic, ¡tachán! ¡Bienvenido a la sección de administración de layouts! Para entender lo que hace Layouts... lo mejor es verlo en acción. Empieza en esta sección de Diseños... y haz clic para crear un nuevo diseño. Esto nos muestra unos seis tipos de diseño diferentes entre los que podemos elegir. Como verás, son mucho menos importantes de lo que puede parecer al principio, porque, una vez que estás en una disposición, puedes hacer realmente lo que quieras, incluso hacer flotar cosas a izquierda y derecha. Yo suelo elegir la "Disposición 2". Llámalo "Diseño de la página de inicio" porque pienso utilizarlo en nuestra página de inicio.

Y... ¡bienvenido al editor de diseño! Recorrido rápido: estos elementos del lado izquierdo se llaman "bloques", y hay muchos tipos diferentes, desde simples bloques de título a mapas de Google... hasta cosas más complejas como listas y cuadrículas en las que puedes representar colecciones dinámicas de cosas, como recetas destacadas. Lo principal que "hacemos" en esta página es elegir un bloque de la izquierda... y arrastrarlo a una de las "zonas" del centro.

## Colocar los bloques en el diseño

Coge un bloque "Título" y arrástralo a algún lugar de la página... luego dale algo de texto. ¡Genial!

Es un comienzo modesto, pero, ¡bastante bueno! En la parte superior derecha, pulsa "Publicar diseño".

Y ahora que tenemos este nuevo diseño, abre una segunda pestaña y ve a la página de inicio para descubrir que... ¡no ha cambiado absolutamente nada! Deja que reorganice mis pestañas.

## Mapeo de un diseño

De todos modos, nada ha cambiado porque, una vez que tienes una disposición, necesitas asignarla a una página o conjunto de páginas específicas. Ese es el trabajo de la sección de mapeo de diseños. Realmente son las dos únicas secciones importantes en el área de administración.

Aquí, añade un nuevo mapeo y luego ve a Detalles. Hay varias formas de asignar un diseño a una URL específica. Puedes utilizar, por ejemplo, la información de la ruta, que es un término elegante que significa "la URL, pero sin parámetros de consulta". O puedes usar un prefijo de información de la ruta, como usar esta disposición para todas las URL que empiecen por "/productos". O incluso puedes asignar un diseño a un nombre de ruta específico.

Vamos a probar eso. Pulsa "Añadir objetivo". Entonces... vamos a buscar el nombre de la ruta de nuestra página de inicio:`src/Controller/MainController.php`. Aquí está: `app_homepage`:

[[[ code('d1393347fe') ]]]

Vuelve a desplazarte, pega y pulsa "Guardar objetivo".

Más adelante hablaremos de otras formas de mapear o "activar" un diseño para las páginas, pero la información de rutas y caminos es la más sencilla y flexible. Dicen:

> Si la ruta o la URL actuales coinciden con lo que tenemos aquí, utiliza este diseño.

Pulsa guardar cambios. Para elegir qué maquetación va con este mapeo, pulsa "Maquetación de enlace" y selecciona la única: "Diseño de la página de inicio".

¡Genial! Ahora, cuando vayamos a la página de inicio, se utilizará el diseño de la página de inicio. Pero... ¿qué significa eso? ¡Vamos a averiguarlo! Actualiza y... ¡todavía no vemos ninguna diferencia! ¡Es la misma página estática de Symfony!

## Ampliando el diseño base dinámico

Ah, eso es porque nos hemos saltado un paso importante de la instalación. ¡Culpa mía! Ve a abrir la plantilla de esta página: `templates/main/homepage.html.twig`. Ahora mismo, estamos ampliando `base.html.twig`:

[[[ code('69c71706f3') ]]]

Y esa plantilla, como es habitual, tiene un bloque llamado `body` en el centro:

[[[ code('7b98ab918d') ]]]

Así que es una configuración súper tradicional.

Ahora, cambia el `extends` por una variable dinámica llamada `nglayouts.layoutTemplate`:

[[[ code('081e4be324') ]]]

## Configurar el diseño base

Prueba la página de nuevo. ¡Error! ¡Eso es un progreso! Dice:

> Diseño base de la página, no especificado. Para renderizar la página con Layouts, especifica
> el diseño base de la página con esta configuración.

Todo esto tendrá más sentido dentro de un minuto. Lo que quiere que hagamos es abrir`config/packages/` y crear un nuevo archivo -que puede llamarse como sea- pero llamémoslo `netgen_layouts.yaml`. Dentro, añade `netgen_layouts` y, debajo,`pagelayout` ajustado a nuestro `base.html.twig`:

[[[ code('27cfddc67a') ]]]

Te explicaré todo esto en un minuto. Si refrescamos ahora... ¡eh, el mismo error! Es posible que Symfony no haya visto mi nuevo archivo de configuración... así que déjame borrar la caché para estar seguro:

```terminal-silent
php ./bin/console cache:clear
```

Y ahora... ¡sí! ¡Funciona! Excepto que... ¡sigue siendo la misma página estática! Pero, por primera vez, abajo en la barra de herramientas de depuración de la web, muestra que se está utilizando el "Diseño de la página de inicio". Así que se ha dado cuenta de que el diseño debe ser utilizado... sólo que no parece estar renderizándolo.

## Renderizar el bloque de diseño

Para solucionarlo, tenemos que hacer una última cosa... y luego retrocederemos para explicar lo que está pasando y lo genial que es. En `base.html.twig`, alrededor de `{% block body %}`, añade `{% block layout %}`... luego después de `{% endblock %}`:

[[[ code('8867c5b0b5') ]]]

Actualiza una vez más. Y... ¡guau! ¡Nuestra página ha desaparecido! Vale, todavía tenemos el nav y el pie de página... que vienen de arriba y de abajo de los bloques en `base.html.twig`, pero el contenido real de nuestra página ha desaparecido y ha sido sustituido por el bloque de título dinámico ¿Qué magia negra es ésta?

## La magia de la herencia de plantillas de diseño

En primer lugar, antes de explicarlo, permíteme decir que hay formas mucho más rápidas de empezar con Netgen Layouts: tienen proyectos de inicio para aplicaciones normales de Symfony, aplicaciones de Sylius y aplicaciones de Ibexa CMS. Pero hemos hecho todo este trabajo de configuración manualmente a propósito... porque realmente quiero que entiendas cómo funcionan los Layouts: es sorprendentemente sencillo.

En primer lugar, nuestra página sigue llegando a nuestra ruta normal - `app_homepage` - y sigue ejecutando nuestro controlador normal y sigue renderizando nuestra plantilla normal. No hay nada de magia ahí.

Pero entonces, extendemos `nglayouts.layoutTemplate`. ¿A qué apunta eso? Si no hay ningún diseño asignado a una página concreta, `nglayouts.layoutTemplate` resolverá a `base.html.twig`. Eso es gracias a la configuración que hemos añadido aquí:

[[[ code('e2c3c9b79f') ]]]

Pero si Layouts encuentra una asignación de diseño para esta página, entonces`nglayouts.layoutTemplate` resuelve a una plantilla de Layouts del núcleo. En este caso, si pulsas `Shift`+`Shift`, se llamará `layout2.html.twig`... ya que hemos seleccionado "Layout 2".

Esto renderiza el diseño dinámico a través de estas etiquetas `nglayouts_render_zone`: cada una de ellas se refiere a una sección diferente -o "zona"- dentro de nuestro diseño.

En cualquier caso, lo realmente importante es que convierte el diseño en un bloque Twig llamado `layout`. A continuación, extiende `ngLayouts.pageLayoutTemplate`, que resuelve a nuestro `base.html.twig`.

El resultado final es que nuestra página se renderiza con total normalidad y sigue extendiendo`base.html.twig`... pero se ha añadido un bloque llamado `layout` que contiene el contenido del diseño dinámico.

Por eso no vimos ningún cambio en la página al principio. Hasta que no incluimos `{% block layout %}` en `base.html.twig`, el diseño se estaba cargando... sólo que no lo estábamos mostrando en ningún sitio.

La conclusión es la siguiente: si estás en una página que no está maquetada, todo es exactamente igual que siempre. Pero si estás en una página que se mapea a un diseño, simplemente significa que ahora tienes un bloque llamado `layout` cuyo contenido es igual a lo que tengas dentro de ese diseño.

## Extender el diseño dinámico a todas las páginas

Como he mencionado antes, no tenemos que añadir maquetas a todas las páginas de nuestro sitio: ¡podríamos añadirlas a la página de inicio y listo! Pero todas las páginas que queramos que admitan diseños tienen que ampliar `nglayouts.layoutTemplate`. Lo bueno es que, incluso si ampliamos esto, no ocurre nada a menos que asignemos un diseño a esta página. Así que no hay ningún inconveniente en utilizarla en todas partes. Actualizaré rápidamente`login.html.twig` para utilizarlo:

[[[ code('2dd3fa018d') ]]]

luego `list.html.twig` y `show.html.twig`:

[[[ code('0325f4f028') ]]]

[[[ code('959088390f') ]]]

¡Realmente puedo moverme rápido cuando lo necesito!

De vuelta al navegador, las páginas de la lista de recetas y de la muestra de recetas siguen teniendo el mismo aspecto... porque no se ha resuelto el diseño. Pero ahora están preparadas para usar maquetas, si queremos.

Ahora, por muy interesante que sea controlar dinámicamente el contenido de la página de inicio, ¡hemos hecho demasiado! Todo nuestro antiguo contenido ha desaparecido. ¿Es posible mezclar el contenido dinámico con parte del contenido estático de nuestra plantilla Twig de la página de inicio? Por supuesto. Y eso es una gran parte de lo que hace que los diseños sean especiales. Eso a continuación.
