# Temas y sustitución de plantillas

Ahora podemos añadir mucho contenido dinámico a nuestro sitio, como estos bloques estáticos de aquí arriba, cuadrículas o listas. Las cuadrículas y las listas pueden contener elementos de Contentful o de nuestra entidad`Recipe`. Pero para que nuestro sitio brille de verdad, necesitamos flexibilidad sobre el aspecto de estas piezas. Empecemos por lo más sencillo, anulando la plantilla que muestra el aspecto del bloque "Título" para toda nuestra aplicación.

## Encontrar plantillas de bloques en el perfilador

Para ello... primero tenemos que averiguar qué plantilla se encarga actualmente de representar este bloque. Una forma fácil de averiguarlo es ir a una página que muestre uno de estos bloques, actualizarla y hacer clic en el icono Twig de la barra de herramientas de depuración web. Abajo, en la parte inferior, vemos todo el árbol. Y si nos fijamos bien, ¡ah ja! ¡Parece que hay una plantilla llamada `block/title.html.twig`!

El propio Layouts también tiene una sección de la barra de herramientas de depuración web realmente bonita. Si vas a "Bloques renderizados", muestra "Definición de bloque: título", "Texto", "Lista" y "Pie". Y, como hemos visto, el Título se renderiza mediante `title.html.twig`.

## Hola Temas

Observa que casi todas estas plantillas están dentro de los directorios `themes/standard/`. Layouts tiene un concepto de temas, aunque no necesitaremos crear varios temas a menos que estemos construyendo algún tipo de aplicación multisitio. En nuestro caso, sólo vamos a utilizar el tema incorporado llamado `standard`.

Pero los temas siguen siendo importantes, porque cualquier cosa dentro de un tema puede ser fácilmente anulada colocando una plantilla en el lugar adecuado. Vamos a utilizar esa convención para anular la plantilla Título.

## Anular la plantilla Título

¡Vamos a hacerlo! Primero, en el directorio `templates/`, asegúrate de que tienes un subdirectorio `nglayouts/`. Dentro de él, añade uno nuevo llamado `themes/`... seguido de otro subdirectorio llamado `standard/`. Te habrás dado cuenta de que estamos igualando la estructura que hay aquí: `nglayouts/themes/standard/`.

Dentro de esto, como la plantilla de destino se llama `block/title.html.twig`, si creamos esa misma ruta, nuestro `title.html.twig` ganará. Hazlo: añade otro directorio llamado `block/` y un nuevo archivo dentro: `title.html.twig`. Para ver si funciona, escribe un texto ficticio:

[[[ code('a63c8ee8e8') ]]]

¡Probemos esto! Vuelve a la página Habilidades, actualiza y... no pasa absolutamente nada. Eso es porque la primera vez que creamos este directorio `themes/`, tenemos que borrar la caché.

```terminal-silent
php bin/console cache:clear
```

Hazlo... y después, vuelve a probar la página. ¡Yupi! ¡Ahora controlamos cómo se muestra el bloque Título! ¡El poder!

## Hacer que la plantilla de título sea más realista

Vale, pero aunque queramos personalizar cómo se muestra el Título... probablemente no queramos empezar de cero. Sería mejor reutilizar parte de la plantilla principal, o al menos utilizarla como referencia.

Pulsa `Shift`+`Shift`, busca `title.html.twig`, y selecciona "Incluir elementos no del proyecto". Abre la del núcleo desde `nglayouts/themes/`.

Vaya. Aquí pasan muchas cosas... incluido el hecho de que amplía otra plantilla: `block.html.twig`. Ábrela.

Contiene muchas funciones básicas, como leer la variable dinámica `css_class`, que contiene las clases CSS que introducimos en el administrador. También gestiona si hay un contenedor o no. ¡Son cosas útiles!

En `title.html.twig`, tiene código para saber si el título es o no un enlace y otras cosas. Podríamos sustituir totalmente esta plantilla e ignorar todo esto si quisiéramos. Pero en lugar de eso, copia la plantilla principal, pégala en nuestra versión:

[[[ code('7c0600c978') ]]]

Y sólo para demostrar que podemos, eliminemos esa clase `title`:

[[[ code('3954decadb') ]]]

¡Genial! Ahora ve, actualiza y... vuelve a tener el mismo aspecto que antes. Pero aquí abajo, ¡la clase `title` de `<h1>` ha desaparecido!

Así que la forma más sencilla de controlar el aspecto de algo es encontrar la plantilla que lo renderiza y anularla por completo utilizando esta estructura de directorios `themes/`.

Volvamos a utilizar este truco para personalizar el aspecto de un campo "activo" de Contentful, como este campo de imagen de habilidad. Pero por el camino, vamos a profundizar en algunos conceptos de enorme importancia: las vistas en bloque y los tipos de vista.
