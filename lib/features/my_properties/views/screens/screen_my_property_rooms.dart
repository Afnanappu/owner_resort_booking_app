import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/core/models/room_model.dart';
import 'package:owner_resort_booking_app/features/my_properties/view_model/bloc/bloc_property_details/property_details_bloc.dart';
import 'package:owner_resort_booking_app/features/my_properties/view_model/bloc/bloc_property_room_list/property_room_list_bloc.dart';
import 'package:owner_resort_booking_app/features/my_properties/view_model/bloc/bloc_room_details/property_room_details_bloc.dart';
import 'package:owner_resort_booking_app/routes/route_names.dart';

class ScreenMyPropertyRooms extends StatelessWidget {
  const ScreenMyPropertyRooms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Rooms',
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: BlocBuilder<PropertyRoomListBloc, PropertyRoomListState>(
          builder: (context, state) {
            return state.maybeWhen(
              initial: () {
                return Center(
                  child: Text(
                    'Loading room details, please wait!',
                  ),
                );
              },
              loading: () {
                return Center(
                  child: Text(
                    'Loading room details, please wait!',
                  ),
                );
              },
              error: (message) {
                return Center(
                  child: Text(
                    message,
                  ),
                );
              },
              orElse: () {
                return Center(
                  child: Text(
                    'Something unexpected happened, can\'t load property details',
                  ),
                );
              },
              loaded: (roomList) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //TODO: property sorting is need to be added

                    Text(
                      'Properties (${roomList.length})',
                      style: MyTextStyles.titleMediumSemiBoldBlack,
                    ),
                    MySpaces.hSpace10,
                    roomList.isEmpty
                        ? Center(
                            child: Text('No property added'),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: roomList.length,
                            itemBuilder: (context, index) {
                              final room = roomList[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: RoomCard(
                                  room: room,
                                  onTap: () {
                                    final propertyId = context
                                        .read<PropertyDetailsBloc>()
                                        .getPropertyId();

                                    context.read<PropertyRoomDetailsBloc>().add(
                                          PropertyRoomDetailsEvent
                                              .fetchRoomDetails(
                                            propertyId: propertyId!,
                                            roomId: room.id!,
                                          ),
                                        );
                                    context.push(
                                        '/${AppRoutes.myPropertyRoomDetails}');
                                  },
                                ),
                              );
                            },
                          ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class RoomCard extends StatelessWidget {
  const RoomCard({
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
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 0.5,
                color: const Color(0xFF8A8989),
              ),
              boxShadow: [
                const BoxShadow(
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
                // Image section
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

                // Room details
                Text(
                  'Room No: ${room.roomId}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 4),

                Text(
                  '${room.roomArea} sqm • ${room.bedType} bed • Max ${room.maxGustCount} adults per room',
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                // Features and price
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
                                style: const TextStyle(fontSize: 10),
                              ),
                            ],
                          );
                        },
                      ),
                    ),

                    // Row(
                    //   children: [
                    //     Icon(Icons.tv, size: 16),
                    //     const SizedBox(width: 4),
                    //     Text(
                    //       'TV',
                    //       style: const TextStyle(fontSize: 10),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(width: 10),
                    Text(
                      '+${room.amenities.length > 4 ? room.amenities.length - 4 : room.amenities.length} more',
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFF0D71B9),
                      ),
                    ),
                    Spacer(),
                    Text(
                      room.price,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // Availability button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFB6E34),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    shadowColor: const Color(0x3F000000),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Unavailable',
                    style: TextStyle(fontSize: 12, color: Colors.white),
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
