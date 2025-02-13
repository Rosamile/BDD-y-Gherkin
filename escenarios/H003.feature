#language: es

Feature: Inicio de sesión de un usuario en la plataforma

    Background: El usuario esta en la pantalla principal
        Given el usuario navega al home principal del sitio web

    @EscenarioFeliz
    Scenario:acceso a la opcion de inicio de sesion
        When El usuario selecciona la opcion "Login" en la pagina principal
        Then La plataforma debe mostrar el formulario de inicio de sesion


    @EscenarioNegativo
    Scenario:No acceso a la opcion de inicio de sesion
        When El usuario selecciona la opcion "Login" en la pagina principal
        Then La plataforma no muestra el formulario de inicio de sesion

    @EscenarioOutline
    Scenario:Inicio de sesión con datos validos
        Given El usuario esta en la pagina de inicio de sesion
        When Ingresa credenciales validas

        Examples:
            | email             | validPassword |
            | "angie@gmail.com" | "12v*2+"      |

        And Presiona el boton "Login"
        Then El sistema muestra la zona de compra con el mensaje "Welcome to our store"

    @EscenarioOutline
    Scenario:Inicio de sesión con datos invalidos
        Given El usuario esta en la pagina de inicio de sesion
        When Ingresa credenciales invalidas
        And Presiona el boton "Login"
        Then El sistema muestra un mensaje de error

        Examples:
            | email                | password | mensaje                           |
            | "angie@gmail.com"    | "abc123" | "usuario o contraseña incorrecta" |
            | "soyangie@gmail.com" | "12v*2+" | "cuenta no registrada"            |

    @EscenarioAlterno
    Scenario:Acceso a la opcion registro
        Given El usuario esta en la pagina de inicio de sesion
        When El usuario selecciona la opcion "Register"
        Then Se muestra la pagina del formulario de registro

    @EscenarioAlterno
    Scenario:Acceso a la opcion olvido clave
        Given El usuario esta en la pagina de inicio de sesion
        When El usuario selecciona la opcion "Olvido clave"
        Then Se muestra la pagina del formulario de recuperacion de contraseña

    @EscenarioAlterno
    Scenario:Acceso a la opcion recordarme
        Given El usuario esta en la pagina de inicio de sesion
        When Ingresa credenciales validas
        And El usuario selecciona la opcion "Recordarme"
        And Presiona el boton "Login"
        Then El sistema guarda las credenciales del usuario y las muestra en un siguiente inicio de sesion

    @EscenarioFeliz
    Scenario:Cierre de sesion exitoso
        Given El usuario ha iniciado sesion
        When El usuario selecciona la opcion "Logout"
        Then El sistema redirige al usuario al home principal

    @EscenarioOutline
    Scenario:Cierre de sesion fallido
        Given El usuario ha iniciado sesion
        When El usuario busca la opcion "Logout"
        Then El sistema <resultado>

        Examples:
            | estado_boton | resultado                                     |
            | existe       | no redirige a la pantalla de inicio           |
            | no_existe    | no muestra la opción de logout en la interfaz |
