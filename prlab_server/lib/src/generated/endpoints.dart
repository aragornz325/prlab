/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/auth_endpoint.dart' as _i2;
import '../endpoints/cliente_endpoint.dart' as _i3;
import '../endpoints/example_endpoint.dart' as _i4;
import '../endpoints/mail_endpoint.dart' as _i5;
import 'package:prlab_commons/modelos/organizacion/organizacion.dart' as _i6;
import 'package:prlab_commons/modelos/mensaje_registro/mensaje_registro.dart'
    as _i7;
import 'package:serverpod_auth_server/module.dart' as _i8;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'auth': _i2.AuthEndpoint()
        ..initialize(
          server,
          'auth',
          null,
        ),
      'cliente': _i3.ClienteEndpoint()
        ..initialize(
          server,
          'cliente',
          null,
        ),
      'example': _i4.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'mail': _i5.MailEndpoint()
        ..initialize(
          server,
          'mail',
          null,
        ),
    };
    connectors['auth'] = _i1.EndpointConnector(
      name: 'auth',
      endpoint: endpoints['auth']!,
      methodConnectors: {
        'getValidationCode': _i1.MethodConnector(
          name: 'getValidationCode',
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
              (endpoints['auth'] as _i2.AuthEndpoint).getValidationCode(
            session,
            params['email'],
          ),
        ),
        'validarTokenPorMail': _i1.MethodConnector(
          name: 'validarTokenPorMail',
          params: {
            'token': _i1.ParameterDescription(
              name: 'token',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint).validarTokenPorMail(
            session,
            params['token'],
          ),
        ),
        'validarCodigoResetPassword': _i1.MethodConnector(
          name: 'validarCodigoResetPassword',
          params: {
            'codigo': _i1.ParameterDescription(
              name: 'codigo',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint)
                  .validarCodigoResetPassword(
            session,
            params['codigo'],
          ),
        ),
      },
    );
    connectors['cliente'] = _i1.EndpointConnector(
      name: 'cliente',
      endpoint: endpoints['cliente']!,
      methodConnectors: {
        'crearOrganizacion': _i1.MethodConnector(
          name: 'crearOrganizacion',
          params: {
            'orga': _i1.ParameterDescription(
              name: 'orga',
              type: _i1.getType<_i6.Organizacion>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['cliente'] as _i3.ClienteEndpoint).crearOrganizacion(
            session,
            params['orga'],
          ),
        ),
        'crearLog': _i1.MethodConnector(
          name: 'crearLog',
          params: {
            'log': _i1.ParameterDescription(
              name: 'log',
              type: _i1.getType<_i7.MensajeRegistro>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['cliente'] as _i3.ClienteEndpoint).crearLog(
            session,
            params['log'],
          ),
        ),
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
              (endpoints['example'] as _i4.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    connectors['mail'] = _i1.EndpointConnector(
      name: 'mail',
      endpoint: endpoints['mail']!,
      methodConnectors: {
        'envioMailRegistro': _i1.MethodConnector(
          name: 'envioMailRegistro',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'tipoInvitacion': _i1.ParameterDescription(
              name: 'tipoInvitacion',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['mail'] as _i5.MailEndpoint).envioMailRegistro(
            session,
            params['email'],
            params['tipoInvitacion'],
          ),
        )
      },
    );
    modules['serverpod_auth'] = _i8.Endpoints()..initializeEndpoints(server);
  }
}
