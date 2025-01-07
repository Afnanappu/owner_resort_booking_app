import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_resort_booking_app/core/components/custom_text_form_field_for_all_widget_with_suggestions.dart';
import 'package:owner_resort_booking_app/core/utils/custom_regex.dart';
import 'package:owner_resort_booking_app/core/utils/debouncer.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_category/category_cubit.dart';

class PropertyTypeTextFormFieldForAddProperty extends StatelessWidget {
  const PropertyTypeTextFormFieldForAddProperty({
    super.key,
    required this.typeController,
  });

  final TextEditingController typeController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPropertyTypeCubit, List<String>>(
      builder: (context, suggestions) {
        return CustomTextFormFieldForAllWidgetWithSuggestion(
          onTap: () {
            context.read<GetPropertyTypeCubit>().fetchAdditionalOptionsType(
                  type: AdditionalOptionType.propertyCategories,
                );
          },
          onChanged: (value) {
            Debouncer(milliseconds: 500).call(
              () {
                context.read<GetPropertyTypeCubit>().fetchAdditionalOptionsType(
                      type: AdditionalOptionType.propertyCategories,
                    );
              },
            );
          },
          width: 180,
          hintText: 'Property Type',
          controller: typeController,
          suggestions: suggestions,
          validator: (value) {
            if (!MyRegex.emptySpaceValidation(value)) {
              return 'Don\'t use empty space, user characters';
            } else {
              return null;
            }
          },
        );
      },
    );
  }
}
