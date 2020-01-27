import 'package:json_annotation/json_annotation.dart';

part 'localed_response.g.dart';

@JsonSerializable()
class LocaledResponse {
  const LocaledResponse({this.ja, this.en});

  factory LocaledResponse.fromJson(Map<String, dynamic> json) =>
      _$LocaledResponseFromJson(json);

  final String ja;
  final String en;
}
