# Configuración previa

Estoy bastante seguro de que nuestro nuevo `item_view` está configurado correctamente. Tenemos`item\value_type: contentful_entry`, que sé que es correcto... y luego estamos utilizando `contentful\content_type` ajustado a `skill` para que esto sólo afecte a las habilidades:

[[[ code('3d44c7c73e') ]]]

Pero... parece que no funciona en el frontend. Antes, cuando ejecutamos`debug:config`, vimos que el problema reside en el orden de la configuración. Layouts lee de arriba abajo cuando decide qué "vista" utilizar. Así que mira ésta primero, ve que la `value_type` es `contentful_entry`... y simplemente se detiene. Para solucionarlo, tenemos que invertir nuestra configuración.

Vale, entonces... ¿por qué está en este orden para empezar? ¿Por qué nuestra configuración aparece al final? Esto se debe a la forma en que Symfony carga la configuración: primero carga la configuración del bundle - como la del paquete Contentful o Layouts - y luego carga nuestros archivos de configuración. Y ese suele ser el orden que queremos Nos permite anular la configuración establecida en los bundles.

Pero en este caso, queremos lo contrario. ¿Cómo lo conseguimos? Pidiendo a Symfony que preañada nuestra configuración.

## Configurar el Prepend

En el directorio `config/`, crea un nuevo directorio llamado `prepends/`y mueve la configuración de Netgen Layouts a él. Esto evitará que Symfony cargue ese archivo de la forma normal: vamos a cargarlo manualmente.

El siguiente paso es un poco técnico. En `src/`, crea una clase "extensión" llamada, qué tal, `AppExtension`. Voy a pegar el código: puedes cogerlo del bloque de código de esta página:

[[[ code('69b6b296c8') ]]]

Esto carga nuestro archivo de configuración de forma normal... excepto que se le añadirá una extensión.

Paso final. Para llamar a este método, abre la clase `Kernel`. Después de`use MicroKernelTrait`, añade `configureContainer as baseConfigureContainer`:

[[[ code('a8ef752bb3') ]]]

Esto añade el método `configureContainer` de `MicroKernelTrait` a esta clase como haría normalmente un trait... excepto que lo renombra a`baseConfigureContainer`. Hacemos esto para poder definir nuestro propio método`configureContainer()`. Copia la firma `configureContainer()` del trait, pégala, pulsa "OK" para añadir las sentencias `use` y luego llama a`$this->baseConfigureContainer()` pasando por `$container`, `$loader` y `$builder`:

[[[ code('4cb8f10d90') ]]]

El método `configureContainer()` del trait se encarga de cargar`services.yaml` y todos los archivos de `config/packages/`. Todo eso son cosas buenas que queremos seguir haciendo. Pero después de hacer eso, añade una cosa más: `$builder->registerExtension(new AppExtension())`:

[[[ code('bc39e110a1') ]]]

De nuevo, sí, esto es fastidiosamente técnico. Pero gracias a estas dos piezas, nuestra configuración`netgen_layouts.yaml` estará preconfigurada.

¡Compruébalo! Vuelve a ejecutar el comando `debug:config`:

```terminal-silent
php ./bin/console debug:config netgen_layouts view.item_view
```

Desplázate hacia arriba y... ¡sí! ¡Nuestra configuración está ahora arriba! Y cuando actualizamos... ¡woohoo! ¡Vemos el texto!

A continuación: vamos a hacer que esta plantilla se muestre exactamente igual que las habilidades codificadas. A continuación, crearemos una segunda plantilla de elementos para personalizar la representación del tipo de contenido "Anuncio" de Contentful.
