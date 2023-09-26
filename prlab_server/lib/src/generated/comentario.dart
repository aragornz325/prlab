/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Comentario extends _i1.TableRow {
  Comentario({
    int? id,
    this.idEntregable,
    required this.textoComentario,
    this.idAutor,
    this.nombre,
    this.apellido,
    this.fechaEliminacion,
    this.ultimaModificacion,
    this.fechaCreacion,
    this.completado,
    this.idAutorCompletado,
    this.fechaCompletado,
  }) : super(id);

  factory Comentario.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Comentario(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      idEntregable: serializationManager
          .deserialize<int?>(jsonSerialization['idEntregable']),
      textoComentario: serializationManager
          .deserialize<String>(jsonSerialization['textoComentario']),
      idAutor:
          serializationManager.deserialize<int?>(jsonSerialization['idAutor']),
      nombre: serializationManager
          .deserialize<String?>(jsonSerialization['nombre']),
      apellido: serializationManager
          .deserialize<String?>(jsonSerialization['apellido']),
      fechaEliminacion: serializationManager
          .deserialize<DateTime?>(jsonSerialization['fechaEliminacion']),
      ultimaModificacion: serializationManager
          .deserialize<DateTime?>(jsonSerialization['ultimaModificacion']),
      fechaCreacion: serializationManager
          .deserialize<DateTime?>(jsonSerialization['fechaCreacion']),
      completado: serializationManager
          .deserialize<bool?>(jsonSerialization['completado']),
      idAutorCompletado: serializationManager
          .deserialize<int?>(jsonSerialization['idAutorCompletado']),
      fechaCompletado: serializationManager
          .deserialize<DateTime?>(jsonSerialization['fechaCompletado']),
    );
  }

  static final t = ComentarioTable();

  int? idEntregable;

  String textoComentario;

  int? idAutor;

  String? nombre;

  String? apellido;

  DateTime? fechaEliminacion;

  DateTime? ultimaModificacion;

  DateTime? fechaCreacion;

  bool? completado;

  int? idAutorCompletado;

  DateTime? fechaCompletado;

  @override
  String get tableName => 'comentarios';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idEntregable': idEntregable,
      'textoComentario': textoComentario,
      'idAutor': idAutor,
      'nombre': nombre,
      'apellido': apellido,
      'fechaEliminacion': fechaEliminacion,
      'ultimaModificacion': ultimaModificacion,
      'fechaCreacion': fechaCreacion,
      'completado': completado,
      'idAutorCompletado': idAutorCompletado,
      'fechaCompletado': fechaCompletado,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'idEntregable': idEntregable,
      'textoComentario': textoComentario,
      'idAutor': idAutor,
      'fechaEliminacion': fechaEliminacion,
      'ultimaModificacion': ultimaModificacion,
      'fechaCreacion': fechaCreacion,
      'completado': completado,
      'idAutorCompletado': idAutorCompletado,
      'fechaCompletado': fechaCompletado,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'idEntregable': idEntregable,
      'textoComentario': textoComentario,
      'idAutor': idAutor,
      'nombre': nombre,
      'apellido': apellido,
      'fechaEliminacion': fechaEliminacion,
      'ultimaModificacion': ultimaModificacion,
      'fechaCreacion': fechaCreacion,
      'completado': completado,
      'idAutorCompletado': idAutorCompletado,
      'fechaCompletado': fechaCompletado,
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
      case 'idEntregable':
        idEntregable = value;
        return;
      case 'textoComentario':
        textoComentario = value;
        return;
      case 'idAutor':
        idAutor = value;
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
      case 'completado':
        completado = value;
        return;
      case 'idAutorCompletado':
        idAutorCompletado = value;
        return;
      case 'fechaCompletado':
        fechaCompletado = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Comentario>> find(
    _i1.Session session, {
    ComentarioExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Comentario>(
      where: where != null ? where(Comentario.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Comentario?> findSingleRow(
    _i1.Session session, {
    ComentarioExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Comentario>(
      where: where != null ? where(Comentario.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Comentario?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Comentario>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required ComentarioExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Comentario>(
      where: where(Comentario.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Comentario row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Comentario row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Comentario row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    ComentarioExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Comentario>(
      where: where != null ? where(Comentario.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef ComentarioExpressionBuilder = _i1.Expression Function(ComentarioTable);

class ComentarioTable extends _i1.Table {
  ComentarioTable() : super(tableName: 'comentarios');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final idEntregable = _i1.ColumnInt('idEntregable');

  final textoComentario = _i1.ColumnString('textoComentario');

  final idAutor = _i1.ColumnInt('idAutor');

  final fechaEliminacion = _i1.ColumnDateTime('fechaEliminacion');

  final ultimaModificacion = _i1.ColumnDateTime('ultimaModificacion');

  final fechaCreacion = _i1.ColumnDateTime('fechaCreacion');

  final completado = _i1.ColumnBool('completado');

  final idAutorCompletado = _i1.ColumnInt('idAutorCompletado');

  final fechaCompletado = _i1.ColumnDateTime('fechaCompletado');

  @override
  List<_i1.Column> get columns => [
        id,
        idEntregable,
        textoComentario,
        idAutor,
        fechaEliminacion,
        ultimaModificacion,
        fechaCreacion,
        completado,
        idAutorCompletado,
        fechaCompletado,
      ];
}

@Deprecated('Use ComentarioTable.t instead.')
ComentarioTable tComentario = ComentarioTable();