import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'bloc_crear_cuenta_admin_event.dart';
part 'bloc_crear_cuenta_admin_state.dart';

/// bloc principal de crear cuenta admin
class BlocCrearCuentaAdmin
    extends Bloc<BlocCrearCuentaAdminEvent, BlocCrearCuentaAdminState> {
  BlocCrearCuentaAdmin() : super(BlocCrearCuentaAdminInitial()) {
    on<BlocCrearCuentaAdminEventEnviarEmail>(_onEnviarEmail);
    on<BlocCrearCuentaAdminEventVerificarEmail>(_onVerificarEmail);
  }

  /// Funcion que envia el email ingresado al back para crear una
  /// nueva `Admin`
  Future<void> _onEnviarEmail(
    BlocCrearCuentaAdminEventEnviarEmail event,
    Emitter<BlocCrearCuentaAdminState> emit,
  ) async {
    emit(BlocCrearCuentaAdminStateLoading());
    try {
      //TODO: implementar la funcion de enviar el email
      emit(const BlocCrearCuentaAdminStateSuccessEmailEnviado());
    } catch (e, st) {
      //TODO: Agregar mensaje de error cuando se agregue la funcionalidad
      emit(
        const BlocCrearCuentaAdminStateError(
          errorMessage: 'Error al enviar el email',
        ),
      );
      if (kDebugMode) {
        emit(
          BlocCrearCuentaAdminStateError(
            errorMessage: 'Error: $e St: $st',
          ),
        );
      }
    }
  }

  /// Funcion que cambia el booleano del emailValido con la cual cambiamos el
  /// color del boton y podemos enviar el email
  Future<void> _onVerificarEmail(
    BlocCrearCuentaAdminEventVerificarEmail event,
    Emitter<BlocCrearCuentaAdminState> emit,
  ) async {
    try {
      emit(BlocCrearCuentaAdminStateSuccess(emailValido: event.emailValido));
    } catch (e, st) {
      emit(
        const BlocCrearCuentaAdminStateError(
          errorMessage: 'Error al cambiar el email valido',
        ),
      );
      if (kDebugMode) {
        emit(
          BlocCrearCuentaAdminStateError(
            errorMessage: 'Error: $e St: $st',
          ),
        );
      }
    }
  }
}
