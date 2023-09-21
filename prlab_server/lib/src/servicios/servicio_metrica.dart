import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:prlab_server/src/servicio.dart';
import 'package:similar_web/similar_web.dart';

class ServicioMetrica extends Servicio {
  Future<TotalVisitsResponse> getTotalVisits(String domainName) async {
    similarWeb.response = Response(
      requestOptions: RequestOptions(),
      data: jsonEncode({
        'meta': {
          'request': {
            'granularity': 'daily',
            'mainDomainOnly': true,
            'mtd': true,
            'showVerified': true,
            'state': 'state',
            'format': 'json',
            'domain': domainName,
            'startDate': DateTime(1998, 03, 25).toUtc(),
            'endDate': DateTime(2023, 03, 25).toUtc(),
            'country': 'ar',
          },
          'status': 'Complete!',
          'lastUpdated': DateTime(2023, 04, 25).toUtc(),
        },
        'visits': [
          {
            'date': DateTime(1998, 03, 25).toUtc(),
            'visits': 3.141516,
          },
          {
            'date': DateTime(2023, 03, 25).toUtc(),
            'visits': 2.7182,
          }
        ],
      }),
      statusCode: 200,
      statusMessage: 'OK',
    );

    return await similarWeb.getTotalVisits(domainName);
  }
}
