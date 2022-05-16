import 'dart:io';

import 'package:food_challenge_20210610/app/shared/irepositories/iproduct_repository.dart';
import 'package:food_challenge_20210610/app/shared/iservices/ifile_picker_service.dart';
import 'package:food_challenge_20210610/app/shared/iservices/istorage_service.dart';
import 'package:food_challenge_20210610/app/shared/models/product.dart';
import 'package:food_challenge_20210610/app/shared/utils/string_helper.dart';
import 'package:mobx/mobx.dart';

part 'product_store.g.dart';

class ProductStore = _ProductStoreBase with _$ProductStore;

abstract class _ProductStoreBase with Store {
  final IProductRepository _productRepository;
  final IStorageService _storage;
  final IFilePickerService _filePicker;
  _ProductStoreBase(this._productRepository, this._storage, this._filePicker);

  Stream<List<Product>> get products => _productRepository.getProducts();

  Stream<Product> get productStream =>
      _productRepository.getProductById(product!.id!);

  @observable
  File? image;

  @observable
  String title = "";

  @observable
  String type = "";

  @observable
  String price = "";

  @observable
  String description = "";

  @observable
  String height = "";

  @observable
  String width = "";

  @observable
  bool isSaving = false;

  @observable
  Product? product;

  @action
  void setImage(File image) => this.image = image;

  @action
  void setTitle(String title) => this.title = title;

  @action
  void setType(String type) => this.type = type;

  @action
  void setPrice(String price) => this.price = price;

  @action
  void setDescription(String description) => this.description = description;

  @action
  void setHeight(String height) => this.height = height;

  @action
  void setWidth(String width) => this.width = width;

  @action
  void setIsSaving(bool isSaving) => this.isSaving = isSaving;

  @action
  setProduct(Product product) => this.product = product;

  @action
  setInitialValues(Product product) {
    this.product = product;
    title = product.title;
    type = product.type;
    price = product.price.toString();
    description = product.description ?? "";
    height = product.heightString;
    width = product.widthString;
  }

  @action
  Future<File?> selectImage() async {
    var image = await _filePicker.pickImage();

    if (image != null) {
      setImage(image);
    }
    return null;
  }

  @action
  Future<String> updateImage(bool firstImage, String filename) async {
    String imageUrl;

    try {
      if (firstImage) {
        imageUrl = await _storage.uploadProductImage(
          file: image!,
          fileName: filename,
        );
      } else {
        imageUrl =
            await _storage.uploadProductImage(file: image!, fileName: filename);
      }

      return imageUrl;
    } catch (e) {
      rethrow;
    }
  }

  @action
  Future<void> updateProduct() async {
    isSaving = true;
    bool productHasImage = product!.hasImage;
    bool newImageSelected = image != null;
    bool firstImage = !productHasImage;
    String? imageUrl;
    Product newUpdatedProduct;

    String? filename = firstImage && newImageSelected
        ? StringHelper.uniqueFilenameFromFile(image!)
        : product!.filename;

    try {
      if (newImageSelected) {
        imageUrl = await updateImage(firstImage, filename!);
        newUpdatedProduct = Product(
          id: product!.id,
          rating: product!.rating,
          createdAt: product!.createdAt,
          type: type,
          title: title,
          imageUrl: imageUrl,
          filename: filename,
          description: description,
          width: int.tryParse(width),
          height: int.tryParse(height),
          price: Product.priceFromString(price),
        );
      } else {
        newUpdatedProduct = Product(
          id: product!.id,
          rating: product!.rating,
          imageUrl: product!.imageUrl,
          createdAt: product!.createdAt,
          type: type,
          title: title,
          filename: filename,
          description: description,
          width: int.tryParse(width),
          height: int.tryParse(height),
          price: Product.priceFromString(price),
        );
      }

      await _productRepository.updateProduct(newUpdatedProduct);
    } catch (e) {
      rethrow;
    } finally {
      isSaving = false;
    }
  }

  @action
  Future<void> deleteProduct(Product product) async {
    try {
      await _productRepository.deleteProduct(product.id!);
      if (product.hasImage) {
        await _storage.deleteProductImage(fileName: product.filename!);
      }
    } catch (e) {
      rethrow;
    }
  }
}
