import 'dart:io';

class StringHelper {
  static String uniqueFilenameFromFile(File file) {
    String uniqueNumber = DateTime.now().millisecondsSinceEpoch.toString();
    String filename = file.path.split("/").last;
    return "$uniqueNumber-$filename";
  }
}
