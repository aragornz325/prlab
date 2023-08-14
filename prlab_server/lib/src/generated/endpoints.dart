/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/cliente_endpoint.dart' as _i2;
import '../endpoints/example_endpoint.dart' as _i3;
import '../endpoints/mailer_endpoint.dart' as _i4;
import 'package:prlab_commons/modelos/organizacion/organizacion.dart' as _i5;
import 'package:serverpod_auth_server/module.dart' as _i6;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'cliente': _i2.ClienteEndpoint()
        ..initialize(
          server,
          'cliente',
          null,
        ),
      'example': _i3.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'mailer': _i4.MailerEndpoint()
        ..initialize(
          server,
          'mailer',
          null,
        ),
    };
    connectors['cliente'] = _i1.EndpointConnector(
      name: 'cliente',
      endpoint: endpoints['cliente']!,
      methodConnectors: {
        'crearOrganizacion': _i1.MethodConnector(
          name: 'crearOrganizacion',
          params: {
            'orga': _i1.ParameterDescription(
              name: 'orga',
              type: _i1.getType<_i5.Organizacion>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['cliente'] as _i2.ClienteEndpoint).crearOrganizacion(
            session,
            params['orga'],
          ),
        )
      },
    );
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i3.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    connectors['mailer'] = _i1.EndpointConnector(
      name: 'mailer',
      endpoint: endpoints['mailer']!,
      methodConnectors: {
        'envioMailRegistro': _i1.MethodConnector(
          name: 'envioMailRegistro',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['mailer'] as _i4.MailerEndpoint).envioMailRegistro(
            session,
            params['email'],
          ),
        )
      },
    );
    modules['serverpod_auth'] = _i6.Endpoints()..initializeEndpoints(server);
  }
}
