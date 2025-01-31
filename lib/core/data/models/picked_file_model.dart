// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PickedFileModel {
  String fileName;
  String fileExtension;
  String filePath;
  String base64file;
  PickedFileModel({
    required this.fileName,
    required this.fileExtension,
    required this.filePath,
    required this.base64file,
  });

  PickedFileModel copyWith({
    String? fileName,
    String? fileExtension,
    String? filePath,
    String? base64file,
  }) {
    return PickedFileModel(
      fileName: fileName ?? this.fileName,
      fileExtension: fileExtension ?? this.fileExtension,
      filePath: filePath ?? this.filePath,
      base64file: base64file ?? this.base64file,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fileName': fileName,
      'fileExtension': fileExtension,
      'filePath': filePath,
      'base64file': base64file,
    };
  }

  factory PickedFileModel.fromMap(Map<String, dynamic> map) {
    return PickedFileModel(
      fileName: map['fileName'] as String,
      fileExtension: map['fileExtension'] as String,
      filePath: map['filePath'] as String,
      base64file: map['base64file'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PickedFileModel.fromJson(String source) =>
      PickedFileModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PickedFileModel(fileName: $fileName, fileExtension: $fileExtension, filePath: $filePath)';
  }

  @override
  bool operator ==(covariant PickedFileModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.fileName == fileName &&
      other.fileExtension == fileExtension &&
      other.filePath == filePath &&
      other.base64file == base64file;
  }

  @override
  int get hashCode {
    return fileName.hashCode ^
      fileExtension.hashCode ^
      filePath.hashCode ^
      base64file.hashCode;
  }
}
