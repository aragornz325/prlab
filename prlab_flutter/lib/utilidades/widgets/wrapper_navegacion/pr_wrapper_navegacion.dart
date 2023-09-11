import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/utilidades/widgets/appbar/appbar.dart';
import 'package:prlab_flutter/utilidades/widgets/drawer/drawer.dart';

/// {@template PRWrapperNavegacion}
/// Componente de navegacion que contiene drawer y appbar
/// {@endtemplate}
class PRWrapperNavegacion extends StatelessWidget {
  /// {@macro PRWrapperNavegacion}

  const PRWrapperNavegacion({
    required this.body,
    required this.onTap,
    super.key,
  });

  /// Widget que recibira para mostrar el contenido de la screen.
  final Widget body;

  /// Función al ser seleccionado cualquier item de PRAppBar
  final void Function(MenuDeOpciones) onTap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const PrDrawer(),
          SizedBox(width: 30.pw),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PRAppBar(onTap: onTap),
                Expanded(child: body),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
