/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/articulo_endpoint.dart' as _i2;
import '../endpoints/auth_endpoint.dart' as _i3;
import '../endpoints/cliente_endpoint.dart' as _i4;
import '../endpoints/mail_endpoint.dart' as _i5;
import '../endpoints/marca_endpoint.dart' as _i6;
import 'package:prlab_server/src/generated/articulo.dart' as _i7;
import 'package:prlab_server/src/generated/cliente.dart' as _i8;
import 'package:prlab_server/src/generated/marca.dart' as _i9;
import 'package:serverpod_auth_server/module.dart' as _i10;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'articulo': _i2.ArticuloEndpoint()
        ..initialize(
          server,
          'articulo',
          null,
        ),
      'auth': _i3.AuthEndpoint()
        ..initialize(
          server,
          'auth',
          null,
        ),
      'cliente': _i4.ClienteEndpoint()
        ..initialize(
          server,
          'cliente',
          null,
        ),
      'mail': _i5.MailEndpoint()
        ..initialize(
          server,
          'mail',
          null,
        ),
      'marca': _i6.MarcaEndpoint()
        ..initialize(
          server,
          'marca',
          null,
        ),
    };
    connectors['articulo'] = _i1.EndpointConnector(
      name: 'articulo',
      endpoint: endpoints['articulo']!,
      methodConnectors: {
        'crearArticulo': _i1.MethodConnector(
          name: 'crearArticulo',
          params: {
            'payload': _i1.ParameterDescription(
              name: 'payload',
              type: _i1.getType<_i7.Articulo>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['articulo'] as _i2.ArticuloEndpoint).crearArticulo(
            session,
            params['payload'],
          ),
        ),
        'listarArticulos': _i1.MethodConnector(
          name: 'listarArticulos',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['articulo'] as _i2.ArticuloEndpoint)
                  .listarArticulos(session),
        ),
        'obtenerArticulo': _i1.MethodConnector(
          name: 'obtenerArticulo',
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
              (endpoints['articulo'] as _i2.ArticuloEndpoint).obtenerArticulo(
            session,
            params['id'],
          ),
        ),
        'eliminarArticulo': _i1.MethodConnector(
          name: 'eliminarArticulo',
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
              (endpoints['articulo'] as _i2.ArticuloEndpoint).eliminarArticulo(
            session,
            params['id'],
          ),
        ),
        'listarArticulosPorMarca': _i1.MethodConnector(
          name: 'listarArticulosPorMarca',
          params: {
            'idMarca': _i1.ParameterDescription(
              name: 'idMarca',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['articulo'] as _i2.ArticuloEndpoint)
                  .listarArticulosPorMarca(
            session,
            params['idMarca'],
          ),
        ),
      },
    );
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
              (endpoints['auth'] as _i3.AuthEndpoint).getValidationCode(
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
              (endpoints['auth'] as _i3.AuthEndpoint).validarTokenPorMail(
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
              (endpoints['auth'] as _i3.AuthEndpoint)
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
              (endpoints['auth'] as _i3.AuthEndpoint).eliminarOTPResetPassword(
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
              type: _i1.getType<_i8.Cliente>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['cliente'] as _i4.ClienteEndpoint).completarKyc(
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
              (endpoints['mail'] as _i5.MailEndpoint).envioMailRegistro(
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
              type: _i1.getType<_i9.Marca>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['marca'] as _i6.MarcaEndpoint).crearMarca(
            session,
            params['payload'],
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
              (endpoints['marca'] as _i6.MarcaEndpoint).eliminarMarca(
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
              (endpoints['marca'] as _i6.MarcaEndpoint).listarMarcas(session),
        ),
        'obtenerMarcaPorId': _i1.MethodConnector(
          name: 'obtenerMarcaPorId',
          params: {
            'idMarca': _i1.ParameterDescription(
              name: 'idMarca',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['marca'] as _i6.MarcaEndpoint).obtenerMarcaPorId(
            session,
            params['idMarca'],
          ),
        ),
        'asignarUsuarioAMarca': _i1.MethodConnector(
          name: 'asignarUsuarioAMarca',
          params: {
            'idMarca': _i1.ParameterDescription(
              name: 'idMarca',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'idUsuario': _i1.ParameterDescription(
              name: 'idUsuario',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'idRol': _i1.ParameterDescription(
              name: 'idRol',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['marca'] as _i6.MarcaEndpoint).asignarUsuarioAMarca(
            session,
            idMarca: params['idMarca'],
            idUsuario: params['idUsuario'],
            idRol: params['idRol'],
          ),
        ),
        'listarMarcasPorUsuario': _i1.MethodConnector(
          name: 'listarMarcasPorUsuario',
          params: {
            'idUsuario': _i1.ParameterDescription(
              name: 'idUsuario',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['marca'] as _i6.MarcaEndpoint).listarMarcasPorUsuario(
            session,
            idUsuario: params['idUsuario'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i10.Endpoints()..initializeEndpoints(server);
  }
}
