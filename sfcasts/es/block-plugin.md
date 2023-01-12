# Bloquear Plugins

¡Míranos! Hemos llegado al último tema del tutorial. Ya hemos transformado nuestro sitio estático en uno en el que podemos reordenar el diseño de cada página, mezclarlo con código personalizado de plantillas Twig y añadir contenido dinámico. Eso es... algo impresionante. Por supuesto, no hemos cubierto todo lo que puedes hacer con los Diseños, pero ahora eres realmente peligroso.

## ¿Crear un bloque personalizado?

Un tema que no hemos tratado es cómo crear un bloque totalmente nuevo, pero está documentado y, a estas alturas, creo que no sería demasiado difícil. ¿Por qué deberías crear un bloque personalizado? Supongamos que tienes algo superpersonalizado como nuestra área "Héroe" o esta área "suscribirse al boletín", que en realidad está potenciada por el paquete UX Live Component de Symfony, que le da el elegante comportamiento Ajax.

En cualquier caso, si quieres algo así en tu página, la forma más sencilla de añadirlo es... como hice yo en este proyecto: poner la lógica en Symfony, renderizar dentro de un bloque Twig, y luego incluir ese bloque Twig dentro de Layouts.

¿Pero qué pasa si queremos que el usuario administrador pueda añadir esto a varias páginas cuando quiera? Entonces sería útil crear un bloque personalizado. Los bloques personalizados también pueden tener opciones, así que incluso podrías permitirles personalizarlo de alguna manera.

## Plugins del Bloque Hola

De todos modos, hagamos un último reto relacionado con los bloques: crear un plugin de bloques. Ve a una página de demostración de habilidades. Hmm, probablemente nos vendría bien un poco más de margen entre estos bloques. Y esa es una necesidad bastante común. Podríamos manejar esto añadiendo una clase CSS que establezca el margen. Pero quiero hacerlo aún más fácil.

Ve al administrador de Diseños y edita el Diseño de habilidad individual. Bien, supongamos que queremos añadir algo de margen aquí. Para ello, quiero que el usuario administrador pueda hacer clic en cualquier bloque del sistema -por ejemplo, este bloque de columnas- y, en la pestaña de diseño, seleccionar el margen superior o inferior que necesite de un nuevo campo de formulario.

Es un objetivo bastante descabellado... ¡porque, para conseguirlo, necesitamos poder modificar todos los bloques del sistema! Afortunadamente, ése es exactamente el objetivo de un plugin de bloque: ampliar uno -o todos- los bloques.

## Crear el complemento de bloque

Manos a la obra. En el directorio `src/Layouts/`, crea una nueva clase PHP llamada, qué tal, `VerticalWhitespacePlugin`. Tiene que implementar `PluginInterface`. Pero en la práctica, extendemos una clase `Plugin` que implementa esa interfaz por nosotros. Ve a "Código"->"Generar", o `Command`+`N` en un Mac, e implementa el único método que necesitamos: `getExtendedHandlers()`:

[[[ code('df7bdd362a') ]]]

Vale, cada bloque del sistema -es decir, cada elemento de aquí del menú de la izquierda- tiene una clase detrás llamada manejador de bloques. Nuestro trabajo en `getExtendedHandlers()` es devolver un iterable de todos los "manejadores" que queramos extender. Por ejemplo, si sólo quisieras extender el bloque del título, podrías`yield TitleHandler::class`. ¿Cómo sabía que debía utilizar esa clase? Bueno, la mayoría de las veces puedes adivinarlo: el bloque de título tiene un `TitleHandler`. Pero si quieres mirar más a fondo, puedes ver todos los manejadores del sistema ejecutando:

```terminal
php bin/console debug:container --tag=netgen_layouts.block_definition_handler
```

De todos modos, en nuestro caso, queremos anular cada bloque. Así que podemos`yield BlockHandlerDefinitionInterface::class`, porque cada manejador de bloque debe implementar esa interfaz:

[[[ code('c8023c3d3a') ]]]

Y sí, acabo de olvidar por completo la palabra `Definition`. ¡Uy! Arreglaré esta mala interfaz en un minuto.

## Añadir un parámetro/campo de bloque personalizado

Para saber qué hacer a continuación, vuelve al menú "Código"->"Generar", selecciona "Anular métodos" y elige `buildParameters()`. No necesitamos llamar al método padre porque está vacío:

[[[ code('85ef1b82b1') ]]]

Parámetro es la palabra que utiliza Layouts para las opciones del formulario que puedes personalizar en la parte derecha de la pantalla para cada bloque. Gracias a nuestro método `getExtendedHandlers()`, cuando Layouts construya esas opciones para cualquier bloque, ahora llamará a este método y podremos añadir nuevos parámetros.

También necesitamos una declaración `use` para este espacio de nombres`ParameterType`:

[[[ code('cb192ec198') ]]]

¡Genial! Como puedes ver, Layouts viene con un montón de "tipos de campo" incorporados, como`BooleanField`, que se mostrará como una casilla de verificación. Su valor predeterminado es falso y tiene una etiqueta. Ah, ¿y este grupo? ¿Recuerdas que hay dos pestañas: "Diseño" y "Contenido"? Aquí es donde determinas dentro de cuál debe vivir tu parámetro.

Y la primera clave - `vertical_whitespace:enabled` es el nombre interno de este campo. Verás cómo lo utilizamos en un minuto.

Antes de que lo intentemos, el futuro Ryan acaba de informarme de que... ¡he metido la pata! Típico, desplázate hacia arriba. ¡Estoy cediendo la clase equivocada! Rendimiento `BlockDefinitionHandlerInterface::class`:

[[[ code('23c1bca5e6') ]]]

Así está mejor.

Ahora vamos a probar. Actualiza... haz clic en cualquier bloque... déjame encontrar mi bloque Título... y... ¡ahí está! ¡En cualquier bloque vemos el nuevo campo!

## Añadir parámetros/campos "hijos

Pero, la idea real es que, si el usuario lo activa, le mostramos dos campos más donde puede seleccionar el margen superior o inferior.

Para ello, después del primer campo, pegaré dos parámetros más:

[[[ code('96b06e749a') ]]]

Estos son básicamente como el primero. La gran diferencia es que, aquí arriba, dijimos`$builder->add()`. Pero ahora tenemos `$builder->get('vertical_whitespace:enabled')`y luego `->add()`. Esto hace que estos campos sean hijos del primero.

Esto está muy bien. Actualiza y... vamos a buscar el bloque Columna. Haz clic en "Activar espacio en blanco vertical". ¡Guau! ¡Aparecen los otros dos campos! Hagamos un espaciado superior "Medio" y un espaciado inferior "No". Publícalo.

## Utilizar los parámetros de la plantilla de bloque

Sin embargo, no debería sorprenderte demasiado que cuando actualicemos la página... ¡no ocurra absolutamente nada! Hemos añadido esas opciones... pero aún no las estamos utilizando en ningún sitio. Para ello, necesitamos anular una plantilla.

Pensemos: queremos que este margen superior e inferior se aplique a todos los bloques del sistema. Y, afortunadamente, todos los bloques del sistema acaban extendiéndose a`block.html.twig`: éste de aquí, en el directorio `nglayouts/themes/`.

Cópialo. Luego, anúlalo a través del sistema temático. Si seguimos la ruta...`standard/block`... `standard/block`... el nuevo archivo debería vivir aquí:`block.html.twig`. Pega el contenido dentro.

Para asegurarte de que funciona, pon un poco de `TEST`:

[[[ code('af2d79735c') ]]]

¡Ok! Actualiza el frontend. ¡Yupi! Sí, definitivamente funciona. Vamos... quita eso.

En la parte superior de la plantilla, tenemos una variable llamada `css_class`, que está establecida en algunas clases principales. Y ¡eh! ¡Llama a `block.parameter('css_class')`! Sí, ¡eso es lo que lee el campo "Clase CSS" de las opciones del bloque!

Luego, utiliza `|join(' ')` para combinar todo esto en una cadena.

Voy a eliminar ese `join()`... y luego cambiaré el nombre de esta variable a `css_classes`:

[[[ code('adbbdf8423') ]]]

Estamos configurando las cosas para que podamos modificar fácilmente esa variable. Aquí abajo, justo antes de `block_content`, vuelve a crear esa variable `css_class` configurada como`css_classes|join(' ')`:

[[[ code('b1a5b01a60') ]]]

Esta variable se utiliza en un montón de sitios diferentes y en plantillas hijo, así que tenemos que asegurarnos de que sigue establecida.

De todas formas, aquí arriba, ahora tenemos una matriz `css_classes`. ¡Vamos a utilizarla! Voy a pegar tres variables, cada una ajustada al valor de nuestros tres parámetros:

[[[ code('ce7b33eadc') ]]]

Aquí es donde resulta útil el nombre del parámetro que utilizamos en la clase.

Ahora, muy sencillo, si `use_whitespace`, entonces añade algunas clases de margen. También pegaré ese código:

[[[ code('26c42409e5') ]]]

Así, para el margen superior, añadiremos un nuevo `whitespace-top-` seguido de `none`,`small`, `medium` o `large`. Y lo mismo para el inferior.

Estas nuevas clases son totalmente inventadas: no forman parte del CSS de Bootstrap ni de nada, pero podrías hacer esto más inteligente para reutilizarlas. Pero para nosotros, si abres `assets/styles/app.css`... cerca de la parte superior, ¡allá vamos!

[[[ code('94ec7f3631') ]]]

Antes del tutorial, ya he preparado esas clases.

Así que... ¡debería funcionar! Muévete y actualiza. ¡Ya está! Nuestro bloque tiene un pequeño espacio en blanco superior extra... que proviene de nuestra nueva clase.

Y... ¡listo!, ¡Woo! ¡Gran trabajo, equipo! ¡Ahora eres un campeón de Layouts! Hacednos saber qué cosas chulas estáis construyendo con él. Y si tienes alguna pregunta, como siempre, estamos a tu disposición en la sección de comentarios.

Muy bien, gracias y hasta la próxima.
