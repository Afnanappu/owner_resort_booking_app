import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/features/authentication/model/picked_file_model.dart';

class UploadedFileProvider extends ChangeNotifier {
  PickedFileModel? personalProof;
  List<PickedFileModel> license = [];

  void setFiles({PickedFileModel? proof, List<PickedFileModel>? license}) {
    if (proof != null) personalProof = proof;
    if (license != null) this.license = license;
    notifyListeners();
  }

  void clear() {
    personalProof = null;
    license.clear();
  }
}
