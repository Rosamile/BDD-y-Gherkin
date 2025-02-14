#language:es

Caracteristica: Visualizacion de computadores

    Antecedentes: El accede al URL de la pagina principal
        Dado el usuario navega al home principal del sitio web
        Y el usuario esta autenticado

    @EsquemaDelEscenario
    Esquema del escenario:Acceso a las opciones del menu "Computers"
        Cuando El usuario selecciona la opcion "Computers"
        Entonces muestra las categorias disponibles

        Ejemplos:
            | estadoOpcionComputers | opcion1           | opcion2           | opcion3          |
            | Seleccionado          | Muestra Desktops  |                   |                  |
            | Seleccionado          | Muestra Notebooks |                   |                  |
            | Seleccionado          | Muestra Software  |                   |                  |
            | Seleccionado          | Muestra Desktops  | Muestra Notebooks |                  |
            | Seleccionado          | Muestra Notebooks | Muestra Software  |                  |
            | Seleccionado          | Muestra Desktops  | Muestra Notebooks | Muestra Software |
            | Seleccionado          |                   |                   |                  |

    @EsquemaDelEscenario
    Esquema del escenario:visualizacion de  productos en diferentes formatos
        Cuando El usuario selecciona la opcion <categoria>
        Y El usuario selecciona el <formato>
        Entonces Debe mostrar los productos en el formato <formato>
        Ejemplos:
            | categoria | formato |
            | Desktops  | lista   |
            | Desktops  | cuadros |
            | Notebooks | lista   |
            | Notebooks | cuadros |
            | Software  | lista   |
            | Software  | cuadros |

    @EsquemaDelEscenario
    Esquema del escenario:visualizacion incorrecta de productos en diferentes formatos
        Cuando El usuario selecciona la opcion <categoria>
        Y El usuario selecciona el <formato>
        Entonces  debe mostrar <resultado> en el formato <visualizacion>
        Ejemplos:
            | categoria | formato       | resultado  | formatoResultante |
            | Software  |               | no muestra |                   |
            | Desktops  |               | no muestra |                   |
            | Notebooks |               | no muestra |                   |
            | Software  | no habilitado | producto   | invalido          |
            | Desktops  | no habilitado | producto   | ivalido           |
            | Notebooks | no habilitado | producto   | invalido          |
            | Software  | lista         | producto   | cuadro            |
            | Desktops  | lista         | producto   | cuadro            |
            | Notebooks | lista         | producto   | cuadro            |
            | Software  | cuadro        | producto   | lista             |
            | Desktops  | cuadro        | producto   | lista             |
            | Notebooks | cuadro        | producto   | lista             |

    @EsquemaDelEscenario
    Esquema del escenario:ordenamiento de productos en diferentes formatos
        Dado Que el usuario selecciona una <categoria>
        Cuando El usuario selecciona la opcion <ordenar>
        Entonces  debe mostrar <formatoResultante>
        Ejemplos:
            | categoría  | ordenar               | formatoResultante       |
            | Software   | AZ nombre ascendente  | AZ nombre ascendente   |
            | Software   | AZ nombre descendente | AZ nombre descendente  |
            | Software   | precio mayor a menor  | precio mayor a menor   |
            | Software   | precio menor a mayor  | precio menor a mayor   |
            | Desktops   | AZ nombre ascendente  | AZ nombre ascendente   |
            | Desktops   | AZ nombre descendente | AZ nombre descendente  |
            | Desktops   | precio mayor a menor  | precio mayor a menor   |
            | Desktops   | precio menor a mayor  | precio menor a mayor   |
            | Notebooks  | AZ nombre ascendente  | AZ nombre ascendente   |
            | Notebooks  | AZ nombre descendente | AZ nombre descendente  |
            | Notebooks  | precio mayor a menor  | precio mayor a menor   |
            | Notebooks  | precio menor a mayor  | precio menor a mayor   |

    @EsquemaDelEscenario
    Esquema del escenario: ordenamiento incorrecto de productos en diferentes formatos
        Dado Que el usuario selecciona una <categoria>
        Cuando El usuario selecciona la opcion <ordenar>
        Entonces  debe mostrar <formatoResultante>
        Examples:
  | Categoría  | Ordenar               | Formato Resultante     |
  | Software   | AZ nombre ascendente  | AZ nombre descendente  |
  | Software   | AZ nombre ascendente  | precio mayor a menor   |
  | Software   | AZ nombre ascendente  | precio menor a mayor   |
  | Software   | AZ nombre ascendente  |                        |
  | Software   | AZ nombre descendente | AZ nombre ascendente   |
  | Software   | AZ nombre descendente | precio mayor a menor   |
  | Software   | AZ nombre descendente | precio menor a mayor   |
  | Software   | AZ nombre descendente |                        |
  | Software   | precio mayor a menor  | precio menor a mayor   |
  | Software   | precio mayor a menor  | AZ nombre descendente  |
  | Software   | precio mayor a menor  | AZ nombre ascendente   |
  | Software   | precio mayor a menor  |                        |
  | Software   | precio menor a mayor  | precio mayor a menor   |
  | Software   | precio menor a mayor  | precio mayor a menor   |
  | Software   | precio menor a mayor  | AZ nombre ascendente   |
  | Software   | precio menor a mayor  |                        |
  | Desktops   | AZ nombre ascendente  | AZ nombre descendente  |
  | Desktops   | AZ nombre ascendente  | precio mayor a menor   |
  | Desktops   | AZ nombre ascendente  | precio menor a mayor   |
  | Desktops   | AZ nombre ascendente  |                        |
  | Desktops   | AZ nombre descendente | AZ nombre ascendente   |
  | Desktops   | AZ nombre descendente | precio mayor a menor   |
  | Desktops   | AZ nombre descendente | precio menor a mayor   |
  | Desktops   | AZ nombre descendente |                        |
  | Desktops   | precio mayor a menor  | precio menor a mayor   |
  | Desktops   | precio mayor a menor  | AZ nombre descendente  |
  | Desktops   | precio mayor a menor  | AZ nombre ascendente   |
  | Desktops   | precio mayor a menor  |                        |
  | Desktops   | precio menor a mayor  | precio mayor a menor   |
  | Desktops   | precio menor a mayor  | precio mayor a menor   |
  | Desktops   | precio menor a mayor  | AZ nombre ascendente   |
  | Desktops   | precio menor a mayor  |                        |
  | Notebooks  | AZ nombre ascendente  | AZ nombre descendente  |
  | Notebooks  | AZ nombre ascendente  | precio mayor a menor   |
  | Notebooks  | AZ nombre ascendente  | precio menor a mayor   |
  | Notebooks  | AZ nombre ascendente  |                        |
  | Notebooks  | AZ nombre descendente | AZ nombre ascendente   |
  | Notebooks  | AZ nombre descendente | precio mayor a menor   |
  | Notebooks  | AZ nombre descendente | precio menor a mayor   |
  | Notebooks  | AZ nombre descendente |                        |
  | Notebooks  | precio mayor a menor  | precio menor a mayor   |
  | Notebooks  | precio mayor a menor  | AZ nombre descendente  |
  | Notebooks  | precio mayor a menor  | AZ nombre ascendente   |
  | Notebooks  | precio mayor a menor  |                        |
  | Notebooks  | precio menor a mayor  | precio mayor a menor   |
  | Notebooks  | precio menor a mayor  | precio mayor a menor   |
  | Notebooks  | precio menor a mayor  | AZ nombre ascendente   |
  | Notebooks  | precio menor a mayor  |                        |

    @EsquemaDelEscenario
    Esquema del escenario:filtro exitoso por precio en diferentes rangos
        Cuando El usuario selecciona la categoria <categoria>
        Y Selecciona el filtro por precio <rango>
        Entonces El sistema muestra solo los productos del rango <rango>
        Ejemplos:
            | categoria | rango               |
            | Desktops  | Entre $1000 y $1200 |
            | Notebooks | Mayor a $1200       |
            | Software  |                     |

    @EsquemaDelEscenario
    Esquema del escenario:Usuario intenta filtrar por precio
        Cuando El usuario selecciona la categoria <categoria>
        Entonces El sistema <muestraFiltro> muestra el filtro
        Ejemplos:
            | categoria | muestraFiltro |
            | Desktops  | Si            |
            | Notebooks | Si            |
            | Software  | No            |

    @EsquemaDelEscenario
    Esquema del escenario: El usuario visualiza correctamente los productos en modo lista
        Dado el usuario esta en la categoria "<categoria>"
        Cuando el usuario cambia la vista a "Lista"
        Entonces cada producto mostrado debe contener:
            | Nombre                        |
            | Valoracion                    |
            | Descripcion breve             |
            | Precio                        |
            | Boton "Agregar al carrito"    |
            | Boton "Comparar 2 productos"  |
            | Boton "Agregar a la Wishlist" |
        Ejemplos:
            | categoria |
            | Desktops  |
            | Notebooks |
            | Software  |

    @EscenarioNegativo
    Escenario:Un producto no muestra toda la informacion requerida en la vista de lista
        Dado El usuario esta en una categoria
        Cuando El usuario cambia la vista a "Lista"
        Entonces Algunos productos no muestran los elementos requeridos en el resumen del producto:
            | Nombre                        |
            | Valoracion                    |
            | Descripcion breve             |
            | Precio                        |
            | Boton "Agregar al carrito"    |
            | Boton "Comparar 2 productos"  |
            | Boton "Agregar a la Wishlist" |


    @EsquemaDelEscenario
    Esquema del escenario: El usuario visualiza correctamente los productos en modo cuadros
        Dado El usuario esta en la categoria "<categoria>"
        Cuando El usuario cambia la vista a "Cuadros"
        Entonces Cada producto mostrado debe contener:
            | Nombre                        |
            | Valoracion                    |
            | Precio                        |
            | Boton "Agregar al carrito"    |
            | Boton "Comparar 2 productos"  |
            | Boton "Agregar a la Wishlist" |
        Ejemplos:
            | categoria |
            | Desktops  |
            | Notebooks |
            | Software  |

    @EscenarioNegativo
    Escenario:Un producto no muestra toda la informacion requerida en la vista de cuadros
        Dado El usuario esta en una categoria
        Cuando El usuario cambia la vista a "Cuadros"
        Entonces Algunos productos no muestran los elementos requeridos en el resumen del producto:
            | Nombre                        |
            | Valoracion                    |
            | Precio                        |
            | Boton "Agregar al carrito"    |
            | Boton "Comparar 2 productos"  |
            | Boton "Agregar a la Wishlist" |

    @EscenarioFeliz
    Escenario:El usuario agrega un producto al carrito desde la pantalla de categorias
        Dado El usuario esta en la pantalla de categorias
        Cuando El usuario selecciona la opcion "Agregar al carrito" en un producto
        Entonces El producto se anade correctamente al carrito

    @EscenarioNegativo
    Escenario:Error al intentar agregar un producto al carrito desde la pantalla de categorias
        Dado El usuario esta en la pantalla de categorias
        Cuando El usuario selecciona la opcion "Agregar al carrito" en un producto
        Entonces El producto no se anade al carrito

    @EscenarioFeliz
    Escenario:El usuario agrega un producto a la lista de deseos desde la pantalla de categorias
        Dado El usuario esta en la pantalla de categorias
        Cuando El usuario selecciona la opcion "Agregar a la Wishlist" en un producto
        Entonces El producto se anade correctamente a la lista de deseos

    @EscenarioNegativo
    Escenario:Error al intentar agregar un producto a la lista de deseos desde la pantalla de categorias
        Dado El usuario esta en la pantalla de categorias
        Cuando El usuario selecciona la opcion "Agregar a la Wishlist" en un producto
        Entonces El producto no se anade a la lista de deseos

    @EscenarioFeliz
    Escenario:El usuario visualiza correctamente el detalle del producto desde la pantalla de categorias
        Dado El usuario esta en la pantalla de categorias
        Cuando El usuario da clic sobre un producto
        Entonces El sistema redirige al usuario a la pantalla de detalle del producto
        Y El usuario podra visualizar la informacion detallada del producto

    @EscenarioNegativo
    Escenario:Error al visualizar el detalle del producto desde la pantalla de categorias
        Dado El usuario esta en la pantalla de categorias
        Cuando El usuario da clic sobre un producto
        Entonces El sistema no redirige al usuario a la pantalla de detalle del producto

    @EscenarioFeliz
    Escenario: El usuario selecciona las especificaciones del producto y el sistema calcula el precio correctamente
        Dado El usuario esta en la pantalla de detalle de un producto en la categoria "Computers"
        Cuando El usuario selecciona las especificaciones del producto
        Entonces El sistema actualiza y muestra el precio total a pagar
        Y El usuario puede ingresar la cantidad deseada del producto
        Y El usuario puede ver el boton "Agregar al carrito"

    @EscenarioNegativo
    Escenario: Error en el calculo del precio al seleccionar las especificaciones de un producto
        Dado El usuario esta en la pantalla de detalle de un producto en la categoria "Computers"
        Cuando El usuario selecciona las especificaciones del producto
        Entonces El sistema no muestra el precio total actualizado

    @EscenarioFeliz
    Escenario: El usuario selecciona la cantidad del producto antes de agregar al carrito
        Dado El usuario esta en la pantalla de detalle de un producto en la categoria "Computers"
        Cuando El usuario ingresa una cantidad valida del producto
        Entonces El usuario selecciona el boton "Agregar al carrito"
        Y El sistema agrega exitosamente en producto al carrito con la cantidad seleccionada


    @EscenarioNegativo
    Escenario: El usuario selecciona una cantidad invalida
        Dado El usuario esta en la pantalla de detalle de un producto en la categoria "Computers"
        Cuando El usuario ingresa una cantidad invalida del producto (0 o negativo)
        Entonces El usuario no puede agregar productos al carrito


    @EsquemaDelEscenario
    Esquema del escenario: El usuario selecciona la visualizacion por secciones
        Dado El usuario esta en la pantalla de productos
        Cuando El usuario <selecciona> una visualizacion
        Entonces El usuario puede ver la <cantidadMostrada> de productos
        Ejemplos:
            | selecciona | cantidadMostrada |
            | 3          | 3                |
            | 6          | 6                |
            | 9          | 9                |
            | 15         | 15               |

    @EsquemaDelEscenario
    Esquema del escenario: El usuario no puede tener visualizacion por secciones
        Dado El usuario esta en la pantalla de productos
        Cuando El usuario <selecciona> una visualizacion
        Entonces El usuario ve una <cantidadMostrada> diferente
        Ejemplos:
            | selecciona | cantidadMostrada |
            | 3          | 6                |
            | 3          | 9                |
            | 3          | 15               |
            | 6          | 3                |
            | 6          | 9                |
            | 6          | 15               |
            | 9          | 3                |
            | 9          | 6                |
            | 9          | 15               |
            | 15         | 3                |
            | 15         | 6                |
            | 15         | 9                |

    @EsquemaDelEscenario
    Esquema del escenario: El usuario puede anadir productos
        Dado El usuario esta en la pantalla principal de productos
        Cuando El usuario puede anadir <producto> al <opcionSeleccionada>
        Entonces El usuario puede ver el <resultado>
        Ejemplos:
            | opcionSeleccionada | producto | resultado                     |
            | carrito            | MacBook  | MacBook anadido al carrito    |
            | wishlist           | MacBook  | MacBook  anadido al  wishlist |


    @EscenarioFeliz
    Esquema del escenario: El usuario visualiza correctamente los botones adicionales en la pantalla de detalle del producto
        Dado El usuario esta en la pantalla de detalle de un producto en la categoria "<Categoria>"
        Cuando El usuario revisa la interfaz debajo del boton "ADD TO CART"
        Entonces El sistema muestra los botones:
            | Boton "Añadir a la lista de deseos"       |
            | Boton "Comprar"                           |
            | Boton "Enviar email a un amigo"           |
            | Opciones para compartir en redes sociales |
        Ejemplos:
            | Categoria  |
            | Computers  |
            | Tablets    |
            | Accesorios |
            | Software   |

    @EscenarioNegativo
    Esquema del escenario: Error en la visualizacion de los botones adicionales en la pantalla de detalle del producto
        Dado El usuario esta en la pantalla de detalle de un producto en la categoria "<Categoria>"
        Cuando El usuario revisa la interfaz debajo del boton "ADD TO CART"
        Entonces El sistema no muestra algunos de los botones adicionales correctamente
        Y El usuario ve un mensaje de error "Ocurrio un problema al cargar las opciones adicionales"
        Ejemplos:
            | Categoria  |
            | Computers  |
            | Tablets    |
            | Accesorios |
            | Software   |

    @EscenarioFeliz
    Escenario:Restriccion de compra para Apple MacBook Pro 13-inch
        Dado el usuario esta en la categoria "Notebooks"
        Cuando selecciona el producto "Apple MacBook Pro 13 -inch"
        Y intenta agregar solo 1 unidad al carrito
        Entonces el sistema debe mostrar un mensaje indicYo la "cantidad minima es de 2 unidades"
        Cuando intenta agregar 2 o mas unidades
        Entonces el sistema debe permitir la compra
