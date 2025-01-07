import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/components/custom_add_details_for_all_widget.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/models/extra_details_model.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_extra_details/extra_details_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_rules_details/rules_details_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_sub_details/sub_details_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/views/widgets/extra_basic_details_widget.dart';
import 'package:owner_resort_booking_app/features/add_property/views/widgets/extra_rules_details_widget.dart';
import 'package:owner_resort_booking_app/routes/route_names.dart';

class ExtraDetailsWidget extends StatelessWidget {
  const ExtraDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExtraDetailsCubit, ExtraDetailsModel?>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomAddDetailsForAllWidget(
              text: 'Extra Details *',
              onPressed: () {
                context
                        .read<RulesDetailsCubit>()
                        .setPreviousRulesDetailsState =
                    context.read<RulesDetailsCubit>().state;
                context
                        .read<ExtraDetailsCubit>()
                        .setPreviousExtraDetailsState =
                    context.read<ExtraDetailsCubit>().state;
                context
                        .read<SubDetailsCubit>()
                        .setPreviousSubDetailsState =
                    context.read<SubDetailsCubit>().state;
    
                context
                    .push('/${AppRoutes.addExtraDetails}');
              },
              trailingText: state != null ? 'Edit' : null,
              trailingIcon:
                  state != null ? Icons.edit : null,
            ),
            if (state != null)
              ExtraBasicDetailsWidget(
                basicDetails: state.basicDetailsModel,
              ),
            if (state != null) MySpaces.hSpace20,
            if (state != null)
              ExtraRulesDetailsWidget(
                rulesDetails: state.rulesDetailsModel,
              )
          ],
        );
      },
    );
  }
}
