import 'package:oline_shop_app/features/domain/entities/product_item_entitity.dart';

class CartService {
  final List<ProductItemEntity> cartProducts = [];

  final deliveryFee = 10.0;
  int quantity = 1;

  productQuantity(cartProducts) {
    var quantity = {};
    cartProducts.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });
    return quantity;
  }

  addProduct(ProductItemEntity product) {
    cartProducts.add(product);
  }

  removeItem(ProductItemEntity product) {
    cartProducts.removeWhere((x) => x == product);
  }

  void clear() {
    cartProducts.clear();
  }

  double getSubTotal() {
    return cartProducts
        .map((e) => e.price)
        .fold(0, (price1, price2) => price1 + price2);
  }

  double getTotal() {
    return cartProducts
        .map((e) => e.price)
        .fold(deliveryFee, (price1, price2) => price1 + price2);
  }

  decreaseQuantity(ProductItemEntity product) {
    cartProducts.remove(product);
  }
}
