import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/components/custom_add_details_for_all_widget.dart';
import 'package:owner_resort_booking_app/core/components/custom_alert_dialog.dart';
import 'package:owner_resort_booking_app/core/data/models/room_model.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/room_add_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/views/widgets/room_details_car_for_add_property.dart';
import 'package:owner_resort_booking_app/routes/route_names.dart';

class AddRoomWidgetForAddProperty extends StatelessWidget {
  const AddRoomWidgetForAddProperty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomAddDetailsForAllWidget(
          text: 'Add Rooms *',
          onPressed: () {
            context.push('/${AppRoutes.addRoom}');
          },
        ),
        BlocBuilder<RoomAddCubit, List<RoomModel>>(
          builder: (context, rooms) {
            return rooms.isNotEmpty
                ? SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: rooms.reversed.map(
                        (room) {
                          return ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: 250, // Minimum width for each card
                              maxWidth: MediaQuery.of(context)
                                  .size
                                  .width, // Allow up to 90% of screen width
                            ),
                            child: GestureDetector(
                              onLongPress: () async {
                                //Long press to remove file from list.
                                await customAlertDialog(
                                  context: context,
                                  title: 'Remove Room',
                                  content:
                                      'Do you want to remove this from the list?',
                                  firstText: 'Yes',
                                  secondText: 'No',
                                  firstOnPressed: () {
                                    context
                                        .read<RoomAddCubit>()
                                        .removeRoom(room);
                                    context.pop();
                                  },
                                  secondOnPressed: () {
                                    context.pop();
                                  },
                                );
                              },
                              child: RoomDetailsCard(
                                room: room,
                                index: rooms.indexOf(room),
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ))
                : SizedBox();
          },
        )
      ],
    );
  }
}
