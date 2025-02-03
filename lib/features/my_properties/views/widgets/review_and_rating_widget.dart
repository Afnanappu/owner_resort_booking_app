import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/components/custom_divider.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/my_constants.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/core/data/models/review_component_widget.dart';
import 'package:owner_resort_booking_app/core/data/models/review_model.dart';
import 'package:owner_resort_booking_app/core/utils/math_functions.dart';
import 'package:owner_resort_booking_app/features/my_properties/views/components/custom_container_for_property_details.dart';
import 'package:owner_resort_booking_app/features/my_properties/views/components/rating_start_indicator_component.dart';

class ReviewAndRatingWidget extends StatelessWidget {
  const ReviewAndRatingWidget({
    super.key,
    required this.reviews,
  });

  final List<ReviewModel> reviews;

  @override
  Widget build(BuildContext context) {
    final ratingAvg = getAverage(
      reviews
          .map(
            (e) => e.rating,
          )
          .toList(),
    );
    final ratingsMap = _getSpecificStartCount(reviews);

    final totalRating = _getTotalRatings(reviews);
    return Column(
      children: [
        //review and rating container
        CustomContainerForPropertyDetails(
          padding: 20,
          title: 'Review & Rating',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 10,
            children: [
              //green box
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRad10),
                  color: const Color.fromARGB(255, 54, 187, 59),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$ratingAvg/5',
                      style: MyTextStyles.ratingStyle.apply(
                        color: MyColors.white,
                      ),
                    ),
                    Text(
                      '${reviews.length} Ratings',
                      style: TextStyle(
                        color: MyColors.white,
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return RatingStartIndicatorComponent(
                      index: 5 - index,
                      indicatorValue:
                          ((ratingsMap[5 - index] ?? 0) / totalRating) * 100,
                      rating: ratingsMap[5 - index] ?? 0,
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        MySpaces.hSpace20,

       if(reviews.isNotEmpty) CustomContainerForPropertyDetails(
          title: 'Your Review',
          child: ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: reviews.length > 4 ? 4 : reviews.length,
            separatorBuilder: (context, index) {
              return CustomDivider(
                vertical: 10,
              );
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ReviewWidget(review: reviews[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  Map<int, int> _getSpecificStartCount(List<ReviewModel> reviews) {
    final Map<int, int> frequency = {};
    for (var review in reviews) {
      final rating = review.rating;
      frequency[rating] = (frequency[rating] ?? 0) + 1;
    }
    print(frequency);
    return frequency;
  }

  int _getTotalRatings(List<ReviewModel> reviews) {
    final total = reviews.fold(
      0,
      (previousValue, element) => previousValue + element.rating,
    );
    if (total > 0) {
      return total;
    } else {
      return 1;
    }
  }
}
