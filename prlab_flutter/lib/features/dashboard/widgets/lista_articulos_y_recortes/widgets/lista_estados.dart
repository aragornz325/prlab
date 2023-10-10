import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_client/prlab_client.dart';
import 'package:prlab_flutter/extensiones/extension_tema.dart';

/// {@template CheckBoxYEtiquetaDeEstado}
/// Check box de PRLab y una etiqueta del nombre del estado establecido que
/// puede ser modificable
/// {@endtemplate}
class CheckBoxYEtiquetaDeEstado extends StatelessWidget {
  /// {@macro CheckBoxYEtiquetaDeEstado}
  const CheckBoxYEtiquetaDeEstado({
    required this.estado,
    required this.listaDeEntregables,
    required this.onChanged,
    required this.etiqueta,
    required this.colorCheckBox,
    super.key,
  });

  /// estado de los articulos
  final StEntregables estado;

  /// lista de los articulos
  final List<StEntregables> listaDeEntregables;

  /// cambia el valor dependiendo del estado
  final void Function(bool) onChanged;

  /// etiqueta del estado
  final String etiqueta;

  /// color del check box dependiendo del estado.
  final Color colorCheckBox;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return SizedBox(
      width: 80.pw,
      height: 50.ph,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PRLabCheckbox(
            estaMarcado: listaDeEntregables.contains(estado),
            onChanged: onChanged,
            colorBorde: colorCheckBox,
            colorMarcado: colorCheckBox,
            colorDesmarcado: colores.surfaceTint,
          ),
          SizedBox(width: 5.pw),
          Text(
            etiqueta,
            style: TextStyle(
              color: colores.tertiary,
              fontSize: 14.pf,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
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
    required this.estaMarcado,
    required this.onChanged,
    required this.colorBorde,
    required this.colorMarcado,
    required this.colorDesmarcado,
    super.key,
  });

  /// Verifica si esta seleccionado
  final bool estaMarcado;

  /// Es el cambio en el check box Cambia el valor pasado entre true o false
  final ValueChanged<bool> onChanged;

  /// color del border
  final Color colorBorde;

  /// color al estar seleccionado
  final Color colorMarcado;

  /// color del border cuando esta no seleccionado
  final Color colorDesmarcado;

  @override
  _PRLabCheckboxState createState() => _PRLabCheckboxState();
}

class _PRLabCheckboxState extends State<PRLabCheckbox> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.estaMarcado;
  }

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return InkWell(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
          widget.onChanged(_isChecked);
        });
      },
      child: Container(
        width: max(18.ph, 18.ph),
        height: max(18.ph, 18.ph),
        decoration: BoxDecoration(
          border: Border.all(color: widget.colorBorde, width: 2),
          color: _isChecked ? widget.colorMarcado : widget.colorDesmarcado,
          borderRadius: BorderRadius.circular(2.5.sw),
        ),
        child: _isChecked
            ? Icon(
                Icons.check_outlined,
                size: 15,
                color: colores.surfaceTint,
              )
            : null,
      ),
    );
  }
}
