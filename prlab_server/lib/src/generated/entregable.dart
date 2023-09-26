/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Entregable extends _i1.TableRow {
  Entregable({
    int? id,
    required this.nombre,
    this.idAutor,
    required this.fechaInicio,
    required this.fechaFin,
    required this.ultimaModificacion,
    required this.fechaCreacion,
  }) : super(id);

  factory Entregable.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Entregable(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      nombre:
          serializationManager.deserialize<String>(jsonSerialization['nombre']),
      idAutor:
          serializationManager.deserialize<int?>(jsonSerialization['idAutor']),
      fechaInicio: serializationManager
          .deserialize<DateTime>(jsonSerialization['fechaInicio']),
      fechaFin: serializationManager
          .deserialize<DateTime>(jsonSerialization['fechaFin']),
      ultimaModificacion: serializationManager
          .deserialize<DateTime>(jsonSerialization['ultimaModificacion']),
      fechaCreacion: serializationManager
          .deserialize<DateTime>(jsonSerialization['fechaCreacion']),
    );
  }

  static final t = EntregableTable();

  String nombre;

  int? idAutor;

  DateTime fechaInicio;

  DateTime fechaFin;

  DateTime ultimaModificacion;

  DateTime fechaCreacion;

  @override
  String get tableName => 'entregables';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'idAutor': idAutor,
      'fechaInicio': fechaInicio,
      'fechaFin': fechaFin,
      'ultimaModificacion': ultimaModificacion,
      'fechaCreacion': fechaCreacion,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'nombre': nombre,
      'idAutor': idAutor,
      'fechaInicio': fechaInicio,
      'fechaFin': fechaFin,
      'ultimaModificacion': ultimaModificacion,
      'fechaCreacion': fechaCreacion,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'nombre': nombre,
      'idAutor': idAutor,
      'fechaInicio': fechaInicio,
      'fechaFin': fechaFin,
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
      case 'nombre':
        nombre = value;
        return;
      case 'idAutor':
        idAutor = value;
        return;
      case 'fechaInicio':
        fechaInicio = value;
        return;
      case 'fechaFin':
        fechaFin = value;
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

  static Future<List<Entregable>> find(
    _i1.Session session, {
    EntregableExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Entregable>(
      where: where != null ? where(Entregable.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Entregable?> findSingleRow(
    _i1.Session session, {
    EntregableExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Entregable>(
      where: where != null ? where(Entregable.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Entregable?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Entregable>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required EntregableExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Entregable>(
      where: where(Entregable.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Entregable row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Entregable row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Entregable row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    EntregableExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Entregable>(
      where: where != null ? where(Entregable.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef EntregableExpressionBuilder = _i1.Expression Function(EntregableTable);

class EntregableTable extends _i1.Table {
  EntregableTable() : super(tableName: 'entregables');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final nombre = _i1.ColumnString('nombre');

  final idAutor = _i1.ColumnInt('idAutor');

  final fechaInicio = _i1.ColumnDateTime('fechaInicio');

  final fechaFin = _i1.ColumnDateTime('fechaFin');

  final ultimaModificacion = _i1.ColumnDateTime('ultimaModificacion');

  final fechaCreacion = _i1.ColumnDateTime('fechaCreacion');

  @override
  List<_i1.Column> get columns => [
        id,
        nombre,
        idAutor,
        fechaInicio,
        fechaFin,
        ultimaModificacion,
        fechaCreacion,
      ];
}

@Deprecated('Use EntregableTable.t instead.')
EntregableTable tEntregable = EntregableTable();
