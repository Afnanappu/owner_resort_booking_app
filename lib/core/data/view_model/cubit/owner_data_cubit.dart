import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/components/custom_alert_dialog.dart';
import 'package:owner_resort_booking_app/core/data/models/owner_model.dart';
import 'package:owner_resort_booking_app/core/data/repository/owner_repository.dart';
import 'package:owner_resort_booking_app/routes/route_names.dart';

class OwnerDataCubit extends Cubit<OwnerModel?> {
  final OwnerRepository _repository;
  OwnerDataCubit(this._repository) : super(null);

  Future<void> fetchOwnerData() async {
    final user = await _repository.fetchOwnerData();
    emit(user);
  }


  Future<void> updateOwnerData(OwnerModel ownerModel) async {
    try {
      await _repository.updateOwnerData(ownerModel);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
    }
  }
  void setUser(OwnerModel ownerModel) {
    emit(ownerModel);
  }

  void isOwnerBlocked(BuildContext context) {
    _repository.isOwnerBlocked().listen(
      (isBlocked) {
        if (isBlocked == true) {
          if (context.mounted) {
            customAlertDialog(
              context: context,
              barrierDismissible: false,
              title: 'Your account is blocked by the admin',
              content: 'contact the admin for more information',
              firstText: 'Ok',
              secondText: null,
              secondOnPressed: null,
              firstOnPressed: () async {
                context.go('/${AppRoutes.login}');
                await FirebaseAuth.instance.signOut();
              },
            );
          }
        }
      },
    );
  }
}
