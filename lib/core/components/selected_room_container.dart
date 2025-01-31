import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/components/custom_app_container.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';

class SelectedRoomContainer extends StatelessWidget {
  final String roomNumber;
  final String roomType;
  final String bedType;
  final String maxGuests;
  final double pricePerNight;
  final int nights;
  final int guests;
  final List<String> amenities;

  const SelectedRoomContainer({
    super.key,
    required this.roomNumber,
    required this.roomType,
    required this.bedType,
    required this.maxGuests,
    required this.pricePerNight,
    required this.nights,
    required this.guests,
    required this.amenities,
  });

  @override
  Widget build(BuildContext context) {
    double totalPrice = pricePerNight * nights;

    return CustomAppContainer(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Room Number
          Text(
            'Room No: $roomNumber',
            style: MyTextStyles.bodyLargeBoldBlack,
          ),
          const SizedBox(height: 6),

          // Room Details
          Text(
            '$roomType • $bedType bed • Max $maxGuests guests',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 10),

          // Amenities
          Row(
            children: [
              const Text(
                'Amenities: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Expanded(
                child: Text(
                  amenities.join(', '),
                  style: const TextStyle(color: MyColors.grey),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Pricing and Duration
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '₹${pricePerNight.toStringAsFixed(2)} / night',
                    style: MyTextStyles.bodyLargeBoldBlack,
                  ),
                  Text(
                    '$nights Nights • $guests Guests',
                    style: MyTextStyles.bodySmallMediumGrey,
                  ),
                ],
              ),
              Text(
                'Total: ₹${totalPrice.toStringAsFixed(2)}',
                style: MyTextStyles.bodyLargeBoldBlack,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
