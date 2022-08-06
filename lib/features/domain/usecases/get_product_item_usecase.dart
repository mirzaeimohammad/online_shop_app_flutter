import 'package:oline_shop_app/features/domain/entities/product_item_entitity.dart';
import 'package:oline_shop_app/features/domain/repositoroes/product_item_repository.dart';
import 'package:oline_shop_app/features/domain/usecases/usecase.dart';

class GetProductItemUseCase implements UseCase<ProductItemEntity, NoParams> {
  final ProductItemRepository repository;

  GetProductItemUseCase(this.repository);

  @override
  Future<List<ProductItemEntity>> call(NoParams params) async {
    return await repository.getProductItem();
  }
}
