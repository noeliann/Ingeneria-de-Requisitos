Feature: Autogeneración de comentarios y diagramas

  Como desarrollador,
  quiero generar automáticamente diagramas UML y comentarios en el código fuente,
  para comprender y mantener sistemas heredados con mayor facilidad.

  Scenario Outline: Generación automática de diagramas UML
    Given el desarrollador tiene cargado el proyecto "<Proyecto>" en la plataforma
    And el proyecto contiene los siguientes archivos compatibles

      | Archivo              | Lenguaje |
      | UserController.java  | Java     |
      | UserService.java     | Java     |
      | UserRepository.java  | Java     |
      | User.java            | Java     |

    When solicita la generación automática de un diagrama UML
    Then el diagrama UML es generado correctamente
    And el diagrama representa las clases y relaciones del proyecto
    And el sistema permite visualizarlo o descargarlo

    Examples:
      | Proyecto          |
      | LegacyERP         |
      | HospitalSystem    |
      | BankingPlatform   |

  Scenario Outline: Autogeneración de comentarios en el código fuente
    Given el desarrollador ha modificado un archivo escrito en "<Lenguaje>"
    And el archivo contiene los siguientes bloques de código

      | BloqueCodigo         | TipoComentario |
      | Método Login()       | Función        |
      | Clase Usuario        | Clase          |
      | Método ValidarRol()  | Método         |

    When solicita la generación automática de comentarios
    Then el sistema inserta comentarios explicativos en los bloques correspondientes
    And los comentarios siguen un formato consistente de documentación
    And el archivo queda disponible para su revisión o descarga

    Examples:
      | Lenguaje |
      | Java     |
      | C#       |
      | Python   |