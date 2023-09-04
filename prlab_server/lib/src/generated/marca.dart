/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

class Marca extends _i1.TableRow {
  Marca({
    int? id,
    required this.nombre,
    required this.sitioWeb,
    this.staff,
    this.fechaCreacion,
    this.ultimaModificacion,
    this.fechaEliminacion,
  }) : super(id);

  factory Marca.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Marca(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      nombre:
          serializationManager.deserialize<String>(jsonSerialization['nombre']),
      sitioWeb: serializationManager
          .deserialize<String>(jsonSerialization['sitioWeb']),
      staff: serializationManager
          .deserialize<List<_i2.Cliente>?>(jsonSerialization['staff']),
      fechaCreacion: serializationManager
          .deserialize<DateTime?>(jsonSerialization['fechaCreacion']),
      ultimaModificacion: serializationManager
          .deserialize<DateTime?>(jsonSerialization['ultimaModificacion']),
      fechaEliminacion: serializationManager
          .deserialize<DateTime?>(jsonSerialization['fechaEliminacion']),
    );
  }

  static final t = MarcaTable();

  String nombre;

  String sitioWeb;

  List<_i2.Cliente>? staff;

  DateTime? fechaCreacion;

  DateTime? ultimaModificacion;

  DateTime? fechaEliminacion;

  @override
  String get tableName => 'marcas';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'sitioWeb': sitioWeb,
      'staff': staff,
      'fechaCreacion': fechaCreacion,
      'ultimaModificacion': ultimaModificacion,
      'fechaEliminacion': fechaEliminacion,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'nombre': nombre,
      'sitioWeb': sitioWeb,
      'fechaCreacion': fechaCreacion,
      'ultimaModificacion': ultimaModificacion,
      'fechaEliminacion': fechaEliminacion,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'nombre': nombre,
      'sitioWeb': sitioWeb,
      'staff': staff,
      'fechaCreacion': fechaCreacion,
      'ultimaModificacion': ultimaModificacion,
      'fechaEliminacion': fechaEliminacion,
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
      case 'sitioWeb':
        sitioWeb = value;
        return;
      case 'fechaCreacion':
        fechaCreacion = value;
        return;
      case 'ultimaModificacion':
        ultimaModificacion = value;
        return;
      case 'fechaEliminacion':
        fechaEliminacion = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Marca>> find(
    _i1.Session session, {
    MarcaExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Marca>(
      where: where != null ? where(Marca.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Marca?> findSingleRow(
    _i1.Session session, {
    MarcaExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Marca>(
      where: where != null ? where(Marca.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Marca?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Marca>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required MarcaExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Marca>(
      where: where(Marca.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Marca row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Marca row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Marca row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    MarcaExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Marca>(
      where: where != null ? where(Marca.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef MarcaExpressionBuilder = _i1.Expression Function(MarcaTable);

class MarcaTable extends _i1.Table {
  MarcaTable() : super(tableName: 'marcas');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final nombre = _i1.ColumnString('nombre');

  final sitioWeb = _i1.ColumnString('sitioWeb');

  final fechaCreacion = _i1.ColumnDateTime('fechaCreacion');

  final ultimaModificacion = _i1.ColumnDateTime('ultimaModificacion');

  final fechaEliminacion = _i1.ColumnDateTime('fechaEliminacion');

  @override
  List<_i1.Column> get columns => [
        id,
        nombre,
        sitioWeb,
        fechaCreacion,
        ultimaModificacion,
        fechaEliminacion,
      ];
}

@Deprecated('Use MarcaTable.t instead.')
MarcaTable tMarca = MarcaTable();
