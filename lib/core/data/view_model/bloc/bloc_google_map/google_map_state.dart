part of 'google_map_bloc.dart';

@freezed
class GoogleMapState with _$GoogleMapState {
  const factory GoogleMapState.initial() = _Initial;
  const factory GoogleMapState.mapLoaded({
    required CameraPosition cameraPosition,
    required Set<Marker> selectedMarker,
  }) = _MapLoaded;
  const factory GoogleMapState.locationSelected(
      {required LatLng selectedLocation}) = _LocationSelected;
  const factory GoogleMapState.locationConfirmed(
      {required LocationModel confirmedLocation}) = _LocationConfirmed;
  const factory GoogleMapState.error(String error) = _Error;
  const factory GoogleMapState.pathDrown({
    required LocationModel confirmedLocation,
  }) = _PathDrown;
}
