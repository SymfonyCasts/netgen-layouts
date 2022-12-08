# Asignar un diseño a las páginas de Contentful

La integración de Contentful que acabamos de instalar ha añadido dos cosas a nuestro sitio. En primer lugar, ha añadido una integración de Layouts: nuevos tipos de valores, tipos de consulta, etc. para que podamos seleccionar nuestro contenido de Contentful en bloques de listas y cuadrículas. En segundo lugar, ha añadido la posibilidad de que cada contenido de Contentful tenga su propia URL y página en nuestro sitio. La segunda parte no tiene nada que ver con los Diseños.

Hace un minuto, utilizamos este práctico comando `contentful:routes` para ver que ahora debería haber una página en la URL `/mashing`. Cuando fuimos allí, no nos dio un error 404, pero no funcionó exactamente. La página está casi vacía.

## Depuración del funcionamiento de las páginas dinámicas de Contentful

Veamos qué está pasando. Haz clic en el icono Twig de la barra de herramientas de depuración web para averiguar qué plantillas se están renderizando. Veamos aquí... si bajamos un poco... aparentemente se renderiza `@NetgenLayoutsContentful/contentful/content.html.twig`. ¡Esa debe ser la plantilla de esta página! Vamos a comprobarlo.

Le daré a `Shift`+`Shift` y buscaré `content.html.twig`: queremos la de`layouts-contentful`. Y... ¡genial! Esta es la plantilla que está renderizando esa página. Imprime `content.name`... pero en realidad nunca la vemos. Ah, eso es porque la renderiza en un `block` llamado `content`. Éste acaba extendiendo`base.html.twig`... y como nuestra plantilla base nunca renderiza `block content`, no vemos nada. De nuevo, esta parte de Contentful en la que obtienes una URL que renderiza un controlador, que a su vez renderiza esta plantilla... no tiene nada que ver con los Diseños. Es sólo una bonita forma de exponer cada pieza de contenido de Contentful como una página de nuestro sitio.

Así que, sin relación con Layouts, si quisiéramos, podríamos reemplazar esta plantilla en nuestra aplicación y personalizarla para que funcione. Podríamos cambiarla para utilizar `block body` y aprovechar esta variable `content`, que representa el contenido, para mostrar todos los campos.

Pero... espera un segundo. ¿No es ese el objetivo de Layouts? Los diseños nos permiten crear páginas dinámicamente, en lugar de escribirlas completamente en Twig. Ahora mismo, esta página no está vinculada a ningún diseño. Pero si la vinculáramos, podríamos empezar a construir la página utilizando los datos de la Habilidad Contentful correspondiente, en este caso, de la Habilidad "Machacar".

## Asignar un diseño a la página dinámica

Dirígete a nuestra sección de administración, publica ese diseño y crea un nuevo diseño. Lo llamaré "Diseño de habilidad individual"... y elige "Diseño 2". Con el tiempo, haremos que se parezca más al "Diseño 5"... pero podemos hacerlo más adelante mediante los bloques de columnas. Ésa es una de las razones por las que me gusta la "Presentación 2": es bastante sencilla, y podemos hacerla más compleja más adelante con las herramientas que ya tenemos.

Bien, empieza como siempre. Cierra la barra de herramientas de depuración web para que podamos vincular la cabecera a la cabecera compartida... y nuestro pie de página al pie de página compartido. Estupendo. Luego, para empezar, añade un bloque Título, escribe algo... y publica el diseño.

## Asignar un diseño a las entradas de Contentful

A continuación, tenemos que asignar este diseño a esa página. Hasta ahora, hemos mapeado maquetaciones por el nombre de la ruta o por la URL, también conocida como "Información de la ruta". Podríamos volver a hacerlo aquí. Pero, como verás, lo que realmente queremos hacer es utilizar este diseño para todas las páginas de Skills. Dentro de unos minutos, cambiaremos la URL de estas páginas de algo como `/mashing` a `/skills/mashing`. Cuando lo hagamos (permíteme añadir una nueva asignación aquí y pulsar detalles), podríamos utilizar el "Prefijo de información de ruta" para asignar esta disposición a cualquier URL que empiece por `/skills/`.

Pero, algo que puede añadirse a los Diseños es otra forma de mapear o resolver qué diseño debe utilizarse en cada página. Y, ¡sí! El bundle Contentful añadió dos nuevos: Entrada Contentful y Espacio Contentful. Cuando vamos a una de estas páginas de Contentful, la ruta dinámica le dice a Symfony a qué Contentful Entry - que es la pieza individual de contenido en Contentful - y a qué Contentful Space corresponde esta página.

Gracias a esto, podemos aprovechar uno de estos nuevos objetivos para que coincida con la entrada o el espacio. Por ejemplo, podríamos utilizar la Entrada Contentful para mapear un diseño específico a un elemento específico en Contentful. Literalmente, podríamos decir

> Si el Contenido actual es específicamente esta habilidad "Machacar", entonces utiliza esta disposición.

O podríamos hacer lo que yo voy a hacer: mapear a través del Espacio de Contentful. Sólo tenemos un Espacio, así que es bastante fácil. Básicamente, estamos diciendo

> Si estamos en cualquier página dinámica de Contentful, quiero que mapees a este diseño.

Guardemos esto... y luego vinculemos este diseño al "Diseño de habilidad individual". Pulsa "Confirmar" y... ¡listo! Ve, actualiza y... ¡funciona! ¡Sí!

## Asignación a un tipo de contenido específico

Como he mencionado antes, en realidad tenemos dos tipos de contenido en Contentful: Habilidades y Anuncios. Los anuncios no deben tener su propia página, sólo las habilidades. Vamos a incrustar anuncios en algunas páginas existentes un poco más adelante.

Vuelve a los detalles de la vinculación del diseño.  Además del espacio Contentful, podemos bajar
aquí a una lista de condiciones y seleccionar "Tipos de contenido Contentful". Las condiciones son una forma de hacer que tu vinculación sea más específica. Añade esa condición. Y, esto es un poco difícil de ver, pero podemos seleccionar "Habilidad" o "Anuncio". Selecciona "Habilidad", guarda los cambios y... ¡genial! Ahora sólo coincidirá si vamos a una URL de Contentful que esté mostrando una habilidad.

En la línea de comandos, puedes ver que tenemos un anuncio... es esta URL de aspecto gracioso. Sí, ahora mismo, el anuncio está disponible como página en nuestro sitio. Lo arreglaremos en unos minutos. Pero, como mínimo, si fuéramos a esa URL rara, la página funcionaría... pero no coincidiría con ningún diseño gracias a nuestro mapeo. Así que, básicamente, estaría en blanco.

Así que ahora tenemos control sobre las páginas de Contentful. ¡Genial! Aunque... lo único que estamos renderizando es un título manual. Snooze.

A continuación: Hagamos nuestro diseño más inteligente mostrando contenido real de la habilidad correspondiente.
