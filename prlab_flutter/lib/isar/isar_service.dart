import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:prlab_flutter/isar/models/user/user.dart';

/// Clase de el servicio de Isar que inicializa la DB local y que tiene
///  funciones de CRUD.
abstract class IsarService {
  IsarService();

  static late Isar _instance;

  Isar get instance => _instance;

  /// Inicia la base de datos local y asigna un path para guardar los datos.
  static Future<void> abrirDB() async {
    final appDocumentosDir = await getApplicationDocumentsDirectory();
    _instance = Isar.open(
      schemas: [
        UserIsarSchema,
      ],
      directory: appDocumentosDir.path,
    );
  }

  /// Guarda el usuario en la DB local.
  static Future<void> guardarUsuarioIsar(UserIsar nuevoUsuario) async {
    await _instance.writeAsync(
      (isar) => isar.userIsars.put(nuevoUsuario),
    );
  }

  /// Trae todos los usuarios de la DB.
  static Future<List<UserIsar>> traerTodosLosUsuarios() async {
    final isar = _instance;
    return isar.userIsars.where().findAll();
  }

  /// Borra los datos de la DB.
  Future<void> borrarDatosDeInstanciaDB() async {
    _instance.clear();
  }
}
