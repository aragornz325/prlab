/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Publicacion extends _i1.TableRow {
  Publicacion({
    int? id,
    required this.titulo,
    this.idProyecto,
    this.idAutor,
    this.idStatus,
    required this.ultimaModificacion,
    required this.fechaCreacion,
  }) : super(id);

  factory Publicacion.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Publicacion(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      titulo:
          serializationManager.deserialize<String>(jsonSerialization['titulo']),
      idProyecto: serializationManager
          .deserialize<int?>(jsonSerialization['idProyecto']),
      idAutor:
          serializationManager.deserialize<int?>(jsonSerialization['idAutor']),
      idStatus:
          serializationManager.deserialize<int?>(jsonSerialization['idStatus']),
      ultimaModificacion: serializationManager
          .deserialize<DateTime>(jsonSerialization['ultimaModificacion']),
      fechaCreacion: serializationManager
          .deserialize<DateTime>(jsonSerialization['fechaCreacion']),
    );
  }

  static final t = PublicacionTable();

  String titulo;

  int? idProyecto;

  int? idAutor;

  int? idStatus;

  DateTime ultimaModificacion;

  DateTime fechaCreacion;

  @override
  String get tableName => 'publicaciones';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'idProyecto': idProyecto,
      'idAutor': idAutor,
      'idStatus': idStatus,
      'ultimaModificacion': ultimaModificacion,
      'fechaCreacion': fechaCreacion,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'titulo': titulo,
      'idProyecto': idProyecto,
      'idAutor': idAutor,
      'idStatus': idStatus,
      'ultimaModificacion': ultimaModificacion,
      'fechaCreacion': fechaCreacion,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'titulo': titulo,
      'idProyecto': idProyecto,
      'idAutor': idAutor,
      'idStatus': idStatus,
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
      case 'idProyecto':
        idProyecto = value;
        return;
      case 'idAutor':
        idAutor = value;
        return;
      case 'idStatus':
        idStatus = value;
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

  static Future<List<Publicacion>> find(
    _i1.Session session, {
    PublicacionExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Publicacion>(
      where: where != null ? where(Publicacion.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Publicacion?> findSingleRow(
    _i1.Session session, {
    PublicacionExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Publicacion>(
      where: where != null ? where(Publicacion.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Publicacion?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Publicacion>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required PublicacionExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Publicacion>(
      where: where(Publicacion.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Publicacion row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Publicacion row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Publicacion row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    PublicacionExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Publicacion>(
      where: where != null ? where(Publicacion.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef PublicacionExpressionBuilder = _i1.Expression Function(
    PublicacionTable);

class PublicacionTable extends _i1.Table {
  PublicacionTable() : super(tableName: 'publicaciones');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final titulo = _i1.ColumnString('titulo');

  final idProyecto = _i1.ColumnInt('idProyecto');

  final idAutor = _i1.ColumnInt('idAutor');

  final idStatus = _i1.ColumnInt('idStatus');

  final ultimaModificacion = _i1.ColumnDateTime('ultimaModificacion');

  final fechaCreacion = _i1.ColumnDateTime('fechaCreacion');

  @override
  List<_i1.Column> get columns => [
        id,
        titulo,
        idProyecto,
        idAutor,
        idStatus,
        ultimaModificacion,
        fechaCreacion,
      ];
}

@Deprecated('Use PublicacionTable.t instead.')
PublicacionTable tPublicacion = PublicacionTable();
