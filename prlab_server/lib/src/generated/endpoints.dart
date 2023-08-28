/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/auth_endpoint.dart' as _i2;
import '../endpoints/cliente_endpoint.dart' as _i3;
import '../endpoints/mail_endpoint.dart' as _i4;
import '../endpoints/subida_archivos.dart' as _i5;
import 'package:prlab_server/src/generated/cliente.dart' as _i6;
import 'package:serverpod_auth_server/module.dart' as _i7;

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
      'mail': _i4.MailEndpoint()
        ..initialize(
          server,
          'mail',
          null,
        ),
      'subida': _i5.ArchivosEndpoint()
        ..initialize(
          server,
          'subida',
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
        'eliminarOTPResetPassword': _i1.MethodConnector(
          name: 'eliminarOTPResetPassword',
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
              (endpoints['auth'] as _i2.AuthEndpoint).eliminarOTPResetPassword(
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
        'completarKyc': _i1.MethodConnector(
          name: 'completarKyc',
          params: {
            'datosDelCliente': _i1.ParameterDescription(
              name: 'datosDelCliente',
              type: _i1.getType<_i6.Cliente>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['cliente'] as _i3.ClienteEndpoint).completarKyc(
            session,
            params['datosDelCliente'],
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
            'tipoDeInvitacion': _i1.ParameterDescription(
              name: 'tipoDeInvitacion',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['mail'] as _i4.MailEndpoint).envioMailRegistro(
            session,
            params['email'],
            params['tipoDeInvitacion'],
          ),
        )
      },
    );
    connectors['subida'] = _i1.EndpointConnector(
      name: 'subida',
      endpoint: endpoints['subida']!,
      methodConnectors: {
        'subirImagen': _i1.MethodConnector(
          name: 'subirImagen',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['subida'] as _i5.ArchivosEndpoint).subirImagen(
            session,
            params['path'],
          ),
        ),
        'borrarImagen': _i1.MethodConnector(
          name: 'borrarImagen',
          params: {
            'publicId': _i1.ParameterDescription(
              name: 'publicId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'url': _i1.ParameterDescription(
              name: 'url',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['subida'] as _i5.ArchivosEndpoint).borrarImagen(
            session,
            params['publicId'],
            params['url'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i7.Endpoints()..initializeEndpoints(server);
  }
}
