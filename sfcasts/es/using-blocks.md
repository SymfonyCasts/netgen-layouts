# Añadir más bloques personalizados

Vamos a trabajar más en este Diseño de Lista de Recetas más adelante. Pero, vamos a hacer una cosa más ahora. Editar este diseño. Quiero dar a nuestros usuarios administradores la flexibilidad de cambiar este título. ¡Genial! Añadamos un nuevo bloque de título justo encima... e introduzcamos algo de texto.

Pulsa "Publicar y continuar editando"... y luego ve al frontend. Lo que intento hacer es replicar este título, o área "héroe", para poder eliminarlo de nuestra plantilla Twig. Pero cuando refrescamos, todavía no se ve bien.

Ve y mira esa plantilla. Bien: para replicar esto, necesitamos una etiqueta `h1` envuelta en un div `hero-wrapper`:

[[[ code('a5a9d53de5') ]]]

Ahora mismo, Layouts está simplemente renderizando un `h1`. Y, por cierto, puedes, en las opciones del bloque de título, elegir entre `h1`, `h2`, o `h3`. `h1` es lo que necesitamos esta vez.

## Añadir una columna Div envolvente

Entonces: ¿cómo podemos envolver esto en un `div` y darle una clase `hero-wrapper`? La respuesta: añadiendo un ingenioso bloque "columna"... y luego moviendo el título a esa columna. Genial, ¿verdad? Por último, al hacer clic en la columna, puedes añadir la clase que quieras. Añade `hero-wrapper`.

¡Vamos a probarlo! Pulsa "Publicar y continuar editando", actualiza el frontend y... ¡mucho mejor! ¿Qué pasa con ese texto? Cópialo, añade un nuevo bloque de "texto" justo debajo de nuestro "título" y... pega. Publica y continúa editando de nuevo... prueba de nuevo el frontend y... ¡mira eso! ¡Una réplica perfecta!

Para celebrarlo, en la plantilla, podemos eliminar esa sección por completo:

[[[ code('74e279eacb') ]]]

El resultado final es el mismo que antes... excepto que los usuarios administradores tienen ahora la posibilidad de cambiar el texto.

## ¿CSS personalizado en las plantillas o tipo de bloque personalizado prefabricado?

Sin embargo, probablemente te hayas dado cuenta de que esto me obligó a ser un poco técnico: tuve que conocer la clase CSS que necesitaba la columna. Si los usuarios administradores que diseñan tus diseños son un poco técnicos, entonces esto podría no ser un problema. Pero si tus editores son menos técnicos, podrías, en cambio, crear un tipo de bloque personalizado -como un bloque de héroe- en el que el usuario sólo tenga que escribir el texto y tú lo renderices todo por él. No vamos a crear bloques personalizados en este tutorial... pero eso es sobre todo porque, al final del tutorial, sabrás todo lo que necesitas para seguir los documentos para ello.

## La barra de herramientas de depuración de Layouts Web

Muy bien, de vuelta en el front-end, Layouts viene con su propio icono de la barra de herramientas de depuración web. Y si haces clic en esto, es bastante genial. Vamos a usar esto un montón de veces. Te muestra el diseño que se ha resuelto e incluso la razón por la que se ha elegido.

Pero lo realmente útil es la sección "Bloques renderizados". Esto nos muestra todos los bloques de diseño que se renderizaron para construir esta página. Puedes ver que hay uno llamado "Bloque Twig" para la navegación superior, una "Columna", luego el bloque "Título", "Texto", "Vista completa" y finalmente el último bloque "Twig" para el pie de página. Esta es una gran manera de ver todos los diferentes bloques que se están renderizando, así como la plantilla que hay detrás de cada uno. Más adelante, hablaremos de cómo anular esas plantillas, para poder personalizar su aspecto.

## Vinculación con el administrador de diseños

De vuelta al administrador de Diseños, publica el diseño para volver a la página principal. Si vas a `/admin`, verás que nuestra aplicación ya tiene EasyAdmin instalado. Vamos a añadir un enlace desde el menú de aquí a Diseños para hacer la vida más fácil. Abre`src/Controller/Admin/DashboardController.php`... y encuentra `configureMenuItems()`. Añade otro con `yield MenuItem::linkToUrl()`, llámalo "Layouts" y dale unos iconos: `fas fa-list`. Para la url, utiliza `this->generateUrl()` y pasa el nombre de la ruta, que resulta ser `nglayouts_admin_layouts_index`:

[[[ code('b4e3a9c232') ]]]

¡Perfecto! Es un pequeño detalle, pero ahora, cuando estemos en `/admin`, podemos hacer clic en "Diseños" para saltar directamente allí.

Bien, ¡comprobación de estado! Podemos representar los bloques Twig y mezclar títulos, texto, HTML, Google Maps y otros bloques donde queramos. Cuantos más bloques Twig tengamos en la plantilla, más flexibilidad tendremos.

¿Pero qué pasa con la posibilidad de representar una colección de recetas de nuestra base de datos, como las "Últimas recetas" que tenemos en la página de inicio? Esa es una pieza importante de los diseños: así que empecemos a sumergirnos en ella a continuación.
