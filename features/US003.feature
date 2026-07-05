Feature: Visualización del grafo de dependencias

  Como desarrollador,
  quiero visualizar el grafo de dependencias del sistema,
  para comprender las relaciones entre módulos e identificar riesgos antes de realizar cambios.

  Scenario Outline: Generación del grafo de dependencias
    Given el desarrollador ha seleccionado el módulo "<Modulo>"
    And el módulo contiene los siguientes componentes

      | Componente         | Tipo       |
      | AuthController     | Controlador|
      | AuthService        | Servicio   |
      | AuthRepository     | Repositorio|
      | UserModel          | Modelo     |

    When solicita la visualización del grafo de dependencias
    Then el sistema genera el grafo de dependencias del módulo
    And resalta las dependencias críticas según su nivel de riesgo
    And el grafo puede visualizarse correctamente

    Examples:
      | Modulo          |
      | Autenticación   |
      | Facturación     |
      | Inventario      |

  Scenario Outline: Identificación de riesgos de impacto
    Given el desarrollador está visualizando el grafo de dependencias del módulo "<Modulo>"
    And el grafo contiene las siguientes dependencias

      | Nodo             | ComponenteAfectado | NivelImpacto |
      | <Nodo>           | API Gateway        | Alto         |
      | <Nodo>           | Servicio de Login  | Medio        |
      | <Nodo>           | Base de Datos      | Bajo         |

    When el desarrollador posiciona el cursor sobre el nodo "<Nodo>"
    Then el sistema muestra los componentes afectados
    And muestra el nivel de impacto asociado a cada dependencia

    Examples:
      | Modulo        | Nodo          |
      | Autenticación | AuthService   |
      | Facturación   | InvoiceService|
      | Inventario    | StockService  |