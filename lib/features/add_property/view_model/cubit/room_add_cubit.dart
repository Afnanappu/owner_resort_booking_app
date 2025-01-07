import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_resort_booking_app/core/models/room_model.dart';

class RoomAddCubit extends Cubit<List<RoomModel>> {
  RoomAddCubit() : super([]);

  int? _index;

  int? get getIndex => _index;

  set setIndex(int? index) => _index = index;

  void addRoom(RoomModel roomModel) {
    emit(List.from(state)..add(roomModel));
  }

  ///update a specific room model among the list of models
  void updateRoom(int index, RoomModel roomModel) {
    state[index] = roomModel;

    emit(List.from(state));
  }

  void removeRoom(RoomModel roomModel) {
    final removedList = state;
    removedList.remove(roomModel);
    emit(List.from(removedList));
  }

  void clear() {
    emit([]);
  }
}
