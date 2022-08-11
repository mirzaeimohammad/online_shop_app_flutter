import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oline_shop_app/core/services/cart_service.dart';
import 'package:oline_shop_app/features/domain/entities/product_item_entitity.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

class CartCubit extends Cubit<CartState> {
  final CartService cartService;

  CartCubit(this.cartService) : super(Loaded(cartService.cartProducts));

  adding(ProductItemEntity item) {
    cartService.addProduct(item);
  }

  decrease(ProductItemEntity item) {
    cartService.decreaseQuantity(item);
  }

  remove(ProductItemEntity item) {
    cartService.removeItem(item);
  }

  clearProduct() {
    cartService.clear();
  }

  List<ProductItemEntity> get cart => cartService.cartProducts;
  get totalAmount => cartService.getTotal();
  get subTotal => cartService.getSubTotal();
  get productQuantity => cartService.productQuantity(cart);

  get decreaseQuantity => cartService.decreaseQuantity;
}
