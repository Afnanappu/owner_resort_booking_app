import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_resort_booking_app/core/models/room_model.dart';

class RoomAddCubit extends Cubit<List<RoomModel>> {
  RoomAddCubit() : super([]);

  void addRoom(RoomModel roomModel) {
    emit(List.from(state)..add(roomModel));
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
