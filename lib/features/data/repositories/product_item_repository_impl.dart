import 'package:oline_shop_app/features/data/datasources/product_item_data_source.dart';
import 'package:oline_shop_app/features/domain/entities/product_item_entitity.dart';
import 'package:oline_shop_app/features/domain/repositoroes/product_item_repository.dart';

class ProductItemrepositoryImpl implements ProductItemRepository {
  final ProductItemDataSource dataSource;
  ProductItemrepositoryImpl(this.dataSource);

  @override
  Future<List<ProductItemEntity>> getProductItem() async {
    final product = await dataSource.getProductItems();
    return product;
  }
}
