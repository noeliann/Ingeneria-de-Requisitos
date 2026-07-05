Feature: Generación automática de documentación técnica

  Como desarrollador,
  quiero que la plataforma genere documentación técnica a partir del código fuente,
  para reducir el tiempo invertido en descifrar la lógica de sistemas heredados.

  Scenario Outline: Generar documentación técnica desde un repositorio válido
    Given el desarrollador tiene acceso al repositorio "<Repositorio>"
    And el repositorio contiene los siguientes archivos compatibles

      | Archivo           | Lenguaje |
      | AuthService.cs    | C#       |
      | UserController.cs | C#       |
      | UserRepository.cs | C#       |
      | User.cs           | C#       |

    When el desarrollador solicita la generación de documentación técnica
    Then la documentación técnica del proyecto es generada correctamente
    And el sistema muestra un mensaje de generación exitosa
    And la documentación puede visualizarse o descargarse

    Examples:
      | Repositorio     |
      | ERP-Legacy      |
      | InventorySystem |
      | CRM-System      |

  Scenario Outline: Actualizar automáticamente la documentación después de cambios en el código fuente
    Given existe documentación técnica previamente generada para el proyecto "<Proyecto>"
    And el proyecto contiene los siguientes archivos modificados

      | Archivo        | TipoCambio |
      | Cliente.cs     | Modificado |
      | Pedido.cs      | Agregado   |
      | Factura.cs     | Eliminado  |

    When el desarrollador sincroniza los cambios del repositorio
    Then la documentación técnica es actualizada automáticamente
    And los cambios realizados se reflejan en la documentación
    And el sistema no requiere una actualización manual

    Examples:
      | Proyecto          |
      | ERP Corporativo   |
      | Sistema Contable  |
      | Portal Académico  |