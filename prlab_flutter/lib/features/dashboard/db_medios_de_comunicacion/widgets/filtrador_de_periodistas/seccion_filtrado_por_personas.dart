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

    return BlocBuilder<BlocDbMediosDeComunicacion,
        BlocDbMediosDeComunicacionEstado>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // TODO(Andre):
                    // Cuando este el bloc de la feature agregarle
                    // funcionalidad a todos estos campos y tiles.
                    _CampoDeTextoFiltrador(
                      controller: _nombrePeriodistaController,
                      hintText: l10n
                          .pageMediaDatabaseHorizontalTextFieldJournalistName,
                    ),
                    const Divider(height: 0),
                    _CampoDeTextoFiltrador(
                      controller: _nombreMedioDeComunicacionController,
                      hintText:
                          l10n.pageMediaDatabaseHorizontalTextFieldMediaOutlet,
                    ),
                    const Divider(height: 0),
                    TileConCheckBoxes<Filtro>(
                      titulo:
                          l10n.pageMediaDatabaseHorizontalFilterLabelCountry,
                      listaDeItems: state.itemPaises,
                      onTapEliminarTodo: (value) {
                        context.read<BlocDbMediosDeComunicacion>().add(
                              BlocDbMediosDeComunicacionEventoActualizarFiltros(
                                paises: state.paises.deseleccionarFiltros(
                                  value,
                                ),
                              ),
                            );
                      },
                      onTapAplicarNuevaSeleccion: (value) {
                        context.read<BlocDbMediosDeComunicacion>().add(
                              BlocDbMediosDeComunicacionEventoActualizarFiltros(
                                paises: value.listaDeFiltros,
                              ),
                            );
                      },
                      onTapEliminarItem: (item) {
                        context.read<BlocDbMediosDeComunicacion>().add(
                              BlocDbMediosDeComunicacionEventoActualizarFiltros(
                                paises:
                                    state.paises.deseleccionarFiltros([item]),
                              ),
                            );
                      },
                    ),
                    TileConCheckBoxes<Filtro>(
                      titulo: l10n.pageMediaDatabaseHorizontalFilterLabelCity,
                      listaDeItems: state.itemCiudades,
                      onTapEliminarTodo: (value) {
                        context.read<BlocDbMediosDeComunicacion>().add(
                              BlocDbMediosDeComunicacionEventoActualizarFiltros(
                                ciudades: state.ciudades.deseleccionarFiltros(
                                  value,
                                ),
                              ),
                            );
                      },
                      onTapAplicarNuevaSeleccion: (value) {
                        context.read<BlocDbMediosDeComunicacion>().add(
                              BlocDbMediosDeComunicacionEventoActualizarFiltros(
                                ciudades: value.listaDeFiltros,
                              ),
                            );
                      },
                      onTapEliminarItem: (item) {
                        context.read<BlocDbMediosDeComunicacion>().add(
                              BlocDbMediosDeComunicacionEventoActualizarFiltros(
                                ciudades:
                                    state.ciudades.deseleccionarFiltros([item]),
                              ),
                            );
                      },
                    ),
                    TileConCheckBoxes<Filtro>(
                      titulo: l10n
                          .pageMediaDatabaseHorizontalFilterLabelContactLanguage,
                      listaDeItems: state.itemLenguajes,
                      onTapEliminarTodo: (value) {
                        context.read<BlocDbMediosDeComunicacion>().add(
                              BlocDbMediosDeComunicacionEventoActualizarFiltros(
                                lenguajes: state.lenguajes.deseleccionarFiltros(
                                  value,
                                ),
                              ),
                            );
                      },
                      onTapAplicarNuevaSeleccion: (value) {
                        context.read<BlocDbMediosDeComunicacion>().add(
                              BlocDbMediosDeComunicacionEventoActualizarFiltros(
                                lenguajes: value.listaDeFiltros,
                              ),
                            );
                      },
                      onTapEliminarItem: (item) {
                        context.read<BlocDbMediosDeComunicacion>().add(
                              BlocDbMediosDeComunicacionEventoActualizarFiltros(
                                lenguajes: state.lenguajes
                                    .deseleccionarFiltros([item]),
                              ),
                            );
                      },
                    ),
                    TileConCheckBoxes<Filtro>(
                      titulo: l10n.pageMediaDatabaseHorizontalFilterLabelTopic,
                      listaDeItems: state.itemTemas,
                      onTapEliminarTodo: (value) {
                        context.read<BlocDbMediosDeComunicacion>().add(
                              BlocDbMediosDeComunicacionEventoActualizarFiltros(
                                temas: state.temas.deseleccionarFiltros(
                                  value,
                                ),
                              ),
                            );
                      },
                      onTapAplicarNuevaSeleccion: (value) {
                        context.read<BlocDbMediosDeComunicacion>().add(
                              BlocDbMediosDeComunicacionEventoActualizarFiltros(
                                temas: value.listaDeFiltros,
                              ),
                            );
                      },
                      onTapEliminarItem: (item) {
                        context.read<BlocDbMediosDeComunicacion>().add(
                              BlocDbMediosDeComunicacionEventoActualizarFiltros(
                                temas: state.temas.deseleccionarFiltros([item]),
                              ),
                            );
                      },
                    ),
                    TileConCheckBoxes<Filtro>(
                      titulo:
                          l10n.pageMediaDatabaseHorizontalFilterLabelMediaType,
                      listaDeItems: state.itemTipoDeMedio,
                      onTapEliminarTodo: (value) {
                        context.read<BlocDbMediosDeComunicacion>().add(
                              BlocDbMediosDeComunicacionEventoActualizarFiltros(
                                temas: state.tipoDeMedio.deseleccionarFiltros(
                                  value,
                                ),
                              ),
                            );
                      },
                      onTapAplicarNuevaSeleccion: (value) {
                        context.read<BlocDbMediosDeComunicacion>().add(
                              BlocDbMediosDeComunicacionEventoActualizarFiltros(
                                temas: value.listaDeFiltros,
                              ),
                            );
                      },
                      onTapEliminarItem: (item) {
                        context.read<BlocDbMediosDeComunicacion>().add(
                              BlocDbMediosDeComunicacionEventoActualizarFiltros(
                                tipoDeMedio: state.tipoDeMedio
                                    .deseleccionarFiltros([item]),
                              ),
                            );
                      },
                    ),
                    TileConCheckBoxes<Filtro>(
                      titulo: l10n.pageMediaDatabaseHorizontalFilterLabelRole,
                      listaDeItems: state.itemRoles,
                      onTapEliminarTodo: (value) {
                        context.read<BlocDbMediosDeComunicacion>().add(
                              BlocDbMediosDeComunicacionEventoActualizarFiltros(
                                roles: state.roles.deseleccionarFiltros(
                                  value,
                                ),
                              ),
                            );
                      },
                      onTapAplicarNuevaSeleccion: (value) {
                        context.read<BlocDbMediosDeComunicacion>().add(
                              BlocDbMediosDeComunicacionEventoActualizarFiltros(
                                roles: value.listaDeFiltros,
                              ),
                            );
                      },
                      onTapEliminarItem: (item) {
                        context.read<BlocDbMediosDeComunicacion>().add(
                              BlocDbMediosDeComunicacionEventoActualizarFiltros(
                                roles: state.roles.deseleccionarFiltros([item]),
                              ),
                            );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const Divider(height: 0),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.sh),
              child: PRBoton.esOutlined(
                onTap: () => const PRDialogErrorNoDisponible().show(context),
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
      },
    );
  }
}

extension DeseleccionarFiltros on List<Filtro> {
  /// Sirve para deseleccionar los filtros que se le pase por parámetro.
  ///
  /// Agarra una lista de filtros e itera por cada uno de los
  /// componentes de la lista actual, si algún componente de la lista
  /// es igual al objeto que se esta iterando, se reemplaza la instancia
  /// de [Filtro] por una nueva con el valor de `estaSeleccionado` en false.
  List<Filtro> deseleccionarFiltros(List<Filtro> filtros) {
    return map(
      (filtro) {
        return filtros.contains(filtro)
            ? Filtro(
                etiqueta: filtro.etiqueta,
                estaSeleccionado: false,
              )
            : filtro;
      },
    ).toList();
  }
}

extension TransformarAListaDeFiltros on List<Item<Filtro>> {
  /// Transforma la lista a una lista de [Filtro].
  List<Filtro> get listaDeFiltros => map(
        (e) => Filtro(
          etiqueta: e.etiqueta,
          estaSeleccionado: e.estaSeleccionado,
        ),
      ).toList();
}
