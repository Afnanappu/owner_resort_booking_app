import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/components/custom_app_container.dart';
import 'package:owner_resort_booking_app/core/components/custom_divider.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/core/utils/screen_size.dart';
import 'package:owner_resort_booking_app/core/data/models/basic_details_model.dart';

class ExtraBasicDetailsWidget extends StatelessWidget {
  const ExtraBasicDetailsWidget({
    super.key,
    required this.basicDetails,
  });
  final BasicDetailsModel basicDetails;
  @override
  Widget build(BuildContext context) {
    return CustomAppContainer(
      padding: EdgeInsets.all(20),
      width: MyScreenSize.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Text(
            basicDetails.title,
            style: MyTextStyles.titleSmallSemiBoldBlack,
          ),
          const SizedBox(height: 10),

          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final details = basicDetails.subDetails[index];
              return _buildSection(
                title: details.title,
                items: details.details,
              );
            },
            separatorBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomDivider(
                  horizontal: 40,
                ),
              );
            },
            itemCount: basicDetails.subDetails.length,
          ),
        ],
      ),
    );
  }

  Widget _buildSection({required String title, required List<String> items}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: MyTextStyles.bodySmallMediumBlack,
        ),
        const SizedBox(height: 5),
        ...items.map(
          (item) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 4),
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
                      item,
                      style: MyTextStyles.bodySmallNormalBlack
                          .copyWith(fontSize: 13),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
