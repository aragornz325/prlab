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
    // final queryTemas = idTemas.isNotEmpty ? '"idTema" IN (${idTemas.join(',')})' : '';
    // final queryIdiomas = idIdiomas.isNotEmpty ? '"idIdioma" IN (${idIdiomas.join(',')})' : '';
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
      queryRoles,
      queryTiposDeMedio,
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
    }

    final modeloApi = Periodista().toJson()
      ..remove('idRol')
      ..remove('idMedio')
      ..remove('idCiudad')
      ..remove('idPais');

    var consulta = '''
SELECT j."id", j."urlImagen", j."nombreCompleto", r."rol", m."medio", j."bio", j."email", j."telefono", c."ciudad", n."pais", j."redesSociales"
FROM
  periodistas j
  INNER JOIN roles r ON j."idRol" = r.id
  INNER JOIN medios m ON j."idMedio" = m.id
  INNER JOIN ciudades c ON j."idCiudad" = c.id
  INNER JOIN paises n ON j."idPais" = n.id$whereBuffer;
    ''';
    final response = await ejecutarConsultaSql(
      session,
      consulta,
      clavesMapaModeloDb: modeloApi.keys,
    );
    return response.map((e) => Periodista.fromJson(e, Protocol())).toList();
  }
}
