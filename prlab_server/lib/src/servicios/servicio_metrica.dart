import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:prlab_server/src/generated/protocol.dart';
import 'package:prlab_server/src/servicio.dart';
import 'package:similar_web/similar_web.dart';

/// Servicio para recuperar métricas de APIs externas.
class ServicioMetrica extends Servicio {

  /// Obtiene visitas de dominios registradas por SimilarWeb.
  Future<List<VisitasApi>> getTotalVisits(
    String domainName, {
    required String country,
    required Granularity granularity,
    DateTime? startDate,
    DateTime? endDate,
    bool? mainDomainOnly,
    bool? showVerified,
    bool? mtd,
    bool? engagedOnly,
  }) async {
    // TODO(anyone): Remover respuesta mockeada al obtener soporte.
    similarWeb.response = Response(
      requestOptions: RequestOptions(),
      data: jsonEncode({
        'meta': {
          'request': {
            'granularity': granularity.name,
            'mainDomainOnly': mainDomainOnly,
            'mtd': mtd,
            'showVerified': showVerified,
            'state': 'state',
            'format': 'json',
            'domain': domainName,
            'startDate': startDate?.toString(),
            'endDate': endDate?.toString(),
            'country': country,
          },
          'status': 'Complete!',
          'lastUpdated': endDate?.add(const Duration(days: 900)).toString(),
        },
        'visits': [
          {
            'date': startDate?.toString() ??
                DateTime.now().subtract(const Duration(days: 900)).toString(),
            'visits': pi,
          },
          {
            'date': endDate?.toString() ?? DateTime.now().toString(),
            'visits': e,
          }
        ],
      }),
      statusCode: 200,
      statusMessage: 'OK',
    );

    final respuesta = await similarWeb.getTotalVisits(
      domainName,
      country: country,
      granularity: granularity,
      startDate: startDate,
      endDate: endDate,
      mainDomainOnly: mainDomainOnly,
      format: Format.json,
      showVerified: showVerified,
      mtd: mtd,
      engagedOnly: engagedOnly,
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
