// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PickedFileModel {
  String fileName;
  String file;

  PickedFileModel(
    this.fileName,
    this.file,
  );

  PickedFileModel copyWith({
    String? fileName,
    String? file,
  }) {
    return PickedFileModel(
      fileName ?? this.fileName,
      file ?? this.file,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fileName': fileName,
      'file': file,
    };
  }

  factory PickedFileModel.fromMap(Map<String, dynamic> map) {
    return PickedFileModel(
      map['fileName'] as String,
      map['file'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PickedFileModel.fromJson(String source) => PickedFileModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PickedFileModel(fileName: $fileName, file: $file)';

  @override
  bool operator ==(covariant PickedFileModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.fileName == fileName &&
      other.file == file;
  }

  @override
  int get hashCode => fileName.hashCode ^ file.hashCode;
}
