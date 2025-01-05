import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/features/my_properties/view_model/bloc/bloc_property_details/property_details_bloc.dart';
import 'package:owner_resort_booking_app/features/my_properties/view_model/bloc/bloc_property_room_list/property_room_list_bloc.dart';
import 'package:owner_resort_booking_app/features/my_properties/view_model/bloc/bloc_room_details/property_room_details_bloc.dart';
import 'package:owner_resort_booking_app/features/my_properties/views/widgets/room_list_card.dart';
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
                                child: RoomListCard(
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
