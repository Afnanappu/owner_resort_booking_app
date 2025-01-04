part of 'property_details_bloc.dart';

@freezed
class PropertyDetailsState with _$PropertyDetailsState {
  const factory PropertyDetailsState.initial() = _Initial;
  const factory PropertyDetailsState.loading() = _Loading;
  const factory PropertyDetailsState.loaded(
      PropertyDetailsModel propertyDetails) = _Loaded;
  const factory PropertyDetailsState.error(String message) = _Error;
}
