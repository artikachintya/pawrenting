import 'package:flutter/services.dart' show rootBundle;

class FileHelper {
  static Future<String> loadTextFile(String path) async {
    return await rootBundle.loadString(path);
  }
}
