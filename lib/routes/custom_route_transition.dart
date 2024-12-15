import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


//animation duration, Just made it constant for better use.
const _animationDuration = Duration(milliseconds: 200);


// Custom page transition that will help to create dynamic page transition.
CustomTransitionPage<dynamic> customTransitionPage(GoRouterState state, Widget screen) {
  return CustomTransitionPage(
    key: state.pageKey,
    transitionDuration: _animationDuration,
    reverseTransitionDuration: _animationDuration,
    child: screen,
    transitionsBuilder: customTransition,
  );
}


//Custom transition animation part.
Widget customTransition(context, animation, secondaryAnimation, child) {
  final tween = Tween(begin: Offset(1, 0), end: Offset.zero)
      .chain(CurveTween(curve: Curves.easeIn));
  return SlideTransition(
    position: animation.drive(tween),
    child: child,
  );
}
