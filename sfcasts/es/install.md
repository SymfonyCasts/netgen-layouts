# ¡Hola Configuración de Layouts+!

¡Hola amigos! Me alegro mucho de que estéis aquí conmigo, porque este tutorial trata de algo divertido, genial y bastante poderoso. No, no se trata de un felino enmascarado que lucha contra el crimen y que tiene superpoderes, aunque eso sería genial. Este tutorial trata sobre el paquete Netgen Layouts.

## ¿Qué es Layouts?

Esta biblioteca existe desde hace años, pero hace poco que la he probado. Layouts es, sencillamente, una forma de tomar cualquier aplicación Symfony existente y añadir la capacidad de reorganizar dinámicamente la organización de tus páginas sobre la marcha a través de una sección de administración... incluyendo la adición de nuevo contenido dinámico. Es una mezcla muy interesante de una aplicación Symfony normal con controladores y plantillas Twig... además de funciones de gestión de contenidos que puedes activar página por página. A mí me gusta especialmente el enfoque de la opción

## ¿Quién necesita diseños?

¿Por qué te tomarías la molestia de usar Layouts en tu aplicación Symfony? Bueno, no todos los proyectos lo necesitan. Pero si un usuario administrador necesita poder hacer cambios en la organización de tu sitio y su contenido, entonces esto es para ti. Esto incluye poder añadir y cambiar colecciones de elementos -como productos destacados- justo en el centro de una página existente, reorganizar el contenido de una plantilla Twig más arriba o más abajo en la página, añadir un contenido personalizable completamente nuevo a una página o crear páginas de destino temporales y permitir que todo esto lo hagan los usuarios normales. Puedes aprovechar Layouts para una sola página de tu sitio, dejando que todo lo demás sea una aplicación normal de Symfony, o todas las páginas de tu sitio pueden utilizarlo. Como he dicho, puedes optar por los Layouts como mejor te parezca.

## Configuración del proyecto

Podría seguir y seguir, pero probablemente sea mejor ver la magia de Layouts en acción. Es súper divertido jugar con él, así que definitivamente deberías descargar el código del curso desde esta página y codificar junto a mí. Cuando descomprimas el archivo, encontrarás un directorio`start/` con el mismo código que ves aquí. Abre este archivo `README.md`para ver todos los detalles de la configuración. Yo ya he ido a mi terminal, he instalado mis activos Node mediante

```terminal
yarn install
```

y he ejecutado:

```terminal
yarn watch
```

para construir mis archivos CSS y JS. Pero todo eso es sólo para que nuestra aplicación y este tutorial sean más realistas. Layouts no requiere que usemos Encore y no se mete con nuestro CSS y JS en absoluto.

De todos modos, el último paso en el `README` es abrir otra pestaña del terminal y ejecutar

```terminal
symfony serve -d
```

para iniciar un servidor web en https://127.0.0.1:8000 - Voy a hacer trampas y hacer clic en eso. Y... hola nuevo proyecto paralelo: ¡es Bark & Bake! Escucha, los perros están bastante cansados de nuestros perezosos intentos de cocina canina. ¿Problemas crujientes? No, gracias. Así que hemos construido este sitio para inspirar a la gente a ser los mejores chefs que puedan ser... para sus perros.

Se trata de una aplicación Symfony bastante tradicional con algunos controladores y algunas plantillas Twig. También tiene dos entidades: Una entidad `User` para la seguridad, y una entidad `Recipe`. En el sitio, tenemos una página de inicio que muestra las últimas y mejores recetas, una sección de recetas y la posibilidad de abrir una receta específica, para que podamos seguirla en la cocina. Eso es todo. Esto de las habilidades no está implementado en absoluto todavía.

Así que, aparte de poder editar los detalles de cada receta a través de un área de administración, ¡este es un sitio estático! ¡Es hora de cambiar eso! Pronto podremos tomar esta página de inicio -que está escrita mediante un controlador y una plantilla Symfony normales... como puedes ver aquí- y utilizar diseños para insertar contenido y reorganizar cosas de forma dinámica

## Instalar los layouts

Así que vamos a instalar Layouts. Busca tu terminal y ejecuta:

```terminal
composer require netgen/layouts-standard
```

Esto descargará varios paquetes, incluyendo un par de bundles nuevos. Cuando termine, ejecuta

```terminal
git status
```

para ver que también nos ha proporcionado dos nuevos archivos de rutas, que añaden algunas rutas de administración que vamos a ver en unos minutos.

## Ejecuta las migraciones

Layouts también requiere algunas tablas adicionales de la base de datos donde se almacena la información sobre los diseños que crearemos, así como cualquier contenido personalizado que vayamos a poner en ellos. Veremos todo eso en la sección de administración de Diseños en un minuto. Para añadir las tablas necesarias, desplázate hacia arriba y copia esta ingeniosa línea `doctrine:migrations:migrate`.

Esto es genial. Los paquetes de layouts vienen con migraciones... y esto las ejecuta. Pega este comando, pero si utilizas la configuración de la base de datos de Docker que describimos en el LÉEME - yo lo hago - entonces modifica esto para que empiece con`symfony console` para que pueda inyectar las variables de entorno de Docker que apuntan a nuestra base de datos:

```terminal-silent
symfony console doctrine:migrations:migrate --configuration=vendor/netgen/layouts-core/migrations/doctrine.yml
```

Y... ¡perfecto! Una advertencia es que estas migraciones están escritas específicamente para MySQL. Por ahora, Layouts sólo admite MySQL.

## Ignorar las tablas personalizadas

En su mayor parte, Layouts va a gestionar por completo todas las tablas que acabamos de añadir: no necesitamos hacer nada con ellas. Pero ahora que existen en nuestra base de datos, si añadiéramos una nueva entidad y generáramos una migración para ella... la migración intentaría eliminar todas las tablas de Netgen Layouts. ¡Observa! Ejecuta:

```terminal
symfony console doctrine:schema:update --dump-sql --complete
```

Esto imita la generación de una migración, y... ¡sí! Quiere soltar todas las tablas de Diseños. Para solucionarlo, entra en `config/packages/doctrine.yaml` y, en`dbal`, añade `schema_filter`, y pasa una expresión regular... que puedes copiar de la documentación de Layouts:

[[[ code('4add623423') ]]]

¡Perfecto! Con esto, si volvemos a ejecutar el comando `doctrine:schema:update` de nuevo...

```terminal-silent
symfony console doctrine:schema:update --dump-sql --complete
```

Está limpio, excepto por `doctrine_migration_versions`. Pero, no te preocupes: el comando`make:migration` es lo suficientemente inteligente como para no dejar caer su propia tabla.

Bien, Netgen Layouts está instalado y tiene las tablas de la base de datos que necesita. Si volvemos a actualizar nuestro sitio ahora... ¡felicidades! No ha cambiado absolutamente nada, aunque tenemos un bonito icono de la barra de herramientas de depuración web aquí abajo del que hablaremos más adelante.

Esto, de nuevo, es una de las grandes cosas de Layouts. Al instalarlo no se apodera de tu aplicación. Layouts no se utiliza en absoluto para representar esta página.

A continuación, vamos a sumergirnos en el área de administración de Layouts para crear nuestro primer diseño. Luego, veremos cómo interactúa con las páginas reales de nuestro sitio.
