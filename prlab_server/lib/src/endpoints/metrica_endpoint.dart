import 'package:prlab_server/src/generated/visitas_api.dart';
import 'package:prlab_server/src/servicios/servicio_metrica.dart';
import 'package:serverpod/protocol.dart';
import 'package:serverpod/server.dart';
import 'package:similar_web/similar_web.dart';

class MetricaEndpoint extends Endpoint {
  final servicioMetrica = ServicioMetrica();

  Future<List<VisitasApi>> getTotalVisits(
    Session session,
    String domainName, {
    required String country,
    required int granularity,
    DateTime? startDate,
    DateTime? endDate,
    bool? mainDomainOnly,
    Format? format,
    bool? showVerified,
    bool? mtd,
    bool? engagedOnly,
  }) async {
    return (await servicioMetrica.getTotalVisits(
      domainName,
      startDate: startDate,
      endDate: endDate,
      country: country,
      granularity: Granularity.values[granularity],
      mainDomainOnly: mainDomainOnly,
      format: format,
      showVerified: showVerified,
      mtd: mtd,
      engagedOnly: engagedOnly,
    ))
        .visits!
        .map(
          (e) => VisitasApi.fromJson(
            e.toMap()
              ..['date'] = e.toMap()['date'].toString()
              ..['visits'] = e.visits!.truncate(),
            Protocol(),
          ),
        )
        .toList();
  }
}
