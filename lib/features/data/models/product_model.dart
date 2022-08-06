import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oline_shop_app/features/domain/entities/product_item_entitity.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel implements ProductItemEntity {
  const factory ProductModel({
    required int id,
    required String imageUrl,
    required String title,
    required double price,
    required int quantity,
  }) = _ProductModel;
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
