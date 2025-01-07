import 'package:flutter_bloc/flutter_bloc.dart';

class RulesDetailsCubit extends Cubit<List<String>> {
  RulesDetailsCubit() : super([]);

  List<String> _previousRulesDetailsState = [];

  set setPreviousRulesDetailsState(List<String> rulesDetailsState) =>
      _previousRulesDetailsState = rulesDetailsState;

  List<String> get getPreviousRulesDetailsState => _previousRulesDetailsState;

  void clearPreviousState() {
    _previousRulesDetailsState = [];
  }

  ///Add rules to the cubit
  void addRules(String rule) {
    final updatedList = List<String>.from(state)..add(rule);
    emit(updatedList);
  }

  ///Add all rules to the cubit
  void setAllRules(List<String> rules) {
    emit(rules);
  }

  void updateRule(int index, String rule) {
    state[index] = rule;
    final updatedList = List<String>.from(state);
    emit(updatedList);
  }

  void removeRule(String rule) {
    emit(List<String>.from(state)..remove(rule));
  }

  ///Clear the cubit by emitting empty list
  void clear() {
    emit([]);
  }
}
