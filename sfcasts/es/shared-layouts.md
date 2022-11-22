# Diseños compartidos

Abre `base.html.twig` y mueve el `{% block layout %}` para que esté alrededor de todo. Así, pon el inicio justo dentro de la etiqueta `body`... y el final justo antes de la etiqueta de cierre`body`:

[[[ code('aa49c5d223') ]]]

Si ahora actualizamos la página de inicio... ¡se destruye! La parte superior `nav` y `footer` han desaparecido. ¿Por qué he hecho esto? ¡Porque me encanta el caos! Es broma, lo he hecho porque nos da el poder, dentro de los layouts, de diseñar páginas totalmente personalizadas: incluso páginas sin los tradicionales `navigation` y `footer`, tal vez como una página de aterrizaje temporal para una promoción.

Pero seamos sinceros, el 99% de las veces, querremos los `nav` y `footer`. No hay problema, vuelve a `base.html.twig`. Recuerda: añadir bloques nos da más flexibilidad. Así que, encima de la navegación, añade un nuevo bloque llamado `navigation`, con `{% endblock %}` después. Luego, aquí abajo, otro llamado `footer`... y`{% endblock %}`:

[[[ code('a91fe5214d') ]]]

Apuesto a que sabes lo que voy a hacer a continuación. En el administrador del diseño, ahora podemos añadir un bloque Twig en la parte superior que muestre `navigation`... y otro aquí abajo en la parte inferior. No es necesario que esté en esta última zona... pero tiene sentido allí. Renderiza `footer`.

¡Vamos a probarlo! Pulsa "Publicar y continuar editando" y... actualiza. ¡Ya estamos de vuelta!

## Crear una segunda maqueta

Vamos a crear un segundo diseño, esta vez para la página `/recipes`. Si miras en `RecipeController`, verás que ya he hecho todo el trabajo para consultar las recetas y pasarlas a esta plantilla:

[[[ code('19661a73f5') ]]]

Y en esa plantilla, hacemos un bucle y renderizamos cada una, con paginación:

[[[ code('a5a9d53de5') ]]]

Y así, definitivamente quiero incluir todo este trabajo personalizado en el nuevo diseño.

De vuelta al área de administración, pulsaré "Publicar diseño" como una forma fácil de volver a la lista de diseños. A continuación, pulsa en nuevo diseño, elegiré mi diseño favorito 2 y lo llamaré "Diseño de la lista de recetas". Para empezar, añade un nuevo bloque llamado "Vista completa"... y arrástralo a cualquier parte de la página, ¡vaya! Ya está.

¿Qué es esta "Vista completa"? No es nada especial, de hecho, ¡es un poco redundante! No es más que un "bloque Twig" que renderiza el bloque llamado `body`. Así que, sí, podríamos haber hecho esto fácilmente utilizando el bloque Twig normal y escribiendo `body`.

Publica este diseño... y luego ve a "Mapeos de diseño". Añade una nueva... y esta vez la enlazaré primero... a "Diseño de la lista de recetas". Luego haz clic en "Detalles". Como la última vez, podríamos mapear esto a través del nombre de la ruta. Pero para ver algo diferente, utiliza "Información de la ruta", que, de nuevo, es sólo una palabra elegante para la URL, pero sin ningún parámetro de consulta. Haz que coincida con `/recipes`... "Guarda los cambios" y... ¡bien!

Cuando probamos la página... ¡se ve genial! Excepto que, ¡me olvidé del nav y del pie de página! Añadir esos dos bloques al "Diseño de la lista de recetas" es fácil. Pero ¿qué pasa si, más adelante, decidimos que cada página debe mostrar tanto el bloque de navegación en la parte superior como un banner dinámico, quizá para una venta que estemos realizando? Si eso ocurriera, tendríamos que editar cada diseño para añadir manualmente ese nuevo banner.

## Diseños compartidos

Afortunadamente, hay una forma mejor de manejar elementos de diseño repetidos como éste.

Pulsa "Descartar" para volver a la lista de diseños, y luego haz clic en "Diseños compartidos" y "Nuevo diseño compartido". Como siempre, el tipo de diseño no importa mucho, así que usaré el normal... y lo llamaré "Diseño de navegación y pie de página".

Este no va a ser un diseño real que esté vinculado a ninguna página. No, sólo va a ser una maqueta de la que robaremos piezas. En la zona superior, crea un bloque de Twig que se muestre en `navigation`... e incluso lo etiquetaré como "Top Nav" para que quede más claro. A continuación, en cualquier otra zona -puedes ponerla en la parte inferior, pero no es necesario-, añade otro bloque Twig que renderice `footer` y se etiquete como Pie de página.

¡Genial! Pulsa "Publicar diseño". Ahora tenemos un diseño compartido. De nuevo, no están pensados para ser asignados a páginas: están pensados para que los utilicemos en otros diseños reales.

Compruébalo: edita el "Diseño de la lista de recetas". En la parte inferior izquierda de la pantalla, escondido detrás de la barra de herramientas de depuración web -la cerraré temporalmente- hay un botón para vincular una zona con una zona de diseño compartido. Haz clic en él y selecciona la zona superior... llamada zona "Cabecera", aunque ese nombre no es importante.

Ahora, podemos encontrar una zona compartida desde un diseño compartido... y sólo tenemos una. Pulsa "Seleccionar zona" y... ¡ya está! La zona superior de nuestro diseño será ahora igual al bloque o bloques que haya en la zona superior de ese diseño compartido. Si añadimos más cosas a esa zona en el diseño compartido, aparecerán automáticamente aquí.

Hazlo una vez más: selecciona la última zona para que el pie de página aparezca definitivamente en la parte inferior, selecciona la zona compartida y... ¡listo!

Publica eso, muévete, actualiza y... ¡la página completa está de vuelta! Repitamos rápidamente esto para la "Disposición de la página de inicio". Pero esto es complicado porque pongo todos mis bloques dentro de esta zona superior. En general, estas zonas no importan, pero en este caso, para evitar sobrescribir todo esto, arrastraré todo excepto el bloque Twig de navegación hacia abajo. Podemos arreglar el orden más tarde.

Y ahora, configura la zona superior para que utilice la del diseño compartido. Sí Reemplaza lo que teníamos allí antes. A continuación, enlaza también la zona inferior con el diseño compartido.

¡Perfecto! Comprobemos el orden de nuestros bloques... que es lo bueno de los diseños. Si no me gusta el orden de lo que hay en mi página, ¡siempre puedo cambiarlo! Eso es mejor. Publica el diseño, vuelve a la página de inicio en el frontend y... ¡bien!

Siguiente: hagamos que nuestra página de la lista de recetas sea más flexible permitiendo que esta zona superior de `h1`se construya y personalice desde dentro de los diseños... en lugar de que esté codificada en la plantilla.
