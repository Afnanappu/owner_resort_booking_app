part of 'booked_property_details_bloc.dart';

@freezed
class BookedPropertyDetailsEvent with _$BookedPropertyDetailsEvent {
  const factory BookedPropertyDetailsEvent.fetchBookedDetails({
    required String ownerId,
    required String bookingId,
  }) = _FetchBookedDetails;

  // const factory BookedPropertyDetailsEvent.cancelBooking({
  //   required BookedPropertyDetailsModel bookedPropertyDetailsModel,
  // }) = _CancelBooking;
}
