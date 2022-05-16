import 'package:firebase_core/firebase_core.dart' as firebase;
import 'package:firebase_database/firebase_database.dart';
import 'package:food_challenge_20210610/app/shared/irepositories/iproduct_repository.dart';
import 'package:food_challenge_20210610/app/shared/models/product.dart';

class ProductRepository implements IProductRepository {
  final _database = FirebaseDatabase.instance.ref();

  @override
  Stream<List<Product>> getProducts() {
    try {
      var productsReference = _database.child('products');

      Stream<List<Product>> productsStream =
          productsReference.onValue.map((event) {
        List<Product> products = [];
        (event.snapshot.value as Map).forEach((id, productMap) {
          var product = Product.fromJson(id, productMap);

          products.add(product);
        });
        return products;
      });

      return productsStream;
    } on firebase.FirebaseException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception("Erro ao obter produtos");
    }
  }

  @override
  Stream<Product> getProductById(String id) {
    try {
      var productReference = _database.child('products').child(id);

      Stream<Product> productStream = productReference.onValue.map((event) {
        return Product.fromJson(id, event.snapshot.value);
      });
      return productStream;
    } on firebase.FirebaseException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception("Erro ao obter produto");
    }
  }

  @override
  Future<void> updateProduct(Product product) async {
    try {
      var productReference = _database.child('products').child(product.id!);

      await productReference.update(product.toJson());
    } on firebase.FirebaseException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception("Erro ao tentar atualizar produto");
    }
  }

  @override
  Future<void> deleteProduct(String id) async {
    try {
      var productReference = _database.child('products').child(id);

      await productReference.remove();
    } on firebase.FirebaseException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception("Erro ao tentar remover produto");
    }
  }
}
