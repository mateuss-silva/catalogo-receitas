import 'dart:io';

import 'package:food_challenge_20210610/app/shared/iservices/istorage_service.dart';
import 'package:mocktail/mocktail.dart';

class StorageServiceMock extends Mock implements IStorageService {
  final _storage = {
    "products": {
      "file1.png": "www.mock.url/products/file1.png",
      "file2.png": "www.mock.url/products/file2.png",
      "file3.png": "www.mock.url/products/file3.png",
    }
  };
  @override
  Future<String> uploadFile({
    required File file,
    required String fileName,
    required String path,
  }) async {
    var fullPath = "$path/$fileName";
    return getFileUrl(path: fullPath);
  }

  @override
  Future<String> uploadProductImage({
    required File file,
    required String fileName,
    String path = "products",
  }) async {
    return await uploadFile(file: file, fileName: fileName, path: path);
  }

  @override
  Future<String> getFileUrl({required String path}) async {
    return "www.mock.url/$path";
  }

  @override
  Future<void> deleteProductImage({
    required String fileName,
    String path = "products",
  }) async {
    deleteFile(path: path, fileName: fileName);
  }

  @override
  Future<void> deleteFile({
    required String path,
    required String fileName,
  }) async {
    _storage[path]?.remove(fileName);
  }
}
