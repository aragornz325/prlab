part of 'filtrador_de_periodistas.dart';

/// {@template TileConCheckBoxes}
/// Contiene una lista del tipo de [T] que se le
/// proporcione, por cada uno de los objetos de la lista se
/// renderiza un checkbox con la etiqueta que se le brinde dentro
/// de [Item].
///
/// _Nota: Este componente se limita a dar las herramientas
/// para el cómputo por fuera del mismo a través de los diferentes callbacks
/// que ofrece, los cambios en la lista de items unicamente se verán reflejados
/// si se brindan las listas actualizadas cuando se instancia el mismo_
///
/// Contiene además funcionalidades de la eliminación de
/// ítems pre-seleccionados, aquellos donde `estaSeleccionado` dentro del
/// objeto [Item] lo tengan true.
///
/// También la alteración de `estaSeleccionado` a través de un popup
/// con la lista de [Item]s y respectivos checkboxes.
/// {@endtemplate}
class TileConCheckBoxes<T> extends StatelessWidget {
  /// {@macro TileConCheckBoxes}
  const TileConCheckBoxes({
    required this.titulo,
    required this.onTapEliminarTodo,
    required this.onTapAplicarNuevaSeleccion,
    required this.onTapEliminarItem,
    this.listaDeItems = const [],
    super.key,
  });

  /// El título del tile.
  ///
  /// Etiqueta del tipo de objecto que se va pasar
  /// en la lista de [Item]s.
  final String titulo;

  /// Lista completa de ítems que pueden ser seleccionables o
  /// ya fueron seleccionados.
  final List<Item<T>> listaDeItems;

  /// Callback que devuelve la lista de ítems a ser eliminados
  /// para manejar un posible cómputo por fuera de este objeto.
  final void Function(List<T> itemsParaEliminar) onTapEliminarTodo;

  /// Callback que devuelve el objecto que se deseo eliminar
  /// para un posible cómputo por fuera de este objeto.
  final void Function(T itemParaEliminar) onTapEliminarItem;

  /// Callback que devuelve la lista de ítems con los respectivos
  /// cambios de selección aplicados en el popup integrado del
  /// [TileConCheckBoxes].
  final void Function(List<Item<T>> itemsParaAdherir)
      onTapAplicarNuevaSeleccion;

  List<Item<T>> get itemSeleccionados =>
      listaDeItems.where((e) => e.estaSeleccionado).toList();

  List<T> get itemValues => itemSeleccionados.map((e) => e.valor).toList();

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    final l10n = context.l10n;

    return Column(
      children: [
        SizedBox(height: max(20.ph, 20.sh)),
        Padding(
          padding: EdgeInsets.only(left: 20.pw),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    titulo,
                    style: TextStyle(
                      color: colores.secondary,
                    ),
                  ),
                  const Spacer(),
                  if (itemSeleccionados.isNotEmpty)
                    InkWell(
                      onTap: () => onTapEliminarTodo.call(itemValues),
                      child: Text(
                        l10n.pageMediaDatabaseHorizontalFilterClearAll,
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  SizedBox(width: 10.pw),
                  InkWell(
                    onTap: () {
                      ListaDeItemsSeleccionablesDialog<T>(
                        titulo: titulo,
                        listaDeSeleccionables: listaDeItems,
                        onTapAplicar: onTapAplicarNuevaSeleccion,
                      ).show(context);
                    },
                    child: Icon(
                      Icons.tune_rounded,
                      color: colores.primary,
                    ),
                  ),
                  SizedBox(width: 20.pw),
                ],
              ),
              if (itemSeleccionados.isNotEmpty) SizedBox(height: 15.ph),
              ...itemSeleccionados.map(
                (e) => Row(
                  children: [
                    InkWell(
                      onTap: () => onTapEliminarItem.call(e.valor),
                      child: Icon(
                        Icons.check_box,
                        size: 20.pw,
                        color: colores.primary,
                      ),
                    ),
                    SizedBox(width: 5.pw),
                    Text(
                      e.etiqueta,
                      style: TextStyle(
                        color: colores.secondary,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: max(20.ph, 20.sh)),
            ],
          ),
        ),
        const Divider(height: 0),
      ],
    );
  }
}

/// {@template ListaDeItemsSeleccionablesDialog}
/// Contiene una lista de [listaDeSeleccionables] con checkboxes
/// esto permite adherirlos o eliminarlos de una lista de [T],
/// una vez que el usuario le da a aplicar los cambios, esto devuelve
/// un callback [onTapAplicar] con la nueva lista deseada de
/// [listaDeSeleccionables].
/// {@endtemplate}
class ListaDeItemsSeleccionablesDialog<T> extends StatefulWidget {
  /// {@macro ListaDeItemsSeleccionablesDialog}
  const ListaDeItemsSeleccionablesDialog({
    required this.titulo,
    required this.listaDeSeleccionables,
    required this.onTapAplicar,
    super.key,
  });

  /// El título sirve para representar al tipo de
  /// [T] que se esta brindando en forma de etiqueta,
  /// de esta manera utilizarlo dentro de un par de
  /// componente internos de [ListaDeItemsSeleccionablesDialog].
  final String titulo;

  /// Lista completa de ítems que pueden ser seleccionables o
  /// ya fueron seleccionados.
  final List<Item<T>> listaDeSeleccionables;

  /// Al clickear en el boton de aplicar, se ejecuta
  /// esta funcion donde se devuelve la nueva lista de [T]s
  /// que fueron seleccionados, incluyendo los que previamente
  /// ya estaban seleccionados y no fueron destildados en los
  /// checkboxes.
  final void Function(List<Item<T>>) onTapAplicar;

  Future<void> show(BuildContext context) => showDialog(
        context: context,
        builder: (_) => this,
      );

  @override
  State<ListaDeItemsSeleccionablesDialog<T>> createState() =>
      _ListaDeItemsSeleccionablesDialogState<T>();
}

class _ListaDeItemsSeleccionablesDialogState<T>
    extends State<ListaDeItemsSeleccionablesDialog<T>> {
  List<Item<T>> _listaDeSeleccionables = [];

  @override
  void initState() {
    super.initState();
    _listaDeSeleccionables = widget.listaDeSeleccionables;
  }

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    final l10n = context.l10n;

    return PRDialog.solicitudAccion(
      context: context,
      titulo: l10n.pageMediaDatabaseFilterTileFilterByPopupTitle(widget.titulo),
      tituloDelBoton: l10n.commonApply,
      tieneAlturaMinima: false,
      content: PRDropdown<T>(
        isValid: true,
        valueColor: colores.primary,
        hasSearchField: true,
        items: _listaDeSeleccionables
            .map(
              (item) => PRDropdownOption<T>(
                title: item.etiqueta,
                value: item.valor,
                textStyle: TextStyle(color: colores.tertiary),
                checkBoxValue: item.estaSeleccionado,
                checkBoxCallback: (value) {
                  _listaDeSeleccionables =
                      _listaDeSeleccionables.alternarSeleccion(
                    item,
                  );
                  setState(() {});
                },
              ),
            )
            .toList(),
        icon: Icon(
          Icons.person_outline_rounded,
          color: colores.primary,
        ),
        hintText: l10n.pageMediaDatabaseFilterTileFilterByPopupDropdownHintText(
          widget.titulo.toLowerCase(),
        ),
        valueText:
            l10n.pageMediaDatabaseFilterTileFilterByPopupDropdownHintText(
          widget.titulo.toLowerCase(),
        ),
        onChanged: (value) {
          final item = _listaDeSeleccionables.firstWhere(
            (e) => e.valor == value,
          );

          _listaDeSeleccionables = _listaDeSeleccionables.alternarSeleccion(
            item,
          );
          setState(() {});
        },
      ),
      onTap: () {
        widget.onTapAplicar.call(_listaDeSeleccionables);
        Navigator.pop(context);
      },
    );
  }
}

/// Contiene los valores requeridos para poder renderizar
/// un item de tipo [T] donde se utiliza la [etiqueta]
/// para representarlo.
class Item<T> extends Equatable {
  const Item({
    required this.etiqueta,
    required this.valor,
    required this.estaSeleccionado,
  });

  /// valor con el que representa cada item. Ej: String = Item<String>
  final T valor;

  /// Representa una etiqueta o nombre asociado con el artículo.
  final String etiqueta;

  /// Indica si el item esta seleccionado, por defecto es false.
  final bool estaSeleccionado;

  @override
  List<Object?> get props => [
        valor,
        etiqueta,
        estaSeleccionado,
      ];
}

extension AlternarSeleccion<T> on List<Item<T>> {
  List<Item<T>> alternarSeleccion(Item<T> item) {
    return map((e) {
      if (e == item) {
        return Item(
          etiqueta: item.etiqueta,
          valor: item.valor,
          estaSeleccionado: !item.estaSeleccionado,
        );
      }

      return e;
    }).toList();
  }
}
