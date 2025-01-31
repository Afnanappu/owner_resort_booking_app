import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/components/custom_app_container.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/core/utils/screen_size.dart';
import 'package:owner_resort_booking_app/core/data/models/rules_details_model.dart';

class ExtraRulesDetailsWidget extends StatelessWidget {
  const ExtraRulesDetailsWidget({
    super.key,
    required this.rulesDetails,
  });
  final RulesDetailsModel rulesDetails;
  @override
  Widget build(BuildContext context) {
    return CustomAppContainer(
      padding: EdgeInsets.all(20),
      width: MyScreenSize.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            rulesDetails.title,
            style: MyTextStyles.titleSmallSemiBoldBlack,
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: rulesDetails.rules.length,
            itemBuilder: (context, index) {
              final details = rulesDetails.rules[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  spacing: 12,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 8,
                      color: MyColors.black,
                    ),
                    Expanded(
                      child: Text(
                        details,
                        style: MyTextStyles.bodySmallNormalBlack,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
