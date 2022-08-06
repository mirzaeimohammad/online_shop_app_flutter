import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:oline_shop_app/features/presentation/bloc/product_bloc.dart';
import 'package:oline_shop_app/features/presentation/widgets/fake_tabbar_widget.dart';
import 'package:oline_shop_app/features/presentation/widgets/product_grid_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = Modular.get<ProductBloc>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..add(const ProductEvent.started()),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Padding(
                padding: EdgeInsets.only(right: 15),
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
              ),
              tooltip: 'Open shopping cart',
            ),
          ],
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            'Overview',
            style: TextStyle(
              color: Color(0xFF545D68),
              fontSize: 20,
            ),
          ),
        ),
        body: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Foods',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
              return state.when(
                  initial: () =>
                      const Center(child: CircularProgressIndicator()),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  loaded: (listProducts) {
                    return Column(
                      children: [
                        Container(
                          height: 30,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: const [
                              FakeTabBarWidget(),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 600,
                          child: GridView.builder(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 230,
                                childAspectRatio: 1,
                                crossAxisSpacing: 30,
                                mainAxisSpacing: 30,
                                mainAxisExtent: 200,
                              ),
                              physics: const PageScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: listProducts.length,
                              itemBuilder: (context, index) {
                                return ProductGridWidget(
                                    product: listProducts[index]);
                              }),
                        ),
                      ],
                    );
                  });
            }),
          ],
        ),
      ),
    );
  }
}
