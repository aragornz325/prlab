/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class EstadoDeArticulo extends _i1.TableRow {
  EstadoDeArticulo({
    int? id,
    required this.estado,
    required this.ultimaModificacion,
    required this.fechaCreacion,
  }) : super(id);

  factory EstadoDeArticulo.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return EstadoDeArticulo(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      estado:
          serializationManager.deserialize<String>(jsonSerialization['estado']),
      ultimaModificacion: serializationManager
          .deserialize<DateTime>(jsonSerialization['ultimaModificacion']),
      fechaCreacion: serializationManager
          .deserialize<DateTime>(jsonSerialization['fechaCreacion']),
    );
  }

  static final t = EstadoDeArticuloTable();

  String estado;

  DateTime ultimaModificacion;

  DateTime fechaCreacion;

  @override
  String get tableName => 'estados_de_articulos';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'estado': estado,
      'ultimaModificacion': ultimaModificacion,
      'fechaCreacion': fechaCreacion,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'estado': estado,
      'ultimaModificacion': ultimaModificacion,
      'fechaCreacion': fechaCreacion,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'estado': estado,
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
      case 'estado':
        estado = value;
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

  static Future<List<EstadoDeArticulo>> find(
    _i1.Session session, {
    EstadoDeArticuloExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<EstadoDeArticulo>(
      where: where != null ? where(EstadoDeArticulo.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<EstadoDeArticulo?> findSingleRow(
    _i1.Session session, {
    EstadoDeArticuloExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<EstadoDeArticulo>(
      where: where != null ? where(EstadoDeArticulo.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<EstadoDeArticulo?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<EstadoDeArticulo>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required EstadoDeArticuloExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<EstadoDeArticulo>(
      where: where(EstadoDeArticulo.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    EstadoDeArticulo row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    EstadoDeArticulo row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    EstadoDeArticulo row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    EstadoDeArticuloExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<EstadoDeArticulo>(
      where: where != null ? where(EstadoDeArticulo.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef EstadoDeArticuloExpressionBuilder = _i1.Expression Function(
    EstadoDeArticuloTable);

class EstadoDeArticuloTable extends _i1.Table {
  EstadoDeArticuloTable() : super(tableName: 'estados_de_articulos');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final estado = _i1.ColumnString('estado');

  final ultimaModificacion = _i1.ColumnDateTime('ultimaModificacion');

  final fechaCreacion = _i1.ColumnDateTime('fechaCreacion');

  @override
  List<_i1.Column> get columns => [
        id,
        estado,
        ultimaModificacion,
        fechaCreacion,
      ];
}

@Deprecated('Use EstadoDeArticuloTable.t instead.')
EstadoDeArticuloTable tEstadoDeArticulo = EstadoDeArticuloTable();
