part of 'add_property_bloc.dart';

@freezed
class AddPropertyEvent with _$AddPropertyEvent {
  const factory AddPropertyEvent.addProperty(
      {required PropertyModel propertyModel,
      required List<RoomModel> roomModelList}) = _AddProperty;
}
