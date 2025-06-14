// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MallProduct {

 String get id; String get title; String get subtitle; double get price; double get discountPrice; double get discountPercent; String get imageUrl;
/// Create a copy of MallProduct
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MallProductCopyWith<MallProduct> get copyWith => _$MallProductCopyWithImpl<MallProduct>(this as MallProduct, _$identity);

  /// Serializes this MallProduct to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MallProduct&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.price, price) || other.price == price)&&(identical(other.discountPrice, discountPrice) || other.discountPrice == discountPrice)&&(identical(other.discountPercent, discountPercent) || other.discountPercent == discountPercent)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,subtitle,price,discountPrice,discountPercent,imageUrl);

@override
String toString() {
  return 'MallProduct(id: $id, title: $title, subtitle: $subtitle, price: $price, discountPrice: $discountPrice, discountPercent: $discountPercent, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $MallProductCopyWith<$Res>  {
  factory $MallProductCopyWith(MallProduct value, $Res Function(MallProduct) _then) = _$MallProductCopyWithImpl;
@useResult
$Res call({
 String id, String title, String subtitle, double price, double discountPrice, double discountPercent, String imageUrl
});




}
/// @nodoc
class _$MallProductCopyWithImpl<$Res>
    implements $MallProductCopyWith<$Res> {
  _$MallProductCopyWithImpl(this._self, this._then);

  final MallProduct _self;
  final $Res Function(MallProduct) _then;

/// Create a copy of MallProduct
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? subtitle = null,Object? price = null,Object? discountPrice = null,Object? discountPercent = null,Object? imageUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,discountPrice: null == discountPrice ? _self.discountPrice : discountPrice // ignore: cast_nullable_to_non_nullable
as double,discountPercent: null == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as double,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MallProduct implements MallProduct {
  const _MallProduct({required this.id, required this.title, required this.subtitle, this.price = 0, this.discountPrice = 0, this.discountPercent = 0, required this.imageUrl});
  factory _MallProduct.fromJson(Map<String, dynamic> json) => _$MallProductFromJson(json);

@override final  String id;
@override final  String title;
@override final  String subtitle;
@override@JsonKey() final  double price;
@override@JsonKey() final  double discountPrice;
@override@JsonKey() final  double discountPercent;
@override final  String imageUrl;

/// Create a copy of MallProduct
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MallProductCopyWith<_MallProduct> get copyWith => __$MallProductCopyWithImpl<_MallProduct>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MallProductToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MallProduct&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.price, price) || other.price == price)&&(identical(other.discountPrice, discountPrice) || other.discountPrice == discountPrice)&&(identical(other.discountPercent, discountPercent) || other.discountPercent == discountPercent)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,subtitle,price,discountPrice,discountPercent,imageUrl);

@override
String toString() {
  return 'MallProduct(id: $id, title: $title, subtitle: $subtitle, price: $price, discountPrice: $discountPrice, discountPercent: $discountPercent, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$MallProductCopyWith<$Res> implements $MallProductCopyWith<$Res> {
  factory _$MallProductCopyWith(_MallProduct value, $Res Function(_MallProduct) _then) = __$MallProductCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String subtitle, double price, double discountPrice, double discountPercent, String imageUrl
});




}
/// @nodoc
class __$MallProductCopyWithImpl<$Res>
    implements _$MallProductCopyWith<$Res> {
  __$MallProductCopyWithImpl(this._self, this._then);

  final _MallProduct _self;
  final $Res Function(_MallProduct) _then;

/// Create a copy of MallProduct
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? subtitle = null,Object? price = null,Object? discountPrice = null,Object? discountPercent = null,Object? imageUrl = null,}) {
  return _then(_MallProduct(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,discountPrice: null == discountPrice ? _self.discountPrice : discountPrice // ignore: cast_nullable_to_non_nullable
as double,discountPercent: null == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as double,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
