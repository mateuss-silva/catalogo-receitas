import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_challenge_20210610/app/shared/repositories/product_repository.dart';

import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeController(i.get<ProductRepository>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (context, args) => const HomePage()),
  ];
}
