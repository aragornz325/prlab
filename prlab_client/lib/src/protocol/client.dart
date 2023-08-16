/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:prlab_commons/modelos/organizacion/organizacion.dart' as _i3;
import 'package:prlab_commons/modelos/mensaje_registro/mensaje_registro.dart'
    as _i4;
import 'package:serverpod_auth_client/module.dart' as _i5;
import 'dart:io' as _i6;
import 'protocol.dart' as _i7;

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
}

class _EndpointCliente extends _i1.EndpointRef {
  _EndpointCliente(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'cliente';

  _i2.Future<int> crearOrganizacion(_i3.Organizacion orga) =>
      caller.callServerEndpoint<int>(
        'cliente',
        'crearOrganizacion',
        {'orga': orga},
      );

  _i2.Future<int> crearLog(_i4.MensajeRegistro log) =>
      caller.callServerEndpoint<int>(
        'cliente',
        'crearLog',
        {'log': log},
      );
}

class _EndpointExample extends _i1.EndpointRef {
  _EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
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
    auth = _i5.Caller(client);
  }

  late final _i5.Caller auth;
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i6.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i7.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    auth = _EndpointAuth(this);
    cliente = _EndpointCliente(this);
    example = _EndpointExample(this);
    mail = _EndpointMail(this);
    modules = _Modules(this);
  }

  late final _EndpointAuth auth;

  late final _EndpointCliente cliente;

  late final _EndpointExample example;

  late final _EndpointMail mail;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'auth': auth,
        'cliente': cliente,
        'example': example,
        'mail': mail,
      };
  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
