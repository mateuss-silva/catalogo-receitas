import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:food_challenge_20210610/app/shared/iservices/ifile_picker_service.dart';

class FilePickerService implements IFilePickerService {
  @override
  Future<File?> pickImage() async {
    var results = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['png', 'jpg', 'jpeg'],
    );

    if (results != null) {
      var path = results.files.single.path;
      return path != null ? File(path) : null;
    }
    return null;
  }
}
