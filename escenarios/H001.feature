#language: es

Feature: Visualizacion de computadores

    Background: El accede al URL de la pagina principal
        Given el usuario navega al home principal del sitio web
        And el usuario esta autenticado

    @EscenarioOutline
    Scenario:Acceso a las opciones del menu "Computers"
        When El usuario selecciona la opcion "Computers"
        Then muestra las categorias disponibles

        Examples:
            | estadoOpcionComputers | opcion1           | opcion2           | opcion3          |
            | Seleccionado          | Muestra Desktops  |                   |                  |
            | Seleccionado          | Muestra Notebooks |                   |                  |
            | Seleccionado          | Muestra Software  |                   |                  |
            | Seleccionado          | Muestra Desktops  | Muestra Notebooks |                  |
            | Seleccionado          | Muestra Notebooks | Muestra Software  |                  |
            | Seleccionado          | Muestra Desktops  | Muestra Notebooks | Muestra Software |
            | Seleccionado          |                   |                   |                  |

    @EscenarioOutline
    Scenario:visualizacion de  productos en diferentes formatos
        When El usuario selecciona la opcion <categoria>
        And El usuario selecciona el <formato>
        Then Debe mostrar los productos en el formato <formato>
        Examples:
            | categoria | formato |
            | Desktops  | lista   |
            | Desktops  | cuadros |
            | Notebooks | lista   |
            | Notebooks | cuadros |
            | Software  | lista   |
            | Software  | cuadros |

    @EscenarioOutline
    Scenario:visualizacion incorrecta de productos en diferentes formatos
        When El usuario selecciona la opcion <categoria>
        And El usuario selecciona el <formato>
        Then  debe mostrar <resultado> en el formato <visualizacion>
        Examples:
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

    @EscenarioOutline
    Scenario:ordenamiento de productos en diferentes formatos
        When El usuario selecciona la opcion <ordenar>
        Then  debe mostrar <formatoResultante>
        Examples:
            | ordenar               | formatoResultante    |
            | AZ nombre ascendente  | AZ nombre ascendente |
            | AZ nombre descendente | AZ nombredescendente |
            | precio mayor a menor  | precio mayor a menor |
            | precio menor a mayor  | precio menor a mayor |

    @EscenarioOutline
    Scenario: ordenamiento incorrecto de productos en diferentes formatos
        When El usuario selecciona la opcion <ordenar>
        Then  debe mostrar <formatoResultante>
        Examples:
            | ordenar               | formatoResultante     |
            | AZ nombre ascendente  | AZ nombre descendente |
            | AZ nombre ascendente  | precio mayor a menor  |
            | AZ nombre ascendente  | precio menor a mayor  |
            | AZ nombre ascendente  |                       |
            | AZ nombre descendente | AZ nombre ascendente  |
            | AZ nombre descendente | precio mayor a menor  |
            | AZ nombre descendente | precio menor a mayor  |
            | AZ nombre descendente |                       |
            | precio mayor a menor  | precio menor a mayor  |
            | precio mayor a menor  | AZ nombre descendente |
            | precio mayor a menor  | AZ nombre ascendente  |
            | precio mayor a menor  |                       |
            | precio menor a mayor  | precio mayor a menor  |
            | precio menor a mayor  | precio mayor a menor  |
            | precio menor a mayor  | AZ nombre ascendente  |
            | precio menor a mayor  |                       |

    @EscenarioOutline
    Scenario:filtro exitoso por precio en diferentes rangos
        When El usuario selecciona la categoria <categoria>
        And Selecciona el filtro por precio <rango>
        Then El sistema muestra solo los productos del rango <rango>
        Examples:
            | categoria | rango               |
            | Desktops  | Entre $1000 y $1200 |
            | Notebooks | Mayor a $1200       |
            | Software  |                     |

    @EscenarioOutline
    Scenario:Usuario intenta filtrar por precio
        When El usuario selecciona la categoria <categoria>
        Then El sistema <muestraFiltro> muestra el filtro
        Examples:
            | categoria | muestraFiltro |
            | Desktops  | Si            |
            | Notebooks | Si            |
            | Software  | No            |

    @EscenarioOutline
    Scenario: El usuario visualiza correctamente los productos en modo lista
        Given El usuario esta en la categoria "<categoria>"
        When El usuario cambia la vista a "Lista"
        Then Cada producto mostrado debe contener:
            | Nombre                        |
            | Valoracion                    |
            | Descripcion breve             |
            | Precio                        |
            | Boton "Agregar al carrito"    |
            | Boton "Comparar 2 productos"  |
            | Boton "Agregar a la Wishlist" |
        Examples:
            | categoria |
            | Desktops  |
            | Notebooks |
            | Software  |

    @EscenarioNegativo
    Scenario:Un producto no muestra toda la informacion requerida en la vista de lista
        Given El usuario esta en una categoria
        When El usuario cambia la vista a "Lista"
        Then Algunos productos no muestran los elementos requeridos en el resumen del producto:
            | Nombre                        |
            | Valoracion                    |
            | Descripcion breve             |
            | Precio                        |
            | Boton "Agregar al carrito"    |
            | Boton "Comparar 2 productos"  |
            | Boton "Agregar a la Wishlist" |


    @EscenarioOutline
    Scenario: El usuario visualiza correctamente los productos en modo cuadros
        Given El usuario esta en la categoria "<categoria>"
        When El usuario cambia la vista a "Cuadros"
        Then Cada producto mostrado debe contener:
            | Nombre                        |
            | Valoracion                    |
            | Precio                        |
            | Boton "Agregar al carrito"    |
            | Boton "Comparar 2 productos"  |
            | Boton "Agregar a la Wishlist" |
        Examples:
            | categoria |
            | Desktops  |
            | Notebooks |
            | Software  |

    @EscenarioNegativo
    Scenario:Un producto no muestra toda la informacion requerida en la vista de cuadros
        Given El usuario esta en una categoria
        When El usuario cambia la vista a "Cuadros"
        Then Algunos productos no muestran los elementos requeridos en el resumen del producto:
            | Nombre                        |
            | Valoracion                    |
            | Precio                        |
            | Boton "Agregar al carrito"    |
            | Boton "Comparar 2 productos"  |
            | Boton "Agregar a la Wishlist" |

    @EscenarioFeliz
    Scenario:El usuario agrega un producto al carrito desde la pantalla de categorias
        Given El usuario esta en la pantalla de categorias
        When El usuario selecciona la opcion "Agregar al carrito" en un producto
        Then El producto se añade correctamente al carrito

    @EscenarioNegativo
    Scenario:Error al intentar agregar un producto al carrito desde la pantalla de categorias
        Given El usuario esta en la pantalla de categorias
        When El usuario selecciona la opcion "Agregar al carrito" en un producto
        Then El producto no se añade al carrito

    @EscenarioFeliz
    Scenario:El usuario agrega un producto a la lista de deseos desde la pantalla de categorias
        Given El usuario esta en la pantalla de categorias
        When El usuario selecciona la opcion "Agregar a la Wishlist" en un producto
        Then El producto se añade correctamente a la lista de deseos

    @EscenarioNegativo
    Scenario:Error al intentar agregar un producto a la lista de deseos desde la pantalla de categorias
        Given El usuario esta en la pantalla de categorias
        When El usuario selecciona la opcion "Agregar a la Wishlist" en un producto
        Then El producto no se añade a la lista de deseos

    @EscenarioFeliz
    Scenario:El usuario visualiza correctamente el detalle del producto desde la pantalla de categorias
        Given El usuario esta en la pantalla de categorias
        When El usuario da clic sobre un producto
        Then El sistema redirige al usuario a la pantalla de detalle del producto
        And El usuario podra visualizar la informacion detallada del producto

    @EscenarioNegativo
    Scenario:Error al visualizar el detalle del producto desde la pantalla de categorias
        Given El usuario esta en la pantalla de categorias
        When El usuario da clic sobre un producto
        Then El sistema no redirige al usuario a la pantalla de detalle del producto

    @EscenarioFeliz
    Scenario: El usuario selecciona las especificaciones del producto y el sistema calcula el precio correctamente
        Given El usuario esta en la pantalla de detalle de un producto en la categoria "Computers"
        When El usuario selecciona las especificaciones del producto
        Then El sistema actualiza y muestra el precio total a pagar
        And El usuario puede ingresar la cantidad deseada del producto
        And El usuario puede ver el boton "Agregar al carrito"

    @EscenarioNegativo
    Scenario: Error en el calculo del precio al seleccionar las especificaciones de un producto
        Given El usuario esta en la pantalla de detalle de un producto en la categoria "Computers"
        When El usuario selecciona las especificaciones del producto
        Then El sistema no muestra el precio total actualizado

    @EscenarioFeliz
    Scenario: El usuario selecciona la cantidad del producto antes de agregar al carrito
        Given El usuario esta en la pantalla de detalle de un producto en la categoria "Computers"
        When El usuario ingresa una cantidad valida del producto
        Then El usuario selecciona el boton "Agregar al carrito"
        And El sistema agrega exitosamente en producto al carrito con la cantidad seleccionada


    @EscenarioNegativo
    Scenario: El usuario selecciona una cantidad invalida
        Given El usuario esta en la pantalla de detalle de un producto en la categoria "Computers"
        When El usuario ingresa una cantidad invalida del producto (0 o negativo)
        Then El usuario no puede agregar productos al carrito


    @EscenarioOutline
    Scenario: El usuario selecciona la visualizacion por secciones
        Given El usuario esta en la pantalla de productos
        When El usuario <selecciona> una visualizacion
        Then El usuario puede ver la <cantidadMostrada> de productos
        Examples:
            | selecciona | cantidadMostrada |
            | 3          | 3                |
            | 6          | 6                |
            | 9          | 9                |
            | 15         | 15               |

    @EscenarioOutline
    Scenario: El usuario no puede tener visualizacion por secciones
        Given El usuario esta en la pantalla de productos
        When El usuario <selecciona> una visualizacion
        Then El usuario ve una <cantidadMostrada> diferente
        Examples:
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

    @EscenarioOutline
    Scenario: El usuario puede añadir productos
        Given El usuario esta en la pantalla principal de productos
        When El usuario puede añadir <producto> al <opcionSeleccionada>
        Then El usuario puede ver el <resultado>
        Examples:
            | opcionSeleccionada | producto | resultado                     |
            | carrito            | MacBook  | MacBook añadido al carrito    |
            | wishlist           | MacBook  | MacBook  añadido al  wishlist |


    @EscenarioFeliz
    Scenario Outline: El usuario visualiza correctamente los botones adicionales en la pantalla de detalle del producto
        Given El usuario esta en la pantalla de detalle de un producto en la categoria "<Categoria>"
        When El usuario revisa la interfaz debajo del boton "ADD TO CART"
        Then El sistema muestra los botones:
            | Boton "Añadir a la lista de deseos"       |
            | Boton "Comprar"                           |
            | Boton "Enviar email a un amigo"           |
            | Opciones para compartir en redes sociales |
        Examples:
            | Categoria  |
            | Computers  |
            | Tablets    |
            | Accesorios |
            | Software   |

    @EscenarioNegativo
    Scenario Outline: Error en la visualizacion de los botones adicionales en la pantalla de detalle del producto
        Given El usuario esta en la pantalla de detalle de un producto en la categoria "<Categoria>"
        When El usuario revisa la interfaz debajo del boton "ADD TO CART"
        Then El sistema no muestra algunos de los botones adicionales correctamente
        And El usuario ve un mensaje de error "Ocurrio un problema al cargar las opciones adicionales"
        Examples:
            | Categoria  |
            | Computers  |
            | Tablets    |
            | Accesorios |
            | Software   |

    @EscenarioFeliz
    Scenario:Restriccion de compra para Apple MacBook Pro 13-inch
        Given el usuario esta en la categoria "Notebooks"
        When selecciona el producto "Apple MacBook Pro 13 -inch"
        And intenta agregar solo 1 unidad al carrito
        Then el sistema debe mostrar un mensaje indicando la "cantidad minima es de 2 unidades"
        When intenta agregar 2 o mas unidades
        Then el sistema debe permitir la compra
