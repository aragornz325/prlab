import 'package:prlab_server/src/generated/protocol.dart';
import 'package:prlab_server/src/odm.dart';
import 'package:serverpod/serverpod.dart';

class OdmPeriodista extends ODM {
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
    final queryTemas = idTemas.isNotEmpty ? 't."id" IN (${idTemas.join(',')})' : '';
    final queryIdiomas = idIdiomas.isNotEmpty ? 'l."id" IN (${idIdiomas.join(',')})' : '';
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
    ].where((element) => (element != '' && element != [])).toList();

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

}
