/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class MensajeRegistro extends _i1.TableRow {
  MensajeRegistro({
    int? id,
    required this.mensaje,
    required this.host,
    required this.fechaCreacion,
  }) : super(id);

  factory MensajeRegistro.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return MensajeRegistro(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      mensaje: serializationManager
          .deserialize<String>(jsonSerialization['mensaje']),
      host: serializationManager.deserialize<String>(jsonSerialization['host']),
      fechaCreacion: serializationManager
          .deserialize<DateTime>(jsonSerialization['fechaCreacion']),
    );
  }

  static final t = MensajeRegistroTable();

  String mensaje;

  String host;

  DateTime fechaCreacion;

  @override
  String get tableName => 'mensaje_registro';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'mensaje': mensaje,
      'host': host,
      'fechaCreacion': fechaCreacion,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'mensaje': mensaje,
      'host': host,
      'fechaCreacion': fechaCreacion,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'mensaje': mensaje,
      'host': host,
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
      case 'mensaje':
        mensaje = value;
        return;
      case 'host':
        host = value;
        return;
      case 'fechaCreacion':
        fechaCreacion = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<MensajeRegistro>> find(
    _i1.Session session, {
    MensajeRegistroExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<MensajeRegistro>(
      where: where != null ? where(MensajeRegistro.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<MensajeRegistro?> findSingleRow(
    _i1.Session session, {
    MensajeRegistroExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<MensajeRegistro>(
      where: where != null ? where(MensajeRegistro.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<MensajeRegistro?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<MensajeRegistro>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required MensajeRegistroExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<MensajeRegistro>(
      where: where(MensajeRegistro.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    MensajeRegistro row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    MensajeRegistro row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    MensajeRegistro row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    MensajeRegistroExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<MensajeRegistro>(
      where: where != null ? where(MensajeRegistro.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef MensajeRegistroExpressionBuilder = _i1.Expression Function(
    MensajeRegistroTable);

class MensajeRegistroTable extends _i1.Table {
  MensajeRegistroTable() : super(tableName: 'mensaje_registro');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final mensaje = _i1.ColumnString('mensaje');

  final host = _i1.ColumnString('host');

  final fechaCreacion = _i1.ColumnDateTime('fechaCreacion');

  @override
  List<_i1.Column> get columns => [
        id,
        mensaje,
        host,
        fechaCreacion,
      ];
}

@Deprecated('Use MensajeRegistroTable.t instead.')
MensajeRegistroTable tMensajeRegistro = MensajeRegistroTable();
