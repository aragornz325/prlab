import 'package:flutter/material.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/paginas/registro/bloc/bloc_registro_state.dart';

/// Funcion que devuelve el mensaje de error traducido al idioma adecuado.
String obtenerErroresDeRegistro(
  BuildContext context,
  MensajesDeErrorRegistro loginErrorMessages,
) {
  final l10n = context.l10n;
  return switch (loginErrorMessages) {
    MensajesDeErrorRegistro.credencialesInvalidas =>
      'User  ya registrado', // TODO(sam): revisar mensajes de error
    MensajesDeErrorRegistro.usuarioNoEncontrado => l10n.alertDialogCodeIn,
  };
}

// TODO(Sam): Reemplazar esta funcion por el nuevo handleo de errores del back 

 
