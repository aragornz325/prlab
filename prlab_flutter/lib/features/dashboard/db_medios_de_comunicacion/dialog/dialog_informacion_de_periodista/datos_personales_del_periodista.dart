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
    // TODO(Andre): cambiar por el modelo de manu.
    final periodista = Periodista('');

    final colores = context.colores;

    final l10n = context.l10n;

    return SizedBox(
      width: 355.pw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.pw),
            child: Column(
              children: [
                SizedBox(height: 40.ph),
                CircleAvatar(
                  foregroundImage: NetworkImage(
                    periodista.valor,
                  ),
                  backgroundColor: colores.secondary,
                  minRadius: 25.pw,
                  maxRadius: 45.pw,
                ),
                SizedBox(height: 10.ph),
                Text(
                  periodista.valor,
                  style: TextStyle(
                    fontSize: 20.sf,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 5.ph),
                Text(
                  l10n.pageMediaDatabaseJournalistInformationDialogAnchorAt(
                    periodista.valor,
                  ),
                  style: TextStyle(
                    fontSize: 15.sf,
                    fontWeight: FontWeight.w500,
                    color: colores.secondary,
                  ),
                ),
                SizedBox(height: 20.ph),
                Text(
                  periodista.valor,
                  style: TextStyle(
                    color: colores.secondary,
                  ),
                ),
                SizedBox(height: 20.ph),
              ],
            ),
          ),
          const Divider(height: 0),
          SizedBox(
            height: 380.ph,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.pw),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TODO(Andre): Aca van los topics
                    SizedBox(height: 90.ph),
                    Text(
                      l10n.pageMediaDatabaseJournalistInformationDialogGeneral,
                      style: TextStyle(
                        color: colores.secondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 9.ph),
                    IconoConDatoDePeriodista(
                      icono: Icons.mail_outline_rounded,
                      etiqueta: periodista.valor,
                    ),
                    IconoConDatoDePeriodista(
                      icono: Icons.call_outlined,
                      etiqueta: periodista.valor,
                    ),
                    IconoConDatoDePeriodista(
                      icono: Icons.location_on_outlined,
                      etiqueta: periodista.valor,
                    ),
                    IconoConDatoDePeriodista(
                      icono: Icons.translate_rounded,
                      etiqueta: periodista.valor,
                    ),
                    SizedBox(height: 9.ph),
                    Text(
                      l10n.pageMediaDatabaseJournalistInformationDialogSocial,
                      style: TextStyle(
                        color: colores.secondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 9.ph),
                    IconoConDatoDePeriodista(
                      icono: Icons.square,
                      etiqueta: periodista.valor,
                    ),
                    IconoConDatoDePeriodista(
                      icono: Icons.square,
                      etiqueta: periodista.valor,
                    ),
                    IconoConDatoDePeriodista(
                      icono: Icons.square,
                      etiqueta: periodista.valor,
                    ),
                    IconoConDatoDePeriodista(
                      icono: Icons.square,
                      etiqueta: periodista.valor,
                    ),
                    SizedBox(height: 15.ph),
                  ],
                ),
              ),
            ),
          ),
          const Divider(height: 0),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.ph),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PRBoton(
                  // TODO(anyone): Agregarle funcionalidad
                  onTap: () => const PRDialogErrorNoDisponible().show(context),
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
                  onTap: () => const PRDialogErrorNoDisponible().show(context),
                  texto:
                      l10n.pageMediaDatabaseJournalistInformationDialogReport,
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
class IconoConDatoDePeriodista extends StatelessWidget {
  /// {@macro IconoConDatoDePeriodista}
  const IconoConDatoDePeriodista({
    required this.icono,
    required this.etiqueta,
    super.key,
  });

  final IconData icono;

  final String etiqueta;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return SizedBox(
      height: 30.ph,
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

class Periodista {
  Periodista(this.valor);

  final String valor;
}
