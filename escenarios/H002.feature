#language:es

Caracteristica: Registro en la plataforma de un usuario

    Antecedentes: El usuario accede a la tienda en linea
        Dado el usuario navega al home principal del sitio web

    @EscenarioFeliz
    Escenario:acceso exitoso a la opcion registro
        Cuando El usuario selecciona la opcion "Register" en la pagina principal
        Entonces La pagina debe mostrar el formulario de registro


    @EscenarioNegativo
    Escenario:acceso fallido a la opcion registro
        Cuando El usuario selecciona la opcion "Register" en la pagina principal
        Entonces La pagina no muestra el formulario de registro

    @EsquemaDelEscenario
    Esquema del escenario:Registro exitoso con datos obligatorios
        Dado El usuario esta en la pagina de registro
        Cuando Ingresa los siguientes datos
        Ejemplos:
            | genero     | primerNombre | apellidos | fechaDeNacimiento | email              | cedula      | nombreDeLaCompania | password | newsletter |
            |            | "Angie"      | "Lopez"   | 02/12/1996        | "angie@gmail.com"  | 125697823   | "LG"               |"12v*2+"  |            |
            |            | "Manuela"    | "Romero"  |                   | "manu@gmail.com"   | 2587463     |                    |          |            |
            |            | "Rosa"       | "Cruz"    |                   | "rosa@gmail.com"   | 125697823   | "LG"               |          |            |
            | "Femenino" | "Manuela"    | "Rojas"   | 15/04/2004        | "pepita@gmail.com" | 2587463     | "Mercado Libre"    |"a1b3c."  | "true"     |
        
        Y Presiona el boton "Register"
        Entonces El sistema crea el usuario
        Y Muestra un mensaje indicYo que el usuario es creado exitosamente


    @EsquemaDelEscenario
    Esquema del escenario:Registro con menos de 6  caracteres en la contrasena
        Dado El usuario esta en la pagina de registro
        Cuando Ingresa una contrasena con menos de 6 caracteres
        Ejemplos:
            | genero     | primerNombre | apellidos | fechaDeNacimiento | email              | cedula      | nombreDeLaCompania | password | newsletter |
            | Femenino   | "Angie"      | "Lopez"   | 02/12/1996        | "angie@gmail.com"  | 125697823   | "LG"               |"12v*"    |            |
            | Masculino  | "Pepito"     | "Perez"   | 12/09/1994        | "pepito@gmail.com" | 825697003   | "LG"               |"vvv"     |            |
        
        Y Presiona el boton "Register"
        Entonces El sistema debe mostrar un mensaje de error "La contrasena debe tener al menos 6 caracteres"


    @EsquemaDelEscenario
    Esquema del escenario:Registro de usuario con campos obligatorios incompletos
        Dado El usuario esta en la pagina de registro
        Cuando El usuario no registra la totalidad de los campos obligatorios
        Ejemplos:
            | genero     | primerNombre | apellidos | fechaDeNacimiento | email              | cedula      | nombreDeLaCompania | password | newsletter |
            | Femenino   | "Manuela"    |           | 02/12/1996        | "manu@gmail.com"   | 2587463     |                    |"a1b3c."  |            |
            | Masculino  | "Jose"       |"Loaiza"   |                   | "jose@gmail.com"   | 1544236     |                    |"12+596"  |            |
            
        
        Y Presiona el boton "Register"
        Entonces El sistema indica al usuario los campos obligatorios a diligenciar







