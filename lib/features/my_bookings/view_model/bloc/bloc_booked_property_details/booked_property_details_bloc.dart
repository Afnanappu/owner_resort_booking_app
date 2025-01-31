import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:owner_resort_booking_app/features/my_bookings/model/booked_property_details_model.dart';
import 'package:owner_resort_booking_app/features/my_bookings/repository/my_booking_repository.dart';

part 'booked_property_details_bloc.freezed.dart';
part 'booked_property_details_event.dart';
part 'booked_property_details_state.dart';

class BookedPropertyDetailsBloc
    extends Bloc<BookedPropertyDetailsEvent, BookedPropertyDetailsState> {
  final MyBookingRepository _repository;
  BookedPropertyDetailsBloc(this._repository) : super(_Initial()) {
    on<_FetchBookedDetails>((event, emit) async {
      emit(BookedPropertyDetailsState.loading());

      try {
        final bookedPropertyDetails = await _repository.fetchBookingDetails(
            ownerId: event.ownerId, bookingId: event.bookingId);

        emit(BookedPropertyDetailsState.loaded(bookedPropertyDetails));
      } catch (e) {
        emit(BookedPropertyDetailsState.error(e.toString()));
      }
    });

    // on<_CancelBooking>((event, emit) async {
    //   emit(BookedPropertyDetailsState.loading());

    //   try {
    //     //
    //     await _repository.cancelBooking(
    //         bookedPropertyDetailsModel: event.bookedPropertyDetailsModel);
    //     emit(BookedPropertyDetailsState.cancelled());
    //   } catch (e) {
    //     emit(BookedPropertyDetailsState.error(e.toString()));
    //   }
    // });
  }
}
