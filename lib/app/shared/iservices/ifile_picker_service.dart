import 'dart:io';

abstract class IFilePickerService {
  Future<File?> pickImage();
}
