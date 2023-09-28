/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/almacenamiento_archivos_nube_endpoint.dart' as _i2;
import '../endpoints/auth_endpoint.dart' as _i3;
import '../endpoints/cliente_endpoint.dart' as _i4;
import '../endpoints/comentario_endpoint.dart' as _i5;
import '../endpoints/entregable_articulo_endpoint.dart' as _i6;
import '../endpoints/mail_endpoint.dart' as _i7;
import '../endpoints/marca_endpoint.dart' as _i8;
import '../endpoints/periodista_endpoint.dart' as _i9;
import 'package:prlab_server/src/generated/cliente.dart' as _i10;
import 'package:prlab_server/src/generated/comentario.dart' as _i11;
import 'package:prlab_server/src/generated/entregable_articulo.dart' as _i12;
import 'package:prlab_server/src/generated/marca.dart' as _i13;
import 'package:prlab_server/src/generated/periodista.dart' as _i14;
import 'package:serverpod_auth_server/module.dart' as _i15;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'almacenamientoArchivosNube': _i2.AlmacenamientoArchivosNubeEndpoint()
        ..initialize(
          server,
          'almacenamientoArchivosNube',
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
      'comentario': _i5.ComentarioEndpoint()
        ..initialize(
          server,
          'comentario',
          null,
        ),
      'entregableArticulo': _i6.EntregableArticuloEndpoint()
        ..initialize(
          server,
          'entregableArticulo',
          null,
        ),
      'mail': _i7.MailEndpoint()
        ..initialize(
          server,
          'mail',
          null,
        ),
      'marca': _i8.MarcaEndpoint()
        ..initialize(
          server,
          'marca',
          null,
        ),
      'periodista': _i9.PeriodistaEndpoint()
        ..initialize(
          server,
          'periodista',
          null,
        ),
    };
    connectors['almacenamientoArchivosNube'] = _i1.EndpointConnector(
      name: 'almacenamientoArchivosNube',
      endpoint: endpoints['almacenamientoArchivosNube']!,
      methodConnectors: {
        'subirImagen': _i1.MethodConnector(
          name: 'subirImagen',
          params: {
            'rutaImagen': _i1.ParameterDescription(
              name: 'rutaImagen',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'nombreImagen': _i1.ParameterDescription(
              name: 'nombreImagen',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'directorioNube': _i1.ParameterDescription(
              name: 'directorioNube',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['almacenamientoArchivosNube']
                      as _i2.AlmacenamientoArchivosNubeEndpoint)
                  .subirImagen(
            session,
            rutaImagen: params['rutaImagen'],
            nombreImagen: params['nombreImagen'],
            directorioNube: params['directorioNube'],
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
            'urlImagen': _i1.ParameterDescription(
              name: 'urlImagen',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['almacenamientoArchivosNube']
                      as _i2.AlmacenamientoArchivosNubeEndpoint)
                  .borrarImagen(
            session,
            publicId: params['publicId'],
            urlImagen: params['urlImagen'],
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
              type: _i1.getType<_i10.Cliente>(),
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
              (endpoints['cliente'] as _i4.ClienteEndpoint).comprobarKyc(
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
              (endpoints['cliente'] as _i4.ClienteEndpoint)
                  .listarUsuariosPorMarca(
            session,
            idMarca: params['idMarca'],
          ),
        ),
      },
    );
    connectors['comentario'] = _i1.EndpointConnector(
      name: 'comentario',
      endpoint: endpoints['comentario']!,
      methodConnectors: {
        'listarComentariosPorArticulo': _i1.MethodConnector(
          name: 'listarComentariosPorArticulo',
          params: {
            'idArticulo': _i1.ParameterDescription(
              name: 'idArticulo',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['comentario'] as _i5.ComentarioEndpoint)
                  .listarComentariosPorArticulo(
            session,
            idArticulo: params['idArticulo'],
          ),
        ),
        'listarTodosComentarios': _i1.MethodConnector(
          name: 'listarTodosComentarios',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['comentario'] as _i5.ComentarioEndpoint)
                  .listarTodosComentarios(session),
        ),
        'obtenerComentario': _i1.MethodConnector(
          name: 'obtenerComentario',
          params: {
            'idComentario': _i1.ParameterDescription(
              name: 'idComentario',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['comentario'] as _i5.ComentarioEndpoint)
                  .obtenerComentario(
            session,
            idComentario: params['idComentario'],
          ),
        ),
        'eliminarComentario': _i1.MethodConnector(
          name: 'eliminarComentario',
          params: {
            'idComentario': _i1.ParameterDescription(
              name: 'idComentario',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['comentario'] as _i5.ComentarioEndpoint)
                  .eliminarComentario(
            session,
            idComentario: params['idComentario'],
          ),
        ),
        'crearComentario': _i1.MethodConnector(
          name: 'crearComentario',
          params: {
            'comentario': _i1.ParameterDescription(
              name: 'comentario',
              type: _i1.getType<_i11.Comentario>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['comentario'] as _i5.ComentarioEndpoint)
                  .crearComentario(
            session,
            comentario: params['comentario'],
          ),
        ),
        'modificarComentario': _i1.MethodConnector(
          name: 'modificarComentario',
          params: {
            'comentario': _i1.ParameterDescription(
              name: 'comentario',
              type: _i1.getType<_i11.Comentario>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['comentario'] as _i5.ComentarioEndpoint)
                  .modificarComentario(
            session,
            comentario: params['comentario'],
          ),
        ),
      },
    );
    connectors['entregableArticulo'] = _i1.EndpointConnector(
      name: 'entregableArticulo',
      endpoint: endpoints['entregableArticulo']!,
      methodConnectors: {
        'crearArticulo': _i1.MethodConnector(
          name: 'crearArticulo',
          params: {
            'articulo': _i1.ParameterDescription(
              name: 'articulo',
              type: _i1.getType<_i12.EntregableArticulo>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['entregableArticulo']
                      as _i6.EntregableArticuloEndpoint)
                  .crearArticulo(
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
              (endpoints['entregableArticulo']
                      as _i6.EntregableArticuloEndpoint)
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
              (endpoints['entregableArticulo']
                      as _i6.EntregableArticuloEndpoint)
                  .obtenerArticulo(
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
              (endpoints['entregableArticulo']
                      as _i6.EntregableArticuloEndpoint)
                  .eliminarArticulo(
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
              (endpoints['entregableArticulo']
                      as _i6.EntregableArticuloEndpoint)
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
              type: _i1.getType<_i12.EntregableArticulo>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['entregableArticulo']
                      as _i6.EntregableArticuloEndpoint)
                  .actualizarArticulo(
            session,
            articulo: params['articulo'],
          ),
        ),
        'subirImagenArticulo': _i1.MethodConnector(
          name: 'subirImagenArticulo',
          params: {
            'rutaImagen': _i1.ParameterDescription(
              name: 'rutaImagen',
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
              (endpoints['entregableArticulo']
                      as _i6.EntregableArticuloEndpoint)
                  .subirImagenArticulo(
            session,
            rutaImagen: params['rutaImagen'],
            idArticulo: params['idArticulo'],
          ),
        ),
        'traerArticulosPorUsuario': _i1.MethodConnector(
          name: 'traerArticulosPorUsuario',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['entregableArticulo']
                      as _i6.EntregableArticuloEndpoint)
                  .traerArticulosPorUsuario(session),
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
              (endpoints['mail'] as _i7.MailEndpoint).envioMailRegistro(
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
              type: _i1.getType<_i13.Marca>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['marca'] as _i8.MarcaEndpoint).crearMarca(
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
              (endpoints['marca'] as _i8.MarcaEndpoint).eliminarMarca(
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
              (endpoints['marca'] as _i8.MarcaEndpoint).listarMarcas(session),
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
              (endpoints['marca'] as _i8.MarcaEndpoint).obtenerMarcaPorId(
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
              (endpoints['marca'] as _i8.MarcaEndpoint).asignarUsuarioAMarca(
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
              (endpoints['marca'] as _i8.MarcaEndpoint)
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
              (endpoints['marca'] as _i8.MarcaEndpoint).listarMarcasPorUsuario(
            session,
            idUsuario: params['idUsuario'],
          ),
        ),
      },
    );
    connectors['periodista'] = _i1.EndpointConnector(
      name: 'periodista',
      endpoint: endpoints['periodista']!,
      methodConnectors: {
        'crearPeriodista': _i1.MethodConnector(
          name: 'crearPeriodista',
          params: {
            'periodista': _i1.ParameterDescription(
              name: 'periodista',
              type: _i1.getType<_i14.Periodista>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['periodista'] as _i9.PeriodistaEndpoint)
                  .crearPeriodista(
            session,
            periodista: params['periodista'],
          ),
        ),
        'eliminarPeriodistaBorradoFisico': _i1.MethodConnector(
          name: 'eliminarPeriodistaBorradoFisico',
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
              (endpoints['periodista'] as _i9.PeriodistaEndpoint)
                  .eliminarPeriodistaBorradoFisico(
            session,
            id: params['id'],
          ),
        ),
        'eliminarPeriodistaBorradoLogico': _i1.MethodConnector(
          name: 'eliminarPeriodistaBorradoLogico',
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
              (endpoints['periodista'] as _i9.PeriodistaEndpoint)
                  .eliminarPeriodistaBorradoLogico(
            session,
            id: params['id'],
          ),
        ),
        'modificarPeriodista': _i1.MethodConnector(
          name: 'modificarPeriodista',
          params: {
            'periodista': _i1.ParameterDescription(
              name: 'periodista',
              type: _i1.getType<_i14.Periodista>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['periodista'] as _i9.PeriodistaEndpoint)
                  .modificarPeriodista(
            session,
            periodista: params['periodista'],
          ),
        ),
        'listarPeriodistas': _i1.MethodConnector(
          name: 'listarPeriodistas',
          params: {
            'nombreCompleto': _i1.ParameterDescription(
              name: 'nombreCompleto',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'nombreDeMedio': _i1.ParameterDescription(
              name: 'nombreDeMedio',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'idPaises': _i1.ParameterDescription(
              name: 'idPaises',
              type: _i1.getType<List<int>?>(),
              nullable: true,
            ),
            'idCiudades': _i1.ParameterDescription(
              name: 'idCiudades',
              type: _i1.getType<List<int>?>(),
              nullable: true,
            ),
            'idTemas': _i1.ParameterDescription(
              name: 'idTemas',
              type: _i1.getType<List<int>?>(),
              nullable: true,
            ),
            'idIdiomas': _i1.ParameterDescription(
              name: 'idIdiomas',
              type: _i1.getType<List<int>?>(),
              nullable: true,
            ),
            'idTiposDeMedio': _i1.ParameterDescription(
              name: 'idTiposDeMedio',
              type: _i1.getType<List<int>?>(),
              nullable: true,
            ),
            'idRoles': _i1.ParameterDescription(
              name: 'idRoles',
              type: _i1.getType<List<int>?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['periodista'] as _i9.PeriodistaEndpoint)
                  .listarPeriodistas(
            session,
            nombreCompleto: params['nombreCompleto'],
            nombreDeMedio: params['nombreDeMedio'],
            idPaises: params['idPaises'],
            idCiudades: params['idCiudades'],
            idTemas: params['idTemas'],
            idIdiomas: params['idIdiomas'],
            idTiposDeMedio: params['idTiposDeMedio'],
            idRoles: params['idRoles'],
          ),
        ),
        'obtenerListaDeFiltrosConRecuento': _i1.MethodConnector(
          name: 'obtenerListaDeFiltrosConRecuento',
          params: {
            'idPaises': _i1.ParameterDescription(
              name: 'idPaises',
              type: _i1.getType<List<int>?>(),
              nullable: true,
            ),
            'idCiudades': _i1.ParameterDescription(
              name: 'idCiudades',
              type: _i1.getType<List<int>?>(),
              nullable: true,
            ),
            'idIdiomas': _i1.ParameterDescription(
              name: 'idIdiomas',
              type: _i1.getType<List<int>?>(),
              nullable: true,
            ),
            'idTemas': _i1.ParameterDescription(
              name: 'idTemas',
              type: _i1.getType<List<int>?>(),
              nullable: true,
            ),
            'idTiposDeMedio': _i1.ParameterDescription(
              name: 'idTiposDeMedio',
              type: _i1.getType<List<int>?>(),
              nullable: true,
            ),
            'idRoles': _i1.ParameterDescription(
              name: 'idRoles',
              type: _i1.getType<List<int>?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['periodista'] as _i9.PeriodistaEndpoint)
                  .obtenerListaDeFiltrosConRecuento(
            session,
            idPaises: params['idPaises'],
            idCiudades: params['idCiudades'],
            idIdiomas: params['idIdiomas'],
            idTemas: params['idTemas'],
            idTiposDeMedio: params['idTiposDeMedio'],
            idRoles: params['idRoles'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i15.Endpoints()..initializeEndpoints(server);
  }
}
