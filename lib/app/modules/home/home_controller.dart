import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_challenge_20210610/app/shared/irepositories/iproduct_repository.dart';
import 'package:food_challenge_20210610/app/shared/models/product.dart';

class HomeController extends Disposable {
  final IProductRepository _productRepository;

  HomeController(this._productRepository);
  Stream<List<Product>> get products => _productRepository.getProducts();

  @override
  void dispose() {
    
  }
}
