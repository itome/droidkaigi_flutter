import 'package:json_annotation/json_annotation.dart';

part 'speaker_response.g.dart';

@JsonSerializable()
class SpeakerResponse {
  const SpeakerResponse({
    this.id,
    this.firstName,
    this.lastName,
    this.profilePicture,
    this.sessions,
    this.tagLine,
    this.isTopSpeaker,
    this.bio,
    this.fullName,
  });

  factory SpeakerResponse.fromJson(Map<String, dynamic> json) =>
      _$SpeakerResponseFromJson(json);

  final String id;
  final String firstName;
  final String lastName;
  final String profilePicture;
  final List<int> sessions;
  final String tagLine;
  final bool isTopSpeaker;
  final String bio;
  final String fullName;
}
