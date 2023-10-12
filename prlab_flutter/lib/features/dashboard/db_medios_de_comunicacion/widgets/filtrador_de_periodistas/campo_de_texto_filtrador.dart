part of 'filtrador_de_periodistas.dart';

/// {@template _CampoDeTextoFiltrador}
/// Utilizado para algunos de los tipos de
/// filtrado que ofrece la página como el
/// filtrado por nombre de periodistas entre
/// otros.
/// {@endtemplate}
class _CampoDeTextoFiltrador extends StatefulWidget {
  /// {@macro _CampoDeTextoFiltrador}
  const _CampoDeTextoFiltrador({
    required this.controller,
    required this.hintText,
    required this.onChanged,
  });

  /// El controlador de campo de texto.
  final TextEditingController controller;

  /// El texto que se encuentra en el campo de texto
  /// cuando se encuentra vacío.
  final String hintText;

  /// Devuelve el valor del campo de texto
  final void Function(String)? onChanged;

  @override
  State<_CampoDeTextoFiltrador> createState() => _CampoDeTextoFiltradorState();
}

class _CampoDeTextoFiltradorState extends State<_CampoDeTextoFiltrador> {
  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.pw,
        vertical: 20.ph,
      ),
      child: TextField(
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search_rounded,
            size: 24.pw,
            color: colores.secondary,
          ),
          hintText: widget.hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.sw),
          ),
        ),
      ),
    );
  }
}
