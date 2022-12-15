# Construir la página Contentful

Ahora tenemos un control total sobre cómo se muestran las páginas de Contentful. Eso es gracias al "diseño de habilidad individual" que hemos asignado a todas las páginas de "habilidad" de Contentful.

Pero... todo lo que tenemos es este título manual de `h1`. ¿Cómo podemos mostrar los datos reales de la habilidad de Contentful que estamos viendo?

En primer lugar, en el sitio de Contentful, si navego hasta "Modelo de contenido" y hago clic en "Skill", puedes ver que cada Skill tiene 5 campos... y cada campo tiene un nombre interno. Es... casi más fácil ver esto a través de la vista previa JSON. Allá vamos. Así que hay un campo "Título", su nombre interno es `title`, "Descripción breve", "Técnica", y algunos otros como "Imagen" y "Anuncio". El anuncio es en realidad un enlace a ese otro tipo de contenido.

## Uso del tipo de bloque "Campo de entrada de contenido

En cualquier caso, lo que realmente queremos hacer aquí es imprimir el título de la habilidad en`h1`. Afortunadamente, eso es posible, gracias a un nuevo tipo de bloque que ha añadido el bundle Contentful. Está aquí abajo: "Campo de entrada Contentful".

Esto nos permite renderizar un único campo de cualquier entrada de Contentful que se esté renderizando en ese momento. ¡Vamos a probarlo! A continuación, borra el antiguo `h1`.

El nuevo bloque tiene una opción superimportante: identificador de campo. Establécelo con el nombre interno del campo: `title`. Y conviértelo en un `h1`. Como de costumbre, la etiqueta del bloque es opcional, pero yo la incluiré.

¡Genial! Dale a publicar y sigue editando, muévete y... ¡sí! Es dinámico. Si vamos a la URL de alguna otra habilidad, como `/basic-chop`, ¡también funciona!

## Añadir el área de héroe

Pongámonos más elegantes. Añade una columna... y mueve este título dentro. ¿Adivinas lo que voy a hacer? Dale a la columna la misma clase `hero-wrapper` que hemos utilizado antes. ¿Y sabes qué más? Cada habilidad tiene una "Breve descripción". Vamos a añadir otro bloque de campo de entrada justo debajo.

Fíjate en que una opción de este bloque es "tipo de vista". Pronto hablaremos más sobre esto, pero debería coincidir con el "tipo" del contenido que estás extrayendo de Contentful. Hasta ahora, tanto `title` como este `shortDescription` son tipos "cadena". Deja esto como `div`.

¡Temporizador de pruebas! Pulsa "Publicar y continuar editando". Y... a ver qué tal queda. ¡Me encanta! ¡Añadamos más!

## Añadir una imagen de Contentful

Cada habilidad tiene una imagen. Dentro de esa misma columna héroe, añade otro bloque de entrada Contentful en la parte inferior. Se llamará `image`... y el tipo será "activos referenciados". Tienes que establecer una anchura y una altura. Hagamos 200 por 200. Publica eso... actualiza y... ¡ya estamos en marcha!

Una última cosa: renderizar el contenido de la habilidad debajo de todo. Por cierto, podríamos renderizarlo en la misma zona... o utilizar la zona de abajo. Las zonas no importan mucho en la mayoría de los casos.

## Utilizar un bloque de 2 columnas

Pero hagamos este punto más interesante. Quiero mostrar el contenido de la habilidad a la izquierda y un anuncio a la derecha. Para ello, utiliza por primera vez un bloque de 2 columnas. Ajústalo a 66, 33 para que el lado izquierdo ocupe la mayor parte del espacio. Añade un título a la parte izquierda y conviértelo en un `h3` con el texto "La Técnica:". Debajo, arrastra un campo de entrada de contenido.

Éste... si voy a comprobar mis campos... se llama `technique` y contiene texto enriquecido. Si lo modificaras en Contentful, verías un editor de texto enriquecido... y el valor final es HTML. Así que escribe `technique`, mantenlo como `div` y selecciona `Richtext`.

## Renderizar una entrada relacionada de Contentful

Por último, en el lado derecho, añade un campo de entrada Contentful más. Vuelve a mirar el modelo de contenido de Habilidades... y desplázate un poco hacia abajo. El que queremos utilizar se llama `advertisement`, y es de tipo "Entrada referenciada". Sí, si editaras una habilidad, elegirías el Anuncio de la lista de Anuncios que tenemos en Contentful. Es como una relación de base de datos.

De todos modos, introduce `advertisement`, pulsa "Publicar y continuar editando"... actualiza y... ¡bien! Más o menos genial. Necesitamos un contenedor para introducirlos. Ya tenemos una columna, así que haz clic en "Envolver en contenedor".

Y... sí... aunque a esto también le vendría bien algo de margen superior. En esa misma columna, añade una clase: `my-3`. Publica esto... y vuelve a cargar. ¡Mucho mejor! Aunque, el Anuncio sólo está imprimiendo una URL... no renderizando un anuncio. Eso es porque Contentful no sabe cómo renderizar el tipo de contenido "Anuncio". Pronto lo solucionaremos.

Pero primero, vamos a arreglar nuestras páginas Skill anteponiendo a todas las URL el prefijo `/skills`.
