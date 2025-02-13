#language: es

Feature: Registro en la plataforma de un usuario

    Background: El usuario accede a la tienda en linea
        Given el usuario navega al home principal del sitio web

    @EscenarioFeliz
    Scenario:acceso exitoso a la opcion registro
        When El usuario selecciona la opcion "Register" en la pagina principal
        Then La pagina debe mostrar el formulario de registro


    @EscenarioNegativo
    Scenario:acceso fallido a la opcion registro
        When El usuario selecciona la opcion "Register" en la pagina principal
        Then La pagina no muestra el formulario de registro

    @EscenarioOutline
    Scenario:Registro exitoso con datos obligatorios
        Given El usuario esta en la pagina de registro
        When Ingresa los siguientes datos
        Examples:
            | genero     | primerNombre | apellidos | fechaDeNacimiento | email              | cedula      | nombreDeLaCompania | password | newsletter |
            |            | "Angie"      | "Lopez"   | 02/12/1996        | "angie@gmail.com"  | 125697823   | "LG"               |"12v*2+"  |            |
            |            | "Manuela"    | "Romero"  |                   | "manu@gmail.com"   | 2587463     |                    |          |            |
            |            | "Rosa"       | "Cruz"    |                   | "rosa@gmail.com"   | 125697823   | "LG"               |          |            |
            | "Femenino" | "Manuela"    | "Rojas"   | 15/04/2004        | "pepita@gmail.com" | 2587463     | "Mercado Libre"    |"a1b3c."  | "true"     |
        
        And Presiona el boton "Register"
        Then El sistema crea el usuario
        And Muestra un mensaje indicando que el usuario es creado exitosamente


    @EscenarioOutline
    Scenario:Registro con menos de 6  caracteres en la contraseña
        Given El usuario esta en la pagina de registro
        When Ingresa una contraseña con menos de 6 caracteres
        Examples:
            | genero     | primerNombre | apellidos | fechaDeNacimiento | email              | cedula      | nombreDeLaCompania | password | newsletter |
            | Femenino   | "Angie"      | "Lopez"   | 02/12/1996        | "angie@gmail.com"  | 125697823   | "LG"               |"12v*"    |            |
            | Masculino  | "Pepito"     | "Perez"   | 12/09/1994        | "pepito@gmail.com" | 825697003   | "LG"               |"vvv"     |            |
        
        And Presiona el boton "Register"
        Then El sistema debe mostrar un mensaje de error "La contraseña debe tener al menos 6 caracteres"


    @EscenarioOutline
    Scenario:Registro de usuario con campos obligatorios incompletos
        Given El usuario esta en la pagina de registro
        When El usuario no registra la totalidad de los campos obligatorios
        Examples:
            | genero     | primerNombre | apellidos | fechaDeNacimiento | email              | cedula      | nombreDeLaCompania | password | newsletter |
            | Femenino   | "Manuela"    |           | 02/12/1996        | "manu@gmail.com"   | 2587463     |                    |"a1b3c."  |            |
            | Masculino  | "Jose"       |"Loaiza"   |                   | "jose@gmail.com"   | 1544236     |                    |"12+596"  |            |
            
        
        And Presiona el boton "Register"
        Then El sistema indica al usuario los campos obligatorios a diligenciar







