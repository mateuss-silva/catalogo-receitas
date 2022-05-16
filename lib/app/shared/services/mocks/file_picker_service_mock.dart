import 'dart:io';

import 'package:food_challenge_20210610/app/shared/iservices/ifile_picker_service.dart';
import 'package:mocktail/mocktail.dart';

class FilePickerServiceMock extends Mock implements IFilePickerService {
  @override
  Future<File?> pickImage() async {
    
      return File("path/to/file.png") ;
  }
}
