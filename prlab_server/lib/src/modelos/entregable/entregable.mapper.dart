// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'entregable.dart';

class EntregableMapper extends ClassMapperBase<Entregable> {
  EntregableMapper._();

  static EntregableMapper? _instance;
  static EntregableMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EntregableMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Entregable';

  static int _$id(Entregable v) => v.id;
  static const Field<Entregable, int> _f$id = Field('id', _$id);
  static int _$idProyecto(Entregable v) => v.idProyecto;
  static const Field<Entregable, int> _f$idProyecto =
      Field('idProyecto', _$idProyecto);
  static String _$titulo(Entregable v) => v.titulo;
  static const Field<Entregable, String> _f$titulo = Field('titulo', _$titulo);
  static List<int> _$subEntregables(Entregable v) => v.subEntregables;
  static const Field<Entregable, List<int>> _f$subEntregables =
      Field('subEntregables', _$subEntregables);
  static DateTime _$fechaCreacion(Entregable v) => v.fechaCreacion;
  static const Field<Entregable, DateTime> _f$fechaCreacion =
      Field('fechaCreacion', _$fechaCreacion);

  @override
  final Map<Symbol, Field<Entregable, dynamic>> fields = const {
    #id: _f$id,
    #idProyecto: _f$idProyecto,
    #titulo: _f$titulo,
    #subEntregables: _f$subEntregables,
    #fechaCreacion: _f$fechaCreacion,
  };

  static Entregable _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('Entregable');
  }

  @override
  final Function instantiate = _instantiate;

  static Entregable fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Entregable>(map));
  }

  static Entregable fromJson(String json) {
    return _guard((c) => c.fromJson<Entregable>(json));
  }
}

mixin EntregableMappable {
  String toJson();
  Map<String, dynamic> toMap();
  EntregableCopyWith<Entregable, Entregable, Entregable> get copyWith;
}

abstract class EntregableCopyWith<$R, $In extends Entregable, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get subEntregables;
  $R call(
      {int? id,
      int? idProyecto,
      String? titulo,
      List<int>? subEntregables,
      DateTime? fechaCreacion});
  EntregableCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}
