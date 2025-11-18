import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leaptech_plus/core/themes/app_colors.dart';
import 'package:leaptech_plus/core/themes/app_text_styles.dart';
import 'package:leaptech_plus/core/utils/spacing.dart';

class EventDetailsBackButton extends StatelessWidget {
  const EventDetailsBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new,
          color: AppColors.primaryColor,
          size: 20.sp,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}

class EventDetailsAppBarContent extends StatelessWidget {
  const EventDetailsAppBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.primaryColor,
                AppColors.secondaryColor,
                AppColors.primaryColor.withOpacity(0.8),
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: Opacity(
            opacity: 0.1,
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 30.h,
          left: 20.w,
          right: 20.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 16.sp,
                      color: AppColors.primaryColor,
                    ),
                    horizontalSpace(8),
                    Text(
                      "11 November 2025",
                      style: AppTextStyles.font14BlackMedium.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace(12),
              Text(
                "Team Monthly Meeting",
                style: AppTextStyles.font28WhiteBold,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
