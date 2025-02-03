import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/my_constants.dart';

class ScreenAbout extends StatelessWidget {
  const ScreenAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'About',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  // Placeholder for the logo
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(appIconAsset),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "StayScape",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            Text(
              "Welcome to StayScape",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Your ultimate companion for booking resorts effortlessly. With a single button click, discover nearby resorts and create unforgettable memories with your loved ones.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 24),
            Divider(thickness: 1, color: Colors.grey[300]),
            SizedBox(height: 24),
            Text(
              "Our Mission",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "At StayScape, we believe everyone deserves a break. We aim to make resort bookings fast, hassle-free, and enjoyable, so you can focus on what truly matters – spending quality time with family and friends.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 24),
            Divider(thickness: 1, color: Colors.grey[300]),
            SizedBox(height: 24),
            Text(
              "Key Features",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            BulletPoint(
                text:
                    "Nearby Resort Finder: Locate the best resorts near you with ease."),
            BulletPoint(
                text:
                    "Quick & Easy Booking: Spend less time planning and more time enjoying."),
            BulletPoint(
                text: "Family & Friend Friendly: Perfect for all occasions."),
            SizedBox(height: 24),
            Divider(thickness: 1, color: Colors.grey[300]),
            SizedBox(height: 24),
            Text(
              "Meet the Team",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "This app was created by a passionate team dedicated to helping you enjoy life to the fullest.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 24),
            Divider(thickness: 1, color: Colors.grey[300]),
            SizedBox(height: 24),
            Text(
              "Contact Us",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Have questions or suggestions? Reach out to us at:",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 8),
            Text(
              "📧 contact@stayscape.com",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: MyColors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BulletPoint extends StatelessWidget {
  final String text;

  const BulletPoint({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle,
            color: MyColors.orange,
            size: 20,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
