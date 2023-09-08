part of 'dialog_informacion_de_periodista.dart';

/// {@template DatosPersonalesDelPeriodista}
/// Se encuentran los datos de el periodista en detalle,
/// información personal y datos de sus redes sociales.
/// {@endtemplate}
class DatosPersonalesDelPeriodista extends StatelessWidget {
  /// {@macro DatosPersonalesDelPeriodista}
  const DatosPersonalesDelPeriodista({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    final l10n = context.l10n;

    return BlocBuilder<BlocDbMediosDeComunicacion,
        BlocDbMediosDeComunicacionEstado>(
      builder: (context, state) {
        if (state
            is! BlocDbMediosDeComunicacionDetallePeriodistaEstadoExitoso) {
          return SizedBox(
            width: 355.pw,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return SizedBox(
          width: 355.pw,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.pw),
                child: Column(
                  children: [
                    SizedBox(height: max(40.ph, 40.sh)),
                    CircleAvatar(
                      foregroundImage: NetworkImage(
                        state.periodista.urlDeImage,
                      ),
                      backgroundColor: colores.secondary,
                      foregroundColor: colores.secondary,
                      minRadius: 25.pw,
                      maxRadius: 45.pw,
                    ),
                    SizedBox(height: max(10.ph, 10.sh)),
                    Text(
                      state.periodista.name,
                      style: TextStyle(
                        fontSize: 20.sf,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: max(5.ph, 5.sh)),
                    Text(
                      l10n.pageMediaDatabaseJournalistInformationDialogAnchorAt(
                        state.periodista.anchor,
                      ),
                      style: TextStyle(
                        fontSize: 15.sf,
                        fontWeight: FontWeight.w500,
                        color: colores.secondary,
                      ),
                    ),
                    SizedBox(height: max(20.ph, 20.sh)),
                    Text(
                      state.periodista.descripcion,
                      style: TextStyle(
                        color: colores.secondary,
                      ),
                    ),
                    SizedBox(height: max(20.ph, 20.sh)),
                  ],
                ),
              ),
              const Divider(height: 0),
              SizedBox(
                height: max(380.ph, 380.sh),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.pw),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: max(15.ph, 15.sh),
                          ),
                          child: Wrap(
                            children: [
                              ...state.periodista.topicCovered.map(
                                (topic) => Padding(
                                  padding: EdgeInsets.only(
                                    right: 10.pw,
                                    bottom: 10.ph,
                                  ),
                                  child: TopicPRCardPeriodista(topic: topic),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          l10n.pageMediaDatabaseJournalistInformationDialogGeneral,
                          style: TextStyle(
                            color: colores.secondary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: max(9.ph, 9.sh)),
                        _IconoConDatoDePeriodista(
                          icono: Icons.mail_outline_rounded,
                          etiqueta: state.periodista.email,
                        ),
                        _IconoConDatoDePeriodista(
                          icono: Icons.call_outlined,
                          etiqueta: state.periodista.telefono,
                        ),
                        _IconoConDatoDePeriodista(
                          icono: Icons.location_on_outlined,
                          etiqueta: state.periodista.location,
                        ),
                        _IconoConDatoDePeriodista(
                          icono: Icons.translate_rounded,
                          etiqueta: state.periodista.idioma,
                        ),
                        SizedBox(height: max(9.ph, 9.sh)),
                        Text(
                          l10n.pageMediaDatabaseJournalistInformationDialogSocial,
                          style: TextStyle(
                            color: colores.secondary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: max(9.ph, 9.sh)),
                        _IconoConDatoDePeriodista(
                          icono: Icons.square,
                          etiqueta: state.periodista.facebook,
                        ),
                        _IconoConDatoDePeriodista(
                          icono: Icons.square,
                          etiqueta: state.periodista.instagram,
                        ),
                        _IconoConDatoDePeriodista(
                          icono: Icons.square,
                          etiqueta: state.periodista.twitter,
                        ),
                        _IconoConDatoDePeriodista(
                          icono: Icons.square,
                          etiqueta: state.periodista.youtube,
                        ),
                        SizedBox(height: max(15.ph, 15.sh)),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(height: 0),
              Padding(
                padding: EdgeInsets.symmetric(vertical: max(9.ph, 9.sh)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PRBoton(
                      // TODO(anyone): Agregarle funcionalidad
                      onTap: () =>
                          const PRDialogErrorNoDisponible().show(context),
                      texto: l10n
                          .pageMediaDatabaseJournalistInformationDialogAddToList,
                      estaHabilitado: true,
                      width: 100.sw,
                      height: 30.sh,
                      fontSize: 15.pf,
                      fontWeight: FontWeight.w500,
                    ),
                    PRBoton.esOutlined(
                      // TODO(anyone): Agregarle funcionalidad
                      onTap: () =>
                          const PRDialogErrorNoDisponible().show(context),
                      texto: l10n
                          .pageMediaDatabaseJournalistInformationDialogReport,
                      estaHabilitado: true,
                      width: 100.sw,
                      height: 30.sh,
                      fontSize: 15.pf,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// {@template IconoConDatoDePeriodista}
/// Renderiza un icono que se le pase y un etiqueta
/// uno a lado del otro.
///
/// Esto se utiliza para mostrar información del periodista
/// tomando como tema el icono y en la etiqueta el valor de
/// ese tema en concreto
///
/// Ej: [icono] Icons.email / [etiqueta] ejemplo@ejemplo.com
/// {@endtemplate}
class _IconoConDatoDePeriodista extends StatelessWidget {
  /// {@macro IconoConDatoDePeriodista}
  const _IconoConDatoDePeriodista({
    required this.icono,
    required this.etiqueta,
  });

  final IconData icono;

  final String etiqueta;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return SizedBox(
      height: max(30.ph, 30.sh),
      child: Row(
        children: [
          Icon(icono, color: colores.primaryAltaOpacidad),
          SizedBox(width: 5.pw),
          Text(
            etiqueta,
            style: TextStyle(
              color: colores.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
