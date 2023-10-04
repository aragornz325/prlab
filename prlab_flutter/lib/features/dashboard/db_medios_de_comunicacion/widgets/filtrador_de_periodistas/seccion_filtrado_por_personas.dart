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
  /// Controlador del campo de texto de nombre del periodista
  final _nombrePeriodistaController = TextEditingController();

  /// Controlador del campo de texto de nombre del medio
  final _nombreMedioDeComunicacionController = TextEditingController();

  /// Genera una espera antes guardar la nueva data del titulo
  /// en la db para mejorar la performance.
  Timer? _debounce;

  @override
  void dispose() {
    _nombrePeriodistaController.dispose();
    _nombreMedioDeComunicacionController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final textoContactLanguage =
        l10n.pageMediaDatabaseHorizontalFilterLabelContactLanguage;

    return BlocBuilder<BlocDbMediosDeComunicacion,
        BlocDbMediosDeComunicacionEstado>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _CampoDeTextoFiltrador(
                      onChanged: (nombre) {
                        if (_debounce?.isActive ?? false) _debounce?.cancel();

                        _debounce =
                            Timer(const Duration(milliseconds: 500), () {
                          context.read<BlocDbMediosDeComunicacion>().add(
                                BlocDbMediosDeComunicacionEventoActualizarFiltros(
                                  nombrePeriodista: nombre,
                                ),
                              );
                        });
                      },
                      controller: _nombrePeriodistaController,
                      hintText: l10n
                          .pageMediaDatabaseHorizontalTextFieldJournalistName,
                    ),
                    const Divider(height: 0),
                    _CampoDeTextoFiltrador(
                      onChanged: (nombreMedio) {
                        if (_debounce?.isActive ?? false) _debounce?.cancel();

                        _debounce =
                            Timer(const Duration(milliseconds: 500), () {
                          context.read<BlocDbMediosDeComunicacion>().add(
                                BlocDbMediosDeComunicacionEventoActualizarFiltros(
                                  nombreDeMedio: nombreMedio,
                                ),
                              );
                        });
                      },
                      controller: _nombreMedioDeComunicacionController,
                      hintText:
                          l10n.pageMediaDatabaseHorizontalTextFieldMediaOutlet,
                    ),
                    const Divider(height: 0),
                    ListaDeTiles(
                      l10n: l10n,
                      textoContactLanguage: textoContactLanguage,
                    ),
                  ],
                ),
              ),
            ),
            const Divider(height: 0),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.ph),
              child: PRBoton.esOutlined(
                onTap: () => const PRDialogErrorNoDisponible().show(context),
                texto: l10n.pageMediaDatabaseHorizontalFilterButtomButton,
                fontSize: 15.pf,
                fontWeight: FontWeight.w500,
                estaHabilitado: true,
                height: max(30.ph, 30.sh),
                width: 100.pw,
              ),
            ),
          ],
        );
      },
    );
  }
}

class ListaDeTiles extends StatelessWidget {
  const ListaDeTiles({
    required this.l10n,
    required this.textoContactLanguage,
    super.key,
  });

  final AppLocalizations l10n;
  final String textoContactLanguage;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocDbMediosDeComunicacion,
        BlocDbMediosDeComunicacionEstado>(
      builder: (context, state) {
        if (state is BlocDbMediosDeComunicacionEstadoCargandoFiltros) {
          return SizedBox(
            height: 250.ph,
            child: const Center(child: CircularProgressIndicator()),
          );
        }
        return Column(
          children: [
            TileConCheckBoxes<CategoriaFiltroSeleccionable>(
              titulo: l10n.pageMediaDatabaseHorizontalFilterLabelCountry,
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
                context.read<BlocDbMediosDeComunicacion>().add(
                      BlocDbMediosDeComunicacionEventoObtenerListadoDeFiltros(),
                    );
              },
              onTapEliminarItem: (item) {
                context.read<BlocDbMediosDeComunicacion>().add(
                      BlocDbMediosDeComunicacionEventoActualizarFiltros(
                        paises: state.paises.deseleccionarFiltros([item]),
                      ),
                    );
              },
            ),
            TileConCheckBoxes<CategoriaFiltroSeleccionable>(
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
                        ciudades: state.ciudades.deseleccionarFiltros([item]),
                      ),
                    );
              },
            ),
            TileConCheckBoxes<CategoriaFiltroSeleccionable>(
              titulo: textoContactLanguage,
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
                        lenguajes: state.lenguajes.deseleccionarFiltros([item]),
                      ),
                    );
              },
            ),
            TileConCheckBoxes<CategoriaFiltroSeleccionable>(
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
            TileConCheckBoxes<CategoriaFiltroSeleccionable>(
              titulo: l10n.pageMediaDatabaseHorizontalFilterLabelMediaType,
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
                        tipoDeMedio:
                            state.tipoDeMedio.deseleccionarFiltros([item]),
                      ),
                    );
              },
            ),
            TileConCheckBoxes<CategoriaFiltroSeleccionable>(
              titulo: l10n.pageMediaDatabaseHorizontalFilterLabelRole,
              listaDeItems: state.itemRoles,
              onTapEliminarTodo: (value) {
                context.read<BlocDbMediosDeComunicacion>().add(
                      BlocDbMediosDeComunicacionEventoActualizarFiltros(
                        roles: state.puestos.deseleccionarFiltros(
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
                        roles: state.puestos.deseleccionarFiltros([item]),
                      ),
                    );
              },
            ),
          ],
        );
      },
    );
  }
}

extension DeseleccionarFiltros<T extends CategoriaFiltroSeleccionable>
    on List<T> {
  /// Sirve para deseleccionar los filtros que se le pase por parámetro.
  ///
  /// Agarra una lista de filtros e itera por cada uno de los
  /// componentes de la lista actual, si algún componente de la lista
  /// es igual al objeto que se esta iterando, se reemplaza la instancia
  /// de [CategoriaFiltroSeleccionable] por una nueva con el valor de
  /// `estaSeleccionado` en false.
  List<T> deseleccionarFiltros(List<T> filtros) {
    return map(
      (filtro) {
        return filtros.contains(filtro)
            ? CategoriaFiltroSeleccionable(
                id: filtro.id,
                recuento: filtro.recuento,
                nombre: filtro.nombre,
                estaSeleccionado: false,
              )
            : filtro;
      },
    ).toList() as List<T>;
  }
}

extension TransformarAListaDeFiltros<T extends CategoriaFiltroSeleccionable>
    on List<Item<T>> {
  /// Transforma la lista a una lista de [CategoriaFiltroSeleccionable].
  List<T> get listaDeFiltros => map(
        (e) => CategoriaFiltroSeleccionable(
          id: e.valor.id,
          recuento: e.valor.recuento,
          nombre: e.nombre,
          estaSeleccionado: e.estaSeleccionado,
        ),
      ).toList().cast<T>();
}
