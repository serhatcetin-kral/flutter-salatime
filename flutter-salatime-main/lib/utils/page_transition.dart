// import 'package:flutter/material.dart';
//
// Route smoothPageRoute(Widget page) {
//   return PageRouteBuilder(
//     transitionDuration: const Duration(milliseconds: 300),
//     pageBuilder: (_, __, ___) => page,
//     transitionsBuilder: (_, animation, __, child) {
//       final offsetAnimation = Tween<Offset>(
//         begin: const Offset(0, 0.05),
//         end: Offset.zero,
//       ).animate(animation);
//
//       return FadeTransition(
//         opacity: animation,
//         child: SlideTransition(
//           position: offsetAnimation,
//           child: child,
//         ),
//       );
//     },
//   );
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Route slidePageRoute(Widget page) {
  return CupertinoPageRoute(
    builder: (_) => page,
  );
}
