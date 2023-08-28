/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Articulo extends _i1.TableRow {
  Articulo({
    int? id,
    required this.titulo,
    this.contenido,
    this.idProyecto,
    this.idAutor,
    this.idStatus,
    this.fechaEliminacion,
    required this.ultimaModificacion,
    required this.fechaCreacion,
  }) : super(id);

  factory Articulo.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Articulo(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      titulo:
          serializationManager.deserialize<String>(jsonSerialization['titulo']),
      contenido: serializationManager
          .deserialize<String?>(jsonSerialization['contenido']),
      idProyecto: serializationManager
          .deserialize<int?>(jsonSerialization['idProyecto']),
      idAutor:
          serializationManager.deserialize<int?>(jsonSerialization['idAutor']),
      idStatus:
          serializationManager.deserialize<int?>(jsonSerialization['idStatus']),
      fechaEliminacion: serializationManager
          .deserialize<DateTime?>(jsonSerialization['fechaEliminacion']),
      ultimaModificacion: serializationManager
          .deserialize<DateTime>(jsonSerialization['ultimaModificacion']),
      fechaCreacion: serializationManager
          .deserialize<DateTime>(jsonSerialization['fechaCreacion']),
    );
  }

  static final t = ArticuloTable();

  String titulo;

  String? contenido;

  int? idProyecto;

  int? idAutor;

  int? idStatus;

  DateTime? fechaEliminacion;

  DateTime ultimaModificacion;

  DateTime fechaCreacion;

  @override
  String get tableName => 'articulos';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'contenido': contenido,
      'idProyecto': idProyecto,
      'idAutor': idAutor,
      'idStatus': idStatus,
      'fechaEliminacion': fechaEliminacion,
      'ultimaModificacion': ultimaModificacion,
      'fechaCreacion': fechaCreacion,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'titulo': titulo,
      'contenido': contenido,
      'idProyecto': idProyecto,
      'idAutor': idAutor,
      'idStatus': idStatus,
      'fechaEliminacion': fechaEliminacion,
      'ultimaModificacion': ultimaModificacion,
      'fechaCreacion': fechaCreacion,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'titulo': titulo,
      'contenido': contenido,
      'idProyecto': idProyecto,
      'idAutor': idAutor,
      'idStatus': idStatus,
      'fechaEliminacion': fechaEliminacion,
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
      case 'titulo':
        titulo = value;
        return;
      case 'contenido':
        contenido = value;
        return;
      case 'idProyecto':
        idProyecto = value;
        return;
      case 'idAutor':
        idAutor = value;
        return;
      case 'idStatus':
        idStatus = value;
        return;
      case 'fechaEliminacion':
        fechaEliminacion = value;
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

  static Future<List<Articulo>> find(
    _i1.Session session, {
    ArticuloExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Articulo>(
      where: where != null ? where(Articulo.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Articulo?> findSingleRow(
    _i1.Session session, {
    ArticuloExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Articulo>(
      where: where != null ? where(Articulo.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Articulo?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Articulo>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required ArticuloExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Articulo>(
      where: where(Articulo.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Articulo row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Articulo row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Articulo row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    ArticuloExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Articulo>(
      where: where != null ? where(Articulo.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef ArticuloExpressionBuilder = _i1.Expression Function(ArticuloTable);

class ArticuloTable extends _i1.Table {
  ArticuloTable() : super(tableName: 'articulos');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final titulo = _i1.ColumnString('titulo');

  final contenido = _i1.ColumnString('contenido');

  final idProyecto = _i1.ColumnInt('idProyecto');

  final idAutor = _i1.ColumnInt('idAutor');

  final idStatus = _i1.ColumnInt('idStatus');

  final fechaEliminacion = _i1.ColumnDateTime('fechaEliminacion');

  final ultimaModificacion = _i1.ColumnDateTime('ultimaModificacion');

  final fechaCreacion = _i1.ColumnDateTime('fechaCreacion');

  @override
  List<_i1.Column> get columns => [
        id,
        titulo,
        contenido,
        idProyecto,
        idAutor,
        idStatus,
        fechaEliminacion,
        ultimaModificacion,
        fechaCreacion,
      ];
}

@Deprecated('Use ArticuloTable.t instead.')
ArticuloTable tArticulo = ArticuloTable();
