import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:oline_shop_app/features/domain/entities/product_item_entitity.dart';
import 'package:oline_shop_app/features/presentation/bloc/cubit/cubit/cart_cubit.dart';

class CartProductCardWidget extends StatefulWidget {
  final ProductItemEntity product;
  final int quantity;
  const CartProductCardWidget(
      {Key? key, required this.product, required this.quantity})
      : super(key: key);

  @override
  State<CartProductCardWidget> createState() => _CartProductCardWidgetState();
}

class _CartProductCardWidgetState extends State<CartProductCardWidget> {
  final cubit = Modular.get<CartCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(
                      0.2,
                    ),
                    spreadRadius: 3.0,
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    child: Container(
                      height: 120,
                      width: 120,
                      color: Colors.orange,
                      child: Image.network(
                        widget.product.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        //color: Colors.green,
                        height: 50,
                        child: Text(
                          widget.product.title,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        //color: Colors.green,
                        height: 20,
                        child: Text(
                          '\$${widget.product.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        child: IconButton(
                          onPressed: () {
                            cubit.remove(widget.product);
                          },
                          icon: const Icon(Icons.delete_sweep_outlined),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            child: IconButton(
                              icon: const Icon(Icons.add_circle),
                              onPressed: () {
                                cubit.adding(widget.product);
                              },
                            ),
                          ),
                          Container(
                            //color: Colors.blue,
                            child: Text(
                              (widget.quantity).toString(),
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Container(
                            child: IconButton(
                              onPressed: () {
                                cubit.decrease(widget.product);
                              },
                              icon: const Icon(
                                Icons.remove_circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
