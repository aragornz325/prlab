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
import '../endpoints/marca_endpoint.dart' as _i5;
import 'package:prlab_server/src/generated/cliente.dart' as _i6;
import 'package:prlab_server/src/generated/marca.dart' as _i7;
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
      'mail': _i4.MailEndpoint()
        ..initialize(
          server,
          'mail',
          null,
        ),
      'marca': _i5.MarcaEndpoint()
        ..initialize(
          server,
          'marca',
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
    connectors['marca'] = _i1.EndpointConnector(
      name: 'marca',
      endpoint: endpoints['marca']!,
      methodConnectors: {
        'crearMarca': _i1.MethodConnector(
          name: 'crearMarca',
          params: {
            'payload': _i1.ParameterDescription(
              name: 'payload',
              type: _i1.getType<_i7.Marca>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['marca'] as _i5.MarcaEndpoint).crearMarca(
            session,
            params['payload'],
          ),
        ),
        'editarMarca': _i1.MethodConnector(
          name: 'editarMarca',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'nombre': _i1.ParameterDescription(
              name: 'nombre',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'descripcion': _i1.ParameterDescription(
              name: 'descripcion',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'logo': _i1.ParameterDescription(
              name: 'logo',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['marca'] as _i5.MarcaEndpoint).editarMarca(
            session,
            params['id'],
            params['nombre'],
            params['descripcion'],
            params['logo'],
          ),
        ),
        'eliminarMarca': _i1.MethodConnector(
          name: 'eliminarMarca',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['marca'] as _i5.MarcaEndpoint).eliminarMarca(
            session,
            params['id'],
          ),
        ),
        'listarMarcas': _i1.MethodConnector(
          name: 'listarMarcas',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['marca'] as _i5.MarcaEndpoint).listarMarcas(session),
        ),
      },
    );
    modules['serverpod_auth'] = _i8.Endpoints()..initializeEndpoints(server);
  }
}
