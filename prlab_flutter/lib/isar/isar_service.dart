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
  static Future<void> openDB() async {
    // if (_instance..isEmpty) {
    final appDocumentsDir = await getApplicationDocumentsDirectory();
    _instance = Isar.open(
      schemas: [
        UserIsarSchema,
      ],
      directory: appDocumentsDir.path,
    );
    // }

    // return
  }

  /// Guarda el usuario en la DB local.
  static Future<void> saveUserIsar(UserIsar nuevoUsuario) async {
    await _instance.writeAsync(
      (isar) => isar.userIsars.put(nuevoUsuario),
    );
  }

  /// Stream que escucha a la lista de usuarios, que probablemente haya 1 solo.
  Stream<List<UserIsar>> listenToUsers() async* {
    final isar = _instance;
    yield* isar.userIsars.where().watch(fireImmediately: true);
  }

  /// Trae todos los usuarios de la DB.
  static Future<List<UserIsar>> getAllUsers() async {
    final isar = _instance;
    return isar.userIsars.where().findAll();
  }

  /// Trae un usuario especifico pasandole el ID.
  static Future<UserIsar?> getUser(Id id) async {
    final isar = _instance;
    return null;
    // return isar.userIsars.filter().idEqualTo(id).findFirst();
  }

  // Future<void> addUser(UserIsar user) async {

  // }

  // Future<void> closeDB() async {

  // }
  // Future<void> updateUser(UserIsar user) async {

  // }

  // Future<void> deleteUser(int userId) async {

  // }

  /// Borra los datos de la DB.
  Future<void> cleanDB() async {
    final isar = _instance;
    // await isar.writeTxn(
    //   isar.clear,
    // );
  }
}
