// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:user_resort_booking_app/core/data/models/booking_model.dart';
// import 'package:user_resort_booking_app/feature/my_bookings/repository/my_booking_repository.dart';

// class BookedPropertyDetailsCubit extends Cubit<BookingModel?> {
//   final MyBookingRepository _repository;

//   BookedPropertyDetailsCubit(this._repository) : super(null);

//   Future<void> fetchBookingDetails({
//     required String ownerId,
//     required String bookingId,
//   }) async {
//     final model = await _repository.fetchBookingDetails(
//         ownerId: ownerId, bookingId: bookingId);

//     emit(model);
//   }

//   void setBookingDetails(BookingModel bookingModel) {
//     emit(bookingModel);
//   }

//   void clear() {
//     emit(null);
//   }
// }
