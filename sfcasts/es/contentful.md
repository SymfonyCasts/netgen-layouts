# Contentful: Cargar datos de un CMS externo

Si añadiéramos cinco entidades más y quisiéramos poder seleccionarlas como elementos en el admin de Layouts, podríamos añadir otros cinco tipos de valor, tipos de consulta y vistas de elementos. Ahora que sabemos lo que estamos haciendo, es un proceso bastante rápido y nos daría mucha potencia en nuestro sitio.

Pero una de las cosas bonitas de los Layouts es que nuestros tipos de valor pueden proceder de cualquier parte: una Entidad Doctrine, datos de una API externa, datos de un almacén Sylius o de Ibexa CMS. De hecho, sistemas como Sylius e Ibexa ya tienen paquetes que hacen todo el trabajo de integrar y añadir los tipos de valor por ti.

Una de las grandes piezas que faltan en nuestro sitio son las habilidades. Las habilidades de la página de inicio están codificadas y el enlace "Todas las habilidades" ni siquiera va a ninguna parte. Podríamos haber optado por almacenar estas habilidades localmente a través de otra entidad Doctrine, pero en lugar de eso, vamos a cargarlas desde una API externa a través de un servicio llamado "Contentful".

## ¡Hola Contentful!

Me dirigiré a Contentful.com e iniciaré sesión. Esto me lleva a un espacio "Contentful" llamado "Bark & Bake" que ya he creado. ¡Contentful es increíble! Es básicamente un CMS como servicio. Nos permite crear diferentes tipos de contenido llamados "modelos de contenido". Ahora mismo, tengo un modelo de contenido llamado "Habilidad" y otro llamado "Anuncio". Si hiciéramos clic en ellos, podríamos introducir contenido a través de una interfaz superamigable. Ya he creado 5 habilidades, cada una con un montón de datos.

Así que, aquí creas y mantienes tu contenido. Luego Contentful tiene una API restful que podemos utilizar para obtener todo esto.

Contentful es genial. Pero el objetivo de esto no es enseñarte sobre Contentful, ¡no! Se trata de mostrarte cómo podemos obtener contenido para los diseños desde cualquier lugar. Por ejemplo, si queremos cargar "habilidades" de Contentful, podríamos crear manualmente un nuevo tipo de valor y hacer todo el trabajo que hicimos antes, excepto hacer peticiones a la API de Contentful en lugar de consultar la base de datos.

¡Pero! ¡Ni siquiera necesitamos hacer eso! ¿Por qué? Porque Layouts ya tiene un bundle compatible con Contentful. Ese bundle añade el tipo de valor, algunos tipos de consulta, las vistas de elementos e incluso la integración del navegador de contenido por nosotros. Woh.

¡Vamos a cogerlo!

## Instalar el bundle Contentful

Ve a tu terminal y ejecuta:

```terminal
composer require netgen/layouts-contentful -W
```

El `-W` está ahí sólo porque, al menos al grabar esto, Composer necesita poder degradar un pequeño paquete para contentar a todas las dependencias. Esa bandera le permite hacerlo.

De acuerdo La receta de este paquete ha añadido un nuevo archivo de configuración:`config/packages/contentful.yaml`:

[[[ code('e2e15fc0f4') ]]]

Y éste lee dos nuevas variables de entorno... que viven en `.env`:

[[[ code('e02c9c2595') ]]]

Ya que estamos aquí, actualicemos estos valores para que apunten a mi espacio Contentful. Copia las claves del bloque de código de esta página y pégalas aquí. Aquí están mi`CONTENTFUL_SPACE_ID`... y mi `CONTENTFUL_ACCESS_TOKEN`, que nos darán acceso de lectura a mi espacio:

[[[ code('fe36bf9250') ]]]

## Contentful + Layouts

Vale, la integración Layouts + Contentful nos da dos cosas muy distintas, y es súper importante entender la diferencia para que todo quede claro.

En primer lugar, el paquete añade una integración entre Layouts y Contentful. Esto significa que añade nuevos tipos de valores, nuevos tipos de consulta y todas las demás cosas que acabamos de añadir para Doctrine. En otras palabras, podemos añadir instantáneamente las competencias o anuncios de Contentful en bloques de lista o cuadrícula. Eso es genial, y lo veremos pronto.

La segunda cosa que añade la integración de Contentful no tiene nada que ver con Layouts. Son las rutas dinámicas. Añade un sistema para que cada "elemento" de Contentful esté disponible a través de su propia URL. Literalmente, todas estas habilidades tendrán al instante su propia página en nuestro sitio. Esto no tiene nada que ver con los Diseños, que consisten en controlar el diseño de las páginas existentes en tu sitio, no en añadir páginas nuevas.

## Configurar el enrutamiento dinámico

Pero, como Contentful es un CMS, es bueno tener una página para cada contenido. Para poner en funcionamiento las rutas dinámicas, entra en el directorio `config/packages/` y añade un nuevo archivo llamado `cmf_routing.yaml`. CMF Routing es un paquete que Contentful utiliza entre bastidores para añadir las rutas dinámicas. Pego aquí un poco de configuración:

[[[ code('429d1d05f7') ]]]

Es feo... pero esta parte no tiene nada que ver con Layouts, así que no importa demasiado. Se trata de permitir que Contentful añada automáticamente URL dinámicas a nuestro sitio.

Este sistema de enrutamiento almacena las rutas en la base de datos... y eso significa que necesitamos una nueva base de datos. Dirígete a tu consola y ejecuta:

```terminal
symfony console make:migration
```

Y... Me aparece un error. Grosero. Probemos a borrar la caché... puede que haya pasado algo raro... o que aún no haya visto mi nuevo archivo de configuración.

```terminal-silent
php bin/console cache:clear
```

Una vez borrada la caché... Volveré a hacer la migración:

```terminal-silent
symfony console make:migration
```

Esta vez... ¡perfecto! Abro el directorio `migrations/`, busco ese archivo y... ¡se ve bien!

[[[ code('8225b80524') ]]]

Tenemos unas cuantas tablas que contienen información sobre nuestros datos de Contentful... y unas cuantas para almacenar esas rutas dinámicas.

Ahora Ejecuta:

```terminal
symfony console doctrine:migrations:migrate
```

Y... ¡woohoo! Tenemos las nuevas tablas que necesitamos.

Por último, podemos ejecutar un comando para cargar todo nuestro contenido desde Contentful y crear esas rutas dinámicas. Una vez más, se trata de una funcionalidad que no tiene nada que ver con los Diseños. Ejecuta:

```terminal
symfony console contentful:sync
```

Y... ¡precioso! Cargó seis elementos. En producción puedes configurar un webhook para que tu sitio se sincronice instantáneamente con cualquier cambio que hagas en Contentful. Pero mientras estamos desarrollando, ejecutar este comando funciona bien.

El resultado de este comando es que cada contenido de Contentful tiene ahora su propia página Para verlas, ejecuta:

```terminal
symfony console contentful:routes
```

Y... ¡impresionante! Parece que tengo una URL llamada `/mashing`. Vamos a comprobarlo! Vuelve a nuestro sitio, navega hasta `/mashing` y... ¡funciona! Más o menos. Está aquí, pero la parte central está vacía.

Hablemos de lo que ocurre a continuación y de cómo podemos aprovechar los Diseños para dar vida a esta página.
