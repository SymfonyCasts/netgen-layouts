# Añadir listas: Tipo de valor

Tenemos una entidad `Recipe` y, en el frontend, una página que enumera las recetas. También hemos visto lo fácil que es crear un diseño, que hace que partes de esta página sean configurables al instante.

## ¿Añadir listas de contenido existente a través de maquetas?

Pero ahora, viendo la página de inicio, me pregunto si podemos añadir bloques más complejos, más allá del simple texto. ¿Podríamos, por ejemplo, añadir un bloque que muestre una lista de recetas? ¿Algo similar a lo que tenemos aquí ahora... excepto que en lugar de añadirlo a través de un bloque Twig, se añade completamente a través de diseños por un usuario administrador? Y, para ir más lejos, ¿podríamos incluso dejar que el usuario administrador eligiera qué recetas mostrar aquí?

¡Totalmente! Si la primera gran idea de Layouts es permitir que los bloques de plantillas Twig se reorganicen y se mezclen con contenido dinámico, entonces la segunda gran idea es permitir que los usuarios administradores incrusten en nuestra página piezas de contenido existente, como las recetas de nuestra base de datos.

¿Cómo? Edita el diseño de la página de inicio. En los bloques de la izquierda, fíjate en este llamado "Rejilla". Añádelo después de nuestro bloque Twig "Héroe". La cuadrícula nos permite añadir elementos individuales a ella... que podrían ser cualquier cosa. Pero, ¡no veo la forma de hacerlo!

Vale, sabemos que muchos bloques, como los títulos, los mapas, el markdown, etc., pueden añadirse a nuestras páginas en los diseños de forma inmediata, sin ningún trabajo de configuración adicional. Pero el propósito de algunos bloques -como el de Lista, el de Cuadrícula y el de Galería aquí abajo (que no son más que cuadrículas extravagantes que tienen un comportamiento de JavaScript asociado a ellas)- es representar una colección de "elementos" que se cargan desde otro lugar, como nuestra base de datos local, el CMS o incluso tu tienda Sylius. Las "cosas" o "elementos" que podemos añadir a estos bloques se llaman "tipos de valores". Y... actualmente tenemos cero. Si se tratara de un proyecto de Sylius, podríamos instalar la integración de Sylius y Layouts y al instante podríamos seleccionar productos. Lo mismo ocurre si utilizas Ibexa CMS.

## Añadir un tipo de valor

Éste es nuestro siguiente gran objetivo: añadir nuestra entidad Doctrine `Recipe` como "tipo de valor" en los diseños para poder crear listas y cuadrículas que contengan recetas.

El primer paso para añadir un tipo de valor es informar a Layouts sobre él en un archivo de configuración. En `config/packages/netgen_layouts.yaml`, de forma muy sencilla, di `value_types`, y debajo, `doctrine_recipe `. Este es el nombre interno del tipo de valor, y nos referiremos a él en algunos lugares. Dale un nombre amigable para los humanos `name` -`Recipe` - y por ahora, pon `manual_items` a `false`... y asegúrate de que tiene una "s" al final:

[[[ code('8d1f76144f') ]]]

Hablaremos más tarde de `manual_items`, pero es más fácil ponerlo en `false`para empezar.

Dirígete, actualiza nuestra página de diseños (no pasa nada por recargarla)... ¡y echa un vistazo a nuestro bloque Grid! Hay un nuevo campo "Tipo de colección" y "Colección manual" es nuestra única opción ahora mismo. Entonces... parece que esto sigue sin funcionar. No puedo cambiar esto por otra cosa... y tampoco puedo seleccionar elementos manualmente.

## Consultas dinámicas vs manuales

Hay dos formas de añadir elementos a uno de estos bloques de "colección". La primera es una colección dinámica en la que elegimos a partir de una consulta preelaborada. Podríamos elegir una consulta "Más populares" que buscara las recetas más populares o una consulta "últimas recetas", por poner dos ejemplos. La segunda forma de elegir elementos es manual: el usuario administrador selecciona literalmente los que quiere de una lista.

## Añadir un tipo de consulta

Vamos a empezar con el primer tipo: la colección dinámica. Todavía no vemos la opción "Colección dinámica" porque primero tenemos que crear una de esas consultas prefabricadas. Esas consultas prefabricadas se llaman `query_types`. Podríamos, por ejemplo, crear un tipo de consulta para `Recipe` llamado "Más popular" y otro llamado "Más reciente".

¿Cómo las creamos? Vuelve al archivo de configuración, añade `query_types` y debajo, digamos, `latest_recipes`. Una vez más, esto es sólo un "nombre interno". También dale un nombre legible para los humanos `name`: `Latest Recipes`:

[[[ code('b74adc5964') ]]]

Entonces... ¿qué hacemos ahora? Si volvemos atrás y refrescamos... obtenemos un error muy bonito que nos dice qué hacer a continuación:

> El gestor de tipos de consulta para el tipo de consulta `latest_recipes` no existe.

¡Está intentando decirnos que tenemos que construir una clase que represente este tipo de consulta! ¡Hagámoslo!

## La clase manejadora del tipo de consulta

En el directorio `src/`, voy a crear un nuevo directorio `Layouts/`: aquí organizaremos muchas de nuestras cosas de Layouts personalizados. A continuación, añade una nueva clase PHP llamada... qué tal `LatestRecipeQueryTypeHandler`. Haz que esto implemente`QueryTypeHandlerInterface`:

[[[ code('babd282473') ]]]

Luego ve a "Generar código" (o `Command`+`N` en un Mac), y selecciona "Implementar métodos" para añadir los cuatro que necesitamos:

[[[ code('c04981c1d2') ]]]

¡Bien! Veamos... Dejaré `buildParameters()` vacío por un momento, pero volveremos a él pronto:

[[[ code('39c0dab62c') ]]]

El método más importante es `getValues()`. Aquí es donde cargaremos y devolveremos los "artículos". Si nuestras recetas estuvieran almacenadas en una API, haríamos aquí una petición a la API para obtenerlas. Pero como están en nuestra base de datos local, las consultaremos.

Para ello, ve a la parte superior de la clase, añade un método `__construct()` con`private RecipeRepository $recipeRepository`:

[[[ code('53ab55cc70') ]]]

A continuación, baja a `getValues()`, `return $this->recipeRepository`... y utiliza un método que ya he creado dentro de `RecipeRepository` llamado`->createQueryBuilderOrderedByNewest()`. Añade también `->setFirstResult($offset)`y `->setMaxResults($limit)`. El usuario administrador podrá elegir cuántos elementos mostrar e incluso podrá saltarse algunos. Y así, Layouts nos pasa esos valores como `$limit` y `$offset`... y los utilizamos en nuestra consulta. Terminamos con`->getQuery()` y `->getResult()`:

[[[ code('5d32df906d') ]]]

¡Perfecto! A continuación, para `getCount()`, vamos a hacer exactamente lo mismo... excepto que no necesitamos `->setMaxResults()` ni `->setFirstResult()`. En su lugar, añadimos`->select('COUNT(recipe.id)')`:

[[[ code('00d69e8605') ]]]

Estoy utilizando `recipe` porque, en `RecipeRepository`... si miramos el método personalizado, utiliza `recipe` como alias en la consulta:

[[[ code('b21de44ac4') ]]]

Después, actualiza `->getResult()` para que sea `->getSingleScalarResult()`:

[[[ code('ec0d670017') ]]]

¡Uf! Ha sido un poco de trabajo, pero bastante sencillo. Ah, y para`isContextual()`, `return false`:

[[[ code('fff5255415') ]]]

No lo vamos a necesitar, pero este método es bastante chulo. Si devuelve `true`, puedes leer la información de la página actual para cambiar la consulta, como si estuvieras en una página de "categoría" y necesitaras listar sólo los productos de esa categoría.

## Etiquetar la clase manejadora del tipo de consulta

De todos modos, eso es todo. ¡Esto es ahora un manejador de tipos de consulta funcional! Pero si vuelves a actualizarlo... sigue sin funcionar. Nos da el mismo error. Esto se debe a que tenemos que asociar esta clase de manejador de tipos de consulta con el tipo de consulta `latest_recipes` en nuestra configuración. Para ello, tenemos que dar una etiqueta al servicio... y hay una forma muy interesante de hacerlo gracias a Symfony 6.1.

Sobre la clase, añade un atributo llamado `#[AutoconfigureTag()]`. El nombre de la etiqueta que necesitamos es `netgen_layouts.query_type_handler`: está sacado de la documentación. También necesitamos pasar un array con una clave `type` establecida en`latest_recipes`:

[[[ code('83a1b6448c') ]]]

Este `type` debe coincidir con lo que tenemos en nuestra configuración:

[[[ code('4195bc4644') ]]]

Esto une a los dos.

Y ahora... ¡la página funciona! Si hacemos clic en nuestro bloque Grid... podemos cambiar a "Colección dinámica". ¡Espectacular! Le doy a Aplicar y... ¡todo deja de cargarse inmediatamente!

Cuando tengas un error en la sección de administración, es muy probable que aparezca a través de una llamada AJAX. A menudo, los diseños te mostrarán el error en un modal. Pero si no lo hace, no te preocupes: sólo tienes que mirar aquí abajo en la barra de herramientas de depuración web. ¡Sí! Tenemos un error 400.

Vamos a solucionarlo creando un convertidor de valores. Luego haremos nuestra consulta aún más inteligente.
