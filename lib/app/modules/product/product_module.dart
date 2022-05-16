import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_challenge_20210610/app/modules/product/product_page.dart';
import 'package:food_challenge_20210610/app/shared/stores/product_store.dart';

import 'controllers/product_edit_controller.dart';
import 'pages/product_edit_page.dart';
import 'product_controller.dart';

class ProductModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ProductController(
      i.get<ProductStore>(),
    )),
    Bind.lazySingleton((i) => ProductEditController(
      i.get<ProductStore>(),
    )),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (context, args) => ProductPage(product: args.data)),
    ChildRoute("/edit",
        child: (context, args) => ProductEditPage(product: args.data)),
  ];
}
