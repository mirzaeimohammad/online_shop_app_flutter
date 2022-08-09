import 'package:flutter_modular/flutter_modular.dart';
import 'package:oline_shop_app/features/data/datasources/local/product_item_datasource_impl.dart';
import 'package:oline_shop_app/features/data/repositories/product_item_repository_impl.dart';
import 'package:oline_shop_app/features/domain/usecases/get_product_item_usecase.dart';
import 'package:oline_shop_app/features/presentation/bloc/product/bloc/product_bloc.dart';
import 'package:oline_shop_app/features/presentation/cubit/cubit/cart_cubit.dart';
import 'package:oline_shop_app/features/presentation/pages/detail_page.dart';
import 'package:oline_shop_app/features/presentation/pages/home_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => ProductBloc(i())),
        Bind.factory((i) => CartCubit(i())),
        Bind.lazySingleton((i) => ProductItemDatasourceImpl()),
        Bind.lazySingleton((i) => ProductItemrepositoryImpl(i())),
        Bind.lazySingleton((i) => GetProductItemUseCase(i()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const HomePage()),
        ChildRoute('/detail',
            child: (context, args) => DetailPage(product: args.data))
      ];
}
