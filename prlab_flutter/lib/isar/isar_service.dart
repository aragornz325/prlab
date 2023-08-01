import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:prlab_flutter/isar/models/user/user.dart';

class IsarService {
  IsarService() {
    isarDb = openDB();
  }
  late Future<Isar> isarDb;

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

  Future<void> saveUserIsar(UserIsar nuevoUsuario) async {
    final isar = await isarDb;
    isar.writeTxnSync<int>(
      () => isar.userIsars.putSync(nuevoUsuario),
    );
  }

  Stream<List<UserIsar>> listenToUsers() async* {
    final isar = await isarDb;
    yield* isar.userIsars.where().watch(fireImmediately: true);
  }

  Future<List<UserIsar>> getAllUsers() async {
    final isar = await isarDb;
    return isar.userIsars.where().findAll();
  }

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

  Future<void> cleanDB() async {
    final isar = await isarDb;
    await isar.writeTxn(
      isar.clear,
    );
  }
}
