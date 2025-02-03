part of 'booked_property_list_bloc.dart';

@freezed
class BookedPropertyListState with _$BookedPropertyListState {
  const factory BookedPropertyListState.loading() = _Loading;
  const factory BookedPropertyListState.loaded(
    List<BookedPropertyCardModel> bookingModelList,
    // PropertyCardModel property,
  ) = _Loaded;
  const factory BookedPropertyListState.error(String error) = _Error;
}
