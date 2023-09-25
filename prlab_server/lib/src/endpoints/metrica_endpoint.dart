import 'package:prlab_server/src/servicios/servicio_metrica.dart';
import 'package:serverpod/server.dart';
import 'package:similar_web/similar_web.dart';

class MetricaEndpoint extends Endpoint {
  final servicioMetrica = ServicioMetrica();

  Future<List<Map>> getTotalVisits(
    Session session,
    String domainName, {
    DateTime? startDate,
    DateTime? endDate,
    String? country,
    Granularity? granularity,
    bool? mainDomainOnly,
    Format? format,
    bool? showVerified,
    bool? mtd,
    bool? engagedOnly,
  }) async {
    return (await servicioMetrica.getTotalVisits(
      domainName,
      startDate: startDate ??= DateTime.now().subtract(Duration(days: 900)),
      endDate: endDate ??= DateTime.now(),
      country: country,
      granularity: granularity,
      mainDomainOnly: mainDomainOnly,
      format: format,
      showVerified: showVerified,
      mtd: mtd,
      engagedOnly: engagedOnly,
    ))
        .visits!
        .map((e) => e.toMap()..['visits'] = e.visits!.truncate())
        .toList();
  }
}
