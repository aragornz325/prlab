import 'package:isar/isar.dart';

part 'user.g.dart';

///Clase del usuario de la DB local basada en UserInfo de Serverpod.
@Collection()
class UserIsar {
  Id id = Isar.autoIncrement;
  late String userName;
  late String? fullName;
  late String email;
  late DateTime? created;
  late String? imageUrl;
  List<String> scopeNames = [];
  bool blocked = false;
}
