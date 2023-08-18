/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:prlab_client/src/modelos/mensaje_registro/mensaje_registro.dart'
    as _i3;
import 'package:serverpod_auth_client/module.dart' as _i4;
import 'dart:io' as _i5;
import 'protocol.dart' as _i6;

/// La clase `AuthEndpoint` está ampliando la clase `Endpoint`. por tanto maneja
/// todas las peticiones relacionadas con el auth del sistema
class _EndpointAuth extends _i1.EndpointRef {
  _EndpointAuth(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'auth';

  /// La función `getValidationCode` devuelve un Future que recupera un código de validación del
  /// `AuthService` utilizando la sesión y el correo electrónico proporcionados.
  ///
  /// Args:
  ///   session (Session): El parámetro de sesión es un objeto que representa la sesión de usuario
  /// actual. Puede contener información como el token de autenticación del usuario o el ID de sesión.
  ///   email (String): El parámetro de correo electrónico es una cadena que representa la dirección de
  /// correo electrónico del usuario para el que se solicita el código de validación.
  ///
  /// retorna un `Future<String>` (el codigo en si).
  _i2.Future<String> getValidationCode(String email) =>
      caller.callServerEndpoint<String>(
        'auth',
        'getValidationCode',
        {'email': email},
      );

  _i2.Future<String> validarTokenPorMail(String token) =>
      caller.callServerEndpoint<String>(
        'auth',
        'validarTokenPorMail',
        {'token': token},
      );

  /// La función `validarCodigoResetPassword` toma un objeto `Session` y una cadena `codigo` como
  /// parámetros y devuelve un `Future<bool>` que indica si el código de restablecimiento de contraseña
  /// es válido.
  ///
  /// Args:
  ///   session (Session): Un objeto Session que representa la sesión de usuario actual.
  ///   codigo (String): El parámetro "codigo" es una cadena que representa el código de restablecimiento
  /// de contraseña que debe validarse.
  ///
  _i2.Future<bool> validarCodigoResetPassword(String codigo) =>
      caller.callServerEndpoint<bool>(
        'auth',
        'validarCodigoResetPassword',
        {'codigo': codigo},
      );

  /// La función `eliminarOTPResetPassword` llama al método `eliminarOTPResetPassword` desde
  /// `authService` y devuelve `Future<bool>`.
  ///
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y representa la información de la
  /// sesión del usuario. Se utiliza para autenticar y autorizar al usuario para la operación.
  ///   codigo (String): El parámetro "codigo" es una cadena que representa el código utilizado para
  /// restablecer la contraseña.
  ///
  _i2.Future<bool> eliminarOTPResetPassword(String codigo) =>
      caller.callServerEndpoint<bool>(
        'auth',
        'eliminarOTPResetPassword',
        {'codigo': codigo},
      );
}

class _EndpointExample extends _i1.EndpointRef {
  _EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<int> hello(
    String name,
    _i3.MensajeRegistro log,
  ) =>
      caller.callServerEndpoint<int>(
        'example',
        'hello',
        {
          'name': name,
          'log': log,
        },
      );
}

class _EndpointMail extends _i1.EndpointRef {
  _EndpointMail(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'mail';

  _i2.Future<bool> envioMailRegistro(
    String email,
    int tipoInvitacion,
  ) =>
      caller.callServerEndpoint<bool>(
        'mail',
        'envioMailRegistro',
        {
          'email': email,
          'tipoInvitacion': tipoInvitacion,
        },
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i4.Caller(client);
  }

  late final _i4.Caller auth;
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i5.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i6.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    auth = _EndpointAuth(this);
    example = _EndpointExample(this);
    mail = _EndpointMail(this);
    modules = _Modules(this);
  }

  late final _EndpointAuth auth;

  late final _EndpointExample example;

  late final _EndpointMail mail;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'auth': auth,
        'example': example,
        'mail': mail,
      };
  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
