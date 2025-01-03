import 'package:flutter_bloc/flutter_bloc.dart';

class BulletPointCubit extends Cubit<List<String>> {
  BulletPointCubit() : super([]);

  void addBulletPoint(String point) {
    final updatedList = List<String>.from(state)..add(point); // Add new point
    emit(updatedList); // Emit new state
  }

  void clear() {
    emit([]);
  }
}
