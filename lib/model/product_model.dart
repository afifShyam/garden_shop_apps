import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
sealed class MallProduct with _$MallProduct {
  const factory MallProduct({
    required String id,
    required String title,
    required String subtitle,
    @Default(0) double price,
    @Default(0) double discountPrice,
    @Default(0) double discountPercent,
    required String imageUrl,
  }) = _MallProduct;

  factory MallProduct.initial() => const MallProduct(
    id: '',
    title: '',
    subtitle: '',
    price: 0,
    discountPrice: 0,
    discountPercent: 0,
    imageUrl: '',
  );

  factory MallProduct.fromJson(Map<String, dynamic> json) => _$MallProductFromJson(json);
}
