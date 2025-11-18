import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leaptech_plus/core/themes/app_text_styles.dart';

class CheckInOutDate extends StatelessWidget {
  const CheckInOutDate({
    super.key,
    required this.title,
    required this.time,
  });
  final String title;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: AppTextStyles.font14WhiteMedium,
        ),
        Icon(
          Icons.watch_later_outlined,
          color: Colors.white,
          size: 20.sp,
        ),
        Text(
          time,
          style: AppTextStyles.font14WhiteMedium,
        ),
      ],
    );
  }
}
