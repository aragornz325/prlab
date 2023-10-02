import 'package:prlab_server/src/generated/visitas_api.dart';
import 'package:prlab_server/src/servicios/servicio_metrica.dart';
import 'package:serverpod/protocol.dart';
import 'package:serverpod/server.dart';
import 'package:similar_web/similar_web.dart';

/// Endpoint para recuperar métricas de APIs externas.
class MetricaEndpoint extends Endpoint {
  /// Instancia del servicio.
  final servicioMetrica = ServicioMetrica();

  /// Obtiene visitas de dominios registradas por SimilarWeb.
  Future<List<VisitasApi>> getTotalVisits(
    Session session,
    String domainName, {
    required String country,
    required int granularity,
    DateTime? startDate,
    DateTime? endDate,
    bool? mainDomainOnly,
    int? format,
    bool? showVerified,
    bool? mtd,
    bool? engagedOnly,
  }) async {
    final respuesta = await servicioMetrica.getTotalVisits(
      domainName,
      startDate: startDate,
      endDate: endDate,
      country: country,
      granularity: Granularity.values[granularity],
      mainDomainOnly: mainDomainOnly ?? false,
      format: format != null ? Format.values[format] : Format.values[0],
      showVerified: showVerified ?? false,
      mtd: mtd ?? false,
      engagedOnly: engagedOnly ?? false,
    );

    final visitas = respuesta.visits ?? [];

    final visitasDeserializadas = visitas
        .map(
          (e) => VisitasApi.fromJson(
            e.toMap()
              ..['date'] = DateTime.parse(e.toMap()['date']).toIso8601String()
              ..['visits'] = e.visits?.truncate() ?? 0,
            Protocol(),
          ),
        )
        .toList();

    return visitasDeserializadas;
  }
}
