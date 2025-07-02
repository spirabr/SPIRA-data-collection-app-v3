import 'dart:io';
import 'dart:typed_data';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:spira/feature/domain/entities/role_entity.dart';

class ConverterUtils {
  static String formatMilliseconds(int milliseconds) {
    int totalSeconds = (milliseconds / 1000).floor();
    int minutes = (totalSeconds / 60).floor();
    int seconds = totalSeconds % 60;

    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');

    return '$minutesStr:$secondsStr';
  }

  static String formatSeconds(int totalSeconds) {
    int minutes = (totalSeconds / 60).floor();
    int seconds = totalSeconds % 60;

    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');

    return '$minutesStr:$secondsStr';
  }

  static Future<Uint8List?> wavToUint8List(String filePath) async {
    if (filePath.isEmpty) return null;
    final file = File(filePath);
    final bytes = await file.readAsBytes();
    return Uint8List.fromList(bytes);
  }

  static Future<File?> uint8ListToWav(Uint8List data, String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = p.join(directory.path, fileName);
    final file = File(filePath);
    await file.writeAsBytes(data);
    return file;
  }

  static String getRoleName(RoleEntity role) {
    if (role.authority == "ROLE_ADMIN") {
      return "Admin";
    } else if (role.authority == "ROLE_USER") {
      return "Coletador";
    }
    return "";
  }
}
