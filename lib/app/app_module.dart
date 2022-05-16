import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_challenge_20210610/app/shared/repositories/product_repository.dart';
import 'package:food_challenge_20210610/app/shared/services/firebase_storage_service.dart';

import 'modules/home/home_module.dart';
import 'modules/product/product_module.dart';
import 'shared/services/file_picker_service.dart';
import 'shared/stores/product_store.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => FirebaseStorageService()),
    Bind.singleton((i) => FilePickerService()),
    Bind.singleton((i) => ProductRepository()),
    Bind.factory((i) => ProductStore(
          i.get<ProductRepository>(),
          i.get<FirebaseStorageService>(),
          i.get<FilePickerService>(),
        )),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ModuleRoute("/product", module: ProductModule()),
  ];
}
