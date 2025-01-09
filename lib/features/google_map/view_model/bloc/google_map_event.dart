part of 'google_map_bloc.dart';

@freezed
class GoogleMapEvent with _$GoogleMapEvent {
  const factory GoogleMapEvent.mapInitialized() = _MapInitialized;
  const factory GoogleMapEvent.selectLocation(LatLng selectedLocation) =
      _SelectLocation;
  const factory GoogleMapEvent.confirmLocation(LatLng? selectedLocation) =
      _ConfirmLocation;
  const factory GoogleMapEvent.clearSelection() = _ClearSelection;
}
