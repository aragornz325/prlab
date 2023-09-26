/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Periodista extends _i1.TableRow {
  Periodista({
    int? id,
    this.urlImagen,
    this.nombreCompleto,
    this.rol,
    this.idRol,
    this.medio,
    this.idMedio,
    this.bio,
    this.temas,
    this.email,
    this.telefono,
    this.ciudad,
    this.idCiudad,
    this.pais,
    this.idPais,
    this.idiomas,
    this.redesSociales,
    this.ultimaModificacion,
    this.activo,
    this.fechaCreacion,
  }) : super(id);

  factory Periodista.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Periodista(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      urlImagen: serializationManager
          .deserialize<String?>(jsonSerialization['urlImagen']),
      nombreCompleto: serializationManager
          .deserialize<String?>(jsonSerialization['nombreCompleto']),
      rol: serializationManager.deserialize<String?>(jsonSerialization['rol']),
      idRol: serializationManager.deserialize<int?>(jsonSerialization['idRol']),
      medio:
          serializationManager.deserialize<String?>(jsonSerialization['medio']),
      idMedio:
          serializationManager.deserialize<int?>(jsonSerialization['idMedio']),
      bio: serializationManager.deserialize<String?>(jsonSerialization['bio']),
      temas: serializationManager
          .deserialize<List<String>?>(jsonSerialization['temas']),
      email:
          serializationManager.deserialize<String?>(jsonSerialization['email']),
      telefono: serializationManager
          .deserialize<String?>(jsonSerialization['telefono']),
      ciudad: serializationManager
          .deserialize<String?>(jsonSerialization['ciudad']),
      idCiudad:
          serializationManager.deserialize<int?>(jsonSerialization['idCiudad']),
      pais:
          serializationManager.deserialize<String?>(jsonSerialization['pais']),
      idPais:
          serializationManager.deserialize<int?>(jsonSerialization['idPais']),
      idiomas: serializationManager
          .deserialize<List<String>?>(jsonSerialization['idiomas']),
      redesSociales: serializationManager
          .deserialize<String?>(jsonSerialization['redesSociales']),
      ultimaModificacion: serializationManager
          .deserialize<DateTime?>(jsonSerialization['ultimaModificacion']),
      activo:
          serializationManager.deserialize<bool?>(jsonSerialization['activo']),
      fechaCreacion: serializationManager
          .deserialize<DateTime?>(jsonSerialization['fechaCreacion']),
    );
  }

  static final t = PeriodistaTable();

  String? urlImagen;

  String? nombreCompleto;

  String? rol;

  int? idRol;

  String? medio;

  int? idMedio;

  String? bio;

  List<String>? temas;

  String? email;

  String? telefono;

  String? ciudad;

  int? idCiudad;

  String? pais;

  int? idPais;

  List<String>? idiomas;

  String? redesSociales;

  DateTime? ultimaModificacion;

  bool? activo;

  DateTime? fechaCreacion;

  @override
  String get tableName => 'periodistas';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'urlImagen': urlImagen,
      'nombreCompleto': nombreCompleto,
      'rol': rol,
      'idRol': idRol,
      'medio': medio,
      'idMedio': idMedio,
      'bio': bio,
      'temas': temas,
      'email': email,
      'telefono': telefono,
      'ciudad': ciudad,
      'idCiudad': idCiudad,
      'pais': pais,
      'idPais': idPais,
      'idiomas': idiomas,
      'redesSociales': redesSociales,
      'ultimaModificacion': ultimaModificacion,
      'activo': activo,
      'fechaCreacion': fechaCreacion,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'urlImagen': urlImagen,
      'nombreCompleto': nombreCompleto,
      'idRol': idRol,
      'idMedio': idMedio,
      'bio': bio,
      'email': email,
      'telefono': telefono,
      'idCiudad': idCiudad,
      'idPais': idPais,
      'redesSociales': redesSociales,
      'ultimaModificacion': ultimaModificacion,
      'activo': activo,
      'fechaCreacion': fechaCreacion,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'urlImagen': urlImagen,
      'nombreCompleto': nombreCompleto,
      'rol': rol,
      'idRol': idRol,
      'medio': medio,
      'idMedio': idMedio,
      'bio': bio,
      'temas': temas,
      'email': email,
      'telefono': telefono,
      'ciudad': ciudad,
      'idCiudad': idCiudad,
      'pais': pais,
      'idPais': idPais,
      'idiomas': idiomas,
      'redesSociales': redesSociales,
      'ultimaModificacion': ultimaModificacion,
      'activo': activo,
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
      case 'urlImagen':
        urlImagen = value;
        return;
      case 'nombreCompleto':
        nombreCompleto = value;
        return;
      case 'idRol':
        idRol = value;
        return;
      case 'idMedio':
        idMedio = value;
        return;
      case 'bio':
        bio = value;
        return;
      case 'email':
        email = value;
        return;
      case 'telefono':
        telefono = value;
        return;
      case 'idCiudad':
        idCiudad = value;
        return;
      case 'idPais':
        idPais = value;
        return;
      case 'redesSociales':
        redesSociales = value;
        return;
      case 'ultimaModificacion':
        ultimaModificacion = value;
        return;
      case 'activo':
        activo = value;
        return;
      case 'fechaCreacion':
        fechaCreacion = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Periodista>> find(
    _i1.Session session, {
    PeriodistaExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Periodista>(
      where: where != null ? where(Periodista.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Periodista?> findSingleRow(
    _i1.Session session, {
    PeriodistaExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Periodista>(
      where: where != null ? where(Periodista.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Periodista?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Periodista>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required PeriodistaExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Periodista>(
      where: where(Periodista.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Periodista row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Periodista row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Periodista row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    PeriodistaExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Periodista>(
      where: where != null ? where(Periodista.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef PeriodistaExpressionBuilder = _i1.Expression Function(PeriodistaTable);

class PeriodistaTable extends _i1.Table {
  PeriodistaTable() : super(tableName: 'periodistas');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final urlImagen = _i1.ColumnString('urlImagen');

  final nombreCompleto = _i1.ColumnString('nombreCompleto');

  final idRol = _i1.ColumnInt('idRol');

  final idMedio = _i1.ColumnInt('idMedio');

  final bio = _i1.ColumnString('bio');

  final email = _i1.ColumnString('email');

  final telefono = _i1.ColumnString('telefono');

  final idCiudad = _i1.ColumnInt('idCiudad');

  final idPais = _i1.ColumnInt('idPais');

  final redesSociales = _i1.ColumnString('redesSociales');

  final ultimaModificacion = _i1.ColumnDateTime('ultimaModificacion');

  final activo = _i1.ColumnBool('activo');

  final fechaCreacion = _i1.ColumnDateTime('fechaCreacion');

  @override
  List<_i1.Column> get columns => [
        id,
        urlImagen,
        nombreCompleto,
        idRol,
        idMedio,
        bio,
        email,
        telefono,
        idCiudad,
        idPais,
        redesSociales,
        ultimaModificacion,
        activo,
        fechaCreacion,
      ];
}

@Deprecated('Use PeriodistaTable.t instead.')
PeriodistaTable tPeriodista = PeriodistaTable();
