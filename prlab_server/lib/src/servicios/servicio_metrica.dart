import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:prlab_server/src/servicio.dart';
import 'package:similar_web/similar_web.dart';

/// Servicio para recuperar métricas de APIs externas.
class ServicioMetrica extends Servicio {

  /// Obtiene visitas de dominios registradas por SimilarWeb.
  Future<TotalVisitsResponse> getTotalVisits(
    String domainName, {
    String country = 'world',
    Granularity granularity = Granularity.monthly,
    DateTime? startDate,
    DateTime? endDate,
    bool? mainDomainOnly = false,
    Format? format = Format.json,
    bool? showVerified = false,
    bool? mtd = false,
    bool? engagedOnly = false,
  }) async {
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
            'format': format,
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

    return await similarWeb.getTotalVisits(
      domainName,
      country: country,
      granularity: granularity,
      startDate: startDate,
      endDate: endDate,
      mainDomainOnly: mainDomainOnly,
      format: format,
      showVerified: showVerified,
      mtd: mtd,
      engagedOnly: engagedOnly,
    );
  }
}
