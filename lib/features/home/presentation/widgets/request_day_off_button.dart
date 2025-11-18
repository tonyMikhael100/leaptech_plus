import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leaptech_plus/core/themes/app_text_styles.dart';
import 'package:leaptech_plus/core/widgets/app_card.dart';

class RequestDayOffButton extends StatelessWidget {
  const RequestDayOffButton({
    super.key,
    required this.onTap,
  });

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {},
        child: AppCard(
          child: Column(
            children: [
              Icon(
                Icons.date_range_outlined,
                size: 25.sp,
                color: Colors.white,
              ),
              Text(
                'Request day off',
                style: AppTextStyles.font16WhiteBold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
