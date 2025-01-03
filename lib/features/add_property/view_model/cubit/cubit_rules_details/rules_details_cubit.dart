import 'package:flutter_bloc/flutter_bloc.dart';

class RulesDetailsCubit extends Cubit<List<String>> {
  RulesDetailsCubit() : super([]);

  void addRules(String rule) {
    final updatedList = List<String>.from(state)..add(rule);
    emit(updatedList);
  }

  void clear() {
    emit([]);
  }
}
