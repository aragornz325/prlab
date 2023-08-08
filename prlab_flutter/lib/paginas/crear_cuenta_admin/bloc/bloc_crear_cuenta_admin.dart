import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'bloc_crear_cuenta_admin_event.dart';
part 'bloc_crear_cuenta_admin_state.dart';

/// bloc principal de crear cuenta admin
class BlocCrearCuentaAdmin
    extends Bloc<BlocCrearCuentaAdminEvent, BlocCrearCuentaAdminState> {
  BlocCrearCuentaAdmin() : super(BlocCrearCuentaAdminStateSuccess()) {
    on<BlocCrearCuentaAdminEvent>((event, emit) {
    });
  }
}
