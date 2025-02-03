import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/components/custom_alert_dialog.dart';
import 'package:owner_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:owner_resort_booking_app/core/components/custom_snack_bar.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/bloc/bloc_add_property/add_property_bloc.dart';
import 'package:owner_resort_booking_app/features/my_properties/view_model/bloc/bloc_property_details/property_details_bloc.dart';
import 'package:owner_resort_booking_app/features/my_properties/view_model/bloc/bloc_property_room_list/property_room_list_bloc.dart';
import 'package:owner_resort_booking_app/features/my_properties/views/components/custom_icon_widget.dart';
import 'package:owner_resort_booking_app/routes/route_names.dart';

class AppBarForMyPropertyDetailsScreen extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarForMyPropertyDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: 'Details Resort',
      needUnderline: false,
      actions: [
        PopupMenuButton(
          offset: Offset(0, 40),
          iconSize: 22,
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: CustomIconTextWidget(
                  content: Text('Edit'),
                  icon: Icon(Icons.edit_note_outlined),
                ),
                onTap: () {
                  context.push('/${AppRoutes.addProperties}');
                  context.read<AddPropertyBloc>().isEdit = true;
                  final id =
                      context.read<PropertyDetailsBloc>().getPropertyId();
                  if (id == null) {
                    showCustomSnackBar(
                        context: context,
                        message: 'Id is null, can\'t show rooms');
                    return;
                  }

                  context.read<PropertyRoomListBloc>().add(
                        PropertyRoomListEvent.fetchRooms(propertyId: id),
                      );
                },
              ),
              PopupMenuItem(
                child: CustomIconTextWidget(
                  icon: Icon(Icons.delete_outline),
                  content: Text('Delete'),
                ),
                onTap: () {
                  final id =
                      context.read<PropertyDetailsBloc>().getPropertyId();
                  if (id == null) {
                    showCustomSnackBar(
                        context: context,
                        message: 'Id is null, can\'t show rooms');
                    return;
                  }
                  customAlertDialog(
                    context: context,
                    title: 'Delete this property!',
                    content:
                        'You will lose all the reviews and data about this property',
                    firstOnPressed: () {
                      context.read<PropertyDetailsBloc>().add(
                            PropertyDetailsEvent.propertyDeleted(id: id),
                          );
                    },
                  );
                },
              ),
            ];
          },
        ),
        MySpaces.hSpace5,
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
