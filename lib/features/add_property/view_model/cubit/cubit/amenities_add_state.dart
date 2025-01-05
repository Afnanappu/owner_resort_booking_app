part of 'amenities_add_cubit.dart';

@freezed
class AmenitiesAddState with _$AmenitiesAddState {
  const factory AmenitiesAddState.initial() = _Initial;
  const factory AmenitiesAddState.error(String error) = _Error;
  const factory AmenitiesAddState.loading() = _Loading;
  const factory AmenitiesAddState.loaded(List<AmenitiesModel> amenitiesList) =
      _Loaded;
  const factory AmenitiesAddState.picked(List<AmenitiesModel> amenitiesList) =
      _Picked;
}
