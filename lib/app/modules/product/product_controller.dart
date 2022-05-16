import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_challenge_20210610/app/shared/stores/product_store.dart';


class ProductController extends Disposable{

  ProductStore store;

  ProductController(this.store);

  @override
  void dispose() {

  }

}