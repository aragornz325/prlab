part of 'dialog_informacion_de_periodista.dart';

/// {@template ListadoDeArticulosDelPeriodista}
/// Se encuentra a lista de articulos que publicó el
/// periodista y cuenta con un buscador.
/// {@endtemplate}
class ListadoDeArticulosDelPeriodista extends StatelessWidget {
  /// {@macro ListadoDeArticulosDelPeriodista}
  const ListadoDeArticulosDelPeriodista({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    final l10n = context.l10n;

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: max(40.ph, 40.sh)),
          Padding(
            padding: EdgeInsets.only(left: 20.pw),
            child: Text(
              // TODO(Andre): Remplazar el 2 por el valor real.
              '${l10n.commonArticles}(2)',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: colores.tertiary,
              ),
            ),
          ),
          SizedBox(height: max(20.ph, 20.sh)),
          Row(
            children: [
              SizedBox(width: 20.pw),
              SizedBox(
                width: 336.pw,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      size: 24.pw,
                      color: colores.secondary,
                    ),
                    hintText: l10n
                        .pageMediaDatabaseJournalistFilterSearchByKeywordsItem,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.sw),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20.pw),
              PRBoton(
                onTap: () {
                  // TODO(Andre): Agregarle funcionalidad.
                  const PRDialogErrorNoDisponible().show(context);
                },
                texto: l10n.commonSearch,
                estaHabilitado: true,
                width: 100.sw,
                height: max(30.ph, 30.sh),
                fontSize: 15.pf,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          SizedBox(height: max(20.ph, 20.sh)),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                // TODO(Andre): Consumir esto del bloc y pasarle los valores que
                // corresponden a titulo y contenido.
                return const _TarjetaDeArticulo(
                  titulo: 'Aca va el titulo',
                  contenido: 'Aca va el contenido Aca va el contenido Aca va el'
                      ' contenido Aca va el contenido',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// {@template _TarjetaDeArticulo}
/// Contiene la corto resumen de un artículo publicado
/// por el periodista.
/// {@endtemplate}
class _TarjetaDeArticulo extends StatelessWidget {
  /// {@macro _TarjetaDeArticulo}
  const _TarjetaDeArticulo({
    required this.contenido,
    required this.titulo,
  });

  /// Titulo del articulo.
  final String titulo;

  /// Texto principal del articulo.
  final String contenido;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.pw,
            vertical: 20.ph,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: max(72.ph, 72.sh),
                width: 72.pw,
                decoration: BoxDecoration(
                  color: colores.secondary,
                  borderRadius: BorderRadius.circular(10.sw),
                ),
              ),
              SizedBox(width: 20.pw),
              SizedBox(
                width: 364.pw,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titulo,
                      style: TextStyle(
                        fontSize: 20.sf,
                        fontWeight: FontWeight.w600,
                        color: colores.tertiary,
                      ),
                    ),
                    SizedBox(height: max(20.ph, 20.sh)),
                    Text(
                      contenido,
                      style: TextStyle(
                        fontSize: 15.sf,
                        fontWeight: FontWeight.w400,
                        color: colores.tertiary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 0),
      ],
    );
  }
}
