Feature: Visualización del avance del proyecto en tiempo real

  Como jefe de proyecto,
  quiero visualizar el avance del proyecto en tiempo real,
  para supervisar el progreso del equipo y tomar decisiones oportunamente.

  Scenario Outline: Visualización del avance de las tareas del proyecto
    Given el jefe de proyecto tiene acceso al panel de monitoreo
    And el proyecto "<Proyecto>" contiene las siguientes tareas

      | Tarea                    | Responsable | Estado       |
      | Implementar autenticación| Carlos      | En progreso  |
      | Generar documentación    | Ana         | Completada   |
      | Diseñar interfaz         | Luis        | Pendiente    |

    When accede al módulo de seguimiento del proyecto
    Then el sistema muestra el estado actualizado de las tareas
    And presenta un progreso global del "<Porcentaje>"
    And permite visualizar el estado individual de cada tarea

    Examples:
      | Proyecto        | Porcentaje |
      | CodeCare        | 65%        |
      | LegacyERP       | 82%        |
      | HospitalSystem  | 67%        |

  Scenario Outline: Consulta de métricas e incidencias del proyecto
    Given el jefe de proyecto accede al panel de métricas del proyecto "<Proyecto>"
    And el sistema registra las siguientes incidencias

      | Incidencia                 | Prioridad | Estado      |
      | Error en autenticación     | Alta      | Abierta     |
      | Cobertura insuficiente     | Media     | En revisión |
      | Código duplicado           | Baja      | Pendiente   |

    When consulta el tablero de control
    Then el sistema muestra las métricas de desarrollo actualizadas
    And resalta visualmente las incidencias de prioridad alta
    And presenta un resumen del estado general del proyecto
    And permite acceder al detalle de cada incidencia

    Examples:
      | Proyecto       |
      | CodeCare       |
      | LegacyERP      |
      | HospitalSystem |