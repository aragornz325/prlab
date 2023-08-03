import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:prlab_flutter/isar/models/user/user.dart';

/// Clase de el servicio de Isar que inicializa la DB local y que tiene
///  funciones de CRUD.
class IsarService {
  IsarService() {
    isarDb = openDB();
  }
  late Future<Isar> isarDb;

  /// Inicia la base de datos local y asigna un path para guardar los datos.
  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final appDocumentsDir = await getApplicationDocumentsDirectory();
      return Isar.open(
        [UserIsarSchema],
        directory: appDocumentsDir.path,
      );
    }
    return Future.value(
      Isar.getInstance(),
    );
  }

  /// Guarda el usuario en la DB local.
  Future<void> saveUserIsar(UserIsar nuevoUsuario) async {
    final isar = await isarDb;
    isar.writeTxnSync<int>(
      () => isar.userIsars.putSync(nuevoUsuario),
    );
  }

  /// Stream que escucha a la lista de usuarios, que probablemente haya 1 solo.
  Stream<List<UserIsar>> listenToUsers() async* {
    final isar = await isarDb;
    yield* isar.userIsars.where().watch(fireImmediately: true);
  }

  /// Trae todos los usuarios de la DB.
  Future<List<UserIsar>> getAllUsers() async {
    final isar = await isarDb;
    return isar.userIsars.where().findAll();
  }

  /// Trae un usuario especifico pasandole el ID.
  Future<UserIsar?> getUser(Id id) async {
    final isar = await isarDb;
    return isar.userIsars.filter().idEqualTo(id).findFirst();
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
    final isar = await isarDb;
    await isar.writeTxn(
      isar.clear,
    );
  }
}
