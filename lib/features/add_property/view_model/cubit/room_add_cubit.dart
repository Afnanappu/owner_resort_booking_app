import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_resort_booking_app/features/add_property/model/add_room_model.dart';

class RoomAddCubit extends Cubit<List<AddRoomModel>> {
  RoomAddCubit() : super([]);

  void addRoom(AddRoomModel roomModel) {
    emit(List.from(state)..add(roomModel));
  }

  void removeRoom(AddRoomModel roomModel) {
    final removedList = state;
    removedList.remove(roomModel);
    emit(List.from(removedList));
  }

  void clear() {
    emit([]);
  }
}
