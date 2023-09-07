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
          SizedBox(height: 40.ph),
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
          SizedBox(height: 20.ph),
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
                      borderRadius: BorderRadius.circular(10.pw),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20.pw),
              PRBoton(
                onTap: () {},
                texto: l10n.commonSearch,
                estaHabilitado: true,
                width: 100.sw,
                height: 30.sh,
                fontSize: 15.pf,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                // TODO(Andre): consumir esto del bloc.
                return const _TarjetaDeArticulo();
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
  const _TarjetaDeArticulo();

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
                height: 72.pw,
                width: 72.pw,
                decoration: BoxDecoration(
                  color: colores.secondary,
                  borderRadius: BorderRadius.circular(10.sh),
                ),
              ),
              SizedBox(width: 20.pw),
              SizedBox(
                width: 364.pw,
                child: Column(
                  children: [
                    Text(
                      'Fernández: “Lamento que no estén en la Cumbre de las Américas - CNN en Español.',
                      style: TextStyle(
                        fontSize: 20.sf,
                        fontWeight: FontWeight.w600,
                        color: colores.tertiary,
                      ),
                    ),
                    SizedBox(height: 20.ph),
                    Text(
                      'Fernández: “Lamento que no estén en la Cumbre de las Américas - CNN en Español.Fernández: “Lamento que no estén en la Cumbre de las Américas - CNN en Español.Fernández: “Lamento que no estén en la Cumbre de las Américas - CNN en Español.',
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
