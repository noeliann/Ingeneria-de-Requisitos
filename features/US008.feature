Feature: Colaboración y gestión compartida de tareas

  Como miembro del equipo,
  quiero actualizar el estado de las tareas compartidas,
  para mantener informado al resto del equipo sobre el avance del proyecto.

  Scenario Outline: Actualización del estado de una tarea compartida
    Given el proyecto "<Proyecto>" contiene la siguiente tarea asignada

      | Tarea            | Responsable | Estado      |
      | <Tarea>          | <Usuario>   | En progreso |

    When el usuario actualiza el estado a "<NuevoEstado>"
    Then la plataforma actualiza la información de la tarea
    And los cambios son visibles para todos los miembros del proyecto
    And la actualización queda registrada en el historial

    Examples:
      | Proyecto | Tarea                     | Usuario | NuevoEstado |
      | CodeCare | Generar documentación     | Carlos  | Completada  |
      | CodeCare | Actualizar diagrama UML   | Ana     | En revisión |