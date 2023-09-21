import 'package:prlab_server/src/servicios/servicio_metrica.dart';
import 'package:serverpod/server.dart';

class MetricaEndpoint extends Endpoint {
  final servicioMetrica = ServicioMetrica();

  Future<String> getTotalVisits(String domainName) async {
    print('Holis');
    return (await servicioMetrica.getTotalVisits(domainName)).toJson();
  }

}
