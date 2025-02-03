import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';

class TotalBookingContainerWidget extends StatelessWidget {
  const TotalBookingContainerWidget({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Divider(
            color: MyColors.greyLight,
          ),
        );
      },
      itemCount: children.length,
      itemBuilder: (context, index) {
        return children[index];
      },
    );

    // Column(
    //   children: [
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Text('Upcoming'),
    //         Text('10'),
    //       ],
    //     ),
    //     Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    //       child: Divider(
    //         color: MyColors.greyLight,
    //       ),
    //     ),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Text('Completed'),
    //         Text('8'),
    //       ],
    //     ),
    //     Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    //       child: Divider(
    //         color: MyColors.greyLight,
    //       ),
    //     ),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Text('Cancelled'),
    //         Text('1'),
    //       ],
    //     ),
    //     Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    //       child: Divider(
    //         color: MyColors.greyLight,
    //       ),
    //     ),
    //   ],
    // );
  }
}
