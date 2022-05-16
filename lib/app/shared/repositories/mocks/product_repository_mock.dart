import 'package:food_challenge_20210610/app/shared/irepositories/iproduct_repository.dart';
import 'package:food_challenge_20210610/app/shared/models/product.dart';
import 'package:mocktail/mocktail.dart';

class ProductRepositoryMock extends Mock implements IProductRepository {
  final List<Product> products = [
    Product(
        id: '1',
        title: 'Product 1',
        type: 'Type 1',
        price: 1.00,
        filename: "file1.png"),
    Product(
        id: '2',
        title: 'Product 2',
        type: 'Type 2',
        price: 2.00,
        filename: "file2.png"),
    Product(
        id: '3',
        title: 'Product 3',
        type: 'Type 3',
        price: 3.00,
        filename: "file3.png"),
  ];

  @override
  Stream<List<Product>> getProducts() {
    return Stream<List<Product>>.value(products);
  }

  @override
  Stream<Product> getProductById(String id) {
    Product product = products.firstWhere((element) => element.id == id);
    return Stream<Product>.value(product);
  }

  @override
  Future<void> updateProduct(Product product) async {
    var index = products.indexOf(product);

    products[index] = product;
  }

  @override
  Future<void> deleteProduct(String id) async {
    products.removeWhere((element) => element.id == id);
  }
}
