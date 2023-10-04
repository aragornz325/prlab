/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

class Periodista extends _i1.TableRow {
  Periodista({
    int? id,
    required this.urlImagen,
    required this.nombres,
    required this.apellidos,
    required this.puesto,
    this.idPuesto,
    required this.medio,
    this.idMedio,
    required this.biografia,
    required this.temas,
    required this.email,
    required this.telefono,
    required this.ciudad,
    this.idCiudad,
    required this.pais,
    this.idPais,
    required this.idiomas,
    required this.redesSociales,
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
          .deserialize<String>(jsonSerialization['urlImagen']),
      nombres: serializationManager
          .deserialize<String>(jsonSerialization['nombres']),
      apellidos: serializationManager
          .deserialize<String>(jsonSerialization['apellidos']),
      puesto:
          serializationManager.deserialize<String>(jsonSerialization['puesto']),
      idPuesto:
          serializationManager.deserialize<int?>(jsonSerialization['idPuesto']),
      medio:
          serializationManager.deserialize<String>(jsonSerialization['medio']),
      idMedio:
          serializationManager.deserialize<int?>(jsonSerialization['idMedio']),
      biografia: serializationManager
          .deserialize<String>(jsonSerialization['biografia']),
      temas: serializationManager
          .deserialize<List<String>>(jsonSerialization['temas']),
      email:
          serializationManager.deserialize<String>(jsonSerialization['email']),
      telefono: serializationManager
          .deserialize<String>(jsonSerialization['telefono']),
      ciudad:
          serializationManager.deserialize<String>(jsonSerialization['ciudad']),
      idCiudad:
          serializationManager.deserialize<int?>(jsonSerialization['idCiudad']),
      pais: serializationManager.deserialize<String>(jsonSerialization['pais']),
      idPais:
          serializationManager.deserialize<int?>(jsonSerialization['idPais']),
      idiomas: serializationManager
          .deserialize<List<String>>(jsonSerialization['idiomas']),
      redesSociales: serializationManager
          .deserialize<List<_i2.RedSocial>>(jsonSerialization['redesSociales']),
      ultimaModificacion: serializationManager
          .deserialize<DateTime?>(jsonSerialization['ultimaModificacion']),
      activo:
          serializationManager.deserialize<bool?>(jsonSerialization['activo']),
      fechaCreacion: serializationManager
          .deserialize<DateTime?>(jsonSerialization['fechaCreacion']),
    );
  }

  static final t = PeriodistaTable();

  String urlImagen;

  String nombres;

  String apellidos;

  String puesto;

  int? idPuesto;

  String medio;

  int? idMedio;

  String biografia;

  List<String> temas;

  String email;

  String telefono;

  String ciudad;

  int? idCiudad;

  String pais;

  int? idPais;

  List<String> idiomas;

  List<_i2.RedSocial> redesSociales;

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
      'nombres': nombres,
      'apellidos': apellidos,
      'puesto': puesto,
      'medio': medio,
      'biografia': biografia,
      'temas': temas,
      'email': email,
      'telefono': telefono,
      'ciudad': ciudad,
      'pais': pais,
      'idiomas': idiomas,
      'redesSociales': redesSociales,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'urlImagen': urlImagen,
      'nombres': nombres,
      'apellidos': apellidos,
      'idPuesto': idPuesto,
      'idMedio': idMedio,
      'biografia': biografia,
      'email': email,
      'telefono': telefono,
      'idCiudad': idCiudad,
      'idPais': idPais,
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
      'nombres': nombres,
      'apellidos': apellidos,
      'puesto': puesto,
      'idPuesto': idPuesto,
      'medio': medio,
      'idMedio': idMedio,
      'biografia': biografia,
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
      case 'nombres':
        nombres = value;
        return;
      case 'apellidos':
        apellidos = value;
        return;
      case 'idPuesto':
        idPuesto = value;
        return;
      case 'idMedio':
        idMedio = value;
        return;
      case 'biografia':
        biografia = value;
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

  final nombres = _i1.ColumnString('nombres');

  final apellidos = _i1.ColumnString('apellidos');

  final idPuesto = _i1.ColumnInt('idPuesto');

  final idMedio = _i1.ColumnInt('idMedio');

  final biografia = _i1.ColumnString('biografia');

  final email = _i1.ColumnString('email');

  final telefono = _i1.ColumnString('telefono');

  final idCiudad = _i1.ColumnInt('idCiudad');

  final idPais = _i1.ColumnInt('idPais');

  final ultimaModificacion = _i1.ColumnDateTime('ultimaModificacion');

  final activo = _i1.ColumnBool('activo');

  final fechaCreacion = _i1.ColumnDateTime('fechaCreacion');

  @override
  List<_i1.Column> get columns => [
        id,
        urlImagen,
        nombres,
        apellidos,
        idPuesto,
        idMedio,
        biografia,
        email,
        telefono,
        idCiudad,
        idPais,
        ultimaModificacion,
        activo,
        fechaCreacion,
      ];
}

@Deprecated('Use PeriodistaTable.t instead.')
PeriodistaTable tPeriodista = PeriodistaTable();
