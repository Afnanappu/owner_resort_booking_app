import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/components/custom_app_container.dart';
import 'package:shimmer/shimmer.dart';

class BookedPropertyCardShimmer extends StatelessWidget {
  const BookedPropertyCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppContainer(
      height: 160,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _shimmerBox(width: 170, height: 16), // Placeholder for Booking Id
          const SizedBox(height: 10),
          _buildDetailsShimmer(),
        ],
      ),
    );
  }

  Widget _buildDetailsShimmer() {
    return Row(
      children: [
        _shimmerBox(
            width: 90, height: 90, borderRadius: 10), // Image Placeholder
        const SizedBox(width: 10),
        Expanded(
          child: _buildPropertyInfoShimmer(),
        ),
      ],
    );
  }

  Widget _buildPropertyInfoShimmer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _shimmerBox(width: double.infinity, height: 16), // Property Name
        const SizedBox(height: 10),
        _shimmerBox(width: 120, height: 16), // Booking Dates
        const SizedBox(height: 10),
        _buildPriceAndStatusShimmer(),
      ],
    );
  }

  Widget _buildPriceAndStatusShimmer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _shimmerBox(width: 60, height: 16), // Price Placeholder
        _shimmerBox(
            width: 80,
            height: 25,
            borderRadius: 5), // Status Button Placeholder
      ],
    );
  }

  Widget _shimmerBox(
      {required double width,
      required double height,
      double borderRadius = 0}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }

  // Widget _shimmerCircle(double size) {
  //   return Shimmer.fromColors(
  //     baseColor: Colors.grey.shade300,
  //     highlightColor: Colors.grey.shade100,
  //     child: Container(
  //       width: size,
  //       height: size,
  //       decoration: const BoxDecoration(
  //         shape: BoxShape.circle,
  //         color: Colors.grey,
  //       ),
  //     ),
  //   );
  // }
}
