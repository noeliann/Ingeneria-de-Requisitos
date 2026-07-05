Feature: Login seguro con autenticación de dos factores

  Como miembro del equipo,
  quiero iniciar sesión utilizando autenticación de dos factores,
  para proteger el acceso a mi cuenta y a la información del proyecto.

  Scenario Outline: Inicio de sesión con autenticación de dos factores
    Given el usuario tiene habilitada la autenticación de dos factores
    And existe la siguiente información de acceso

      | Usuario | EstadoCuenta | Método2FA |
      | <Usuario> | Activa | Aplicación autenticadora |

    And el usuario ha ingresado correctamente sus credenciales
    When introduce el código de verificación "<Codigo>"
    Then el sistema valida el código de autenticación
    And concede acceso al perfil "<Perfil>"
    And registra el inicio de sesión en el historial de accesos
    And redirige al usuario al panel principal
    And muestra un mensaje de bienvenida

    Examples:
      | Usuario | Codigo | Perfil |
      | Carlos  | 482913 | Administrador |
      | Ana     | 315802 | Desarrollador |
      | Luis    | 604175 | Jefe de Proyecto |

  Scenario Outline: Acceso denegado por código de verificación inválido
    Given el usuario ha ingresado correctamente sus credenciales
    And existe el siguiente intento de autenticación

      | Usuario | EstadoCuenta | CódigoIngresado |
      | <Usuario> | Activa | <Codigo> |

    When el sistema valida el código de verificación
    Then el acceso a la cuenta es rechazado
    And el sistema muestra el mensaje "<Mensaje>"
    And el intento fallido queda registrado en el historial de seguridad
    And el usuario permanece en la pantalla de inicio de sesión
    And no se concede acceso a ninguna funcionalidad de la plataforma

    Examples:
      | Usuario | Codigo | Mensaje |
      | Carlos  | 111111 | Código de verificación inválido. |
      | Ana     | 000000 | Código de verificación expirado. |
      | Luis    | 123456 | Código de verificación inválido. |