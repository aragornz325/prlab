/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:prlab_commons/modelos/organizacion/organizacion.dart' as _i3;
import 'package:serverpod_auth_client/module.dart' as _i4;
import 'dart:io' as _i5;
import 'protocol.dart' as _i6;

class _EndpointCliente extends _i1.EndpointRef {
  _EndpointCliente(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'cliente';

  _i2.Future<String> crearOrganizacion(_i3.Organizacion orga) =>
      caller.callServerEndpoint<String>(
        'cliente',
        'crearOrganizacion',
        {'orga': orga},
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

class _EndpointMailer extends _i1.EndpointRef {
  _EndpointMailer(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'mailer';

  _i2.Future<bool> envioMailRegistro(String email) =>
      caller.callServerEndpoint<bool>(
        'mailer',
        'envioMailRegistro',
        {'email': email},
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
    cliente = _EndpointCliente(this);
    example = _EndpointExample(this);
    mailer = _EndpointMailer(this);
    modules = _Modules(this);
  }

  late final _EndpointCliente cliente;

  late final _EndpointExample example;

  late final _EndpointMailer mailer;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'cliente': cliente,
        'example': example,
        'mailer': mailer,
      };
  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
