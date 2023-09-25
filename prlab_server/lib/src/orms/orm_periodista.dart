import 'package:prlab_server/src/generated/protocol.dart';
import 'package:prlab_server/src/orm.dart';
import 'package:serverpod/serverpod.dart';

/// Operaciones de consulta en la base de datos relacionadas a [Periodista]
class OrmPeriodista extends ORM {

  /// Recupera una lista de [Periodista] de acuerdo a diferentes filtros.
  Future<List<Periodista>> listarPeriodistas(
    Session session, {
    String nombreCompleto = '',
    String nombreDeMedio = '',
    List<int> idPaises = const [],
    List<int> idCiudades = const [],
    List<int> idTemas = const [],
    List<int> idIdiomas = const [],
    List<int> idTiposDeMedio = const [],
    List<int> idRoles = const [],
  }) async {
    final queryNombreCompleto = nombreCompleto != ''
        ? '(j."nombreCompleto" LIKE \'%$nombreCompleto%\')'
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
    final queryRoles =
        idRoles.isNotEmpty ? 'j."idRol" IN (${idRoles.join(',')})' : '';

    final listaWheres = [
      queryNombreCompleto,
      queryNombreDeMedio,
      queryPaises,
      queryCiudades,
      queryTemas,
      queryIdiomas,
      queryTiposDeMedio,
      queryRoles,
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

    final modeloApi = Periodista().toJson()
      ..remove('idRol')
      ..remove('idMedio')
      ..remove('idCiudad')
      ..remove('idPais');

    var consulta = '''
SELECT 
  j."id", 
  j."urlImagen", 
  j."nombreCompleto", 
  r."rol", 
  m."medio", 
  j."bio", 
  (
        SELECT ARRAY_AGG(t."tema" ORDER BY t."id")
        FROM temas_periodistas tj
        LEFT JOIN temas t ON tj."idTema" = t."id"
        WHERE tj."idPeriodista" = j."id"
    ) AS "temas", 
  j."email", 
  j."telefono", 
  c."ciudad", 
  n."pais", 
  (
        SELECT ARRAY_AGG(l."idioma" ORDER BY l."id")
        FROM idiomas_periodistas lj
        LEFT JOIN idiomas l ON lj."idIdioma" = l."id"
        WHERE lj."idPeriodista" = j."id"
    ) AS "idiomas", 
  j."redesSociales"
FROM
  periodistas j
  INNER JOIN roles r ON j."idRol" = r.id
  INNER JOIN medios m ON j."idMedio" = m.id
  INNER JOIN ciudades c ON j."idCiudad" = c.id
  INNER JOIN paises n ON j."idPais" = n.id
  LEFT JOIN temas_periodistas tj ON j."id" = tj."idPeriodista"
  LEFT JOIN temas t ON tj."idTema" = t."id"
  LEFT JOIN idiomas_periodistas lj ON j."id" = lj."idPeriodista"
  LEFT JOIN idiomas l ON lj."idIdioma" = l."id"$whereBuffer
  GROUP BY j."id", r."rol", m."medio", c."ciudad", n."pais";
    ''';
    final response = await ejecutarConsultaSql(
      session,
      consulta,
      clavesMapaModeloDb: modeloApi.keys,
    );
    return response.map((e) => Periodista.fromJson(e, Protocol())).toList();
  }

  /// Obtiene las categorías de filtrado de [Periodista] con su nombre, id y 
  /// recuento de acuerdo a los filtros.
  Future<Map> obtenerListaDeFiltrosConRecuento(
    Session session, {
    List<int> idPaises = const [],
    List<int> idCiudades = const [],
    List<int> idIdiomas = const [],
    List<int> idTemas = const [],
    List<int> idTiposDeMedio = const [],
    List<int> idRoles = const [],
  }) async {
    final wherePaises = idPaises.isNotEmpty ? 'j."idPais" IN (${idPaises.join(',')})' : '';
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
    final whereRoles =
        idRoles.isNotEmpty ? 'j."idRol" IN (${idRoles.join(',')})' : '';

    final listaWheres = [
      wherePaises,
      whereCiudades,
      whereIdiomas,
      whereTemas,
      whereTiposDeMedio,
      whereRoles,
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
  INNER JOIN roles r ON j."idRol" = r.id
  INNER JOIN medios m ON j."idMedio" = m.id
  INNER JOIN ciudades c ON j."idCiudad" = c.id
  INNER JOIN paises n ON j."idPais" = n.id
  LEFT JOIN temas_periodistas tj ON j."id" = tj."idPeriodista"
  LEFT JOIN temas t ON tj."idTema" = t."id"
  LEFT JOIN idiomas_periodistas lj ON j."id" = lj."idPeriodista"
  LEFT JOIN idiomas l ON lj."idIdioma" = l."id"$whereBuffer)

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
  INNER JOIN roles r ON j."idRol" = r.id
  INNER JOIN medios m ON j."idMedio" = m.id
  INNER JOIN ciudades c ON j."idCiudad" = c.id
  INNER JOIN paises n ON j."idPais" = n.id
  LEFT JOIN temas_periodistas tj ON j."id" = tj."idPeriodista"
  LEFT JOIN temas t ON tj."idTema" = t."id"
  LEFT JOIN idiomas_periodistas lj ON j."id" = lj."idPeriodista"
  LEFT JOIN idiomas l ON lj."idIdioma" = l."id"$whereBuffer)

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
  INNER JOIN roles r ON j."idRol" = r.id
  INNER JOIN medios m ON j."idMedio" = m.id
  INNER JOIN ciudades c ON j."idCiudad" = c.id
  INNER JOIN paises n ON j."idPais" = n.id
  LEFT JOIN temas_periodistas tj ON j."id" = tj."idPeriodista"
  LEFT JOIN temas t ON tj."idTema" = t."id"
  LEFT JOIN idiomas_periodistas lj ON j."id" = lj."idPeriodista"
  LEFT JOIN idiomas l ON lj."idIdioma" = l."id"$whereBuffer)

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
  INNER JOIN roles r ON j."idRol" = r.id
  INNER JOIN medios m ON j."idMedio" = m.id
  INNER JOIN ciudades c ON j."idCiudad" = c.id
  INNER JOIN paises n ON j."idPais" = n.id
  LEFT JOIN temas_periodistas tj ON j."id" = tj."idPeriodista"
  LEFT JOIN temas t ON tj."idTema" = t."id"
  LEFT JOIN idiomas_periodistas lj ON j."id" = lj."idPeriodista"
  LEFT JOIN idiomas l ON lj."idIdioma" = l."id"$whereBuffer)

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
  INNER JOIN roles r ON j."idRol" = r.id
  INNER JOIN medios m ON j."idMedio" = m.id
  INNER JOIN ciudades c ON j."idCiudad" = c.id
  INNER JOIN paises n ON j."idPais" = n.id
  LEFT JOIN temas_periodistas tj ON j."id" = tj."idPeriodista"
  LEFT JOIN temas t ON tj."idTema" = t."id"
  LEFT JOIN idiomas_periodistas lj ON j."id" = lj."idPeriodista"
  LEFT JOIN idiomas l ON lj."idIdioma" = l."id"$whereBuffer)

GROUP BY
    m."idTipoDeMedio", tm."tipoDeMedio"
UNION ALL
-- Recuento de roles
SELECT
    'Rol' AS "categoria",
    r.id AS "id",
    r."rol" AS "nombre",
    COUNT(*) AS "recuento"
FROM
    periodistas j
    INNER JOIN roles r ON j."idRol" = r.id

WHERE
    j."id" IN (SELECT 
  j."id"
FROM
  periodistas j
  INNER JOIN roles r ON j."idRol" = r.id
  INNER JOIN medios m ON j."idMedio" = m.id
  INNER JOIN ciudades c ON j."idCiudad" = c.id
  INNER JOIN paises n ON j."idPais" = n.id
  LEFT JOIN temas_periodistas tj ON j."id" = tj."idPeriodista"
  LEFT JOIN temas t ON tj."idTema" = t."id"
  LEFT JOIN idiomas_periodistas lj ON j."id" = lj."idPeriodista"
  LEFT JOIN idiomas l ON lj."idIdioma" = l."id"$whereBuffer)

GROUP BY
    r.id, r."rol";
''';
    final query = await ejecutarConsultaSql(
      session,
      consulta,
      clavesMapaModeloDb: ['categoria', 'id', 'nombre', 'recuento'],
    );

    Map response = {}
      ..['paises'] = query.where((element) => element['categoria'] == 'País').toList()
      ..['ciudades'] = query.where((element) => element['categoria'] == 'Ciudad').toList()
      ..['idiomas'] = query.where((element) => element['categoria'] == 'Idioma').toList()
      ..['temas'] = query.where((element) => element['categoria'] == 'Tema').toList()
      ..['tiposDeMedio'] = query.where((element) => element['categoria'] == 'Tipo de Medio').toList()
      ..['roles'] = query.where((element) => element['categoria'] == 'Rol').toList();
    

    return response;
  }
}
