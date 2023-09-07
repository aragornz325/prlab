part of 'filtrador_de_periodistas.dart';

/// {@template _CampoDeTextoFiltrador}
/// Utilizado para algunos de los tipos de
/// filtrado que ofrece la página como el
/// filtrado por nombre de periodistas entre
/// otros.
/// {@endtemplate}
class _CampoDeTextoFiltrador extends StatelessWidget {
  /// {@macro _CampoDeTextoFiltrador}
  const _CampoDeTextoFiltrador({
    required this.controller,
    required this.hintText,
  });

  /// El controlador de campo de texto.
  final TextEditingController controller;

  /// El texto que se encuentra en el campo de texto
  /// cuando se encuentra vacío.
  final String hintText;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.pw,
        vertical: 20.ph,
      ),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search_rounded,
            size: 24.pw,
            color: colores.secondary,
          ),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.pw),
          ),
        ),
      ),
    );
  }
}
