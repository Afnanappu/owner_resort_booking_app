import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:owner_resort_booking_app/features/authentication/model/picked_file_model.dart';

Future<PickedFileModel?> pickFileFromDevice() async {
  final result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
    withData: true,
    allowCompression: true,
  );

  log("${result?.names}");

  try {
    if (result != null) {
      final file = result.files.first;
      final fileName = file.name;
      final base64String = base64Encode(file.bytes!);

      //storing file
      return PickedFileModel(fileName, base64String);
    } else {
      return null;
    }
  } catch (e, stack) {
    log(e.toString(), stackTrace: stack);
    return null;
  }
}

Future<List<PickedFileModel>> pickMultiFileFromDevice() async {
  final result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
    withData: true,
    allowMultiple: true,
    allowCompression: true,
  );

  log("${result?.names}");

  try {
    final selectedFiles = <PickedFileModel>[];
    if (result != null) {
      for (var file in result.files) {
        final fileName = file.name;
        final base64String = base64Encode(file.bytes!);
        selectedFiles.add(PickedFileModel(fileName, base64String));
      }

      //storing file
      return selectedFiles;
    } else {
      return [];
    }
  } catch (e, stack) {
    log(e.toString(), stackTrace: stack);
    return [];
  }
}
