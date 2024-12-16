import 'dart:developer';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';

Future<Map<String, Uint8List>?> pickFileFromDevice() async {
  final result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
    withData: true,
  );
  log("${result?.names}");

  try {
    if (result != null) {
      final bytes = result.files.single.bytes!;
      return {result.files.first.name: bytes};
    } else {
      return null;
    }
  } catch (e, stack) {
    log(e.toString(), stackTrace: stack);
    return null;
  }
}
