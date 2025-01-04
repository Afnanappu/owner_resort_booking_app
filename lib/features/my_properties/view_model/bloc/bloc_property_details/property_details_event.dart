part of 'property_details_bloc.dart';

@freezed
class PropertyDetailsEvent with _$PropertyDetailsEvent {
  const factory PropertyDetailsEvent.fetchPropertyDetails(
      {required String id}) = _FetchPropertyDetails;
}
