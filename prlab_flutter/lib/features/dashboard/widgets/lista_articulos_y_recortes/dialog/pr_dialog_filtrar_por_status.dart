import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

// TODO(mati): hacer documentacion
class PrDialogFiltrarPorStatus extends StatefulWidget {
// TODO(mati): hacer documentacion
  const PrDialogFiltrarPorStatus({super.key});

  @override
  State<PrDialogFiltrarPorStatus> createState() =>
      _PrDialogFiltrarPorStatusState();
}

class _PrDialogFiltrarPorStatusState extends State<PrDialogFiltrarPorStatus> {
  bool isDraftSelected = false;
  bool isFeedbackSelected = false;
  bool isCompleteSelected = false;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final colores = context.colores;

    return PRDialog.informacion(
      context: context,
      onTap: () {
        // TODO(anyone): agregarle funcionalidad.
      },
      titulo: l10n.commonAlertDialogFilterByAuthor,
      botonText: l10n.commonApply,
      content: SizedBox(
        width: 300.pw,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomCheckbox(
              isChecked: isDraftSelected,
              onChanged: (value) {
                setState(() {
                  isDraftSelected = value;
                });
              },
              borderColor: colores.secondary,
              checkedColor: colores.secondary,
              uncheckedColor: Colors.white,
            ),
            SizedBox(width: 5.pw),
            Text('Draft'),
            SizedBox(width: 20.pw),
            CustomCheckbox(
              isChecked: isFeedbackSelected,
              onChanged: (value) {
                setState(() {
                  isFeedbackSelected = value;
                });
              },
              borderColor: Color(0xffFF9E0D),
              checkedColor: Color(0xffFF9E0D),
              uncheckedColor: Colors.white,
            ),
            SizedBox(width: 5.pw),
            Text('Feedback'),
            SizedBox(width: 20.pw),
            CustomCheckbox(
              isChecked: isCompleteSelected,
              onChanged: (value) {
                setState(() {
                  isCompleteSelected = value;
                });
              },
              borderColor: Color(0xff1FDE00),
              checkedColor: Color(0xff1FDE00),
              uncheckedColor: Colors.white,
            ),
            SizedBox(width: 5.pw),
            Text('Complete'),
          ],
        ),
      ),
    );
  }
}

// TODO(mati): hacer documentacion
class CustomCheckbox extends StatefulWidget {
// TODO(mati): hacer documentacion
  final bool isChecked;
  final ValueChanged<bool> onChanged;
  final Color borderColor;
  final Color checkedColor;
  final Color uncheckedColor;

  const CustomCheckbox({
    required this.isChecked,
    required this.onChanged,
    required this.borderColor,
    required this.checkedColor,
    required this.uncheckedColor,
  });

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
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
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
