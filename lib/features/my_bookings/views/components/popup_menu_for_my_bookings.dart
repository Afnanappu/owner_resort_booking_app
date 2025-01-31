import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_resort_booking_app/core/data/view_model/cubit/owner_data_cubit.dart';
import 'package:owner_resort_booking_app/features/my_bookings/view_model/bloc/bloc_booked_property_list/booked_property_list_bloc.dart';

class PopupMenuForMyBookings extends StatelessWidget {
  const PopupMenuForMyBookings({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.filter_list),
      onSelected: (String value) {
        final ownerId = context.read<OwnerDataCubit>().state!.uid!;
        context.read<BookedPropertyListBloc>().add(
              BookedPropertyListEvent.fetchMyBookings(
                type: value,
                ownerId: ownerId,
              ),
            );
        log('filtering $value');
      },
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            value: 'all',
            child: Text('All'),
          ),
          // PopupMenuItem(
          //   value: 'pending',
          //   child: Text('Pending'),
          // ),
          PopupMenuItem(
            value: 'booked',
            child: Text('Booked'),
          ),
          PopupMenuItem(
            value: 'cancelled',
            child: Text('Cancelled'),
          ),
        ];
      },
    );
  }
}
