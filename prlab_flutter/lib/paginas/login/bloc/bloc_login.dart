import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'bloc_login_event.dart';
part 'bloc_login_state.dart';

///Bloc que maneja los estados o logica de la pagina de login
class BlocLogin extends Bloc<BlocLoginEvent, BlocLoginState> {
  BlocLogin()
      : super(
          const BlocLoginStateInitial(),
        ) {
    on<BlocLoginIniciarSessionEvent>(_iniciarSesion);
  }

  Future<void> _iniciarSesion(
    BlocLoginIniciarSessionEvent event,
    Emitter<BlocLoginState> emit,
  ) async {
    emit(const BlocLoginStateLoading());
    try {
      emit(const BlocLoginStateSuccess());
    } catch (e) {
      //TODO(Gon): Agregar mensaje de error cuando se agregue la funcionalidad
      emit(const BlocLoginStateError(errorMessage: ''));
    }
  }
}
