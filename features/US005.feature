Feature: Integración con repositorios Git

  Como desarrollador,
  quiero integrar un repositorio Git con la plataforma,
  para mantener sincronizado el código fuente del proyecto.

  Scenario Outline: Conexión exitosa con un repositorio Git
    Given el desarrollador dispone del siguiente repositorio

      | Repositorio | Servidor | Permisos |
      | <Repositorio> | <Servidor> | Escritura |

    When configura la conexión del repositorio en la plataforma
    Then la conexión con el repositorio se establece correctamente
    And las ramas disponibles son sincronizadas
    And el sistema muestra el mensaje "<Mensaje>"

    Examples:
      | Repositorio      | Servidor | Mensaje                                   |
      | CodeCare-Core    | GitHub   | Repositorio vinculado correctamente.      |
      | LegacyBankAPI    | GitLab   | Repositorio vinculado correctamente.      |
      | HospitalSystem   | Bitbucket| Repositorio vinculado correctamente.      |

  Scenario Outline: Sincronización automática de cambios en el código fuente
    Given el repositorio "<Repositorio>" ya se encuentra vinculado
    And existen los siguientes cambios pendientes de sincronización

      | Rama        | Evento | Archivo              |
      | <Rama>      | Push   | AuthService.cs       |
      | <Rama>      | Push   | UserController.cs    |

    When el desarrollador realiza un push sobre la rama "<Rama>"
    Then la plataforma sincroniza los cambios del repositorio
    And actualiza la información del proyecto
    And registra la sincronización en el historial del proyecto

    Examples:
      | Repositorio    | Rama    |
      | CodeCare-Core  | develop |
      | LegacyBankAPI  | main    |
      | HospitalSystem | release |