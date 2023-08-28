/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Cliente extends _i1.TableRow {
  Cliente({
    int? id,
    required this.nombre,
    required this.apellido,
    required this.fechaDeNacimiento,
    required this.nombreDeOrganizacion,
    this.domicilio,
    this.telefono,
    this.idUsuario,
    this.idOrganizacion,
    this.contacto,
    this.fechaEliminacion,
    required this.ultimaModificacion,
    required this.fechaCreacion,
  }) : super(id);

  factory Cliente.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Cliente(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      nombre:
          serializationManager.deserialize<String>(jsonSerialization['nombre']),
      apellido: serializationManager
          .deserialize<String>(jsonSerialization['apellido']),
      fechaDeNacimiento: serializationManager
          .deserialize<DateTime>(jsonSerialization['fechaDeNacimiento']),
      nombreDeOrganizacion: serializationManager
          .deserialize<String>(jsonSerialization['nombreDeOrganizacion']),
      domicilio: serializationManager
          .deserialize<String?>(jsonSerialization['domicilio']),
      telefono: serializationManager
          .deserialize<String?>(jsonSerialization['telefono']),
      idUsuario: serializationManager
          .deserialize<int?>(jsonSerialization['idUsuario']),
      idOrganizacion: serializationManager
          .deserialize<int?>(jsonSerialization['idOrganizacion']),
      contacto:
          serializationManager.deserialize<int?>(jsonSerialization['contacto']),
      fechaEliminacion: serializationManager
          .deserialize<DateTime?>(jsonSerialization['fechaEliminacion']),
      ultimaModificacion: serializationManager
          .deserialize<DateTime>(jsonSerialization['ultimaModificacion']),
      fechaCreacion: serializationManager
          .deserialize<DateTime>(jsonSerialization['fechaCreacion']),
    );
  }

  static final t = ClienteTable();

  String nombre;

  String apellido;

  DateTime fechaDeNacimiento;

  String nombreDeOrganizacion;

  String? domicilio;

  String? telefono;

  int? idUsuario;

  int? idOrganizacion;

  int? contacto;

  DateTime? fechaEliminacion;

  DateTime ultimaModificacion;

  DateTime fechaCreacion;

  @override
  String get tableName => 'clientes';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'apellido': apellido,
      'fechaDeNacimiento': fechaDeNacimiento,
      'nombreDeOrganizacion': nombreDeOrganizacion,
      'domicilio': domicilio,
      'telefono': telefono,
      'idUsuario': idUsuario,
      'idOrganizacion': idOrganizacion,
      'contacto': contacto,
      'fechaEliminacion': fechaEliminacion,
      'ultimaModificacion': ultimaModificacion,
      'fechaCreacion': fechaCreacion,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'nombre': nombre,
      'apellido': apellido,
      'fechaDeNacimiento': fechaDeNacimiento,
      'nombreDeOrganizacion': nombreDeOrganizacion,
      'domicilio': domicilio,
      'telefono': telefono,
      'idUsuario': idUsuario,
      'idOrganizacion': idOrganizacion,
      'contacto': contacto,
      'fechaEliminacion': fechaEliminacion,
      'ultimaModificacion': ultimaModificacion,
      'fechaCreacion': fechaCreacion,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'nombre': nombre,
      'apellido': apellido,
      'fechaDeNacimiento': fechaDeNacimiento,
      'nombreDeOrganizacion': nombreDeOrganizacion,
      'domicilio': domicilio,
      'telefono': telefono,
      'idUsuario': idUsuario,
      'idOrganizacion': idOrganizacion,
      'contacto': contacto,
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
      case 'nombre':
        nombre = value;
        return;
      case 'apellido':
        apellido = value;
        return;
      case 'fechaDeNacimiento':
        fechaDeNacimiento = value;
        return;
      case 'nombreDeOrganizacion':
        nombreDeOrganizacion = value;
        return;
      case 'domicilio':
        domicilio = value;
        return;
      case 'telefono':
        telefono = value;
        return;
      case 'idUsuario':
        idUsuario = value;
        return;
      case 'idOrganizacion':
        idOrganizacion = value;
        return;
      case 'contacto':
        contacto = value;
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

  static Future<List<Cliente>> find(
    _i1.Session session, {
    ClienteExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Cliente>(
      where: where != null ? where(Cliente.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Cliente?> findSingleRow(
    _i1.Session session, {
    ClienteExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Cliente>(
      where: where != null ? where(Cliente.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Cliente?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Cliente>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required ClienteExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Cliente>(
      where: where(Cliente.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Cliente row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Cliente row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Cliente row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    ClienteExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Cliente>(
      where: where != null ? where(Cliente.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef ClienteExpressionBuilder = _i1.Expression Function(ClienteTable);

class ClienteTable extends _i1.Table {
  ClienteTable() : super(tableName: 'clientes');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final nombre = _i1.ColumnString('nombre');

  final apellido = _i1.ColumnString('apellido');

  final fechaDeNacimiento = _i1.ColumnDateTime('fechaDeNacimiento');

  final nombreDeOrganizacion = _i1.ColumnString('nombreDeOrganizacion');

  final domicilio = _i1.ColumnString('domicilio');

  final telefono = _i1.ColumnString('telefono');

  final idUsuario = _i1.ColumnInt('idUsuario');

  final idOrganizacion = _i1.ColumnInt('idOrganizacion');

  final contacto = _i1.ColumnInt('contacto');

  final fechaEliminacion = _i1.ColumnDateTime('fechaEliminacion');

  final ultimaModificacion = _i1.ColumnDateTime('ultimaModificacion');

  final fechaCreacion = _i1.ColumnDateTime('fechaCreacion');

  @override
  List<_i1.Column> get columns => [
        id,
        nombre,
        apellido,
        fechaDeNacimiento,
        nombreDeOrganizacion,
        domicilio,
        telefono,
        idUsuario,
        idOrganizacion,
        contacto,
        fechaEliminacion,
        ultimaModificacion,
        fechaCreacion,
      ];
}

@Deprecated('Use ClienteTable.t instead.')
ClienteTable tCliente = ClienteTable();
