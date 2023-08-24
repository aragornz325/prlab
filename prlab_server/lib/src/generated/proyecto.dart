/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Proyecto extends _i1.TableRow {
  Proyecto({
    int? id,
    required this.nombre,
    required this.descripcion,
    this.idOrganizacion,
    required this.fechaInicio,
    required this.fechaFin,
    required this.ultimaModificacion,
    required this.fechaCreacion,
  }) : super(id);

  factory Proyecto.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Proyecto(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      nombre:
          serializationManager.deserialize<String>(jsonSerialization['nombre']),
      descripcion: serializationManager
          .deserialize<String>(jsonSerialization['descripcion']),
      idOrganizacion: serializationManager
          .deserialize<int?>(jsonSerialization['idOrganizacion']),
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

  static final t = ProyectoTable();

  String nombre;

  String descripcion;

  int? idOrganizacion;

  DateTime fechaInicio;

  DateTime fechaFin;

  DateTime ultimaModificacion;

  DateTime fechaCreacion;

  @override
  String get tableName => 'proyectos';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'descripcion': descripcion,
      'idOrganizacion': idOrganizacion,
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
      'descripcion': descripcion,
      'idOrganizacion': idOrganizacion,
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
      'descripcion': descripcion,
      'idOrganizacion': idOrganizacion,
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
      case 'descripcion':
        descripcion = value;
        return;
      case 'idOrganizacion':
        idOrganizacion = value;
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

  static Future<List<Proyecto>> find(
    _i1.Session session, {
    ProyectoExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Proyecto>(
      where: where != null ? where(Proyecto.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Proyecto?> findSingleRow(
    _i1.Session session, {
    ProyectoExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Proyecto>(
      where: where != null ? where(Proyecto.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Proyecto?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Proyecto>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required ProyectoExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Proyecto>(
      where: where(Proyecto.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Proyecto row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Proyecto row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Proyecto row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    ProyectoExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Proyecto>(
      where: where != null ? where(Proyecto.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef ProyectoExpressionBuilder = _i1.Expression Function(ProyectoTable);

class ProyectoTable extends _i1.Table {
  ProyectoTable() : super(tableName: 'proyectos');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final nombre = _i1.ColumnString('nombre');

  final descripcion = _i1.ColumnString('descripcion');

  final idOrganizacion = _i1.ColumnInt('idOrganizacion');

  final fechaInicio = _i1.ColumnDateTime('fechaInicio');

  final fechaFin = _i1.ColumnDateTime('fechaFin');

  final ultimaModificacion = _i1.ColumnDateTime('ultimaModificacion');

  final fechaCreacion = _i1.ColumnDateTime('fechaCreacion');

  @override
  List<_i1.Column> get columns => [
        id,
        nombre,
        descripcion,
        idOrganizacion,
        fechaInicio,
        fechaFin,
        ultimaModificacion,
        fechaCreacion,
      ];
}

@Deprecated('Use ProyectoTable.t instead.')
ProyectoTable tProyecto = ProyectoTable();
