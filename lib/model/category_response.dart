import 'package:json_annotation/json_annotation.dart';
import 'package:confsched2020/model/localed_response.dart';
import 'package:confsched2020/model/category_item_response.dart';

part 'category_response.g.dart';

@JsonSerializable()
class CategoryResponse {
  const CategoryResponse({
    this.id,
    this.sort,
    this.title,
    this.items,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);

  final int id;
  final int sort;
  final LocaledResponse title;
  final List<CategoryItemResponse> items;
}
