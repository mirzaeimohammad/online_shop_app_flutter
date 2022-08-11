part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
    const factory CartState.initial() = Initial;
  const factory CartState.loading() = Loading;
  const factory CartState.loaded(List<ProductItemEntity> cartProducts) = Loaded;
}
