import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/pr_dropdown.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

/// {@template PrDialogFiltrarPorStatus}
/// Dialog para filtrar por autor de ciertos articulos
/// {@endtemplate}
class PrDialogFiltrarPorAutor extends StatefulWidget {
  /// {@macro PrDialogFiltrarPorStatus}
  const PrDialogFiltrarPorAutor({super.key});

  @override
  State<PrDialogFiltrarPorAutor> createState() =>
      _PrDialogFiltrarPorAutorState();
}

class _PrDialogFiltrarPorAutorState extends State<PrDialogFiltrarPorAutor> {
  int itemSeleccionado = -1;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final colores = context.colores;
    // TODO(anyone): Cambiar esta lista de ejemplo por la lista de datos reales
    // lista de usuarios por la cual se pueda filtrar
    final opcionesDropdown = [
      PRDropdownOption<int>(
        title: 'John Smith',
        value: 0,
        itemHeight: 35.ph,
        textStyle: TextStyle(
          color: colores.tertiary,
          fontSize: 14.pf,
        ),
        preffixIcon: Icon(
          Icons.circle,
          color: colores.outline,
          size: 24.pw,
        ),
      ),
      PRDropdownOption<int>(
        title: 'Martin Clark',
        value: 1,
        itemHeight: 35.ph,
        textStyle: TextStyle(
          color: colores.tertiary,
          fontSize: 14.pf,
        ),
        preffixIcon: Icon(
          Icons.circle,
          color: colores.outline,
          size: 24.pw,
        ),
      ),
      PRDropdownOption<int>(
        title: 'Guillermo Bianchi',
        value: 2,
        itemHeight: 35.ph,
        textStyle: TextStyle(
          color: colores.tertiary,
          fontSize: 14.pf,
        ),
        preffixIcon: Icon(
          Icons.circle,
          color: colores.outline,
          size: 24.pw,
        ),
      ),
      PRDropdownOption<int>(
        title: 'Nicolás Rodsevich',
        value: 3,
        itemHeight: 35.ph,
        textStyle: TextStyle(
          color: colores.tertiary,
          fontSize: 14.pf,
        ),
        preffixIcon: Icon(
          Icons.circle,
          color: colores.outline,
          size: 24.pw,
        ),
      ),
    ];
    return PRDialog.solicitudAccion(
      tituloDelBoton: l10n.commonApply,
      tieneAlturaMinima: false,
      context: context, width: 214.pw,
      onTap: () {
        // TODO(anyone): agregarle funcionalidad.
        showDialog<void>(
          context: context,
          builder: (context) => const PRDialogErrorNoDisponible(),
        );
      },
      titulo: l10n.commonAlertDialogFilterByAuthor,
      // TODO(anyone): Hacer que se puedan seleccionar varios en el dropdown
      content: PRDropdown<int>(
        isValid: true,
        height: opcionesDropdown.length * 55.ph,
        hintText: l10n.commonChooseAnAuthor,
        hintStyle: TextStyle(
          color: colores.secondary,
          fontSize: 15.pf,
        ),
        icon: Icon(
          Icons.person_outline,
          color: colores.primary,
          size: 20.pw,
        ),
        value: itemSeleccionado,
        valueText: itemSeleccionado == -1
            ? l10n.commonChooseFromTheList
            : opcionesDropdown[itemSeleccionado].title,
        notExpandedHeight: 50.ph,
        width: 412.pw,
        onChanged: (value) {
          itemSeleccionado = value;
          setState(() {});
        },
        items: opcionesDropdown,
      ),
    );
  }
}
