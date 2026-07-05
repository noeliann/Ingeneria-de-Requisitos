Feature: Gestión de roles y permisos de acceso

  Como administrador,
  quiero asignar roles y permisos a los miembros del equipo,
  para controlar el acceso a las funcionalidades de la plataforma.

  Scenario Outline: Asignación de un rol y actualización de permisos
    Given el administrador se encuentra en el módulo de gestión de usuarios
    And existe el siguiente miembro del equipo

      | Usuario | RolActual | Estado |
      | <Usuario> | <RolActual> | Activo |

    When el administrador asigna el rol "<NuevoRol>"
    Then los permisos del usuario son actualizados inmediatamente
    And el usuario tiene acceso únicamente a las siguientes funcionalidades

      | Funcionalidad |
      | <Funcionalidad1> |
      | <Funcionalidad2> |

    And el sistema muestra el mensaje "<Mensaje>"

    Examples:
      | Usuario | RolActual | NuevoRol     | Funcionalidad1        | Funcionalidad2           | Mensaje                              |
      | Carlos  | Revisor   | Administrador| Gestión de usuarios   | Configuración del sistema| Rol asignado correctamente.          |
      | Ana     | Invitado  | Desarrollador| Gestión de proyectos  | Generación UML           | Rol asignado correctamente.          |

  Scenario Outline: Restricción de acceso a funcionalidades no autorizadas
    Given un miembro del equipo ha iniciado sesión con el rol "<Rol>"
    And existen las siguientes restricciones de acceso

      | Funcionalidad               | Acceso |
      | <SeccionRestringida>        | Denegado |
      | Configuración del sistema   | Denegado |

    When intenta acceder a "<SeccionRestringida>"
    Then el sistema deniega el acceso
    And muestra el mensaje "<Mensaje>"
    And las opciones de configuración permanecen bloqueadas

    Examples:
      | Rol          | SeccionRestringida | Mensaje                               |
      | Desarrollador| Gestión de usuarios| No cuenta con permisos suficientes.   |
      | Invitado     | Configuración      | No cuenta con permisos suficientes.   |