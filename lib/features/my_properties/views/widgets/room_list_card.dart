import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/my_constants.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/core/models/room_model.dart';

class RoomListCard extends StatelessWidget {
  const RoomListCard({
    super.key,
    required this.room,
    this.onTap,
  });
  final RoomModel room;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: MyColors.scaffoldDefaultColor,
              borderRadius: BorderRadius.circular(borderRad10),
              border: Border.all(
                width: 0.5,
                color: const Color(0xFF8A8989),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 5,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Image Section
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: [
                      Image.memory(
                        base64Decode(room.images.first.base64file),
                        height: 140,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                // Room Details
                Text(
                  'Room No: ${room.roomId}',
                  style: MyTextStyles.bodySmallMediumBlack,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 4),

                Text(
                  '${room.roomArea} sqm • ${room.bedType} bed • Max ${room.maxGustCount} adults per room',
                  style: MyTextStyles.textFieldNormalGreyLight,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 10),

                // Features and Price
                Row(
                  children: [
                    SizedBox(
                      height: 40,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: room.amenities.length > 4
                            ? 4
                            : room.amenities.length,
                        itemBuilder: (context, index) {
                          final amenities = room.amenities[index];
                          return Row(
                            children: [
                              if (amenities.image != null)
                                Image.memory(
                                  base64Decode(amenities.image!),
                                  height: 16,
                                ),
                              const SizedBox(width: 4),
                              Text(
                                amenities.name,
                                style: MyTextStyles.textFieldMediumGreyLight,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '+${room.amenities.length > 4 ? room.amenities.length - 4 : room.amenities.length} more',
                      style: MyTextStyles.bodySmallMediumBlue,
                    ),
                    const Spacer(),
                    Text(
                      '₹${room.price}',
                      style: MyTextStyles.titleSmallSemiBoldBlack,
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // Availability Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFB6E34),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    shadowColor: const Color(0x3F000000),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Unavailable',
                    style: MyTextStyles.titleMediumSemiBoldWhite,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
