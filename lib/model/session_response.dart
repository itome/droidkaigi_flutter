import 'package:json_annotation/json_annotation.dart';
import 'package:confsched2020/model/localed_response.dart';

part 'session_response.g.dart';

@JsonSerializable()
class SessionResponse {
  const SessionResponse({
    this.id,
    this.isServiceSession,
    this.title,
    this.speakers,
    this.description,
    this.startsAt,
    this.endsAt,
    this.language,
    this.roomId,
    this.sessionCategoryItemId,
    this.sessionType,
    this.message,
    this.isPlenumSession,
    this.targetAudience,
    this.interpretationTarget,
    this.videoUrl,
    this.slideUrl,
  });

  factory SessionResponse.fromJson(Map<String, dynamic> json) =>
      _$SessionResponseFromJson(json);

  final String id;
  final bool isServiceSession;
  final LocaledResponse title;
  final List<String> speakers;
  final String description;
  final String startsAt;
  final String endsAt;
  final String language;
  final int roomId;
  final int sessionCategoryItemId;
  final String sessionType;
  final LocaledResponse message;
  final bool isPlenumSession;
  final String targetAudience;
  final bool interpretationTarget;
  final String videoUrl;
  final String slideUrl;

  DateTime get startsAtDate => DateTime.parse(startsAt).toLocal();
  DateTime get endsAtDate => DateTime.parse(endsAt).toLocal();

  int get duration => endsAtDate.difference(startsAtDate).inMinutes;
}
