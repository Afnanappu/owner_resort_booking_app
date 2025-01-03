part of 'add_property_bloc.dart';

@freezed
class AddPropertyEvent with _$AddPropertyEvent {
  const factory AddPropertyEvent.addProperty(AddPropertyModel propertyModel) =
      _AddProperty;
}
