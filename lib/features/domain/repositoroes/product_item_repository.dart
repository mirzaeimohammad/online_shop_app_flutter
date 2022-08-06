import 'package:oline_shop_app/features/domain/entities/product_item_entitity.dart';

abstract class ProductItemRepository {
  Future<List<ProductItemEntity>> getProductItem();
}
