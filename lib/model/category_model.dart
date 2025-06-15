import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
sealed class Category with _$Category {
  const factory Category({
    @Default('') String id,
    @Default('') String name,
    @Default('') String path,
  }) = _Category;

  factory Category.initial() => Category();

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}
