import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:confsched2020/model/timetable_response.dart';
import 'package:dio/dio.dart';

class SessionRepository {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://deploy-preview-49--droidkaigi-api-dev.netlify.com/2020',
    connectTimeout: 5000,
  ));

  Future<TimetableResponse> getSessions() async {
    // FIXME(itome): Please use actual api in web. This is temporary workaround for CORS problem.
    if (kIsWeb) {
      final loadData = await rootBundle.loadString(
        'mock/timetable_response.json',
      );
      return TimetableResponse.fromJson(
        jsonDecode(loadData) as Map<String, dynamic>,
      );
    }

    final response = await dio.get<Map<String, dynamic>>('/timetable');
    return TimetableResponse.fromJson(response.data);
  }
}
