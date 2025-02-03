import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/data/models/review_model.dart';
import 'package:owner_resort_booking_app/core/utils/custom_date_formats.dart';
import 'package:owner_resort_booking_app/features/my_properties/views/components/custom_container_for_property_details.dart';

class ReviewComponentWidget extends StatelessWidget {
  const ReviewComponentWidget({
    super.key,
    required this.review,
  });

  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    return CustomContainerForPropertyDetails(
      title: 'Your Review',
      child: ReviewWidget(review: review),
    );
  }
}

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({
    super.key,
    required this.review,
  });

  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Rating:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(width: 8),
            StarRating(
              rating: review.rating.toDouble(),
              size: 20,
              allowHalfRating: false,
              color: MyColors.orange,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          review.feedback,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            customDateFormatWithTime(review.timestamp), // Display the timestamp
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ),
      ],
    );
  }
}
