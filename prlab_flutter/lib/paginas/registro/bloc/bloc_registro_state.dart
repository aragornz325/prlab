// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class BlocRegistroState extends Equatable {
  const BlocRegistroState();

  @override
  List<Object> get props => [];

  BlocRegistroState copyWith({
    bool? isValid,
    String? errorMessage,
  }) {
    return const BlocRegistroState();
  }
}

class BlocRegistroStateInicial extends BlocRegistroState {
  const BlocRegistroStateInicial() : super();
}
