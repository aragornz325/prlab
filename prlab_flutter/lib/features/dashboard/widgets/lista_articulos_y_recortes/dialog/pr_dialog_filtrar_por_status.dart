import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/widgets/lista_articulos_y_recortes/bloc/bloc_lista_articulos_y_recortes.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

/// {@template PrDialogFiltrarPorStatus}
/// Es el Dialog que muestra el filtrado de los articulos por status
/// para filtrar ciertos Articulos en particular
/// {@endtemplate}
class PrDialogFiltrarPorStatus extends StatelessWidget {
  /// {@macro PrDialogFiltrarPorStatus}
  const PrDialogFiltrarPorStatus({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final colores = context.colores;

    return PRDialog.informacion(
      context: context,
      height: 350,
      onTap: () {
        // TODO(anyone): agregarle funcionalidad.
        Navigator.of(context).pop();
        // Muestra el popup de esta feature estará disponible en otra version
        showDialog<void>(
          context: context,
          builder: (context) => const PRDialogErrorNoDisponible(),
        );
      },
      titulo: l10n.commonAlertDialogFilterByStatus,
      botonText: l10n.commonApply,
      content: SizedBox(
        width: 300.pw,
        child: BlocBuilder<BlocListaArticulosYRecortes,
            BlocListaArticulosYRecortesEstado>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PRLabCheckbox(
                  isChecked: state.borrador,
                  onChanged: (value) {
                    context.read<BlocListaArticulosYRecortes>().add(
                          BlocListaArticulosYRecortesEventoFiltradoPorEstado(
                            borrador: value,
                          ),
                        );
                  },
                  borderColor: colores.secondary,
                  checkedColor: colores.secondary,
                  uncheckedColor: colores.surfaceTint,
                ),
                SizedBox(width: 5.pw),
                Text(
                  // TODO(mati): hacer l10n, pero todavia no esta del todo definido los estado a filtrar
                  'Draft',
                  style: TextStyle(
                    color: colores.tertiary,
                    fontSize: 14.pf,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 20.pw),
                PRLabCheckbox(
                  isChecked: state.comentario,
                  onChanged: (value) {
                    context.read<BlocListaArticulosYRecortes>().add(
                          BlocListaArticulosYRecortesEventoFiltradoPorEstado(
                            comentario: value,
                          ),
                        );
                  },
                  borderColor: colores.onTertiary,
                  checkedColor: colores.onTertiary,
                  uncheckedColor: colores.surfaceTint,
                ),
                SizedBox(width: 5.pw),
                Text(
                  // TODO(mati): hacer l10n, pero todavia no esta del todo definido los estado a filtrar
                  'Feedback',
                  style: TextStyle(
                    color: colores.tertiary,
                    fontSize: 14.pf,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 20.pw),
                PRLabCheckbox(
                  isChecked: state.completo,
                  onChanged: (value) {
                    context.read<BlocListaArticulosYRecortes>().add(
                          BlocListaArticulosYRecortesEventoFiltradoPorEstado(
                            completo: value,
                          ),
                        );
                  },
                  borderColor: colores.onTertiaryContainer,
                  checkedColor: colores.onTertiaryContainer,
                  uncheckedColor: colores.surfaceTint,
                ),
                SizedBox(width: 5.pw),
                Text(
                  // TODO(mati): hacer l10n, pero todavia no esta del todo definido los estado a filtrar
                  'Complete',
                  style: TextStyle(
                    color: colores.tertiary,
                    fontSize: 14.pf,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

/// {@template CustomCheckbox}
/// Check box de PRLab custom como un check box para usar
/// {@endtemplate}
class PRLabCheckbox extends StatefulWidget {
  /// {@macro CustomCheckbox}
  const PRLabCheckbox({
    required this.isChecked,
    required this.onChanged,
    required this.borderColor,
    required this.checkedColor,
    required this.uncheckedColor,
    super.key,
  });

  /// Verifica si esta seleccionado
  final bool isChecked;

  /// Es el cambio en el check box Cambia el valor pasado entre true o false
  final ValueChanged<bool> onChanged;

  /// color del border
  final Color borderColor;

  /// color al estar seleccionado
  final Color checkedColor;

  /// color del border cuando esta no seleccionado
  final Color uncheckedColor;

  @override
  _PRLabCheckboxState createState() => _PRLabCheckboxState();
}

class _PRLabCheckboxState extends State<PRLabCheckbox> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return InkWell(
      onTap: () {
        setState(() {
          //no quiero hacer un bloc para esto :D
          _isChecked = !_isChecked;
          widget.onChanged(_isChecked);
        });
      },
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          border: Border.all(color: widget.borderColor, width: 2),
          color: _isChecked ? widget.checkedColor : widget.uncheckedColor,
          borderRadius: BorderRadius.circular(2.5),
        ),
        child: _isChecked
            ? Icon(
                Icons.check,
                size: 18,
                color: colores.surfaceTint,
              )
            : null,
      ),
    );
  }
}
