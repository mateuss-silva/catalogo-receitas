import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_challenge_20210610/app/shared/stores/product_store.dart';

class ProductEditController extends Disposable {
  ProductStore productStore;

  ProductEditController(this.productStore);

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
