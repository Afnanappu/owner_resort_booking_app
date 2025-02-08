import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:owner_resort_booking_app/core/components/custom_circular_progress_indicator.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/data/models/user_model.dart';
import 'package:owner_resort_booking_app/features/dashboard/view_model/cubit/cubit/customers_cubit.dart';

class ScreenMyCustomers extends StatelessWidget {
  const ScreenMyCustomers({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<CustomersCubit>().fetchAllCustomers();
      },
    );
    return Scaffold(
      appBar: CustomAppBar(
        title: 'My Customers',
      ),
      body: BlocBuilder<CustomersCubit, CustomersState>(
        builder: (context, state) {
          return state.maybeWhen(
            error: (error) => Center(
              child: Text(error),
            ),
            loading: () => Center(
              child: CustomCircularProgressIndicator(),
            ),
            orElse: () => Center(
              child: Text('An unexpected error occurred'),
            ),
            loaded: (users) {
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return CustomerCard(
                    user: user,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class CustomerCard extends StatelessWidget {
  const CustomerCard({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Avatar with the first letter of the user's name
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFFB6E34), Color(0xFFFBAE34)],
              ),
              borderRadius: BorderRadius.circular(25),
              image: user.profilePicture == null
                  ? null
                  : DecorationImage(
                      image: MemoryImage(
                        base64Decode(user.profilePicture!),
                      ),
                    ),
            ),
            child: Center(
              child: Text(
                user.name[0].toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
          // Column with the user's name, amount, and transaction date
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User's name and transaction amount
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      user.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      user.email,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: MyColors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
