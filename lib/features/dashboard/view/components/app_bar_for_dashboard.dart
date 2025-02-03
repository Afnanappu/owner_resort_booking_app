import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/data/models/owner_model.dart';
import 'package:owner_resort_booking_app/core/data/view_model/cubit/owner_data_cubit.dart';
import 'package:owner_resort_booking_app/core/utils/screen_size.dart';
import 'package:owner_resort_booking_app/routes/route_names.dart';

class AppBarForDashboard extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarForDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 117,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.00, 1.00),
          end: Alignment(0, -1),
          colors: [
            Color(0xFFFB6E34),
            Color(0xFFFFA332),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 75.21,
            top: -389,
            child: Transform(
              transform: Matrix4.identity()
                ..translate(0.0, 0.0)
                ..rotateZ(0.19),
              child: Container(
                width: 426.03,
                height: 426.03,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(1.00, 0.00),
                    end: Alignment(-1, 0),
                    colors: [
                      Color(0xFFFB6E34),
                      Color(0xFFFFA332),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 23,
            top: 65,
            right: 23,
            child: SizedBox(
              width: MyScreenSize.width - 46,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<OwnerDataCubit, OwnerModel?>(
                    builder: (context, state) {
                      return Text(
                        'Hello, ${state?.name ?? 'Sir'}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    width: 160,
                  ),
                  IconButton.filled(
                    onPressed: () {
                      context.push('/${AppRoutes.notification}');
                    },
                    color: MyColors.orange,
                    style:
                        IconButton.styleFrom(backgroundColor: MyColors.white),
                    icon: Icon(Icons.notifications_active_outlined),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(117);
}
