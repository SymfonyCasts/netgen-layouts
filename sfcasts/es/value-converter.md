# Convertidor de valores

En cuanto cambiamos nuestro tipo de cuadrícula para utilizar una colección dinámica... dejó de cargarse. El error se esconde aquí abajo en esta llamada AJAX. La mejor manera de verlo es abrir esa URL en una nueva pestaña. Ahí lo tenemos:

> El convertidor de valores para el tipo `App\Entity\Recipe` no existe.

Bien, hasta ahora hemos creado un "tipo de valor" personalizado para `Recipe`, que no era más que esta configuración, y un "tipo de consulta" personalizado que nos permite cargar una lista de las últimas recetas ejecutando la consulta dentro de la clase asociada. Ahora recibimos este error del convertidor de valores.

## Creación de la clase convertidor de valores

Un convertidor de valores es realmente sencillo: es una clase que transforma el objeto subyacente - `Recipe` - en un formato que los Layouts puedan entender. En ese mismo directorio`src/Layouts/`, vamos a crear una clase `RecipeValueConverter`... y hacer que implemente `ValueConverterInterface`:

[[[ code('628e5b6967') ]]]

Ya conoces el procedimiento: ve a "Código" -> "Generar" (o `Command`+`N` en un Mac) y pulsa "Implementar métodos" para generar los siete que necesitamos:

[[[ code('8d37f86a52') ]]]

Lo sé, parece mucho, pero son súper fáciles de rellenar.

En primer lugar, para `supports()`, Layouts llamará a este método cada vez que tenga un "valor" que no entienda. Queremos decirle que sabemos cómo convertir el `$object`si es un `instanceof` `Recipe` :

[[[ code('d12cff09a3') ]]]

En segundo lugar, para `getValueType()`, `return` la clave interna de nuestro tipo de valor:`doctrine_recipe`:

[[[ code('834efdca23') ]]]

Lo siguiente es `getId()`... y literalmente vamos a `return` nuestro ID con`$object->getId()`:

[[[ code('352adab894') ]]]

No tenemos autocompletado en esto, pero sabemos que este objeto será un `Recipe`.

Para `getRemoteId()`, sólo `return $this->getId($object)`:

[[[ code('0f4ddd89e7') ]]]

Este método sólo es importante si planeas utilizar la función de importación en Layouts para mover los datos, por ejemplo, entre la puesta en escena y la producción. Si piensas hacerlo, puedes dar a tus objetos un UUID y devolverlo aquí.

Aquí abajo, para `getName()`, éste será un nombre legible para los humanos que se mostrará en el área de administración. Esta vez, para ayudar a mi editor, vamos a `assert()` que `$object instanceof Recipe`:

[[[ code('24634bca85') ]]]

Dos cosas sobre esto. Primero, sabemos que este objeto será siempre un `Recipe`porque, arriba en `supports()`, dijimos que es el único objeto que soportamos. En segundo lugar, si no has visto la función `assert()` antes, si el `$object` no es un`instanceof` `Recipe` , lanzará una excepción. Es una forma muy fácil de decirle a tu editor -u otras herramientas como PHPStan- que el objeto es definitivamente una instancia de `Recipe`.... , lo que significa que ahora obtendremos el autocompletado cuando digamos`return $object->getName()`:

[[[ code('cc0bbe6423') ]]]

Lo siguiente es `getIsVisible()`. Sólo `return true`:

[[[ code('7eae615203') ]]]

Si tus recetas pudieran ser publicadas o no, por ejemplo, entonces podrías comprobarlo aquí para devolver `true` o `false`.

Por último, para `getObject()`, `return $object`:

[[[ code('03f4c13386') ]]]

Lo sé, parece una tontería, pero es una forma práctica de cambiar tu `Recipe` después de que se haya cargado, si lo necesitas. Pero eso no es algo que necesitemos hacer.

Y... ¡listo!

Esta vez, a diferencia del manejador de tipos de consulta, la autoconfiguración se encarga de todo... así que no necesitamos añadir una etiqueta manual aquí arriba. Observa: muévete y prueba a refrescar la ruta AJAX primero. ¡Eso funciona! Ahora vete, refresca la página de administración de los diseños... y guau. ¡Fíjate! ¡Vemos un montón de elementos en nuestra parrilla! Si hacemos clic en él, vemos que los elementos se cargan abajo. ¡Es increíble!

## Personalizar los resultados de los artículos

Fíjate en que sólo hemos tenido que elegir "colección dinámica". Nosotros... nunca le dijimos al sistema que queríamos utilizar el tipo de consulta "últimas recetas". Esto se debe simplemente a que sólo tenemos un tipo de consulta... y por lo tanto, Layouts adivinó que eso era lo que queríamos. Si añadiéramos un segundo tipo de consulta al sistema, veríamos aquí otro desplegable de selección en el que podríamos elegir entre las últimas recetas y las recetas "más populares", por ejemplo.

Así que estamos utilizando nuestro tipo de consulta "últimas recetas" para obtener 25 resultados. Si intentáramos recrear esta zona aquí, sólo querríamos 4. Así que vamos a limitar el número de elementos a cuatro. ¡Genial!

## Comprobando el Frontend

¿Qué aspecto tiene esto en el frontend? ¡Averigüémoslo! Pulsa "publicar y continuar editando" y.... una vez que se guarde, ve y actualiza. Debería aparecer aquí, pero... ¡no vemos absolutamente nada! O... eso parece al principio.

Pero cuando inspeccionamos el elemento... y hacemos un poco de zoom... hay un `div` con la clase`ngl-vt-grid` en él. Y dentro, una fila y dentro de ésta, un montón de divs vacíos. Si ignoras los elementos de `clearfix`, ¡esto renderiza 1, 2, 3, 4 divs para nuestros cuatro elementos! Así que los elementos se renderizan... simplemente se renderizan vacíos.

Y eso tiene sentido. Todavía no le hemos dicho a los layouts cómo deben representarse los elementos de la receta. En unos minutos hablaremos de ello.

## Opciones del formulario del tipo de consulta (parámetros)

Pero antes de llegar allí, quiero hacer que nuestro tipo de consulta sea un poco más elegante. En la primera pasada, ignoramos el método `buildParameters()`. Resulta que es una forma de añadir campos de formulario adicionales para que un usuario administrador pueda pasar opciones a la consulta.

Por ejemplo, vamos a añadir un término de búsqueda opcional. Digamos que `$builder->add()` pasa a`term` - que será el nombre interno de este nuevo parámetro - y luego `TextType`: el de `Netgen\Layouts`:

[[[ code('c78fcf3109') ]]]

Hay un montón de otros tipos de campos para URLs, fechas y más.

Sólo con esto, cuando refresquemos la sección de administración... y hagamos clic abajo en la cuadrícula, ¡ahí está! ¡Tenemos un gran cuadro nuevo! Por supuesto, si escribimos algo dentro, no pasa nada... y además tiene una etiqueta rara.

## Traducir la etiqueta del campo

Primero vamos a arreglar esa etiqueta. Layouts tiene por defecto esta extraña cadena, pero ya la está pasando por el traductor a través de un dominio llamado `nglayouts`. Así que, en el directorio`translations/`, crea un archivo llamado `nglayouts.en.yaml`, o utiliza el formato que quieras.

Pega la etiqueta y ponla como "Término de búsqueda":

[[[ code('730d026ff0') ]]]

Prueba ahora la sección de administración. Cuando hagamos clic... ¡mucho mejor! Si sigues viendo la etiqueta antigua, prueba a borrar la caché:

```terminal-silent
symfony console cache:clear
```

A veces Symfony no se da cuenta cuando añades un nuevo archivo de traducción.

## Utilizar el parámetro

Bien, para utilizar el término de búsqueda, dirígete a nuestro manejador de tipo de consulta. El objeto `Query`que se pasa a `getValues()` contiene los parámetros que hemos añadido. Además, ¡ya he preparado el método `createQueryBuilderOrderedByNewest()` para que acepte un término de búsqueda opcional! Pasa este `$query->getParameter()`, su nombre - `term` - y luego`->getValue()`:

[[[ code('5a3bdca627') ]]]

Copia eso y repítelo aquí abajo para el método `getCount()`:

[[[ code('3e10f8b2ef') ]]]

Muy bien, ¡vamos a probar esto! Refresca la zona de Diseños, baja aquí y ¡creo que ha funcionado! No muestra ningún elemento... porque he utilizado un término de búsqueda bastante tonto. Despeja la zona. Lo tenemos todo. Ahora escribe unas cuantas letras... y observa cómo cambia abajo.

A continuación, vamos a enseñar a los diseñadores cómo mostrar los elementos de la receta tanto en el frontend como en la vista previa del área de administración.
