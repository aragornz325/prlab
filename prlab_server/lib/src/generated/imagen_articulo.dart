/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class ImagenArticulo extends _i1.TableRow {
  ImagenArticulo({
    int? id,
    required this.url,
    required this.nombreImagen,
    required this.publicId,
    this.idArticulo,
    this.fechaEliminacion,
    required this.ultimaModificacion,
    required this.fechaCreacion,
  }) : super(id);

  factory ImagenArticulo.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return ImagenArticulo(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      url: serializationManager.deserialize<String>(jsonSerialization['url']),
      nombreImagen: serializationManager
          .deserialize<String>(jsonSerialization['nombreImagen']),
      publicId: serializationManager
          .deserialize<String>(jsonSerialization['publicId']),
      idArticulo: serializationManager
          .deserialize<int?>(jsonSerialization['idArticulo']),
      fechaEliminacion: serializationManager
          .deserialize<DateTime?>(jsonSerialization['fechaEliminacion']),
      ultimaModificacion: serializationManager
          .deserialize<DateTime>(jsonSerialization['ultimaModificacion']),
      fechaCreacion: serializationManager
          .deserialize<DateTime>(jsonSerialization['fechaCreacion']),
    );
  }

  static final t = ImagenArticuloTable();

  String url;

  String nombreImagen;

  String publicId;

  int? idArticulo;

  DateTime? fechaEliminacion;

  DateTime ultimaModificacion;

  DateTime fechaCreacion;

  @override
  String get tableName => 'imagen_articulo';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'nombreImagen': nombreImagen,
      'publicId': publicId,
      'idArticulo': idArticulo,
      'fechaEliminacion': fechaEliminacion,
      'ultimaModificacion': ultimaModificacion,
      'fechaCreacion': fechaCreacion,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'url': url,
      'nombreImagen': nombreImagen,
      'publicId': publicId,
      'idArticulo': idArticulo,
      'fechaEliminacion': fechaEliminacion,
      'ultimaModificacion': ultimaModificacion,
      'fechaCreacion': fechaCreacion,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'url': url,
      'nombreImagen': nombreImagen,
      'publicId': publicId,
      'idArticulo': idArticulo,
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
      case 'url':
        url = value;
        return;
      case 'nombreImagen':
        nombreImagen = value;
        return;
      case 'publicId':
        publicId = value;
        return;
      case 'idArticulo':
        idArticulo = value;
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

  static Future<List<ImagenArticulo>> find(
    _i1.Session session, {
    ImagenArticuloExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<ImagenArticulo>(
      where: where != null ? where(ImagenArticulo.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<ImagenArticulo?> findSingleRow(
    _i1.Session session, {
    ImagenArticuloExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<ImagenArticulo>(
      where: where != null ? where(ImagenArticulo.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<ImagenArticulo?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<ImagenArticulo>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required ImagenArticuloExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ImagenArticulo>(
      where: where(ImagenArticulo.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    ImagenArticulo row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    ImagenArticulo row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    ImagenArticulo row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    ImagenArticuloExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ImagenArticulo>(
      where: where != null ? where(ImagenArticulo.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef ImagenArticuloExpressionBuilder = _i1.Expression Function(
    ImagenArticuloTable);

class ImagenArticuloTable extends _i1.Table {
  ImagenArticuloTable() : super(tableName: 'imagen_articulo');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final url = _i1.ColumnString('url');

  final nombreImagen = _i1.ColumnString('nombreImagen');

  final publicId = _i1.ColumnString('publicId');

  final idArticulo = _i1.ColumnInt('idArticulo');

  final fechaEliminacion = _i1.ColumnDateTime('fechaEliminacion');

  final ultimaModificacion = _i1.ColumnDateTime('ultimaModificacion');

  final fechaCreacion = _i1.ColumnDateTime('fechaCreacion');

  @override
  List<_i1.Column> get columns => [
        id,
        url,
        nombreImagen,
        publicId,
        idArticulo,
        fechaEliminacion,
        ultimaModificacion,
        fechaCreacion,
      ];
}

@Deprecated('Use ImagenArticuloTable.t instead.')
ImagenArticuloTable tImagenArticulo = ImagenArticuloTable();
