Feature: Recomendaciones automáticas de optimización de código

  Como desarrollador,
  quiero recibir recomendaciones automáticas de optimización,
  para mejorar la calidad y el rendimiento del código fuente.

  Scenario Outline: Generación de recomendaciones automáticas de optimización de código
    Given el desarrollador tiene abierto el proyecto "<Proyecto>"
    And el sistema ha identificado la siguiente oportunidad de mejora

      | SeccionCodigo | ProblemaDetectado |
      | <Seccion>     | <Problema>        |

    When finaliza el análisis del código fuente
    Then el sistema muestra una recomendación de optimización
    And la recomendación incluye la descripción del problema encontrado

    Examples:
      | Proyecto      | Seccion           | Problema                 |
      | LegacyERP     | LoginService.cs   | Código duplicado         |
      | HospitalApp   | Facturacion.java  | Complejidad elevada      |
      | CRMPlatform   | Cliente.py        | Método demasiado extenso |

  Scenario Outline: Visualización de áreas con mayor deuda técnica
    Given el desarrollador accede al módulo de gestión de deuda técnica del proyecto "<Proyecto>"
    And existen las siguientes áreas evaluadas

      | Area             | Errores | Prioridad |
      | Autenticación    | 15       | Alta      |
      | Facturación      | 9        | Media     |
      | Reportes         | 4        | Baja      |

    When selecciona el criterio de priorización "<Criterio>"
    Then el sistema ordena las áreas según el criterio seleccionado
    And muestra primero las áreas con mayor deuda técnica
    And permite iniciar acciones de mantenimiento sobre las áreas priorizadas

    Examples:
      | Proyecto    | Criterio          |
      | LegacyERP   | Cantidad de errores |
      | HospitalApp | Severidad           |
      | CRMPlatform | Complejidad         |