import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/components/selected_room_container.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/core/data/models/picked_date_range_model.dart';
import 'package:owner_resort_booking_app/core/data/models/room_model.dart';


class SelectedRoomWidget extends StatelessWidget {
  const SelectedRoomWidget({
    super.key,
    required this.roomList,
    required this.selectedDate,
    required this.peoples,
    required this.nights,
    this.isBooked = false,
  });

  final List<RoomModel> roomList;
  final PickedDateRangeModel selectedDate;
  final int nights;
  final int peoples;
  final bool isBooked;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          '${isBooked ? 'Booked' : 'Selected'} Rooms (${roomList.length})',
          style: MyTextStyles.titleMediumSemiBoldBlack,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: roomList.length,
          itemBuilder: (context, index) {
            final room = roomList[index];
            return SelectedRoomContainer(
              roomNumber: room.roomId,
              roomType: room.roomType,
              bedType: room.bedType,
              maxGuests: room.maxGustCount,
              pricePerNight: double.parse(room.price),
              nights: nights,
              guests: peoples,
              amenities: room.amenities
                  .map(
                    (e) => e.name,
                  )
                  .toList(),
            );
          },
        )
      ],
    );
  }
}
