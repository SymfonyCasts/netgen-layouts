# Vista de artículos del frontend

Es hora de crear la vista de artículos `Recipe` para el frontend. Esto empieza casi exactamente igual. De hecho, copia la configuración del admin... y pégala. En Layouts, sabemos que la clave `app` significa la sección "admin". Y resulta que `default` se utiliza para significar el frontend:

[[[ code('960b2697f2') ]]]

## Frontend (por defecto) item_view & Template

Una vez más, este nombre interno no es importante, para la plantilla, utiliza la misma ruta pero `frontend`... y mantén `match` exactamente igual:

[[[ code('065646168b') ]]]

¡Me encanta cuando las cosas son aburridas y fáciles! Vamos a crear esa plantilla. En `nglayouts/`, haz el directorio `frontend/`... y dentro, `recipe_item.html.twig`.

A esta plantilla le pasaremos las mismas variables que a la plantilla de elementos de administración. Esto significa que podemos, una vez más, utilizar `{{ item.object }}` para acceder a nuestro objeto `Recipe`. Vamos a imprimir la clave `name` para ver si las cosas funcionan:

[[[ code('55cca23705') ]]]

Y... están funcionando. ¡Está vivo!

## Comprobando las plantillas en el perfil de Twig

Una de mis cosas favoritas cuando empiezo a trabajar con plantillas dentro de Layouts es hacer clic en el elemento Twig de la barra de herramientas de depuración web. Aquí podemos ver realmente cómo está renderizando Layouts. Sí, renderiza `layout_2.html.twig`... y luego empieza a renderizar cada zona. Renderiza nuestro bloque `navigation`, el bloque `hero`, y luego, finalmente aquí abajo, la cuadrícula. Puedes ver que está usando `grid/3_columns.html.twig`. Esto es algo que podemos controlar en el área de administración. Haz clic en la cuadrícula. A la derecha, vemos la pestaña "Contenido". Pero también hay una pestaña "Diseño". Cambia esto a "4 columnas"... y le doy a "Publicar y continuar editando".

Si ahora refrescamos y volvemos a cargar el perfilador Twig, veremos que se renderiza`4_columns.html.twig`. Entonces, ¡eh! Dentro de cada columna, renderiza nuestro`recipe_item.html.twig`. Esto es realmente genial de ver, y vamos a ver esto de nuevo más tarde cuando hablemos de anular las plantillas del núcleo.

## CSS de Bootstrap 4

Una cosa que tengo que mencionar es que nuestra aplicación está utilizando la versión 4 de Bootstrap, no Bootstrap 5. La razón es que, en este momento, la plantilla de cuadrícula muestra el marcado de la versión 4 de Bootstrap. Si quisieras usar Bootstrap 5, es totalmente posible, pero tendrías que anular estas plantillas de columnas -como`4_columns.html.twig` - para modificar las clases. Anular las plantillas del núcleo es en realidad súper fácil, y hablaremos de cómo hacerlo pronto.

## Personalizar nuestra plantilla frontal

Bien, ¡vamos a dar vida a esta vista frontal! Abre la plantilla de la página de inicio:`main/homepage.html.twig`... y desplázate hacia arriba hasta el lugar en el que hacemos un bucle con las últimas recetas. Perfecto. Lo que básicamente quiero hacer es robar el marcado de uno de estos mosaicos de recetas... y pegarlo en la plantilla del frontend:

[[[ code('bece7a5480') ]]]

Ahora sólo tenemos que ajustar algunas variables: en lugar de `recipe.slug`, tiene que ser `item.object.slug`. Haré una búsqueda y sustitución: sustituye `recipe.` por`item.object.`:

[[[ code('63495a185e') ]]]

## Envolver los bloques en un contenedor

¡Muy bien! Veamos si ha funcionado. Muévete, refresca... ¡y lo hizo! Esto parece el frontend. ¡Somos increíbles! Excepto que falta el "canalón" que tenemos en el original. Inspecciona el elemento. Ah, la diferencia es que las columnas originales estaban dentro de un div `container`, que añade el margen. En el nuevo código, estamos dentro de una fila... pero no de un `container`.

Para arreglar esto en Layouts, vamos a añadir nuestro bloque de utilidad favorito: ¡una columna! Mueve la cuadrícula dentro de esa columna. Entonces, podríamos añadir una clase CSS como hicimos antes en la zona del héroe. Pero en su lugar, toma un atajo y marca "Envolver en contenedor".

Pulsa "Publicar y continuar editando" y actualiza. Vaya, página equivocada. Vuelve a la página de inicio y... ¡se ve muy bien! ¡Ahora está dentro de un elemento con una clase`container`!

Esta "envoltura en el contenedor" es súper útil: añade literalmente un `div`extra alrededor de tu bloque con `class="container"` y todos los bloques lo admiten. Diablos, ni siquiera necesitamos una columna: podríamos haber marcado simplemente la opción "Envolver en contenedor" en la propia cuadrícula.

La única razón por la que he puesto esto dentro de una columna es para que también podamos añadir allí la cabecera "Últimas recetas". Arrastra un nuevo bloque "Título" dentro de la columna. ¡Sal de aquí, Apple! Dentro, escribe "Últimas recetas" y cambia a un `h2`.

Pulsa nuestro favorito "Publicar y continuar editando", actualiza y... ¡aún más cerca! Sólo tenemos que centrar esto... y quizás darle un pequeño margen superior. Añade dos clases al título: `text-center` y `my-5` para darle un poco de margen vertical: ambas clases provienen de Bootstrap. Sólo estoy repitiendo las clases que mi diseñador ya utilizaba en la plantilla.

Publica eso... y cuando lo probamos... coincide exactamente. ¡Guau! Pero ahora, ¡tenemos un control total sobre las recetas que hay dentro! Podemos cambiar a una consulta diferente, cambiar el número de elementos o, dentro de un rato, podemos optar por seleccionar manualmente las recetas exactas a mostrar. Ahora también podemos incrustar listas y cuadrículas de recetas en cualquier lugar que queramos del sitio.

## ¡Limpieza!

Para celebrarlo, elimina todo el bloque Twig de `latest_recipes`:

[[[ code('7860e6d918') ]]]

Y, arriba en `MainController`, elimina la consulta, la variable, el argumento del repositorio y la declaración `use`:

[[[ code('db45591402') ]]]

Cuando actualicemos, sólo tendremos una sección "Últimas recetas" procedente de nuestro bloque dinámico. Ah, pero fíjate en que en el admin de layouts, seguimos mostrando el bloque`latest_recipes`... ¡aunque ya no exista! Layouts es bastante indulgente con los usuarios administradores: en lugar de lanzar un error, simplemente no renderiza nada.

Pero borremos eso... luego publiquemos... y echemos un último vistazo. ¡Me encanta!

A continuación: ahora que tenemos esta cuadrícula dentro de Layouts, podemos hacer algunas cosas interesantes con ella, como activar la paginación con Ajax.
