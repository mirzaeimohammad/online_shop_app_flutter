import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oline_shop_app/features/domain/entities/product_item_entitity.dart';
import 'package:oline_shop_app/features/domain/usecases/get_product_item_usecase.dart';
import 'package:oline_shop_app/features/domain/usecases/usecase.dart';

part 'product_event.dart';
part 'product_state.dart';
part 'product_bloc.freezed.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {

  final GetProductItemUseCase productItemUseCase;

  ProductBloc(this.productItemUseCase) : super(_Initial()) {
    on<ProductEvent>(getProduct);
  }

  Future<void> getProduct(event,emit) async {
    emit(const ProductState.initial());
    var product = await productItemUseCase(NoParams());
    emit(ProductState.loaded(product));
  }
}
