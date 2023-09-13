import 'package:prlab_server/src/generated/periodista.dart';
import 'package:prlab_server/src/odm.dart';
import 'package:serverpod/serverpod.dart';

class OdmPeriodista extends ODM {
  Future<List<Periodista>> listarPeriodistas(
    Session session, {
    String nombre = '',
    String nombreDeMedio = '',
    List<int> idPaises = const [],
    List<int> idCiudades = const [],
    List<int> idTemas = const [],
    List<int> idIdiomas = const [],
    List<int> idTiposDeMedio = const [],
    List<int> idRoles = const [],
  }) async {
    
    // TODO(anyone): Continuar desarrollo.

    // final queryNombre = nombre != '' ? '"nombre" LIKE %$nombre%' : '';
    // final queryNombreDeMedio =
    //     nombreDeMedio != '' ? '"nombre" LIKE %$nombreDeMedio%' : '';
    // final queryPaises =
    //     idPaises.isNotEmpty ? '"idPais" IN (${idPaises.join(',')})' : '';
    // final queryCiudades =
    //     idCiudades.isNotEmpty ? '"idCiudad" IN (${idCiudades.join(',')})' : '';
    // final queryTiposDeMedio = idTiposDeMedio.isNotEmpty
    //     ? '"idTipoDeMedio" IN (${idTiposDeMedio.join(',')})'
    //     : '';
    // final queryRoles =
    //     idRoles.isNotEmpty ? '"idRol" IN (${idRoles.join(',')})' : '';
    
    // final query = await session.db.query(
    //   '''
    //     SELECT *
    //     FROM periodistas
    //     WHERE $queryNombre ${queryNombre != '' ? 'AND' : ''} 
    //     $queryNombreDeMedio ${queryNombreDeMedio != '' ? 'AND' : ''} 
    //     $queryPaises ${queryPaises != '' ? 'AND' : ''}
    //     $queryCiudades ${queryCiudades != '' ? 'AND' : ''}
    //     $queryTiposDeMedio ${queryTiposDeMedio != '' ? 'AND' : ''}
    //     $queryRoles;
    // ''');
    return [];
  }
}
