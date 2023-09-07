part of 'filtrador_de_periodistas.dart';

/// {@template SeccionFiltradoPorPersonas}
/// Muestra una lista de filtros relacionados
/// con datos que tiene el periodista, este menú
/// aparece cuando seleccionas `People` en los
/// ítems del menu de [FiltradorDePeriodistas].
/// {@endtemplate}
class SeccionFiltradoPorPersonas extends StatefulWidget {
  /// {@macro SeccionFiltradoPorPersonas}
  const SeccionFiltradoPorPersonas({
    super.key,
  });

  @override
  State<SeccionFiltradoPorPersonas> createState() =>
      _SeccionFiltradoPorPersonasState();
}

class _SeccionFiltradoPorPersonasState
    extends State<SeccionFiltradoPorPersonas> {
  final _nombrePeriodistaController = TextEditingController();
  final _nombreMedioDeComunicacionController = TextEditingController();

  @override
  void dispose() {
    _nombrePeriodistaController.dispose();
    _nombreMedioDeComunicacionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      children: [
        // TODO(Andre):
        // Cuando este el bloc de la feature agregarle
        // funcionalidad a todos estos campos y tiles.
        _CampoDeTextoFiltrador(
          controller: _nombrePeriodistaController,
          hintText: l10n.pageMediaDatabaseHorizontalTextFieldJournalistName,
        ),
        const Divider(height: 0),
        _CampoDeTextoFiltrador(
          controller: _nombreMedioDeComunicacionController,
          hintText: l10n.pageMediaDatabaseHorizontalTextFieldMediaOutlet,
        ),
        const Divider(height: 0),
        TileConCheckBoxes(
          titulo: l10n.pageMediaDatabaseHorizontalFilterLabelCountry,
          onTapEliminarTodo: (_) {},
          onTapSeleccionarMasItems: (_) {},
          onTapEliminarItem: (_) {},
        ),
        TileConCheckBoxes(
          titulo: l10n.pageMediaDatabaseHorizontalFilterLabelCity,
          onTapEliminarTodo: (_) {},
          onTapSeleccionarMasItems: (_) {},
          onTapEliminarItem: (_) {},
        ),
        TileConCheckBoxes(
          titulo: l10n.pageMediaDatabaseHorizontalFilterLabelContactLanguage,
          onTapEliminarTodo: (_) {},
          onTapSeleccionarMasItems: (_) {},
          onTapEliminarItem: (_) {},
        ),
        TileConCheckBoxes(
          titulo: l10n.pageMediaDatabaseHorizontalFilterLabelTopic,
          onTapEliminarTodo: (_) {},
          onTapSeleccionarMasItems: (_) {},
          onTapEliminarItem: (_) {},
        ),
        TileConCheckBoxes(
          titulo: l10n.pageMediaDatabaseHorizontalFilterLabelRole,
          onTapEliminarTodo: (_) {},
          onTapSeleccionarMasItems: (_) {},
          onTapEliminarItem: (_) {},
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15.sh),
          child: PRBoton.esOutlined(
            onTap: () {
              showDialog<void>(
                context: context,
                builder: (_) => const PRDialogErrorNoDisponible(),
              );
            },
            texto: l10n.pageMediaDatabaseHorizontalFilterButtomButton,
            fontSize: 15.pf,
            fontWeight: FontWeight.w500,
            estaHabilitado: true,
            height: 30.sh,
            width: 100.pw,
          ),
        ),
      ],
    );
  }
}
