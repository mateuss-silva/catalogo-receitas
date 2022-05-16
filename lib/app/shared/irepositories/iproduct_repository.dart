import 'package:food_challenge_20210610/app/shared/models/product.dart';

abstract class IProductRepository {
  Stream<List<Product>> getProducts();
  Stream<Product> getProductById(String id);
  Future<void> updateProduct(Product product);
  Future<void> deleteProduct(String id);
}
