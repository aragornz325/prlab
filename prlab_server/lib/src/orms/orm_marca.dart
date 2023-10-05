import 'dart:convert';

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
  Future<bool> crearMarca({
    required Session session,
    required Marca marca,
  }) async {
    try {
      await ejecutarOperacionOrm(
        session,
        (Session session) {
          logger.info('Creando marca: ${marca.nombre}');
          return Marca.insert(
            session,
            marca,
          );
        },
      );
      logger.fine('Marca ${marca.nombre} creada exitosamente.');
      return true;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// La función [listarMarcas] recupera una lista de objetos [Marca] usando
  /// una operación ODM y una sesión proporcionada.
  Future<List<Marca>> listarMarcas({
    required Session session,
  }) async {
    try {
      return await ejecutarOperacionOrm(
        session,
        (session) => Marca.find(
          session,
          where: (t) => t.activo.equals(true),
        ),
      );
    } on Exception catch (e) {
      throw Exception('$e');
    }
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
      await ejecutarOperacionOrm(
        session,
        (Session session) => session.db.query('''
            UPDATE "articulos" 
            SET "activo" = false
            WHERE "id" = $idMarca AND "activo" = true;
          '''),
      );
      logger.finest(
        'Se elimino la marca con id: $idMarca',
      );
      return true;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// Obtiene el registro de una marca por su id.
  Future<Marca> obtenerMarcaPorId({
    required Session session,
    required int id,
  }) async {
    try {
      final marca = await ejecutarOperacionOrm(
        session,
        (Session session) {
          logger.info('Buscando marca con id: $id');
          return Marca.findById(session, id);
        },
      );
      if (marca == null) {
        const error = ErrorPrLab.errorElementoNoEncontrado;
        throw Exception('mensaje: ${error.mensaje}, errorType: $error');
      }
      logger.fine('Marca con id: $id encontrada');
      return marca;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// Actualiza un registro de Marca. El objeto pasado en el parametro debe
  /// tener el id en la Base de Datos.
  Future<bool> actualizarMarca(Session session, {required Marca marca}) async {
    return await ejecutarOperacionOrm(
      session,
      (session) => Marca.update(
        session,
        marca..ultimaModificacion = DateTime.now(),
      ),
    );
  }

  /// Crea la relación entre una marca y un usuario.
  Future<List<List<dynamic>>> asignarUsuarioAMarca(
    Session session, {
    required int idMarca,
    required int idUsuario,
    required int idRol,
  }) async {
    return await ejecutarOperacionOrm(
      session,
      (session) => session.db.query('''
      INSERT INTO "marcas_staff" ("idMarca", "idStaff", "idRol") 
      VALUES ($idMarca, $idUsuario, $idRol);
      '''),
    );
  }

  /// Da de baja la relacion entre el usuario y la marca
  /// en la tabla intermedia.
  Future<List<List<dynamic>>> desvincularUsuarioDeMarca(
    Session session, {
    required int idMarca,
    required int idUsuario,
  }) async {
    return await ejecutarOperacionOrm(
      session,
      (session) => session.db.query('''
      UPDATE "marcas_staff"
      SET "fechaEliminacion" = '${DateTime.now().toIso8601String()}'
      WHERE "idMarca" = $idMarca AND "idStaff" = $idUsuario AND "fechaEliminacion" IS NULL;
      '''),
    );
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
                  )
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
                    "idMarca" = b."id"
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
                bs."idStaff" = $idUsuario
            );
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
}
