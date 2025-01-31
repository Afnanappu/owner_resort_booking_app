import 'package:flutter/material.dart';

// class ProfileAppBar extends StatelessWidget {
//   const ProfileAppBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return
//   }

// }
class ProfileAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 402,
          height: 290,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.00, -1.00),
              end: Alignment(0, 1),
              colors: [
                Color(0xFFFEE4D9),
                Color(0xFFFFAA88),
              ],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: -117.46,
                top: 21.21,
                child: Transform(
                  transform: Matrix4.identity()
                    ..translate(0.0, 0.0)
                    ..rotateZ(-0.28),
                  child: Container(
                    width: 506.21,
                    height: 279.04,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(-0.38, 0.92),
                        end: Alignment(0.38, -0.92),
                        colors: [
                          Color(0xFFFFAA88),
                          Color(0xFFFEE4D9),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Positioned(
              //   left: 17.91,
              //   top: -148.78,
              //   child: Transform(
              //     transform: Matrix4.identity()
              //       ..translate(0.0, 0.0)
              //       ..rotateZ(0.36),
              //     child: Container(
              //       width: 506.21,
              //       height: 144.92,
              //       clipBehavior: Clip.antiAlias,
              //       decoration: BoxDecoration(
              //         gradient: LinearGradient(
              //           begin: Alignment(0, 1),
              //           end: Alignment(0.00, -1.00),
              //           colors: [
              //             Color(0xFFFFAA88),
              //             Color(0xFFFEE4D9),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
