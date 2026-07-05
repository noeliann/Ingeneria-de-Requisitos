Feature: Integración con herramientas CI/CD y gestores de tareas

  Como desarrollador,
  quiero integrar la plataforma con herramientas CI/CD y gestores de tareas,
  para centralizar el seguimiento del desarrollo y automatizar la sincronización de información.

  Scenario Outline: Integración con herramientas CI/CD
    Given el desarrollador dispone de la herramienta CI/CD "<Herramienta>"
    And cuenta con las siguientes credenciales de acceso

      | TipoCredencial | Estado |
      | Token API       | Válido |
      | URL Base        | Activa |

    And existe el siguiente pipeline configurado

      | Pipeline            | Rama      | Estado |
      | <Pipeline>          | develop   | Activo |

    When configura la integración entre la plataforma y la herramienta
    Then la plataforma establece la conexión mediante la API
    And sincroniza la información del pipeline configurado
    And muestra el estado de ejecución de cada etapa

      | Etapa        | Estado |
      | Compilación  | Exitosa |
      | Pruebas      | Exitosa |
      | Despliegue   | En proceso |

    And registra la fecha de la última sincronización
    And notifica que la integración fue realizada correctamente

    Examples:
      | Herramienta | Pipeline           |
      | Jenkins     | Backend-Build      |
      | GitHub Actions | Deploy-Frontend |
      | GitLab CI   | Release-Production |

  Scenario Outline: Sincronización con un gestor de tareas
    Given el proyecto se encuentra vinculado con el gestor de tareas "<Gestor>"
    And existen las siguientes tareas sincronizadas

      | ID | Tarea                      | Estado |
      | 15 | Implementar autenticación  | En progreso |
      | 22 | Corregir errores de login  | Pendiente |
      | 31 | Actualizar documentación   | Completada |

    When el desarrollador realiza la operación "<Operacion>"
    Then la plataforma sincroniza automáticamente los cambios mediante webhooks
    And actualiza la información del proyecto compartido
    And refleja el nuevo estado de las tareas afectadas
    And registra la operación en el historial de actividades
    And notifica a los miembros del equipo sobre la actualización realizada

    Examples:
      | Gestor | Operacion |
      | Jira   | Actualizar tarea |
      | Trello | Cambiar estado |
      | Asana  | Crear tarea |