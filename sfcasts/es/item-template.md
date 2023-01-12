# Plantilla de elementos Contentful

¡Nuestra plantilla "ítem" para habilidades ya se está utilizando! Así que, ¡vamos a terminarla!

Ya sabemos qué aspecto queremos que tengan las habilidades... así que vamos a robarlo de `templates/main/homepage.html.twig`. Busca el bloque `featured_skills`, copia el aspecto de una de esas habilidades y pégalo en `skill.html.twig`. Añadamos también `dump(item.object)` en la parte superior. Ya hemos creado antes una plantilla de artículo, así que sabemos que `item.object` debería darnos el "objeto" subyacente que representa esta entrada de Contentful.

Si nos dirigimos y actualizamos... ¡genial! Esto vuelca un objeto `ContentfulEntry`. Y, aunque no puedas verlo desde aquí, esta clase tiene un método `get()` que podemos utilizar para leer cualquiera de los datos subyacentes de Contentful.

Para las habilidades, si escarbamos un poco... tenemos campos como `title` y `shortDescription`. ¡Usémoslos! Por ejemplo, en el `<h3>`, digamos `{{ item.object.get('title') }}`. Y... ¡sí! Eso renderiza el título.

Para el `<img src="">`, sustituye lo de `asset()` por `item.object.get('image')`, seguido de `.file.url`, que es específico de Contentful. Rellena también el atributo `alt`con `item.object.get('title')`.

Lo último que tenemos que actualizar es la URL. Pero Si hubiéramos creado una página de "demostración de habilidades" en Symfony, ¡podríamos utilizar la función de ruta de Twig y enlazar a esa ruta! Sin embargo, cada página de habilidad se crea en realidad a través de una ruta dinámica gracias al bundle Contentful. Y, para crear esas rutas, utiliza el sistema de rutas CMF.

Así que, para enlazar, tenemos que utilizar ese sistema. Por ejemplo, `path('cmf_routing_object')` y pasar `_route_object` a `item.object`.

Si estuvieras utilizando Sylius o Ibexa CMS, utilizarías alguna función de su sistema para crear este enlace: esto es específico del sistema de enrutamiento CMF.

Si nos dirigimos a él y lo probamos... ¡sí! Y si hacemos clic en él... ¡doble sí!

Celebrémoslo eliminando el `dump()`... y borrando el bloque `featured_skills`de nuestra plantilla de página de inicio. Ya no lo necesitaremos. Incluso podemos rehacer este `<h2>` dentro del administrador de diseños. Hagámoslo: añade un bloque Título llamado "Habilidades destacadas", hazlo "Título 2"... y dale la misma clase CSS:`text-center mb-4`.

La Rejilla ya está en un contenedor... pero queremos todo esto en un contenedor. Así que añade una Columna, envuélvela en un Contenedor, mueve los bloques Rejilla y Título dentro de ella... entonces ya no necesitaremos un Contenedor justo ahí. Elimina el bloque "Características Habilidades"... y finalmente pulsa "Publicar y continuar editando". Mientras esperamos, elimina también ese bloque de la plantilla Twig.

Y ahora... ¡sí! ¡El aspecto es perfecto!

## La vista de elementos publicitarios

Vale, ya que estamos hablando de vistas de elementos, vamos a personalizar la plantilla de elementos para nuestro otro modelo de contenido dentro de Contentful: Publicidad. Sólo vamos a renderizarlo en un lugar, en una página específica de habilidades justo... aquí. Vamos a comprobarlo.

Publica este diseño... y luego edita el diseño individual de la habilidad. Antes hemos utilizado el bloque Campo de entrada Contentful para mostrar el campo `advertisements`, que es una "entidad referenciada". Sí, si modificas una habilidad en Contentful, abajo en la parte inferior, el campo "Anuncio" te permite elegir entre los Anuncios de nuestro sistema.

Haz clic en el icono Twig de la barra de herramientas de depuración web... busca "elemento", y desplázate hacia abajo.. No es ninguna sorpresa: está utilizando la plantilla estándar "item" de Contentful. Y, buena noticia, ya sabemos cómo anularla.

Ve a nuestra configuración, copia la sección `contentful_entry/skill` y pégala a continuación. A continuación, sustituye `skill` por `ad` para el nombre de la sección, `template` y, por último, establece `content_type` en `advertisement`... porque ése es el nombre interno de ese tipo en Contentful.

¡Vale! Vamos a añadir esa plantilla. En `contentful_entry`, crea un nuevo archivo llamado`ad.html.twig`... y luego simplemente añade algo de texto: `Advertisement`.

Momento de la verdad. Vuelve, actualiza... ¡ya lo tenemos! ¡Ha sido fácil!

Para el contenido real de la plantilla, simplemente pegaré algo. Una vez más, utilizaremos`item.object.get()` para leer el campo `url`. También hay un campo `image` y un campo`shortText`. Y ahora... ¡ya lo tenemos!

Lo siguiente: ¿Qué pasaría si quisiéramos crear una Cuadrícula de elementos en nuestro sitio, pero hacer que esa única Cuadrícula tuviera un aspecto diferente al de todas las demás cuadrículas del sitio? Podemos hacerlo creando una "vista de bloque" adicional para un bloque existente.
