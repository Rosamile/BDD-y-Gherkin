#language:es

Caracteristica: Inicio de sesion de un usuario en la plataforma

    Antecedentes: El usuario esta en la pantalla principal
        Dado el usuario navega al home principal del sitio web

    @EscenarioFeliz
    Escenario:acceso a la opcion de inicio de sesion
        Cuando El usuario selecciona la opcion "Login" en la pagina principal
        Entonces La plataforma debe mostrar el formulario de inicio de sesion


    @EscenarioNegativo
    Escenario:No acceso a la opcion de inicio de sesion
        Cuando El usuario selecciona la opcion "Login" en la pagina principal
        Entonces La plataforma no muestra el formulario de inicio de sesion

    @EsquemaDelEscenario
    Esquema del escenario:Inicio de sesion con datos validos
        Dado El usuario esta en la pagina de inicio de sesion
        Cuando Ingresa credenciales validas

        Ejemplos:
            | email             | validPassword |
            | "angie@gmail.com" | "12v*2+"      |

        Y Presiona el boton "Login"
        Entonces El sistema muestra la zona de compra con el mensaje "Welcome to our store"

    @EsquemaDelEscenario
    Esquema del escenario:Inicio de sesion con datos invalidos
        Dado El usuario esta en la pagina de inicio de sesion
        Cuando Ingresa credenciales invalidas
        Y Presiona el boton "Login"
        Entonces El sistema muestra un mensaje de error

        Ejemplos:
            | email                | password | mensaje                           |
            | "angie@gmail.com"    | "abc123" | "usuario o contrasena incorrecta" |
            | "soyangie@gmail.com" | "12v*2+" | "cuenta no registrada"            |

    @EscenarioAlterno
    Escenario:Acceso a la opcion registro
        Dado El usuario esta en la pagina de inicio de sesion
        Cuando El usuario selecciona la opcion "Register"
        Entonces Se muestra la pagina del formulario de registro

    @EscenarioAlterno
    Escenario:Acceso a la opcion olvido clave
        Dado El usuario esta en la pagina de inicio de sesion
        Cuando El usuario selecciona la opcion "Olvido clave"
        Entonces Se muestra la pagina del formulario de recuperacion de contrasena

    @EscenarioAlterno
    Escenario:Acceso a la opcion recordarme
        Dado El usuario esta en la pagina de inicio de sesion
        Cuando Ingresa credenciales validas
        Y El usuario selecciona la opcion "Recordarme"
        Y Presiona el boton "Login"
        Entonces El sistema guarda las credenciales del usuario y las muestra en un siguiente inicio de sesion

    @EscenarioFeliz
    Escenario:Cierre de sesion exitoso
        Dado El usuario ha iniciado sesion
        Cuando El usuario selecciona la opcion "Logout"
        Entonces El sistema redirige al usuario al home principal

    @EsquemaDelEscenario
    Esquema del escenario:Cierre de sesion fallido
        Dado El usuario ha iniciado sesion
        Cuando El usuario busca la opcion "Logout"
        Entonces El sistema <resultado>

        Ejemplos:
            | estado_boton | resultado                                     |
            | existe       | no redirige a la pantalla de inicio           |
            | no_existe    | no muestra la opcion de logout en la interfaz |
