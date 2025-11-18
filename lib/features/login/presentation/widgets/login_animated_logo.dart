import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginAnimatedLogo extends StatelessWidget {
  const LoginAnimatedLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/logo.png',
        width: 400.w,
        height: 400.h,
      ),
    )
        .animate()
        .fade(
          duration: 700.ms,
          curve: Curves.easeOut,
        )
        .scale(
          begin: const Offset(0.6, 0.6),
          end: const Offset(1, 1),
          duration: 1200.ms,
          curve: Curves.easeOutExpo,
        )
        .then()
        .move(
          duration: 1300.ms,
          begin: Offset(0, 0),
          end: Offset(0, -220.h),
          curve: Curves.easeInOutQuad,
        );
  }
}
