/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class TipoDeOrganizacion extends _i1.TableRow {
  TipoDeOrganizacion({
    int? id,
    required this.tipo,
    required this.ultimaModificacion,
    required this.fechaCreacion,
  }) : super(id);

  factory TipoDeOrganizacion.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return TipoDeOrganizacion(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      tipo: serializationManager.deserialize<String>(jsonSerialization['tipo']),
      ultimaModificacion: serializationManager
          .deserialize<DateTime>(jsonSerialization['ultimaModificacion']),
      fechaCreacion: serializationManager
          .deserialize<DateTime>(jsonSerialization['fechaCreacion']),
    );
  }

  static final t = TipoDeOrganizacionTable();

  String tipo;

  DateTime ultimaModificacion;

  DateTime fechaCreacion;

  @override
  String get tableName => 'tipos_de_organizacion';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tipo': tipo,
      'ultimaModificacion': ultimaModificacion,
      'fechaCreacion': fechaCreacion,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'tipo': tipo,
      'ultimaModificacion': ultimaModificacion,
      'fechaCreacion': fechaCreacion,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'tipo': tipo,
      'ultimaModificacion': ultimaModificacion,
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
      case 'tipo':
        tipo = value;
        return;
      case 'ultimaModificacion':
        ultimaModificacion = value;
        return;
      case 'fechaCreacion':
        fechaCreacion = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<TipoDeOrganizacion>> find(
    _i1.Session session, {
    TipoDeOrganizacionExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<TipoDeOrganizacion>(
      where: where != null ? where(TipoDeOrganizacion.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<TipoDeOrganizacion?> findSingleRow(
    _i1.Session session, {
    TipoDeOrganizacionExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<TipoDeOrganizacion>(
      where: where != null ? where(TipoDeOrganizacion.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<TipoDeOrganizacion?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<TipoDeOrganizacion>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required TipoDeOrganizacionExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<TipoDeOrganizacion>(
      where: where(TipoDeOrganizacion.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    TipoDeOrganizacion row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    TipoDeOrganizacion row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    TipoDeOrganizacion row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    TipoDeOrganizacionExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<TipoDeOrganizacion>(
      where: where != null ? where(TipoDeOrganizacion.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef TipoDeOrganizacionExpressionBuilder = _i1.Expression Function(
    TipoDeOrganizacionTable);

class TipoDeOrganizacionTable extends _i1.Table {
  TipoDeOrganizacionTable() : super(tableName: 'tipos_de_organizacion');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final tipo = _i1.ColumnString('tipo');

  final ultimaModificacion = _i1.ColumnDateTime('ultimaModificacion');

  final fechaCreacion = _i1.ColumnDateTime('fechaCreacion');

  @override
  List<_i1.Column> get columns => [
        id,
        tipo,
        ultimaModificacion,
        fechaCreacion,
      ];
}

@Deprecated('Use TipoDeOrganizacionTable.t instead.')
TipoDeOrganizacionTable tTipoDeOrganizacion = TipoDeOrganizacionTable();
