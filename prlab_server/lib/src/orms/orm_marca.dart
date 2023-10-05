import 'dart:convert';

import 'package:prlab_server/src/excepciones/excepcion_endpoint.dart';
import 'package:prlab_server/src/generated/protocol.dart';
import 'package:prlab_server/src/orm.dart';
import 'package:prlab_server/utils/manejo_de_errores/manejo_de_errores.dart';
import 'package:serverpod/server.dart';

/// La clase [OrmMarca] es una clase Dart que proporciona funciones para crear
/// borrar, modificar y listar objetos `Marca` usando una operación ODM.
class OrmMarca extends ORM {
  /// La función [crearMarca] es una función de Dart que crea un nuevo objeto
  /// `Marca` en una base de datos mediante una operación ODM.

  /// Args:
  ///   [session] ([Session]): El parámetro de sesión es de tipo Sesión y es
  /// obligatorio. Representa lasesión de la base de datos que se utilizará para
  /// la operación.  [marca] (Marca): El parámetro [marca] es de tipo [Marca],
  /// que es un objeto que representa los datos a insertar en la base de datos.
  Future<List<Map>> crearMarca({
    required Session session,
    required Marca marca,
  }) async {
    try {
      final respuesta = await ejecutarOperacionOrm(
        session,
        (session) => insertarRegistro(
          session,
          nombreTabla: Marca.t.tableName,
          registros: [
            marca,
          ],
        ),
      );

      logger.fine('Marca ${marca.nombre} creada exitosamente.');
      return respuesta;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  // TODO(anyone): El método no funciona por el caracter no-nulleable de campos API.
  /// La función [listarMarcas] recupera una lista de objetos [Marca] usando
  /// una operación ODM y una sesión proporcionada.
  // Future<List<Marca>> listarMarcas({
  //   required Session session,
  // }) async {
  //   try {
  //     return await ejecutarOperacionOrm(
  //       session,
  //       (session) => Marca.find(
  //         session,
  //         where: (t) => t.fechaEliminacion.equals(null),
  //       ),
  //     );
  //   } on Exception catch (e) {
  //     throw Exception('$e');
  //   }
  // }

  /// Obtiene el registro de una marca por su id.
  Future<Marca> obtenerMarcaPorId({
    required Session session,
    required int id,
  }) async {
    try {
      final query = await ejecutarOperacionOrm(
        session,
        (Session session) {
          logger.info('Buscando marca con id: $id');
          return ejecutarConsultaSql(
            session,
            '''
          SELECT
            b."id",
            b."nombre",
            b."sitioWeb",
            COALESCE(
              (
                SELECT
                  jsonb_agg(
                    json_build_object(
                      'id',
                      s."id",
                      'nombre',
                      COALESCE(s."nombre", ''),
                      'apellido',
                      COALESCE(s."apellido", '')
                      --'fechaDeNacimiento',
                      --COALESCE(s."fechaDeNacimiento", NULL),
                      --'idUsuario',
                      --COALESCE(s."idUsuario", 0),
                      --'domicilio',
                      --COALESCE(s."domicilio", ''),
                      --'telefono',
                      --COALESCE(s."telefono", ''),
                      --'nombreDeOrganizacion',
                      --COALESCE(s."nombreDeOrganizacion", ''),
                      --'idOrganizacion',
                      --COALESCE(s."idOrganizacion", 0),
                      --'contacto',
                      --COALESCE(s."contacto", 0)
                    )
                    ORDER BY
                      s."idUsuario"
                  )::text
                FROM
                  clientes s
                WHERE
                  s."idUsuario" IN (
                    SELECT
                      bs."idStaff"
                    FROM
                      marcas_staff bs
                    WHERE
                      bs."idMarca" = b."id"
                  ) AND s."fechaEliminacion" IS NULL
              ),
              '[]'::text
            ) AS "staff",
            COALESCE(
              (
                SELECT
                  jsonb_agg(
                    json_build_object(
                      'id',
                      a."id",
                      'titulo',
                      COALESCE(a."titulo", '')
                      --'contenido',
                      --COALESCE(a."contenido", ''),
                      --'contenidoHtml',
                      --COALESCE(a."contenidoHtml", ''),
                      --'idAutor',
                      --COALESCE(a."idAutor", 0),
                      --'idStatus',
                      --COALESCE(a."idStatus", 0),
                      --'ultimaModificacion',
                      --COALESCE(a."ultimaModificacion", NULL),
                      --'slug',
                      --COALESCE(a."slug", ''),
                      --'idMarca', 
                      --COALESCE(a."idMarca", 0),
                      --'fechaPublicacion', 
                      --COALESCE(a."fechaPublicacion", now()),
                      --'idPlataforma', 
                      --COALESCE(a."idPlataforma", 0),
                      --'idProyecto', 
                      --COALESCE(a."idProyecto", 0)
                    )
                  )::text
                FROM (
                  SELECT
                    "id",
                    "titulo"
                    --"contenido",
                    --"contenidoHtml",
                    --"idAutor",
                    --"idStatus",
                    --"ultimaModificacion",
                    --"slug",
                    --"idMarca",
                    --"fechaPublicacion",
                    --"idPlataforma",
                   -- "idProyecto"
                  FROM
                    "articulos"
                  WHERE
                    "idMarca" = b."id" AND "fechaEliminacion" IS NULL
                  ORDER BY
                    "ultimaModificacion" DESC
                  LIMIT 3
                ) a
              ),
              '[]'::text
            ) AS "ultimosArticulos",
            (SELECT COUNT(*)
            FROM articulos
            WHERE "idMarca" = b."id") as "cantidadArticulos",
            0 as "cantidadClippings"
          FROM
            marcas b
          WHERE
            b."id" = $id;
''',
            clavesMapaModeloDb: Marca(
              nombre: '',
              sitioWeb: '',
              staff: [],
              ultimosArticulos: [],
              cantidadArticulos: 0,
              cantidadClippings: 0,
            ).toJson().keys,
          );
        },
      );

      if (query.isEmpty) {
        const error = ErrorPrLab.errorElementoNoEncontrado;
        throw Exception('mensaje: ${error.mensaje}, errorType: $error');
      }

      final respuesta = Marca.fromJson(
        query.first
          ..['staff'] = jsonDecode(query.first['staff'])
          ..['ultimosArticulos'] = jsonDecode(query.first['ultimosArticulos']),
        Protocol(),
      );

      logger.fine('Marca con id: $id encontrada');

      return respuesta;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// Obtiene las marcas a las que se encuentra asignado un usuario.
  Future<List<Marca>> listarMarcasPorUsuario(
    Session session, {
    required int idUsuario,
  }) async {
    final query = await ejecutarOperacionOrm(
      session,
      (session) => ejecutarConsultaSql(
        session,
        '''
          SELECT
            b."id",
            b."nombre",
            b."sitioWeb",
            COALESCE(
              (
                SELECT
                  jsonb_agg(
                    json_build_object(
                      'id',
                      s."id",
                      'nombre',
                      COALESCE(s."nombre", ''),
                      'apellido',
                      COALESCE(s."apellido", '')
                      --'fechaDeNacimiento',
                      --COALESCE(s."fechaDeNacimiento", NULL),
                      --'idUsuario',
                      --COALESCE(s."idUsuario", 0),
                      --'domicilio',
                      --COALESCE(s."domicilio", ''),
                      --'telefono',
                      --COALESCE(s."telefono", ''),
                      --'nombreDeOrganizacion',
                      --COALESCE(s."nombreDeOrganizacion", ''),
                      --'idOrganizacion',
                      --COALESCE(s."idOrganizacion", 0),
                      --'contacto',
                      --COALESCE(s."contacto", 0)
                    )
                    ORDER BY
                      s."idUsuario"
                  )::text
                FROM
                  clientes s
                WHERE
                  s."idUsuario" IN (
                    SELECT
                      bs."idStaff"
                    FROM
                      marcas_staff bs
                    WHERE
                      bs."idMarca" = b."id"
                  ) AND s."fechaEliminacion" IS NULL
              ),
              '[]'::text
            ) AS "staff",
            COALESCE(
              (
                SELECT
                  jsonb_agg(
                    json_build_object(
                      'id',
                      a."id",
                      'titulo',
                      COALESCE(a."titulo", '')
                      --'contenido',
                      --COALESCE(a."contenido", ''),
                      --'contenidoHtml',
                      --COALESCE(a."contenidoHtml", ''),
                      --'idAutor',
                      --COALESCE(a."idAutor", 0),
                      --'idStatus',
                      --COALESCE(a."idStatus", 0),
                      --'ultimaModificacion',
                      --COALESCE(a."ultimaModificacion", NULL),
                      --'slug',
                      --COALESCE(a."slug", ''),
                      --'idMarca', 
                      --COALESCE(a."idMarca", 0),
                      --'fechaPublicacion', 
                      --COALESCE(a."fechaPublicacion", now()),
                      --'idPlataforma', 
                      --COALESCE(a."idPlataforma", 0),
                      --'idProyecto', 
                      --COALESCE(a."idProyecto", 0)
                    )
                  )::text
                FROM (
                  SELECT
                    "id",
                    "titulo"
                    --"contenido",
                    --"contenidoHtml",
                    --"idAutor",
                    --"idStatus",
                    --"ultimaModificacion",
                    --"slug",
                    --"idMarca",
                    --"fechaPublicacion",
                    --"idPlataforma",
                   -- "idProyecto"
                  FROM
                    "articulos"
                  WHERE
                    "idMarca" = b."id" AND "fechaEliminacion" IS NULL
                  ORDER BY
                    "ultimaModificacion" DESC
                  LIMIT 3
                ) a
              ),
              '[]'::text
            ) AS "ultimosArticulos",
            (SELECT COUNT(*)
            FROM articulos
            WHERE "idMarca" = b."id") as "cantidadArticulos",
            0 as "cantidadClippings"
          FROM
            marcas b
          WHERE
            b."id" IN (
              SELECT
                bs."idMarca"
              FROM
                marcas_staff bs
              WHERE
                bs."idStaff" = $idUsuario AND bs."fechaEliminacion" IS NULL
            ) AND b."fechaEliminacion" IS NULL;
        ''',
        clavesMapaModeloDb: Marca(
          nombre: '',
          sitioWeb: '',
          staff: [],
          ultimosArticulos: [],
          cantidadArticulos: 0,
          cantidadClippings: 0,
        ).toJson().keys,
      ),
    );

    final responseSerializado = query
        .map(
          (e) => Marca.fromJson(
            e
              ..['staff'] = jsonDecode(e['staff'])
              ..['ultimosArticulos'] = jsonDecode(e['ultimosArticulos']),
            Protocol(),
          ),
        )
        .toList();

    return responseSerializado;
  }

  /// Actualiza un registro de Marca. Requiere el ID de la [Marca]
  /// y los campos a actualizar.
  Future<bool> modificarMarca({
    required Session session,
    required int idMarca,
    required Map<String, dynamic> camposMarca,
  }) async {
    return await ejecutarOperacionOrm(
      session,
      (session) => actualizarRegistro(
        session,
        nombreTabla: Marca.t.tableName,
        id: idMarca,
        camposRegistro: camposMarca
          ..['ultimaModificacion'] = DateTime.now().toIso8601String()
          ..removeWhere((key, value) => value == null),
      ),
    );
  }

  /// La función [eliminarMarcaBorradoFisico] elimina un registro de la base de
  /// datos según el ID proporcionado. BORRADO FÍSICO.
  /// Args:
  ///   [session] (Session): El parámetro de sesión es de tipo Sesión y es
  /// obligatorio. Representa la sesión de la base de datos que se utilizará
  /// para la operación. [id] (int): El parámetro "id" es un número entero que
  ///  representa el identificador único de la marca que debe eliminarse.
  Future<bool> eliminarMarcaBorradoFisico({
    required Session session,
    required int idMarca,
  }) async {
    try {
      await ejecutarOperacionOrm(
        session,
        (Session session) => Marca.delete(
          session,
          where: (t) => t.id.equals(idMarca),
        ),
      );
      return true;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// Elimina una marca con borrado logico.
  /// Args:
  /// [session] ([Session]): El parámetro de sesión es de tipo Sesión y es
  /// obligatorio. Representa la sesión de la base de datos que se utilizará
  /// para la operación. <br>
  /// [idMarca] ([int]): El parámetro "id" es un número entero que
  ///  representa el identificador único de la marca que debe eliminarse.
  Future<bool> eliminarMarca({
    required Session session,
    required int idMarca,
  }) async {
    try {
      logger.info('Se va a eliminar la marca con id: $idMarca');
      final now = DateTime.now().toIso8601String();
      await ejecutarOperacionOrm(
        session,
        (Session session) => actualizarRegistro(
          session,
          nombreTabla: Marca.t.tableName,
          id: idMarca,
          camposRegistro: {
            'ultimaModificacion': now,
            'fechaEliminacion': now,
          },
        ),
      );
      logger.finest(
        'Se elimino la marca con id: $idMarca',
      );
      return true;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// Crea la relación entre una marca y un usuario.
  Future<bool> asignarUsuarioAMarca(
    Session session, {
    required MarcaStaff marcaStaff,
  }) async {
    final check = await MarcaStaff.find(
      session,
      where: (t) =>
          t.idMarca.equals(marcaStaff.idMarca) &
          t.idStaff.equals(marcaStaff.idStaff) &
          t.fechaEliminacion.equals(null),
    );
    if (check.isNotEmpty) {
      throw Excepciones.desconocido(
          mensaje: 'El usuario ya se encuentra asignado a esa marca');
    }
    await ejecutarOperacionOrm(
      session,
      (session) => MarcaStaff.insert(session, marcaStaff),
    );
    return true;
  }

  /// Da de baja la relacion entre el usuario y la marca
  /// en la tabla intermedia.
  Future<bool> desvincularUsuarioDeMarca(
    Session session, {
    required int idMarca,
    required int idUsuario,
  }) async {
    final now = DateTime.now().toIso8601String();
    await ejecutarOperacionOrm(
      session,
      (session) => session.db.query('''
      UPDATE "marcas_staff"
      SET "fechaEliminacion" = '$now', "ultimaModificacion" = '$now'
      WHERE "idMarca" = $idMarca AND "idStaff" = $idUsuario AND "fechaEliminacion" IS NULL;
      '''),
    );
    return true;
  }
}
