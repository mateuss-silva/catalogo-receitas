import 'package:flutter_test/flutter_test.dart';
import 'package:food_challenge_20210610/app/modules/home/home_controller.dart';
import 'package:food_challenge_20210610/app/shared/models/product.dart';
import 'package:food_challenge_20210610/app/shared/repositories/mocks/product_repository_mock.dart';
import 'package:food_challenge_20210610/app/shared/services/mocks/file_picker_service_mock.dart';
import 'package:food_challenge_20210610/app/shared/services/mocks/storage_service_mock.dart';
import 'package:food_challenge_20210610/app/shared/stores/product_store.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late final HomeController _homeController;
  late final ProductStore _productStore;

  late final StorageServiceMock _storageServiceMock;
  late final FilePickerServiceMock _filePickerServiceMock;
  late final ProductRepositoryMock _productRepositoryMock;

  setUpAll(() async {
    _productRepositoryMock = ProductRepositoryMock();
    _storageServiceMock = StorageServiceMock();
    _filePickerServiceMock = FilePickerServiceMock();
    _homeController = HomeController(_productRepositoryMock);
    _productStore = ProductStore(
      _productRepositoryMock,
      _storageServiceMock,
      _filePickerServiceMock,
    );
  });

  test('list products', () async {
    List<Product> products = await _homeController.products.last;

    expect(products.length, 3);

    expect(products[0].title, 'Product 1');
    expect(products[1].title, 'Product 2');
    expect(products[2].title, 'Product 3');
  });

  test('Delete product', () async {
    var product =  Product(
        id: '1',
        title: 'Product 1',
        type: 'Type 1',
        price: 1.00,
        filename: "file1.png");

    List<Product> products =  await _productStore.products.last;

    expect(products.length, 3);

    await _productStore.deleteProduct(product);

    products = await _productStore.products.last;

    expect(products.length, 2);

  });
}
