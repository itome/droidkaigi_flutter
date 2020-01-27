import 'package:json_annotation/json_annotation.dart';
import 'package:confsched2020/model/session_response.dart';
import 'package:confsched2020/model/room_response.dart';
import 'package:confsched2020/model/speaker_response.dart';
import 'package:confsched2020/model/category_response.dart';

part 'timetable_response.g.dart';

@JsonSerializable()
class TimetableResponse {
  const TimetableResponse({
    this.sessions,
    this.rooms,
    this.speakers,
    this.categories,
  });

  factory TimetableResponse.fromJson(Map<String, dynamic> json) =>
      _$TimetableResponseFromJson(json);

  final List<SessionResponse> sessions;
  final List<RoomResponse> rooms;
  final List<SpeakerResponse> speakers;
  final List<CategoryResponse> categories;
}
