import 'package:flutter_bloc/flutter_bloc.dart';

class BulletPointCubit extends Cubit<List<String>> {
  BulletPointCubit() : super([]);

  int? _index;

  int? get getIndex => _index;
  
  set setIndex(int? index) => _index = index;

  void addBulletPoint(String point) {
    final updatedList = List<String>.from(state)..add(point); // Add new point
    emit(updatedList); // Emit new state
  }

  void setAllBulletPoints(List<String> points) {
    // final list = List<String>.from(points);
    emit(points);
  }

  void removePoint(String point) {
    final updatedList = List<String>.from(state)..remove(point);
    emit(updatedList);
  }

  void updatePoint(int index, String point) {
    final updatedList = List<String>.from(state);
    updatedList[index] = point;
    emit(updatedList);
  }

  void clear() {
    emit([]);
  }
}
