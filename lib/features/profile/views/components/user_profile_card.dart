import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_resort_booking_app/core/components/custom_snack_bar.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/data/models/owner_model.dart';
import 'package:owner_resort_booking_app/core/data/view_model/cubit/owner_data_cubit.dart';
import 'package:owner_resort_booking_app/core/utils/screen_size.dart';
import 'package:owner_resort_booking_app/features/profile/views/widgets/editable_user_dialog.dart';

class UserProfileCard extends StatelessWidget {
  UserProfileCard({
    super.key,
  });

  final profileSize = MyScreenSize.width * 0.2;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OwnerDataCubit, OwnerModel?>(
      builder: (context, user) {
        final String name = user!.name;
        final String email = user.email;
        final String? phone = user.phone;
        final String? profileImageUrl = user.profilePicture;
        return Container(
          height: 140,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: profileSize,
                    height: profileSize,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFFFB6E34),
                          Color(0xFFFBAE34),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(50),
                      image: profileImageUrl == null
                          ? null
                          : DecorationImage(
                              image: MemoryImage(
                                base64Decode(profileImageUrl),
                              ),
                              fit: BoxFit.cover),
                    ),
                    child: profileImageUrl != null
                        ? null
                        : Center(
                            child: Text(
                              name[0].toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                  ),

                  const SizedBox(width: 16),
                  // User Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (phone != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            phone,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.grey),
                          ),
                        ],
                        const SizedBox(height: 4),
                        Text(
                          email,
                          style:
                              const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Edit Button
              Positioned(
                right: 0,
                top: 0,
                child: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => EditableUserDialog(
                        name: user.name,
                        phone: user.phone,
                        profilePicture: user.profilePicture,
                        onSave: (name, phone, profilePicture) async {

                          await context.read<OwnerDataCubit>().updateOwnerData(
                                OwnerModel(
                                  uid: user.uid,
                                  name: name,
                                  email: email,
                                  phone: phone,
                                  profilePicture: profilePicture,
                                  updatedAt: DateTime.now(),
                                ),
                              );
                          if (context.mounted) {
                            context
                                .read<OwnerDataCubit>()
                                .fetchOwnerData()
                                .then(
                              (value) {
                                if (context.mounted) {
                                  showCustomSnackBar(
                                    context: context,
                                    message: 'User data updated',
                                    bgColor: MyColors.success,
                                  );
                                }
                              },
                            );
                          }
                          if (context.mounted) {
                            Navigator.pop(context);
                          }
                        },
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.edit,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
