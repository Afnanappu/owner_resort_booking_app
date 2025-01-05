import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_resort_booking_app/core/components/custom_text_form_field_for_all_widget_with_suggestions.dart';
import 'package:owner_resort_booking_app/core/utils/custom_regex.dart';
import 'package:owner_resort_booking_app/core/utils/debouncer.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_category/category_cubit.dart';

class RoomTypeTextFormFieldForAddRoom extends StatelessWidget {
  const RoomTypeTextFormFieldForAddRoom({
    super.key,
    required this.roomTypeController,
  });

  final TextEditingController roomTypeController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPropertyTypeCubit, List<String>>(
      builder: (context, suggestions) {
        return CustomTextFormFieldForAllWidgetWithSuggestion(
          onTap: () {
            context.read<GetPropertyTypeCubit>().fetchAdditionalOptionsType(
                  type: AdditionalOptionType.room,
                );
          },
          onChanged: (value) {
            Debouncer(milliseconds: 500).call(() {
              context.read<GetPropertyTypeCubit>().fetchAdditionalOptionsType(
                    type: AdditionalOptionType.room,
                  );
            });
          },
          suggestions: suggestions,
          width: 160,
          hintText: 'Room Type',
          controller: roomTypeController,
          suffixIcon: Icon(Icons.arrow_drop_down),
          validator: (value) {
            if (!MyRegex.emptySpaceValidation(value)) {
              return 'Empty space is not allowed';
            }
            return null;
          },
        );
      },
    );
  }
}
