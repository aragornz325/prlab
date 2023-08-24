/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Organizacion extends _i1.TableRow {
  Organizacion({
    int? id,
    required this.nombre,
    this.tipo,
    this.contacto,
    required this.ultimaModificacion,
    required this.fechaCreacion,
  }) : super(id);

  factory Organizacion.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Organizacion(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      nombre:
          serializationManager.deserialize<String>(jsonSerialization['nombre']),
      tipo: serializationManager.deserialize<int?>(jsonSerialization['tipo']),
      contacto:
          serializationManager.deserialize<int?>(jsonSerialization['contacto']),
      ultimaModificacion: serializationManager
          .deserialize<DateTime>(jsonSerialization['ultimaModificacion']),
      fechaCreacion: serializationManager
          .deserialize<DateTime>(jsonSerialization['fechaCreacion']),
    );
  }

  static final t = OrganizacionTable();

  String nombre;

  int? tipo;

  int? contacto;

  DateTime ultimaModificacion;

  DateTime fechaCreacion;

  @override
  String get tableName => 'organizaciones';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'tipo': tipo,
      'contacto': contacto,
      'ultimaModificacion': ultimaModificacion,
      'fechaCreacion': fechaCreacion,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'nombre': nombre,
      'tipo': tipo,
      'contacto': contacto,
      'ultimaModificacion': ultimaModificacion,
      'fechaCreacion': fechaCreacion,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'nombre': nombre,
      'tipo': tipo,
      'contacto': contacto,
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
      case 'tipo':
        tipo = value;
        return;
      case 'contacto':
        contacto = value;
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

  static Future<List<Organizacion>> find(
    _i1.Session session, {
    OrganizacionExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Organizacion>(
      where: where != null ? where(Organizacion.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Organizacion?> findSingleRow(
    _i1.Session session, {
    OrganizacionExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Organizacion>(
      where: where != null ? where(Organizacion.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Organizacion?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Organizacion>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required OrganizacionExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Organizacion>(
      where: where(Organizacion.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Organizacion row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Organizacion row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Organizacion row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    OrganizacionExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Organizacion>(
      where: where != null ? where(Organizacion.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef OrganizacionExpressionBuilder = _i1.Expression Function(
    OrganizacionTable);

class OrganizacionTable extends _i1.Table {
  OrganizacionTable() : super(tableName: 'organizaciones');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final nombre = _i1.ColumnString('nombre');

  final tipo = _i1.ColumnInt('tipo');

  final contacto = _i1.ColumnInt('contacto');

  final ultimaModificacion = _i1.ColumnDateTime('ultimaModificacion');

  final fechaCreacion = _i1.ColumnDateTime('fechaCreacion');

  @override
  List<_i1.Column> get columns => [
        id,
        nombre,
        tipo,
        contacto,
        ultimaModificacion,
        fechaCreacion,
      ];
}

@Deprecated('Use OrganizacionTable.t instead.')
OrganizacionTable tOrganizacion = OrganizacionTable();
