part of 'dialog_informacion_de_periodista.dart';

/// {@template DatosPersonalesDelPeriodista}
/// Se encuentran los datos de el periodista en detalle,
/// información personal y datos de sus redes sociales.
/// {@endtemplate}
class DatosPersonalesDelPeriodista extends StatelessWidget {
  /// {@macro DatosPersonalesDelPeriodista}
  const DatosPersonalesDelPeriodista({
    required this.periodista,
    super.key,
  });

  /// Periodista a mostrar
  final Periodista periodista;
  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    final l10n = context.l10n;

    final descripcionDeGeneral =
        l10n.pageMediaDatabaseJournalistInformationDialogGeneral;

    final descripcionDeSocial =
        l10n.pageMediaDatabaseJournalistInformationDialogSocial;

    final descripcionDeAgregarLista =
        l10n.pageMediaDatabaseJournalistInformationDialogAddToList;

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
                    periodista.urlImagen,
                  ),
                  backgroundColor: colores.secondary,
                  foregroundColor: colores.secondary,
                  minRadius: 25.pw,
                  maxRadius: 45.pw,
                ),
                SizedBox(height: max(10.ph, 10.sh)),
                Text(
                  periodista.nombreCompleto,
                  style: TextStyle(
                    fontSize: 20.pf,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: max(5.ph, 5.sh)),
                Text(
                  periodista.puesto,
                  style: TextStyle(
                    fontSize: 15.sf,
                    fontWeight: FontWeight.w500,
                    color: colores.secondary,
                  ),
                ),
                SizedBox(height: max(20.ph, 20.sh)),
                Text(
                  periodista.biografia,
                  style: TextStyle(
                    color: colores.secondary,
                  ),
                ),
                SizedBox(height: max(20.ph, 20.sh)),
              ],
            ),
          ),
          const Divider(height: 0),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.pw),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 15.ph,
                      ),
                      child: Row(
                        children: [
                          ...periodista.temas.map(
                            (topic) => TopicPRCardPeriodista(
                              topic: topic,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      descripcionDeGeneral,
                      style: TextStyle(
                        color: colores.secondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: max(9.ph, 9.sh)),
                    _IconoConDatoDePeriodista(
                      icono: Icons.mail_outline_rounded,
                      nombreDelDato: periodista.email,
                    ),
                    _IconoConDatoDePeriodista(
                      icono: Icons.call_outlined,
                      nombreDelDato: periodista.telefono,
                    ),
                    _IconoConDatoDePeriodista(
                      icono: Icons.location_on_outlined,
                      nombreDelDato: periodista.localizacion,
                    ),
                    _IconoConDatoDePeriodista(
                      icono: Icons.translate_rounded,
                      nombreDelDato: periodista.listaLenguajes,
                    ),
                    SizedBox(height: max(9.ph, 9.sh)),
                    Text(
                      descripcionDeSocial,
                      style: TextStyle(
                        color: colores.secondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: max(9.ph, 9.sh)),
                    ListView.builder(
                      itemCount: periodista.redesSociales.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return _IconoConDatoDePeriodista(
                          pathImagen: periodista.redesSociales[index].urlIcono,
                          nombreDelDato:
                              periodista.redesSociales[index].nombreDeUsuario,
                        );
                      },
                    ),
                    SizedBox(height: max(15.ph, 15.sh)),
                  ],
                ),
              ),
            ),
          ),
          const Divider(height: 0),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.ph),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PRBoton(
                  // TODO(anyone): Agregarle funcionalidad
                  onTap: () => const PRDialogErrorNoDisponible().show(context),
                  texto: descripcionDeAgregarLista,
                  estaHabilitado: true,
                  width: 100.sw,
                  height: max(30.ph, 30.sh),
                  fontSize: 15.pf,
                  fontWeight: FontWeight.w500,
                ),
                PRBoton.esOutlined(
                  // TODO(anyone): Agregarle funcionalidad
                  onTap: () => const PRDialogErrorNoDisponible().show(context),
                  texto:
                      l10n.pageMediaDatabaseJournalistInformationDialogReport,
                  estaHabilitado: true,
                  width: 100.sw,
                  height: max(30.ph, 30.sh),
                  fontSize: 15.pf,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ],
      ),
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
/// Ej: [icono] Icons.email / [nombreDelDato] ejemplo@ejemplo.com
/// {@endtemplate}
class _IconoConDatoDePeriodista extends StatelessWidget {
  /// {@macro IconoConDatoDePeriodista}
  const _IconoConDatoDePeriodista({
    required this.nombreDelDato,
    this.icono,
    this.pathImagen,
  }) : assert(
          icono != null || pathImagen != null,
          'Either icono or pathImagen must be provided.',
        );

  /// El icono representa el tema de la [nombreDelDato]
  ///
  /// Ej:
  /// Si el dato a mostrar fuera el perfil de instagram del usuario
  /// el icono sería el icono de instagram.
  final IconData? icono;

  final String? pathImagen;

  /// La etiqueta representa el valor que se le quiere dar al tema
  /// del dato.
  ///
  /// Ej:
  /// Si el dato a mostrar fuera el perfil de instagram del usuario
  /// la etiqueta seria @perfil_de_ejemplo
  final String nombreDelDato;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return SizedBox(
      height: max(30.ph, 30.sh),
      child: Row(
        children: [
          if (icono != null)
            Icon(icono, color: colores.primaryOpacidadVeinte)
          else
            pathImagen == null || pathImagen == ''
                ? Icon(
                    Icons.square,
                    color: colores.secondary,
                  )
                : Image.network(
                    pathImagen!,
                    width: 10.pw,
                    height: 10.ph,
                  ),
          SizedBox(width: 5.pw),
          Text(
            nombreDelDato,
            style: TextStyle(
              color: colores.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
