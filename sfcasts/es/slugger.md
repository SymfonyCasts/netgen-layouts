# Personalizar el Slugger de Contentful

Antes de que sigamos personalizando el aspecto de nuestro sitio, quiero arreglar las URL de las habilidades para que en lugar de ser `/mashing`, la página sea `/skills/mashing`. Recuerda: el hecho de que nuestro contenido Contentful tenga instantáneamente URL en nuestro sitio proviene del paquete Contentful que instalamos antes. Pero esa magia no tiene nada que ver con los Diseños. Por tanto, personalizar esta URL también es específico de Contentful, no de Layouts. Pero... Realmente quiero arreglarlo.

## Crear la clase Slugger

En el directorio `src/Layouts/`, crea una nueva clase llamada `ContentfulSlugger`. Haz que implemente `EntrySluggerInterface`... y genera el único método que necesitamos: `getSlug()`:

[[[ code('d59c8a45d0') ]]]

Vamos a configurar las cosas para que se llame a este método cuando se creen las URL dinámicas de todas las entradas de Contentful. Nos permitirá controlar el "slug", que en realidad es la URL de cada elemento.

Para facilitarte las cosas, utiliza `FilterSlugTrait` para acceder a un método que utilizaremos dentro de un minuto:

[[[ code('c95eae1b9f') ]]]

Vale, en Contentful tenemos tanto Habilidades como Anuncios. Pero en realidad no queremos que los anuncios tengan su propia página. Por desgracia, con la integración de Contentful, no hay forma de desactivar las URL para un tipo de contenido específico. Hablaré de cómo solucionarlo en un minuto.

En cualquier caso, este método se pasará tanto a las habilidades como a los anuncios. Utiliza la nueva función PHP `match()` para que coincida con `$contentfulEntry->getContentType()->getId()`. Eso devolverá el nombre interno de cada tipo, que puedes encontrar en Contentful. Si es `skill`, devuelve `/skills/` y luego `$this->filtersSlug()` -que viene del rasgo- pasando `$contentfulEntry->get('title')`:

[[[ code('38236b5cbb') ]]]

Para `advertisement`, devuelve `/_ad` para todos ellos:

[[[ code('396457a084') ]]]

Al menos, en este punto, sólo un anuncio podría tener una página en nuestro sitio: si el usuario fuera a `/_ad`, coincidiría con el primero.

Al final, lanza una nueva Excepción con "Tipo no válido":

[[[ code('23cf8d8b24') ]]]

Así que, sí, en este punto, los anuncios seguirán teniendo su propia página. No hay forma de desactivar eso desde el principio. Pero si te importa lo suficiente, yo asignaría todos los anuncios a la misma URL o patrón de URL de esta forma. Luego crearía una ruta y un controlador con la misma URL y devolvería un 404. Esa ruta tendrá prioridad sobre la dinámica.

## Etiquetar y configurar el Slugger

Para decirle a Contentful que utilice nuestro slugger, necesitamos, por supuesto, ¡darle una etiqueta! Añade`#[AutoconfigureTag]` y éste se llamará `netgen_layouts.contentful.entry_slugger`. Esto también necesita una opción `type`... que puedes establecer en cualquier cadena. Utilicemos`default_slugger`:

[[[ code('22d6c08c21') ]]]

¿Cómo se utiliza? En `config/packages/`, necesitamos crear un nuevo archivo de configuración para el paquete contentful de layouts. Llamémoslo `netgen_layouts_contentful.yaml`.

Repite eso para la clave raíz. A continuación, añade `entry_slug_type`, luego `default` configurado con el tipo que hemos utilizado en nuestra etiqueta: `default_slugger`:

[[[ code('78454fef7a') ]]]

Esta curiosa sintaxis dice

> Para cada tipo de contenido en Contentful, utiliza `default_slugger` al generar
> la URL. Por lo tanto, utiliza nuestro `ContentfulSlugger`.

Vale, ¡listo! Pero... esto no se llama cuando recargamos la página. No. Se llama cuando "sincronizamos" nuestro contenido desde Contentful. Bien, ¡vamos a resincronizar! En tu terminal, ejecuta:

```terminal
symfony console contentful:sync
```

Esto actualiza nuestra base de datos local con los últimos datos de Contentful... y funcionó bien. Pero cuando ejecutamos:

```terminal
symfony console contentful:routes
```

¡Las URL no cambiaron! Esto es una peculiaridad... o quizás una característica para que las páginas existentes no se rompan. En cualquier caso, una vez que se importa una ruta por primera vez, su URL nunca cambia.

La forma más fácil de restablecer las cosas es eliminar la tabla de rutas y volver a importar todo.

Y esto es bastante divertido. Podemos Ejecuta:

```terminal
symfony console doctrine:migrations:migrate current-1
```

Eso anulará la migración más reciente, haciendo que se eliminen las tablas contentful y de rutas. Vuelve a ponerlas con:

```terminal
symfony console doctrine:migrations:migrate
```

Vuelve a sincronizar el contenido:

```terminal-silent
symfony console contentful:sync
```

Y ahora comprueba las rutas:

```terminal-silent
symfony console contentful:routes
```

¡Sí! ¡La URL es `/skills/mashing`! Así, en `/mashing`, obtenemos un 404 a la antigua usanza. Pero `/skills/mashing` funciona.

Siguiente: aún no tenemos una página que enumere todas las habilidades. ¡Vamos a arreglarlo!
