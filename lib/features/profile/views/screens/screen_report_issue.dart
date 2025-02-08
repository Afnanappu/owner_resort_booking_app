import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_resort_booking_app/core/components/custom_snack_bar.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/features/profile/model/report_issue_model.dart';
import 'package:owner_resort_booking_app/features/profile/view_model/cubit_report_issue/report_issue_cubit.dart';

class ReportIssueScreen extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  ReportIssueScreen({super.key});

  void submitReport(BuildContext context) {
    final String title = _titleController.text.trim();
    final String description = _descriptionController.text.trim();

    if (title.isNotEmpty && description.isNotEmpty) {
      // Logic to send the report to the admin (e.g., API call, database update, etc.)
      final model = ReportIssueModel(
        title: title,
        description: description,
        timestamp: DateTime.now(),
      );
      context.read<ReportIssueCubit>().requestSubmit(model);
    } else {
      showCustomSnackBar(
        context: context,
        message: 'Please fill in all fields.',
        bgColor: MyColors.grey,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Report an Issue')),
      body: BlocListener<ReportIssueCubit, ReportIssueState>(
        listener: (context, state) {
          state.maybeWhen(
            submitted: () {
              showCustomSnackBar(
                context: context,
                message: 'Report submitted successfully!',
                bgColor: MyColors.success,
              );

              _titleController.clear();
              _descriptionController.clear();
            },
            error: (error) => showCustomSnackBar(
              context: context,
              message: error,
            ),
            orElse: () {},
          );
        },
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Issue Title',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  alignLabelWithHint: true,
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => submitReport(context),
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
