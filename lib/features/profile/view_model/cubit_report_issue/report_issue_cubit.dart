import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:owner_resort_booking_app/core/utils/exceptions/custom_exceptions.dart';
import 'package:owner_resort_booking_app/features/profile/model/report_issue_model.dart';

part 'report_issue_state.dart';
part 'report_issue_cubit.freezed.dart';

class ReportIssueCubit extends Cubit<ReportIssueState> {
  ReportIssueCubit() : super(ReportIssueState.initial());

  //Function to request submission
  Future<void> requestSubmit(ReportIssueModel model) async {
    emit(ReportIssueState.loading());
    try {
      final doc = FirebaseFirestore.instance.collection('reported_issue').doc();
      model.id = doc.id;
      await doc.set(model.toMap());

      //emit
      emit(ReportIssueState.submitted());
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      emit(
        ReportIssueState.error(AppExceptionHandler.handleFirestoreException(e)),
      );
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      emit(
        ReportIssueState.error(AppExceptionHandler.handleGenericException(e)),
      );
    }
  }
}
