
import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:prlab_server/src/servicio.dart';
import 'package:similar_web/similar_web.dart';

class ServicioMetrica extends Servicio {
  Future<TotalVisitsResponse> getTotalVisits(String domainName, {
  DateTime? startDate,
  DateTime? endDate,
  String? country = 'world',
  Granularity? granularity = Granularity.monthly,
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
            'granularity': granularity,
            'mainDomainOnly': mainDomainOnly,
            'mtd': mtd,
            'showVerified': showVerified,
            'state': 'state',
            'format': format,
            'domain': domainName,
            'startDate': startDate.toString(),
            'endDate': endDate.toString(),
            'country': country,
          },
          'status': 'Complete!',
          'lastUpdated': endDate!.add(Duration(days: 900)).toString(),
        },
        'visits': [
          {
            'date': startDate.toString(),
            'visits': pi,
          },
          {
            'date': endDate.toString(),
            'visits': e,
          }
        ],
      }),
      statusCode: 200,
      statusMessage: 'OK',
    );

    return await similarWeb.getTotalVisits(domainName);
  }
}
