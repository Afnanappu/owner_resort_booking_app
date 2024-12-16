import 'package:flutter/material.dart';

class UploadedFileProvider extends ChangeNotifier {
  String personalProof = 'Not selected';
  String license = 'Not selected';

  void setFiles({String? proof, String? license}) {
    if (proof != null) personalProof = proof;
    if (license != null) this.license = license;
    notifyListeners();
  }
}
