/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/archivos_endpoint.dart' as _i2;
import '../endpoints/articulo_endpoint.dart' as _i3;
import '../endpoints/auth_endpoint.dart' as _i4;
import '../endpoints/cliente_endpoint.dart' as _i5;
import '../endpoints/mail_endpoint.dart' as _i6;
import '../endpoints/marca_endpoint.dart' as _i7;
import 'package:prlab_server/src/generated/articulo.dart' as _i8;
import 'package:prlab_server/src/generated/cliente.dart' as _i9;
import 'package:prlab_server/src/generated/marca.dart' as _i10;
import 'package:serverpod_auth_server/module.dart' as _i11;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'archivos': _i2.ArchivosEndpoint()
        ..initialize(
          server,
          'archivos',
          null,
        ),
      'articulo': _i3.ArticuloEndpoint()
        ..initialize(
          server,
          'articulo',
          null,
        ),
      'auth': _i4.AuthEndpoint()
        ..initialize(
          server,
          'auth',
          null,
        ),
      'cliente': _i5.ClienteEndpoint()
        ..initialize(
          server,
          'cliente',
          null,
        ),
      'mail': _i6.MailEndpoint()
        ..initialize(
          server,
          'mail',
          null,
        ),
      'marca': _i7.MarcaEndpoint()
        ..initialize(
          server,
          'marca',
          null,
        ),
    };
    connectors['archivos'] = _i1.EndpointConnector(
      name: 'archivos',
      endpoint: endpoints['archivos']!,
      methodConnectors: {
        'subirImagen': _i1.MethodConnector(
          name: 'subirImagen',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'fileName': _i1.ParameterDescription(
              name: 'fileName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'cloudinaryFolder': _i1.ParameterDescription(
              name: 'cloudinaryFolder',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['archivos'] as _i2.ArchivosEndpoint).subirImagen(
            session,
            path: params['path'],
            fileName: params['fileName'],
            cloudinaryFolder: params['cloudinaryFolder'],
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
              (endpoints['archivos'] as _i2.ArchivosEndpoint).borrarImagen(
            session,
            params['publicId'],
            params['url'],
          ),
        ),
        'subirImagenArticulo': _i1.MethodConnector(
          name: 'subirImagenArticulo',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'idArticulo': _i1.ParameterDescription(
              name: 'idArticulo',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['archivos'] as _i2.ArchivosEndpoint)
                  .subirImagenArticulo(
            session,
            path: params['path'],
            idArticulo: params['idArticulo'],
          ),
        ),
      },
    );
    connectors['articulo'] = _i1.EndpointConnector(
      name: 'articulo',
      endpoint: endpoints['articulo']!,
      methodConnectors: {
        'crearArticulo': _i1.MethodConnector(
          name: 'crearArticulo',
          params: {
            'articulo': _i1.ParameterDescription(
              name: 'articulo',
              type: _i1.getType<_i8.Articulo>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['articulo'] as _i3.ArticuloEndpoint).crearArticulo(
            session,
            params['articulo'],
          ),
        ),
        'listarArticulos': _i1.MethodConnector(
          name: 'listarArticulos',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['articulo'] as _i3.ArticuloEndpoint)
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
              (endpoints['articulo'] as _i3.ArticuloEndpoint).obtenerArticulo(
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
              (endpoints['articulo'] as _i3.ArticuloEndpoint).eliminarArticulo(
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
              (endpoints['articulo'] as _i3.ArticuloEndpoint)
                  .listarArticulosPorMarca(
            session,
            params['idMarca'],
          ),
        ),
        'actualizarArticulo': _i1.MethodConnector(
          name: 'actualizarArticulo',
          params: {
            'articulo': _i1.ParameterDescription(
              name: 'articulo',
              type: _i1.getType<_i8.Articulo>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['articulo'] as _i3.ArticuloEndpoint)
                  .actualizarArticulo(
            session,
            articulo: params['articulo'],
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
              (endpoints['auth'] as _i4.AuthEndpoint).getValidationCode(
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
              (endpoints['auth'] as _i4.AuthEndpoint).validarTokenPorMail(
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
              (endpoints['auth'] as _i4.AuthEndpoint)
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
              (endpoints['auth'] as _i4.AuthEndpoint).eliminarOTPResetPassword(
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
              type: _i1.getType<_i9.Cliente>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['cliente'] as _i5.ClienteEndpoint).completarKyc(
            session,
            params['datosDelCliente'],
          ),
        ),
        'comprobarKyc': _i1.MethodConnector(
          name: 'comprobarKyc',
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
              (endpoints['cliente'] as _i5.ClienteEndpoint).comprobarKyc(
            session,
            params['idUsuario'],
          ),
        ),
        'listarUsuariosPorMarca': _i1.MethodConnector(
          name: 'listarUsuariosPorMarca',
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
              (endpoints['cliente'] as _i5.ClienteEndpoint)
                  .listarUsuariosPorMarca(
            session,
            idMarca: params['idMarca'],
          ),
        ),
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
              (endpoints['mail'] as _i6.MailEndpoint).envioMailRegistro(
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
            'marca': _i1.ParameterDescription(
              name: 'marca',
              type: _i1.getType<_i10.Marca>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['marca'] as _i7.MarcaEndpoint).crearMarca(
            session,
            params['marca'],
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
              (endpoints['marca'] as _i7.MarcaEndpoint).eliminarMarca(
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
              (endpoints['marca'] as _i7.MarcaEndpoint).listarMarcas(session),
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
              (endpoints['marca'] as _i7.MarcaEndpoint).obtenerMarcaPorId(
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
              (endpoints['marca'] as _i7.MarcaEndpoint).asignarUsuarioAMarca(
            session,
            idMarca: params['idMarca'],
            idUsuario: params['idUsuario'],
            idRol: params['idRol'],
          ),
        ),
        'desvincularUsuarioDeMarca': _i1.MethodConnector(
          name: 'desvincularUsuarioDeMarca',
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
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['marca'] as _i7.MarcaEndpoint)
                  .desvincularUsuarioDeMarca(
            session,
            idMarca: params['idMarca'],
            idUsuario: params['idUsuario'],
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
              (endpoints['marca'] as _i7.MarcaEndpoint).listarMarcasPorUsuario(
            session,
            idUsuario: params['idUsuario'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i11.Endpoints()..initializeEndpoints(server);
  }
}
