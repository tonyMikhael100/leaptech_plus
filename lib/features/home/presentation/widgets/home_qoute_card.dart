import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leaptech_plus/core/themes/app_colors.dart';
import 'package:leaptech_plus/core/themes/app_text_styles.dart';
import 'package:leaptech_plus/features/home/data/models/quote_model.dart';

class HomeQuoteCard extends StatelessWidget {
  const HomeQuoteCard({
    super.key,
    required this.quote,
  });

  final QuoteModel quote;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor,
            AppColors.secondaryColor,
            Colors.blue.shade700
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(0, 4),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quote of the Day',
            style: AppTextStyles.font16WhiteBold.copyWith(
              color: Colors.white70,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            '"${quote.quote}"',
            style: AppTextStyles.font18WhiteSemiBold.copyWith(
              color: Colors.white,
              height: 1.4,
            ),
          ),
          SizedBox(height: 12.h),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              '- ${quote.author}',
              style: AppTextStyles.font14WhiteMedium.copyWith(
                color: Colors.white70,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
