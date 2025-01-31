import 'dart:convert';
import 'dart:developer';
import 'package:file_picker/file_picker.dart';
import 'package:owner_resort_booking_app/core/data/models/picked_file_model.dart';

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
      if (file.size > 1024 * 1024) {
        throw 'Picked file size must be less than 1MB';
      }
      final fileName = file.name;
      final path = file.path!;
      final base64String = base64Encode(file.bytes!);

      //storing file
      return PickedFileModel(
        base64file: base64String,
        fileName: fileName,
        filePath: path,
        fileExtension: file.extension!,
      );
    } else {
      return null;
    }
  } catch (e, stack) {
    log(e.toString(), stackTrace: stack);
    return null;
  }
}

Future<List<PickedFileModel>> pickMultiFileFromDevice(
    {bool allowPdf = true}) async {
  final allowedExtensions = ['jpg', 'jpeg', 'png'];
  //allow pdf if true
  if (allowPdf) allowedExtensions.add('pdf');

  final result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: allowedExtensions,
    withData: true,
    allowMultiple: true,
    allowCompression: true,
  );

  log("${result?.names}");
  try {
    final selectedFiles = <PickedFileModel>[];
    if (result != null) {
      //If the file size is greater than 1MB throw an error
      for (var file in result.files) {
        if (file.size > 1024 * 1024) {
          throw 'Picked file size must be less than 1MB';
        }
        final fileName = file.name;
        final base64String = base64Encode(file.bytes!);

        selectedFiles.add(
          PickedFileModel(
            fileName: fileName,
            filePath: file.path!,
            base64file: base64String,
            fileExtension: file.extension!,
          ),
        );
      }

      //storing file
      return selectedFiles;
    } else {
      throw 'Picking file failed';
    }
  } catch (e, stack) {
    log(e.toString(), stackTrace: stack);
    rethrow;
  }
}
