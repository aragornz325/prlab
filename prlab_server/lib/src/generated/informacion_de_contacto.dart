/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class InformacionDeContacto extends _i1.TableRow {
  InformacionDeContacto({
    int? id,
    this.idUsuario,
    this.emailPrincipal,
    this.emailSecundario,
    this.telefonoPrincipal,
    this.telefonoSecundario,
    this.domicilioCalle,
    this.domicilioNumero,
    this.domicilioCiudad,
    this.domicilioCodigoPostal,
    this.domicilioEstadoProvincia,
    this.domicilioPais,
    this.ultimaModificacion,
    this.fechaCreacion,
  }) : super(id);

  factory InformacionDeContacto.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return InformacionDeContacto(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      idUsuario: serializationManager
          .deserialize<int?>(jsonSerialization['idUsuario']),
      emailPrincipal: serializationManager
          .deserialize<String?>(jsonSerialization['emailPrincipal']),
      emailSecundario: serializationManager
          .deserialize<String?>(jsonSerialization['emailSecundario']),
      telefonoPrincipal: serializationManager
          .deserialize<String?>(jsonSerialization['telefonoPrincipal']),
      telefonoSecundario: serializationManager
          .deserialize<String?>(jsonSerialization['telefonoSecundario']),
      domicilioCalle: serializationManager
          .deserialize<String?>(jsonSerialization['domicilioCalle']),
      domicilioNumero: serializationManager
          .deserialize<String?>(jsonSerialization['domicilioNumero']),
      domicilioCiudad: serializationManager
          .deserialize<String?>(jsonSerialization['domicilioCiudad']),
      domicilioCodigoPostal: serializationManager
          .deserialize<String?>(jsonSerialization['domicilioCodigoPostal']),
      domicilioEstadoProvincia: serializationManager
          .deserialize<String?>(jsonSerialization['domicilioEstadoProvincia']),
      domicilioPais: serializationManager
          .deserialize<String?>(jsonSerialization['domicilioPais']),
      ultimaModificacion: serializationManager
          .deserialize<DateTime?>(jsonSerialization['ultimaModificacion']),
      fechaCreacion: serializationManager
          .deserialize<DateTime?>(jsonSerialization['fechaCreacion']),
    );
  }

  static final t = InformacionDeContactoTable();

  int? idUsuario;

  String? emailPrincipal;

  String? emailSecundario;

  String? telefonoPrincipal;

  String? telefonoSecundario;

  String? domicilioCalle;

  String? domicilioNumero;

  String? domicilioCiudad;

  String? domicilioCodigoPostal;

  String? domicilioEstadoProvincia;

  String? domicilioPais;

  DateTime? ultimaModificacion;

  DateTime? fechaCreacion;

  @override
  String get tableName => 'informacion_de_contactos';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idUsuario': idUsuario,
      'emailPrincipal': emailPrincipal,
      'emailSecundario': emailSecundario,
      'telefonoPrincipal': telefonoPrincipal,
      'telefonoSecundario': telefonoSecundario,
      'domicilioCalle': domicilioCalle,
      'domicilioNumero': domicilioNumero,
      'domicilioCiudad': domicilioCiudad,
      'domicilioCodigoPostal': domicilioCodigoPostal,
      'domicilioEstadoProvincia': domicilioEstadoProvincia,
      'domicilioPais': domicilioPais,
      'ultimaModificacion': ultimaModificacion,
      'fechaCreacion': fechaCreacion,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'idUsuario': idUsuario,
      'emailPrincipal': emailPrincipal,
      'emailSecundario': emailSecundario,
      'telefonoPrincipal': telefonoPrincipal,
      'telefonoSecundario': telefonoSecundario,
      'domicilioCalle': domicilioCalle,
      'domicilioNumero': domicilioNumero,
      'domicilioCiudad': domicilioCiudad,
      'domicilioCodigoPostal': domicilioCodigoPostal,
      'domicilioEstadoProvincia': domicilioEstadoProvincia,
      'domicilioPais': domicilioPais,
      'ultimaModificacion': ultimaModificacion,
      'fechaCreacion': fechaCreacion,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'idUsuario': idUsuario,
      'emailPrincipal': emailPrincipal,
      'emailSecundario': emailSecundario,
      'telefonoPrincipal': telefonoPrincipal,
      'telefonoSecundario': telefonoSecundario,
      'domicilioCalle': domicilioCalle,
      'domicilioNumero': domicilioNumero,
      'domicilioCiudad': domicilioCiudad,
      'domicilioCodigoPostal': domicilioCodigoPostal,
      'domicilioEstadoProvincia': domicilioEstadoProvincia,
      'domicilioPais': domicilioPais,
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
      case 'idUsuario':
        idUsuario = value;
        return;
      case 'emailPrincipal':
        emailPrincipal = value;
        return;
      case 'emailSecundario':
        emailSecundario = value;
        return;
      case 'telefonoPrincipal':
        telefonoPrincipal = value;
        return;
      case 'telefonoSecundario':
        telefonoSecundario = value;
        return;
      case 'domicilioCalle':
        domicilioCalle = value;
        return;
      case 'domicilioNumero':
        domicilioNumero = value;
        return;
      case 'domicilioCiudad':
        domicilioCiudad = value;
        return;
      case 'domicilioCodigoPostal':
        domicilioCodigoPostal = value;
        return;
      case 'domicilioEstadoProvincia':
        domicilioEstadoProvincia = value;
        return;
      case 'domicilioPais':
        domicilioPais = value;
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

  static Future<List<InformacionDeContacto>> find(
    _i1.Session session, {
    InformacionDeContactoExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<InformacionDeContacto>(
      where: where != null ? where(InformacionDeContacto.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<InformacionDeContacto?> findSingleRow(
    _i1.Session session, {
    InformacionDeContactoExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<InformacionDeContacto>(
      where: where != null ? where(InformacionDeContacto.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<InformacionDeContacto?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<InformacionDeContacto>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required InformacionDeContactoExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<InformacionDeContacto>(
      where: where(InformacionDeContacto.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    InformacionDeContacto row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    InformacionDeContacto row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    InformacionDeContacto row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    InformacionDeContactoExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<InformacionDeContacto>(
      where: where != null ? where(InformacionDeContacto.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef InformacionDeContactoExpressionBuilder = _i1.Expression Function(
    InformacionDeContactoTable);

class InformacionDeContactoTable extends _i1.Table {
  InformacionDeContactoTable() : super(tableName: 'informacion_de_contactos');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final idUsuario = _i1.ColumnInt('idUsuario');

  final emailPrincipal = _i1.ColumnString('emailPrincipal');

  final emailSecundario = _i1.ColumnString('emailSecundario');

  final telefonoPrincipal = _i1.ColumnString('telefonoPrincipal');

  final telefonoSecundario = _i1.ColumnString('telefonoSecundario');

  final domicilioCalle = _i1.ColumnString('domicilioCalle');

  final domicilioNumero = _i1.ColumnString('domicilioNumero');

  final domicilioCiudad = _i1.ColumnString('domicilioCiudad');

  final domicilioCodigoPostal = _i1.ColumnString('domicilioCodigoPostal');

  final domicilioEstadoProvincia = _i1.ColumnString('domicilioEstadoProvincia');

  final domicilioPais = _i1.ColumnString('domicilioPais');

  final ultimaModificacion = _i1.ColumnDateTime('ultimaModificacion');

  final fechaCreacion = _i1.ColumnDateTime('fechaCreacion');

  @override
  List<_i1.Column> get columns => [
        id,
        idUsuario,
        emailPrincipal,
        emailSecundario,
        telefonoPrincipal,
        telefonoSecundario,
        domicilioCalle,
        domicilioNumero,
        domicilioCiudad,
        domicilioCodigoPostal,
        domicilioEstadoProvincia,
        domicilioPais,
        ultimaModificacion,
        fechaCreacion,
      ];
}

@Deprecated('Use InformacionDeContactoTable.t instead.')
InformacionDeContactoTable tInformacionDeContacto =
    InformacionDeContactoTable();
