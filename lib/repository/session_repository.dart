import 'package:confsched2020/model/timetable_response.dart';
import 'package:dio/dio.dart';

class SessionRepository {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://deploy-preview-49--droidkaigi-api-dev.netlify.com/2020',
      connectTimeout: 5000,
  ));

  Future<TimetableResponse> getSessions() async {

    final response = await dio.get<Map<String, dynamic>>('/timetable');
    return TimetableResponse.fromJson(response.data);
  }
}
