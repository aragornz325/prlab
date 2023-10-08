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
  ///   
  /// Args:  
  /// REQUERIDO `domainName` ([String]): sitio web del que se buscan métricas,
  /// sin "www." ni llaves ("{}").  
  /// `country`: 
  Future<List<VisitasApi>> getTotalVisits(
    Session session,
    String domainName, {
    required String country,
    required int granularity,
    DateTime? startDate,
    DateTime? endDate,
    bool? mainDomainOnly,
    bool? showVerified,
    bool? mtd,
    bool? engagedOnly,
  }) async {
    return await servicioMetrica.getTotalVisits(
      domainName,
      startDate: startDate,
      endDate: endDate,
      country: country,
      granularity: Granularity.values[granularity],
      mainDomainOnly: mainDomainOnly ?? false,
      showVerified: showVerified ?? false,
      mtd: mtd ?? false,
      engagedOnly: engagedOnly ?? false,
    );
  }
}
