import 'dart:io';

import 'package:firebase_core/firebase_core.dart' as firebase;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:food_challenge_20210610/app/shared/iservices/istorage_service.dart';

class FirebaseStorageService implements IStorageService {
  final _storage = firebase_storage.FirebaseStorage.instance;

  @override
  Future<String> uploadFile({
    required File file,
    required String fileName,
    required String path,
  }) async {
    try {
      var result =
          await _storage.ref().child(path).child(fileName).putFile(file);
      return await getFileUrl(path: result.ref.fullPath);
    } on firebase.FirebaseException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception("Erro ao fazer upload do arquivo");
    }
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
    try {
      var url = await _storage.ref().child(path).getDownloadURL();
      return url;
    } on firebase.FirebaseException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception("Erro ao obter url do arquivo");
    }
  }

  @override
  Future<void> deleteProductImage(
      {required String fileName, String path = "products"}) async {
    try {
      await deleteFile(fileName: fileName, path: path);
    } on firebase.FirebaseException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception("Erro ao deletar arquivo");
    }
  }

  @override
  Future<void> deleteFile(
      {required String path, required String fileName}) async {
    try {
      await _storage.ref().child(path).child(fileName).delete();
    } on firebase.FirebaseException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception("Erro ao deletar arquivo");
    }
  }
}
