part of 'bloc_crear_cuenta_admin.dart';

/// clase abstracta de los tipos de state/estados manejados por el bloc
/// BlocCrearCuentaAdmin
@immutable
abstract class BlocCrearCuentaAdminState extends Equatable {
  const BlocCrearCuentaAdminState();

  @override
  List<Object> get props => [];
}

/// state/estado `inicial` de BlocCrearCuentaAdmin
class BlocCrearCuentaAdminInitial extends BlocCrearCuentaAdminState {}

/// state/estado `exitoso` de BlocCrearCuentaAdmin
class BlocCrearCuentaAdminStateSuccess extends BlocCrearCuentaAdminState {}

/// state/estado de `error` de BlocCrearCuentaAdmin
class BlocCrearCuentaAdminStateError extends BlocCrearCuentaAdminState {}

/// state/estado `cargando` de BlocCrearCuentaAdmin
class BlocCrearCuentaAdminStateLoading extends BlocCrearCuentaAdminState {}
