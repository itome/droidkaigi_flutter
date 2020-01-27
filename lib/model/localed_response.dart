import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:confsched2020/ext/context.dart';

part 'localed_response.g.dart';

@JsonSerializable()
class LocaledResponse {
  const LocaledResponse({this.ja, this.en});

  factory LocaledResponse.fromJson(Map<String, dynamic> json) =>
      _$LocaledResponseFromJson(json);

  final String ja;
  final String en;

  String by(BuildContext context) {
    if (context.localized.locale.languageCode == 'ja') {
      return ja;
    } else {
      return en;
    }
  }
}
