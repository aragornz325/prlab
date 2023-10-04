/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class EntregableArticulo extends _i1.TableRow {
  EntregableArticulo({
    int? id,
    required this.titulo,
    required this.contenido,
    required this.contenidoHtml,
    required this.idAutor,
    required this.idStatus,
    required this.ultimaModificacion,
    required this.fechaCreacion,
    required this.activo,
    this.slug,
    this.idMarca,
    this.fechaEliminacion,
    this.fechaLanzamiento,
    this.fechaPublicacion,
    this.idPlataforma,
    this.idProyecto,
  }) : super(id);

  factory EntregableArticulo.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return EntregableArticulo(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      titulo:
          serializationManager.deserialize<String>(jsonSerialization['titulo']),
      contenido: serializationManager
          .deserialize<String>(jsonSerialization['contenido']),
      contenidoHtml: serializationManager
          .deserialize<String>(jsonSerialization['contenidoHtml']),
      idAutor:
          serializationManager.deserialize<int>(jsonSerialization['idAutor']),
      idStatus:
          serializationManager.deserialize<int>(jsonSerialization['idStatus']),
      ultimaModificacion: serializationManager
          .deserialize<DateTime>(jsonSerialization['ultimaModificacion']),
      fechaCreacion: serializationManager
          .deserialize<DateTime>(jsonSerialization['fechaCreacion']),
      activo:
          serializationManager.deserialize<bool>(jsonSerialization['activo']),
      slug:
          serializationManager.deserialize<String?>(jsonSerialization['slug']),
      idMarca:
          serializationManager.deserialize<int?>(jsonSerialization['idMarca']),
      fechaEliminacion: serializationManager
          .deserialize<DateTime?>(jsonSerialization['fechaEliminacion']),
      fechaLanzamiento: serializationManager
          .deserialize<DateTime?>(jsonSerialization['fechaLanzamiento']),
      fechaPublicacion: serializationManager
          .deserialize<DateTime?>(jsonSerialization['fechaPublicacion']),
      idPlataforma: serializationManager
          .deserialize<int?>(jsonSerialization['idPlataforma']),
      idProyecto: serializationManager
          .deserialize<int?>(jsonSerialization['idProyecto']),
    );
  }

  static final t = EntregableArticuloTable();

  String titulo;

  String contenido;

  String contenidoHtml;

  int idAutor;

  int idStatus;

  DateTime ultimaModificacion;

  DateTime fechaCreacion;

  bool activo;

  String? slug;

  int? idMarca;

  DateTime? fechaEliminacion;

  DateTime? fechaLanzamiento;

  DateTime? fechaPublicacion;

  int? idPlataforma;

  int? idProyecto;

  @override
  String get tableName => 'articulos';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'contenido': contenido,
      'contenidoHtml': contenidoHtml,
      'idAutor': idAutor,
      'idStatus': idStatus,
      'ultimaModificacion': ultimaModificacion,
      'fechaCreacion': fechaCreacion,
      'activo': activo,
      'slug': slug,
      'idMarca': idMarca,
      'fechaPublicacion': fechaPublicacion,
      'idPlataforma': idPlataforma,
      'idProyecto': idProyecto,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'titulo': titulo,
      'contenido': contenido,
      'contenidoHtml': contenidoHtml,
      'idAutor': idAutor,
      'idStatus': idStatus,
      'ultimaModificacion': ultimaModificacion,
      'fechaCreacion': fechaCreacion,
      'activo': activo,
      'slug': slug,
      'idMarca': idMarca,
      'fechaEliminacion': fechaEliminacion,
      'fechaLanzamiento': fechaLanzamiento,
      'fechaPublicacion': fechaPublicacion,
      'idPlataforma': idPlataforma,
      'idProyecto': idProyecto,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'titulo': titulo,
      'contenido': contenido,
      'contenidoHtml': contenidoHtml,
      'idAutor': idAutor,
      'idStatus': idStatus,
      'ultimaModificacion': ultimaModificacion,
      'fechaCreacion': fechaCreacion,
      'activo': activo,
      'slug': slug,
      'idMarca': idMarca,
      'fechaEliminacion': fechaEliminacion,
      'fechaLanzamiento': fechaLanzamiento,
      'fechaPublicacion': fechaPublicacion,
      'idPlataforma': idPlataforma,
      'idProyecto': idProyecto,
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
      case 'contenidoHtml':
        contenidoHtml = value;
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
      case 'activo':
        activo = value;
        return;
      case 'slug':
        slug = value;
        return;
      case 'idMarca':
        idMarca = value;
        return;
      case 'fechaEliminacion':
        fechaEliminacion = value;
        return;
      case 'fechaLanzamiento':
        fechaLanzamiento = value;
        return;
      case 'fechaPublicacion':
        fechaPublicacion = value;
        return;
      case 'idPlataforma':
        idPlataforma = value;
        return;
      case 'idProyecto':
        idProyecto = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<EntregableArticulo>> find(
    _i1.Session session, {
    EntregableArticuloExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<EntregableArticulo>(
      where: where != null ? where(EntregableArticulo.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<EntregableArticulo?> findSingleRow(
    _i1.Session session, {
    EntregableArticuloExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<EntregableArticulo>(
      where: where != null ? where(EntregableArticulo.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<EntregableArticulo?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<EntregableArticulo>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required EntregableArticuloExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<EntregableArticulo>(
      where: where(EntregableArticulo.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    EntregableArticulo row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    EntregableArticulo row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    EntregableArticulo row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    EntregableArticuloExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<EntregableArticulo>(
      where: where != null ? where(EntregableArticulo.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef EntregableArticuloExpressionBuilder = _i1.Expression Function(
    EntregableArticuloTable);

class EntregableArticuloTable extends _i1.Table {
  EntregableArticuloTable() : super(tableName: 'articulos');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final titulo = _i1.ColumnString('titulo');

  final contenido = _i1.ColumnString('contenido');

  final contenidoHtml = _i1.ColumnString('contenidoHtml');

  final idAutor = _i1.ColumnInt('idAutor');

  final idStatus = _i1.ColumnInt('idStatus');

  final ultimaModificacion = _i1.ColumnDateTime('ultimaModificacion');

  final fechaCreacion = _i1.ColumnDateTime('fechaCreacion');

  final activo = _i1.ColumnBool('activo');

  final slug = _i1.ColumnString('slug');

  final idMarca = _i1.ColumnInt('idMarca');

  final fechaEliminacion = _i1.ColumnDateTime('fechaEliminacion');

  final fechaLanzamiento = _i1.ColumnDateTime('fechaLanzamiento');

  final fechaPublicacion = _i1.ColumnDateTime('fechaPublicacion');

  final idPlataforma = _i1.ColumnInt('idPlataforma');

  final idProyecto = _i1.ColumnInt('idProyecto');

  @override
  List<_i1.Column> get columns => [
        id,
        titulo,
        contenido,
        contenidoHtml,
        idAutor,
        idStatus,
        ultimaModificacion,
        fechaCreacion,
        activo,
        slug,
        idMarca,
        fechaEliminacion,
        fechaLanzamiento,
        fechaPublicacion,
        idPlataforma,
        idProyecto,
      ];
}

@Deprecated('Use EntregableArticuloTable.t instead.')
EntregableArticuloTable tEntregableArticulo = EntregableArticuloTable();
