import 'package:json_annotation/json_annotation.dart';
import 'package:confsched2020/model/localed_response.dart';

part 'category_item_response.g.dart';

@JsonSerializable()
class CategoryItemResponse {
  const CategoryItemResponse({
    this.id,
    this.sort,
    this.name,
  });

  factory CategoryItemResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryItemResponseFromJson(json);

  final int id;
  final int sort;
  final LocaledResponse name;
}
