import 'dart:convert';

import 'package:prlab_server/src/generated/protocol.dart';
import 'package:prlab_server/src/orm.dart';
import 'package:serverpod/serverpod.dart';

/// Operaciones de consulta en la base de datos relacionadas a [Periodista]
class OrmPeriodista extends ORM {
  /// Recupera una lista de [Periodista] de acuerdo a diferentes filtros.
  Future<List<Periodista>> listarPeriodistas(
    Session session, {
    String nombres = '',
    String nombreDeMedio = '',
    List<int> idPaises = const [],
    List<int> idCiudades = const [],
    List<int> idTemas = const [],
    List<int> idIdiomas = const [],
    List<int> idTiposDeMedio = const [],
    List<int> idPuestos = const [],
  }) async {
    final queryNombres = nombres != ''
        ? '(j."nombres" LIKE \'%$nombres%\')'
        : '';
    final queryNombreDeMedio =
        nombreDeMedio != '' ? 'm."medio" LIKE \'%$nombreDeMedio%\'' : '';
    final queryPaises =
        idPaises.isNotEmpty ? 'j."idPais" IN (${idPaises.join(',')})' : '';
    final queryCiudades = idCiudades.isNotEmpty
        ? 'j."idCiudad" IN (${idCiudades.join(',')})'
        : '';
    final queryTemas =
        idTemas.isNotEmpty ? 't."id" IN (${idTemas.join(',')})' : '';
    final queryIdiomas =
        idIdiomas.isNotEmpty ? 'l."id" IN (${idIdiomas.join(',')})' : '';
    final queryTiposDeMedio = idTiposDeMedio.isNotEmpty
        ? 'm."idTipoDeMedio" IN (${idTiposDeMedio.join(',')})'
        : '';
    final queryPuestos =
        idPuestos.isNotEmpty ? 'j."idPuesto" IN (${idPuestos.join(',')})' : '';

    final listaWheres = [
      queryNombres,
      queryNombreDeMedio,
      queryPaises,
      queryCiudades,
      queryTemas,
      queryIdiomas,
      queryTiposDeMedio,
      queryPuestos,
    ].where((element) => element != '').toList();

    var whereBuffer = StringBuffer();

    if (listaWheres.isNotEmpty) {
      whereBuffer.writeln();
      whereBuffer.writeln('WHERE');
      whereBuffer.writeln('   ${listaWheres[0]}');
      if (listaWheres.length > 1) {
        for (var i = 1; i < listaWheres.length; i++) {
          whereBuffer.writeln('   AND ${listaWheres[i]}');
        }
      }
      whereBuffer.writeln();
    }

    final modeloApi = Periodista(
      urlImagen: '',
      nombres: '',
      apellidos: '',
      puesto: '',
      medio: '',
      biografia: '',
      email: '',
      telefono: '',
      ciudad: '',
      pais: '',
      temas: [],
      idiomas: [],
      redesSociales: [],
    ).toJson();

    var consulta = '''
SELECT 
  j."id", 
  COALESCE(j."urlImagen", '') AS "urlImagen", 
  COALESCE(j."nombres", '') AS "nombres", 
  COALESCE(j."apellidos", '') AS "apellidos", 
  COALESCE(r."puesto", '') AS "puesto", 
  COALESCE(m."medio", '') AS "medio", 
  COALESCE(j."biografia", '') AS "biografia", 
  COALESCE(
    (
      SELECT ARRAY_AGG(t."tema" ORDER BY t."id")
      FROM temas_periodistas tj
      LEFT JOIN temas t ON tj."idTema" = t."id"
      WHERE tj."idPeriodista" = j."id"
    ), ARRAY[]::text[]
  ) AS "temas", 
  COALESCE(j."email", '') AS "email", 
  COALESCE(j."telefono", '') AS "telefono", 
  COALESCE(c."ciudad", '') AS "ciudad", 
  COALESCE(n."pais", '') AS "pais", 
  COALESCE(
    (
      SELECT ARRAY_AGG(l."idioma" ORDER BY l."id")
      FROM idiomas_periodistas lj
      LEFT JOIN idiomas l ON lj."idIdioma" = l."id"
      WHERE lj."idPeriodista" = j."id"
    ), ARRAY[]::text[]
  ) AS "idiomas",
  COALESCE(
    (
      SELECT jsonb_agg(
        json_build_object(
          'id', rsp."id",
          'urlIcono', COALESCE(r."urlIcono", ''),
          'redSocial', COALESCE(r."redSocial", ''),
          'nombreDeUsuario', COALESCE(rsp."nombreDeUsuario", ''),
          'urlPerfil', COALESCE(rsp."urlPerfil", '')
        ) ORDER BY rsp."idRedSocial"
      )::text
      FROM redes_sociales_periodistas rsp
      INNER JOIN redes_sociales r ON rsp."idRedSocial" = r."id"
      WHERE rsp."idPeriodista" = j."id"
    ), '[]'::text
  ) AS "redesSociales"
FROM
  periodistas j
  LEFT JOIN puestos r ON j."idPuesto" = r.id
  LEFT JOIN medios m ON j."idMedio" = m.id
  LEFT JOIN ciudades c ON j."idCiudad" = c.id
  LEFT JOIN paises n ON j."idPais" = n.id
  LEFT JOIN temas_periodistas tj ON j."id" = tj."idPeriodista"
  LEFT JOIN temas t ON tj."idTema" = t."id"
  LEFT JOIN idiomas_periodistas lj ON j."id" = lj."idPeriodista"
  LEFT JOIN idiomas l ON lj."idIdioma" = l."id"$whereBuffer
  GROUP BY j."id", r."puesto", m."medio", c."ciudad", n."pais";
    ''';
    final response = await ejecutarConsultaSql(
      session,
      consulta,
      clavesMapaModeloDb: modeloApi.keys,
    );

    return response
        .map(
          (e) => Periodista.fromJson(
            e
              ..['redesSociales'] = jsonDecode(e['redesSociales']),
            Protocol(),
          ),
        )
        .toList();
  }

  /// Obtiene las categorías de filtrado de [Periodista] con su nombre, id y
  /// recuento de acuerdo a los filtros.
  Future<CategoriasFiltro> obtenerListaDeFiltrosConRecuento(
    Session session, {
    List<int> idPaises = const [],
    List<int> idCiudades = const [],
    List<int> idIdiomas = const [],
    List<int> idTemas = const [],
    List<int> idTiposDeMedio = const [],
    List<int> idPuestos = const [],
  }) async {
    final wherePaises =
        idPaises.isNotEmpty ? 'j."idPais" IN (${idPaises.join(',')})' : '';
    final whereCiudades = idCiudades.isNotEmpty
        ? 'j."idCiudad" IN (${idCiudades.join(',')})'
        : '';
    final whereIdiomas =
        idIdiomas.isNotEmpty ? 'l."id" IN (${idIdiomas.join(',')})' : '';
    final whereTemas =
        idTemas.isNotEmpty ? 't."id" IN (${idTemas.join(',')})' : '';
    final whereTiposDeMedio = idTiposDeMedio.isNotEmpty
        ? 'm."idTipoDeMedio" IN (${idTiposDeMedio.join(',')})'
        : '';
    final wherePuestos =
        idPuestos.isNotEmpty ? 'j."idPuesto" IN (${idPuestos.join(',')})' : '';

    final listaWheres = [
      wherePaises,
      whereCiudades,
      whereIdiomas,
      whereTemas,
      whereTiposDeMedio,
      wherePuestos,
    ].where((element) => element != '').toList();

    var whereBuffer = StringBuffer();

    if (listaWheres.isNotEmpty) {
      whereBuffer.writeln();
      whereBuffer.writeln('WHERE');
      whereBuffer.writeln('   ${listaWheres[0]}');
      if (listaWheres.length > 1) {
        for (var i = 1; i < listaWheres.length; i++) {
          whereBuffer.writeln('   AND ${listaWheres[i]}');
        }
      }
      whereBuffer.writeln();
    }
    String consulta = '''
-- Recuento de países
SELECT
    'País' AS "categoria",
    n.id AS "id",
    n."pais" AS "nombre",
    COUNT(*) AS "recuento"
FROM
    periodistas j
    INNER JOIN paises n ON j."idPais" = n.id

WHERE
    j."id" IN (SELECT 
  j."id"
FROM
  periodistas j
  LEFT JOIN puestos r ON j."idPuesto" = r.id
  LEFT JOIN medios m ON j."idMedio" = m.id
  LEFT JOIN ciudades c ON j."idCiudad" = c.id
  LEFT JOIN paises n ON j."idPais" = n.id
  LEFT JOIN temas_periodistas tj ON j."id" = tj."idPeriodista"
  LEFT JOIN temas t ON tj."idTema" = t."id"
  LEFT JOIN idiomas_periodistas lj ON j."id" = lj."idPeriodista"
  LEFT JOIN idiomas l ON lj."idIdioma" = l."id")

GROUP BY
    n.id, n."pais"
UNION ALL
-- Recuento de ciudades
SELECT
    'Ciudad' AS "categoria",
    c.id AS "id",
    c."ciudad" AS "nombre",
    COUNT(*) AS "recuento"
FROM
    periodistas j
    INNER JOIN ciudades c ON j."idCiudad" = c.id

WHERE
    j."id" IN (SELECT 
  j."id"
FROM
  periodistas j
  LEFT JOIN puestos r ON j."idPuesto" = r.id
  LEFT JOIN medios m ON j."idMedio" = m.id
  LEFT JOIN ciudades c ON j."idCiudad" = c.id
  LEFT JOIN paises n ON j."idPais" = n.id
  LEFT JOIN temas_periodistas tj ON j."id" = tj."idPeriodista"
  LEFT JOIN temas t ON tj."idTema" = t."id"
  LEFT JOIN idiomas_periodistas lj ON j."id" = lj."idPeriodista"
  LEFT JOIN idiomas l ON lj."idIdioma" = l."id")

GROUP BY
    c.id, c."ciudad"
UNION ALL
-- Recuento de idiomas
SELECT
    'Idioma' AS "categoria",
    l.id AS "id",
    l."idioma" AS "nombre",
    COUNT(*) AS "recuento"
FROM
    idiomas_periodistas lj
    LEFT JOIN idiomas l ON lj."idIdioma" = l."id"
    LEFT JOIN periodistas j ON lj."idPeriodista" = j."id"

WHERE
    j."id" IN (SELECT 
  j."id"
FROM
  periodistas j
  LEFT JOIN puestos r ON j."idPuesto" = r.id
  LEFT JOIN medios m ON j."idMedio" = m.id
  LEFT JOIN ciudades c ON j."idCiudad" = c.id
  LEFT JOIN paises n ON j."idPais" = n.id
  LEFT JOIN temas_periodistas tj ON j."id" = tj."idPeriodista"
  LEFT JOIN temas t ON tj."idTema" = t."id"
  LEFT JOIN idiomas_periodistas lj ON j."id" = lj."idPeriodista"
  LEFT JOIN idiomas l ON lj."idIdioma" = l."id")

GROUP BY
    l.id, l."idioma"
UNION ALL
-- Recuento de temas
SELECT
    'Tema' AS "categoria",
    t.id AS "id",
    t."tema" AS "nombre",
    COUNT(*) AS "recuento"
FROM
    temas_periodistas tj
    LEFT JOIN temas t ON tj."idTema" = t."id"
    LEFT JOIN periodistas j ON tj."idPeriodista" = j."id"

WHERE
    j."id" IN (SELECT 
  j."id"
FROM
  periodistas j
  LEFT JOIN puestos r ON j."idPuesto" = r.id
  LEFT JOIN medios m ON j."idMedio" = m.id
  LEFT JOIN ciudades c ON j."idCiudad" = c.id
  LEFT JOIN paises n ON j."idPais" = n.id
  LEFT JOIN temas_periodistas tj ON j."id" = tj."idPeriodista"
  LEFT JOIN temas t ON tj."idTema" = t."id"
  LEFT JOIN idiomas_periodistas lj ON j."id" = lj."idPeriodista"
  LEFT JOIN idiomas l ON lj."idIdioma" = l."id")

GROUP BY
    t.id, t."tema"
UNION ALL
-- Recuento de Tipos de medio
SELECT
    'Tipo de Medio' AS "categoria",
    m."idTipoDeMedio" AS "id",
    tm."tipoDeMedio" AS "nombre",
    COUNT(*) AS "recuento"
FROM
    periodistas j
    INNER JOIN medios m ON j."idMedio" = m.id
    INNER JOIN tipos_de_medio tm ON m."idTipoDeMedio" = tm.id

WHERE
    j."id" IN (SELECT 
  j."id"
FROM
  periodistas j
  LEFT JOIN puestos r ON j."idPuesto" = r.id
  LEFT JOIN medios m ON j."idMedio" = m.id
  LEFT JOIN ciudades c ON j."idCiudad" = c.id
  LEFT JOIN paises n ON j."idPais" = n.id
  LEFT JOIN temas_periodistas tj ON j."id" = tj."idPeriodista"
  LEFT JOIN temas t ON tj."idTema" = t."id"
  LEFT JOIN idiomas_periodistas lj ON j."id" = lj."idPeriodista"
  LEFT JOIN idiomas l ON lj."idIdioma" = l."id")

GROUP BY
    m."idTipoDeMedio", tm."tipoDeMedio"
UNION ALL
-- Recuento de puestos
SELECT
    'Puesto' AS "categoria",
    r.id AS "id",
    r."puesto" AS "nombre",
    COUNT(*) AS "recuento"
FROM
    periodistas j
    INNER JOIN puestos r ON j."idPuesto" = r.id

WHERE
    j."id" IN (SELECT 
  j."id"
FROM
  periodistas j
  LEFT JOIN puestos r ON j."idPuesto" = r.id
  LEFT JOIN medios m ON j."idMedio" = m.id
  LEFT JOIN ciudades c ON j."idCiudad" = c.id
  LEFT JOIN paises n ON j."idPais" = n.id
  LEFT JOIN temas_periodistas tj ON j."id" = tj."idPeriodista"
  LEFT JOIN temas t ON tj."idTema" = t."id"
  LEFT JOIN idiomas_periodistas lj ON j."id" = lj."idPeriodista"
  LEFT JOIN idiomas l ON lj."idIdioma" = l."id")

GROUP BY
    r.id, r."puesto";
''';
    final query = await ejecutarConsultaSql(
      session,
      consulta,
      clavesMapaModeloDb: ['categoria', 'id', 'nombre', 'recuento'],
    );

    Map<String, dynamic> response = {}
      ..['paises'] = query
          .where((element) => element['categoria'] == 'País')
          .map((value) => value..remove('categoria'))
          .toList()
      ..['ciudades'] = query
          .where((element) => element['categoria'] == 'Ciudad')
          .map((value) => value..remove('categoria'))
          .toList()
      ..['idiomas'] = query
          .where((element) => element['categoria'] == 'Idioma')
          .map((value) => value..remove('categoria'))
          .toList()
      ..['temas'] = query
          .where((element) => element['categoria'] == 'Tema')
          .map((value) => value..remove('categoria'))
          .toList()
      ..['tiposDeMedio'] = query
          .where((element) => element['categoria'] == 'Tipo de Medio')
          .map((value) => value..remove('categoria'))
          .toList()
      ..['puestos'] = query
          .where((element) => element['categoria'] == 'Puesto')
          .map((value) => value..remove('categoria'))
          .toList();

    return CategoriasFiltro.fromJson(response, Protocol());
  }

  Future<bool> crearPeriodista({
    required Session session,
    required Periodista periodista,
  }) async {
    try {
      await ejecutarOperacionOrm(
        session,
        (Session session) {
          logger.finer('Creando periodista: ${periodista.nombres} ${periodista.apellidos}');
          return Periodista.insert(
            session,
            periodista
              ..fechaCreacion = DateTime.now()
              ..ultimaModificacion = DateTime.now()
              ..activo = true,
          );
        },
      );
      logger
          .fine('Periodista ${periodista.nombres} ${periodista.apellidos} creada exitosamente.');
      return true;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// La función `eliminarPeriodistaBorradoFisico` elimina a un periodista de la base de datos mediante
  /// un método de eliminación física.
  ///
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y es obligatorio. Representa la
  /// sesión o conexión actual a la base de datos.
  ///   id (int): El parámetro id es un número entero que representa el identificador único del
  /// periodista que debe eliminarse.
  ///
  /// Returns:
  ///   un `Futuro<bool>`.
  Future<bool> eliminarPeriodistaBorradoFisico({
    required Session session,
    required int id,
  }) async {
    try {
      await ejecutarOperacionOrm(
        session,
        (session) => Periodista.delete(
          session,
          where: (t) => t.id.equals(id),
        ),
      );
      return true;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// La función `eliminarPeriodistaBorradoLogico` es una función de Dart que realiza una eliminación
  /// lógica de un periodista actualizando su campo `activo` a `false` y configurando el campo
  /// `ultimaModificacion` a la fecha y hora actuales.
  ///
  /// Args:
  ///   session (Session): Un parámetro obligatorio de tipo Sesión, que representa la sesión o conexión
  /// actual a la base de datos.
  ///   id (int): El parámetro `id` es un número entero que representa el identificador único del
  /// periodista que debe eliminarse lógicamente.
  ///
  /// Returns:
  ///   un `Futuro<bool>`.
  Future<bool> eliminarPeriodistaBorradoLogico({
    required Session session,
    required int id,
  }) async {
    try {
      final periodistaDB = await ejecutarOperacionOrm(
        session,
        (session) => Periodista.find(
          session,
          where: (t) => t.id.equals(id),
        ),
      );
      await ejecutarOperacionOrm(
        session,
        (session) => Periodista.update(
          session,
          periodistaDB.first
            ..activo = false
            ..ultimaModificacion = DateTime.now(),
        ),
      );
      return true;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// La función `modificarPeriodista` actualiza la información de un periodista y devuelve un valor
  /// booleano que indica si la actualización fue exitosa o no.
  ///
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y es obligatorio. Representa la
  /// sesión o conexión actual a la base de datos.
  ///   periodista (Periodista): El parámetro "periodista" es un objeto de tipo "Periodista". Representa
  /// a un periodista y contiene información sobre él, como su nombre, edad y otros detalles relevantes.
  ///
  /// Returns:
  ///   un `Futuro<bool>`.
  Future<bool> modificarPeriodista({
    required Session session,
    required Periodista periodista,
  }) async {
    try {
      await ejecutarOperacionOrm(
        session,
        (session) => Periodista.update(
          session,
          periodista..ultimaModificacion = DateTime.now(),
        ),
      );
      return true;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }
}
