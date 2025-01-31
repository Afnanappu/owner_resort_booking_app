part of 'booked_property_details_bloc.dart';

@freezed
class BookedPropertyDetailsState with _$BookedPropertyDetailsState {
  const factory BookedPropertyDetailsState.initial() = _Initial;
  const factory BookedPropertyDetailsState.loaded(
    BookedPropertyDetailsModel bookedPropertyDetails,
  ) = _Loaded;
  const factory BookedPropertyDetailsState.loading() = _Loading;
  const factory BookedPropertyDetailsState.cancelled() = _Cancelled;
  const factory BookedPropertyDetailsState.error(String error) = _Error;
}
