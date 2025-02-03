import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/features/profile/views/components/user_profile_card.dart';

class AppBarForProfile extends StatelessWidget {
  const AppBarForProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const colorLight = Color.fromARGB(255, 254, 193, 169);
    const colorDark = Color.fromARGB(255, 239, 130, 86);
    return Container(
      width: double.infinity,
      height: 250,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            colorDark,
            colorLight,
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            child: Container(
              width: 600,
              height: 426.03,
              transform: Matrix4.identity()
                ..translate(0.0, 100.0)
                ..rotateZ(.4),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    colorLight,
                    colorDark,
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: UserProfileCard(),
          ),
        ],
      ),
    );
  }
}
