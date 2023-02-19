import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
class FileHandler {
  static Future<void> checkPermissions() async {
    var status = await Permission.storage.isGranted;
    if (!status) {
      await Permission.storage.request();
    }
  }
  static Future<File> createFile(String fileName, String content) async {
    await FileHandler.checkPermissions();
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$fileName');
    return file.writeAsString(content);
  }
  static Future<String> getFilePath(String fileName) async {
    await FileHandler.checkPermissions();
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/$fileName';
  }
  static Future<File?> getFile(String fileName) async {
    await FileHandler.checkPermissions();
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$fileName');
    if (await file.exists()) {
      return file;
    }
    return null;
  }

  static Future<bool> deleteFile(String fileName) async {
    await FileHandler.checkPermissions();
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$fileName');
    if (await file.exists()) {
      await file.delete();
      return true;
    }
    return false;
  }

  static Future<Directory> createDirectory(String dirName) async {
    await FileHandler.checkPermissions();
    final directory = await getApplicationDocumentsDirectory();
    final newDirectory = Directory('${directory.path}/$dirName');
    return newDirectory.create();
  }

  static Future<Directory?> getDirectory(String dirName) async {
    await FileHandler.checkPermissions();
    final directory = await getApplicationDocumentsDirectory();
    final newDirectory = Directory('${directory.path}/$dirName');
    if (await newDirectory.exists()) {
      return newDirectory;
    }
    return null;
  }

  static Future<bool> deleteDirectory(String dirName) async {
    await FileHandler.checkPermissions();
    final directory = await getApplicationDocumentsDirectory();
    final newDirectory = Directory('${directory.path}/$dirName');
    if (await newDirectory.exists()) {
      await newDirectory.delete(recursive: true);
      return true;
    }
    return false;
  }
}
