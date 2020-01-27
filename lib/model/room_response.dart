import 'package:json_annotation/json_annotation.dart';
import 'package:confsched2020/model/localed_response.dart';

part 'room_response.g.dart';

@JsonSerializable()
class RoomResponse {
  const RoomResponse({
    this.id,
    this.sort,
    this.name,
  });

  factory RoomResponse.fromJson(Map<String, dynamic> json) =>
      _$RoomResponseFromJson(json);

  final int id;
  final int sort;
  final LocaledResponse name;
}
