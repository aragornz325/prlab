/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

enum TipoExcepcion with _i1.SerializableEntity {
  sinConexion,
  noAutorizado,
  noEncontrado,
  prohibido,
  solicitudIncorrecta,
  parseo,
  desconocido;

  static TipoExcepcion? fromJson(int index) {
    switch (index) {
      case 0:
        return sinConexion;
      case 1:
        return noAutorizado;
      case 2:
        return noEncontrado;
      case 3:
        return prohibido;
      case 4:
        return solicitudIncorrecta;
      case 5:
        return parseo;
      case 6:
        return desconocido;
      default:
        return null;
    }
  }

  @override
  int toJson() => index;
}
