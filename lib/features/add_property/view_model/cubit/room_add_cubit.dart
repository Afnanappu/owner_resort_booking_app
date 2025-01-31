import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_resort_booking_app/core/data/models/room_model.dart';
import 'package:owner_resort_booking_app/features/add_property/repository/add_property_repository.dart';

class RoomAddCubit extends Cubit<List<RoomModel>> {
  final AddPropertyRepository _addPropertyRepository;
  RoomAddCubit(this._addPropertyRepository) : super([]);

  int? _index;

  int? get getIndex => _index;

  set setIndex(int? index) => _index = index;

  void addRoom(RoomModel roomModel) {
    emit(List.from(state)..add(roomModel));
  }

  void setRooms(List<RoomModel> roomList) {
    emit(roomList);
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

  Future<void> fetchRooms(String propertyId) async {
    final rooms = await _addPropertyRepository.fetchRooms(propertyId);
    emit(rooms);
  }

  void clear() {
    emit([]);
  }
}
