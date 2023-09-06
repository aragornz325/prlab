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
/// ítems pre-seleccionados, aquellos que se encuentren en la lista
/// de [listaDeSeleccionados].
///
/// También la adhesión de nuevos [Item]s, obtenidos de [listaDeSeleccionables]
/// a la lista de [listaDeSeleccionados] a través de un popup
/// con la lista de [Item]s y respectivos checkboxes.
/// {@endtemplate}
class TileConCheckBoxes<T> extends StatelessWidget {
  /// {@macro TileConCheckBoxes}
  const TileConCheckBoxes({
    required this.titulo,
    required this.onTapEliminarTodo,
    required this.onTapSeleccionarMasItems,
    required this.onTapEliminarItem,
    this.listaDeSeleccionables = const [],
    this.listaDeSeleccionados = const [],
    super.key,
  });

  /// El título del tile.
  ///
  /// Etiqueta del tipo de objecto que se va pasar
  /// en la lista de [Item]s.
  final String titulo;

  /// Aquellos ítems que fueron seleccionados.
  final List<Item<T>> listaDeSeleccionados;

  /// Lista completa de ítems que pueden ser seleccionables o
  /// ya fueron seleccionados.
  final List<Item<T>> listaDeSeleccionables;

  /// Callback que devuelve la lista de ítems a ser eliminados
  /// para manejar un posible cómputo por fuera de este objeto.
  final void Function(List<T> itemsParaEliminar) onTapEliminarTodo;

  /// Callback que devuelve el objecto que se deseo eliminar
  /// para un posible cómputo por fuera de este objeto.
  final void Function(T itemParaEliminar) onTapEliminarItem;

  /// Callback que devuelve la lista de ítems a ser adheridos
  /// para manejar un posible cómputo por fuera de este objeto.
  final void Function(List<T> itemsParaAdherir) onTapSeleccionarMasItems;

  List<T> get itemValues => listaDeSeleccionados.map((e) => e.valor).toList();

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    final l10n = context.l10n;

    return Column(
      children: [
        SizedBox(height: 20.ph),
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
                  if (listaDeSeleccionados.isNotEmpty)
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
                      ListaDeItemsSeleccionablesDialog(
                        titulo: titulo,
                        listaDeSeleccionables: listaDeSeleccionables,
                        listaDeSeleccionados: listaDeSeleccionados,
                        onTapAplicar: onTapSeleccionarMasItems,
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
              if (listaDeSeleccionados.isNotEmpty) SizedBox(height: 15.ph),
              ...listaDeSeleccionados.map(
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
              SizedBox(height: 20.ph),
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
/// [listaDeSeleccionados].
/// {@endtemplate}
class ListaDeItemsSeleccionablesDialog<T> extends StatefulWidget {
  /// {@macro ListaDeItemsSeleccionablesDialog}
  const ListaDeItemsSeleccionablesDialog({
    required this.titulo,
    required this.listaDeSeleccionables,
    required this.listaDeSeleccionados,
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

  /// Aquellos ítems que fueron seleccionados.
  final List<Item<T>> listaDeSeleccionados;

  /// Al clickear en el boton de aplicar, se ejecuta
  /// esta funcion donde se devuelve la nueva lista de [T]s
  /// que fueron seleccionados, incluyendo los que previamente
  /// ya estaban seleccionados y no fueron destildados en los
  /// checkboxes.
  final void Function(List<T>) onTapAplicar;

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
  List<Item<T>> itemsSeleccionados = [];

  List<T> get valorDeItems => itemsSeleccionados.map((e) => e.valor).toList();

  // TODO(Andre):
  // Cambiar al diseño que esta en figma
  // ese es solo para mostrar la data.
  @override
  Widget build(BuildContext context) {
    return PRDialog.solicitudAccion(
      context: context,
      titulo: 'Filter by ${widget.titulo}',
      content: Column(
        children: [
          ...widget.listaDeSeleccionables.map(
            (e) => InkWell(
              onTap: () {
                // TODO(Andre): Arreglar esto que solo agrega en proximo pr.
                itemsSeleccionados.add(e);
              },
              child: Row(
                children: [
                  const Checkbox(
                    value: true,
                    // No requiere funcionamiento
                    onChanged: null,
                  ),
                  SizedBox(width: 5.pw),
                  Text(e.etiqueta),
                ],
              ),
            ),
          ),
        ],
      ),
      onTap: () => widget.onTapAplicar.call(valorDeItems),
    );
  }
}

/// Contiene los valores requeridos para poder renderizar
/// un item de tipo [T] donde se utiliza la [etiqueta]
/// para representarlo.
class Item<T> {
  Item({
    required this.etiqueta,
    required this.valor,
  });

  final T valor;

  final String etiqueta;
}
