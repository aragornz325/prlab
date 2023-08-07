import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_flutter/paginas/registro/bloc/bloc_registro_event.dart';
import 'package:prlab_flutter/paginas/registro/bloc/bloc_registro_state.dart';

class BlocRegistro extends Bloc<BlocRegistroEvent, BlocRegistroState> {
  BlocRegistro()
      : super(
          const BlocRegistroStateInicial(),
        );
}
