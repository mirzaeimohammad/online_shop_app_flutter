import 'package:oline_shop_app/features/data/models/product_model.dart';

abstract class ProductItemDataSource {
  Future<List<ProductModel>> getProductItems();
}