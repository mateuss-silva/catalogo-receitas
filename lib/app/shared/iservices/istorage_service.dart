import 'dart:io';

abstract class IStorageService {
  Future<String> uploadFile({
    required File file,
    required String fileName,
    required String path,
  });

  Future<String> uploadProductImage({
    required File file,
    required String fileName,
    String path = "products",
  });

  Future<String> getFileUrl({required String path});

  Future<void> deleteFile({
    required String path,
    required String fileName,
  });

  Future<void> deleteProductImage({
    String path = "products",
    required String fileName,
  });
}
