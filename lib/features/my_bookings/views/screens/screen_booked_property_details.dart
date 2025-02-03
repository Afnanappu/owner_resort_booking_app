import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:owner_resort_booking_app/core/components/custom_circular_progress_indicator.dart';
import 'package:owner_resort_booking_app/core/components/custom_snack_bar.dart';
import 'package:owner_resort_booking_app/core/components/payment_review_widget.dart';
import 'package:owner_resort_booking_app/core/components/property_simple_card_component.dart';
import 'package:owner_resort_booking_app/core/components/selected_room_widget.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/data/models/picked_date_range_model.dart';
import 'package:owner_resort_booking_app/core/utils/custom_date_formats.dart';
import 'package:owner_resort_booking_app/core/utils/math_functions.dart';
import 'package:owner_resort_booking_app/features/my_bookings/view_model/bloc/bloc_booked_property_details/booked_property_details_bloc.dart';
import 'package:owner_resort_booking_app/features/my_bookings/views/widgets/your_booking_details_widget_for_booked_details.dart';
import 'package:owner_resort_booking_app/features/my_properties/views/components/custom_container_for_property_details.dart';
import 'package:owner_resort_booking_app/features/my_properties/views/components/custom_icon_widget.dart';

class ScreenBookedPropertyDetails extends StatelessWidget {
  const ScreenBookedPropertyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // final userData = context.read<UserDataCubit>().state!;

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {},
    );
    return BlocConsumer<BookedPropertyDetailsBloc, BookedPropertyDetailsState>(
      listener: (context, state) {
        state.maybeWhen(
          cancelled: () {
            showCustomSnackBar(
              context: context,
              message: 'Booking cancelled successfully',
              bgColor: MyColors.success,
            );
            context.pop();
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            title: 'Booking Details',
          ),
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: state.maybeWhen(
              initial: () => Center(
                child: CustomCircularProgressIndicator(),
              ),
              loading: () => Center(
                child: CustomCircularProgressIndicator(),
              ),
              error: (error) => Center(
                child: Text(error),
              ),
              cancelled: () => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomCircularProgressIndicator(),
                    Text('Cancelling the booking'),
                  ],
                ),
              ),
              orElse: () => Center(
                child: Text('Something unexpected happened'),
              ),
              loaded: (bookedPropertyDetails) {
                final property = bookedPropertyDetails.property;
                final bookingDetails = bookedPropertyDetails.bookingDetails;
                final roomList = bookedPropertyDetails.bookedRooms;
                final nights = bookingDetails.endDate
                    .difference(
                      bookingDetails.startDate,
                    )
                    .inDays;
                final ratingAvg = getAverage(property.reviews
                    .map(
                      (e) => e.rating,
                    )
                    .toList());
                return ListView(
                  children: [
                    PropertySimpleCardComponent(
                      image: property.images.first.base64file,
                      propertyName: property.name,
                      location: property.location,
                      rating: ratingAvg,
                      reviews: property.reviews
                          .map(
                            (e) => e.feedback,
                          )
                          .toList(),
                      price: property.price,
                    ),

                    MySpaces.hSpace20,

                    //booking details
                    YourBookingDetailsWidgetForBookedDetails(
                      startingDate: customDateFormat(bookingDetails.startDate),
                      endDate: customDateFormat(bookingDetails.endDate),
                      peoples: bookingDetails.gustCount,
                      bookingId: bookingDetails.bookingId!,
                      userId: bookingDetails.userId,
                    ),

                    MySpaces.hSpace20,

                    //Selected room list
                    SelectedRoomWidget(
                      isBooked: true,
                      roomList: roomList,
                      selectedDate: PickedDateRangeModel(
                        bookingDetails.startDate,
                        bookingDetails.endDate,
                      ),
                      peoples: bookingDetails.gustCount,
                      nights: nights,
                    ),

                    MySpaces.hSpace20,

                    //Payment
                    PaymentReviewWidget(
                      roomList: roomList,
                      nights: nights,
                      price: bookingDetails.totalPrice,
                    ),

                    MySpaces.hSpace20,

                    CustomContainerForPropertyDetails(
                      title: 'Cancellation Eligibility',
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 12,
                        ),
                        child: Column(
                          spacing: 8,
                          children: [
                            '100% Refund for cancellations made within 2 hours of booking.',
                            '100% Refund if cancelled more than 72 hours before check-in',
                            '70% Refund for cancellations made between 24 to 72 hours before check-in.',
                            'No Refund for cancellations made less than 24 hours before check-in.',
                            'Bookings made less than 24 hours before check-in are non-refundable.',
                            'Bookings Fee will not be included in this refunds'
                          ]
                              .map(
                                (item) => CustomIconTextWidget(
                                  icon: Icon(
                                    Icons.circle,
                                    size: 6,
                                  ),
                                  content: Expanded(child: Text(item)),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
