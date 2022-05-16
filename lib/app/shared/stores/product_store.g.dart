// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductStore on _ProductStoreBase, Store {
  late final _$imageAtom =
      Atom(name: '_ProductStoreBase.image', context: context);

  @override
  File? get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(File? value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  late final _$titleAtom =
      Atom(name: '_ProductStoreBase.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$typeAtom =
      Atom(name: '_ProductStoreBase.type', context: context);

  @override
  String get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(String value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  late final _$priceAtom =
      Atom(name: '_ProductStoreBase.price', context: context);

  @override
  String get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(String value) {
    _$priceAtom.reportWrite(value, super.price, () {
      super.price = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_ProductStoreBase.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$heightAtom =
      Atom(name: '_ProductStoreBase.height', context: context);

  @override
  String get height {
    _$heightAtom.reportRead();
    return super.height;
  }

  @override
  set height(String value) {
    _$heightAtom.reportWrite(value, super.height, () {
      super.height = value;
    });
  }

  late final _$widthAtom =
      Atom(name: '_ProductStoreBase.width', context: context);

  @override
  String get width {
    _$widthAtom.reportRead();
    return super.width;
  }

  @override
  set width(String value) {
    _$widthAtom.reportWrite(value, super.width, () {
      super.width = value;
    });
  }

  late final _$isSavingAtom =
      Atom(name: '_ProductStoreBase.isSaving', context: context);

  @override
  bool get isSaving {
    _$isSavingAtom.reportRead();
    return super.isSaving;
  }

  @override
  set isSaving(bool value) {
    _$isSavingAtom.reportWrite(value, super.isSaving, () {
      super.isSaving = value;
    });
  }

  late final _$productAtom =
      Atom(name: '_ProductStoreBase.product', context: context);

  @override
  Product? get product {
    _$productAtom.reportRead();
    return super.product;
  }

  @override
  set product(Product? value) {
    _$productAtom.reportWrite(value, super.product, () {
      super.product = value;
    });
  }

  late final _$selectImageAsyncAction =
      AsyncAction('_ProductStoreBase.selectImage', context: context);

  @override
  Future<File?> selectImage() {
    return _$selectImageAsyncAction.run(() => super.selectImage());
  }

  late final _$updateImageAsyncAction =
      AsyncAction('_ProductStoreBase.updateImage', context: context);

  @override
  Future<String> updateImage(bool firstImage, String filename) {
    return _$updateImageAsyncAction
        .run(() => super.updateImage(firstImage, filename));
  }

  late final _$updateProductAsyncAction =
      AsyncAction('_ProductStoreBase.updateProduct', context: context);

  @override
  Future<void> updateProduct() {
    return _$updateProductAsyncAction.run(() => super.updateProduct());
  }

  late final _$deleteProductAsyncAction =
      AsyncAction('_ProductStoreBase.deleteProduct', context: context);

  @override
  Future<void> deleteProduct(Product product) {
    return _$deleteProductAsyncAction.run(() => super.deleteProduct(product));
  }

  late final _$_ProductStoreBaseActionController =
      ActionController(name: '_ProductStoreBase', context: context);

  @override
  void setImage(File image) {
    final _$actionInfo = _$_ProductStoreBaseActionController.startAction(
        name: '_ProductStoreBase.setImage');
    try {
      return super.setImage(image);
    } finally {
      _$_ProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTitle(String title) {
    final _$actionInfo = _$_ProductStoreBaseActionController.startAction(
        name: '_ProductStoreBase.setTitle');
    try {
      return super.setTitle(title);
    } finally {
      _$_ProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setType(String type) {
    final _$actionInfo = _$_ProductStoreBaseActionController.startAction(
        name: '_ProductStoreBase.setType');
    try {
      return super.setType(type);
    } finally {
      _$_ProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrice(String price) {
    final _$actionInfo = _$_ProductStoreBaseActionController.startAction(
        name: '_ProductStoreBase.setPrice');
    try {
      return super.setPrice(price);
    } finally {
      _$_ProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String description) {
    final _$actionInfo = _$_ProductStoreBaseActionController.startAction(
        name: '_ProductStoreBase.setDescription');
    try {
      return super.setDescription(description);
    } finally {
      _$_ProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHeight(String height) {
    final _$actionInfo = _$_ProductStoreBaseActionController.startAction(
        name: '_ProductStoreBase.setHeight');
    try {
      return super.setHeight(height);
    } finally {
      _$_ProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setWidth(String width) {
    final _$actionInfo = _$_ProductStoreBaseActionController.startAction(
        name: '_ProductStoreBase.setWidth');
    try {
      return super.setWidth(width);
    } finally {
      _$_ProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsSaving(bool isSaving) {
    final _$actionInfo = _$_ProductStoreBaseActionController.startAction(
        name: '_ProductStoreBase.setIsSaving');
    try {
      return super.setIsSaving(isSaving);
    } finally {
      _$_ProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setProduct(Product product) {
    final _$actionInfo = _$_ProductStoreBaseActionController.startAction(
        name: '_ProductStoreBase.setProduct');
    try {
      return super.setProduct(product);
    } finally {
      _$_ProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setInitialValues(Product product) {
    final _$actionInfo = _$_ProductStoreBaseActionController.startAction(
        name: '_ProductStoreBase.setInitialValues');
    try {
      return super.setInitialValues(product);
    } finally {
      _$_ProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
image: ${image},
title: ${title},
type: ${type},
price: ${price},
description: ${description},
height: ${height},
width: ${width},
isSaving: ${isSaving},
product: ${product}
    ''';
  }
}
