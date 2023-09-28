/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class RedSocial extends _i1.TableRow {
  RedSocial({
    int? id,
    this.idRedSocial,
    this.idUsuario,
    required this.redSocial,
    required this.urlIcono,
    required this.nombreDeUsuario,
    required this.urlPerfil,
    this.ultimaModificacion,
    this.activo,
    this.fechaCreacion,
  }) : super(id);

  factory RedSocial.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return RedSocial(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      idRedSocial: serializationManager
          .deserialize<int?>(jsonSerialization['idRedSocial']),
      idUsuario: serializationManager
          .deserialize<int?>(jsonSerialization['idUsuario']),
      redSocial: serializationManager
          .deserialize<String>(jsonSerialization['redSocial']),
      urlIcono: serializationManager
          .deserialize<String>(jsonSerialization['urlIcono']),
      nombreDeUsuario: serializationManager
          .deserialize<String>(jsonSerialization['nombreDeUsuario']),
      urlPerfil: serializationManager
          .deserialize<String>(jsonSerialization['urlPerfil']),
      ultimaModificacion: serializationManager
          .deserialize<DateTime?>(jsonSerialization['ultimaModificacion']),
      activo:
          serializationManager.deserialize<bool?>(jsonSerialization['activo']),
      fechaCreacion: serializationManager
          .deserialize<DateTime?>(jsonSerialization['fechaCreacion']),
    );
  }

  static final t = RedSocialTable();

  int? idRedSocial;

  int? idUsuario;

  String redSocial;

  String urlIcono;

  String nombreDeUsuario;

  String urlPerfil;

  DateTime? ultimaModificacion;

  bool? activo;

  DateTime? fechaCreacion;

  @override
  String get tableName => 'redes_sociales_periodistas';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'redSocial': redSocial,
      'urlIcono': urlIcono,
      'nombreDeUsuario': nombreDeUsuario,
      'urlPerfil': urlPerfil,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'idRedSocial': idRedSocial,
      'idUsuario': idUsuario,
      'nombreDeUsuario': nombreDeUsuario,
      'urlPerfil': urlPerfil,
      'ultimaModificacion': ultimaModificacion,
      'activo': activo,
      'fechaCreacion': fechaCreacion,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'idRedSocial': idRedSocial,
      'idUsuario': idUsuario,
      'redSocial': redSocial,
      'urlIcono': urlIcono,
      'nombreDeUsuario': nombreDeUsuario,
      'urlPerfil': urlPerfil,
      'ultimaModificacion': ultimaModificacion,
      'activo': activo,
      'fechaCreacion': fechaCreacion,
    };
  }

  @override
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'idRedSocial':
        idRedSocial = value;
        return;
      case 'idUsuario':
        idUsuario = value;
        return;
      case 'nombreDeUsuario':
        nombreDeUsuario = value;
        return;
      case 'urlPerfil':
        urlPerfil = value;
        return;
      case 'ultimaModificacion':
        ultimaModificacion = value;
        return;
      case 'activo':
        activo = value;
        return;
      case 'fechaCreacion':
        fechaCreacion = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<RedSocial>> find(
    _i1.Session session, {
    RedSocialExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<RedSocial>(
      where: where != null ? where(RedSocial.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<RedSocial?> findSingleRow(
    _i1.Session session, {
    RedSocialExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<RedSocial>(
      where: where != null ? where(RedSocial.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<RedSocial?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<RedSocial>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required RedSocialExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<RedSocial>(
      where: where(RedSocial.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    RedSocial row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    RedSocial row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    RedSocial row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    RedSocialExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<RedSocial>(
      where: where != null ? where(RedSocial.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef RedSocialExpressionBuilder = _i1.Expression Function(RedSocialTable);

class RedSocialTable extends _i1.Table {
  RedSocialTable() : super(tableName: 'redes_sociales_periodistas');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final idRedSocial = _i1.ColumnInt('idRedSocial');

  final idUsuario = _i1.ColumnInt('idUsuario');

  final nombreDeUsuario = _i1.ColumnString('nombreDeUsuario');

  final urlPerfil = _i1.ColumnString('urlPerfil');

  final ultimaModificacion = _i1.ColumnDateTime('ultimaModificacion');

  final activo = _i1.ColumnBool('activo');

  final fechaCreacion = _i1.ColumnDateTime('fechaCreacion');

  @override
  List<_i1.Column> get columns => [
        id,
        idRedSocial,
        idUsuario,
        nombreDeUsuario,
        urlPerfil,
        ultimaModificacion,
        activo,
        fechaCreacion,
      ];
}

@Deprecated('Use RedSocialTable.t instead.')
RedSocialTable tRedSocial = RedSocialTable();
