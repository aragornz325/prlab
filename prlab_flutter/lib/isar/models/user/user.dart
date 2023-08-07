import 'package:isar/isar.dart';

part 'user.g.dart';

/// Clase del usuario de la DB local basada en UserInfo de Serverpod.
@Collection()
class UserIsar {
  UserIsar({
    required this.id,
    required this.userName,
    required this.email,
    required this.scopeNames,
    required this.blocked,
    this.fullName,
    this.created,
    this.imageUrl,
  });

  final int id;
  final String userName;
  final String? fullName;
  final String email;
  final DateTime? created;
  final String? imageUrl;
  List<String> scopeNames = [];
  bool blocked = false;
}
