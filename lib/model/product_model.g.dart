// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MallProduct _$MallProductFromJson(Map<String, dynamic> json) => _MallProduct(
  id: json['id'] as String,
  title: json['title'] as String,
  subtitle: json['subtitle'] as String,
  price: (json['price'] as num?)?.toDouble() ?? 0,
  discountPrice: (json['discountPrice'] as num?)?.toDouble() ?? 0,
  discountPercent: (json['discountPercent'] as num?)?.toDouble() ?? 0,
  imageUrl: json['imageUrl'] as String,
);

Map<String, dynamic> _$MallProductToJson(_MallProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'price': instance.price,
      'discountPrice': instance.discountPrice,
      'discountPercent': instance.discountPercent,
      'imageUrl': instance.imageUrl,
    };
