import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leaptech_plus/core/themes/app_text_styles.dart';
import 'package:leaptech_plus/core/widgets/app_card.dart';
import 'package:leaptech_plus/features/home/presentation/widgets/chek_in_out_date.dart';

class HomeDateCard extends StatelessWidget {
  const HomeDateCard(
      {super.key,
      required this.chckIn,
      required this.chckOut,
      required this.date});
  final String chckIn;
  final String chckOut;
  final String date;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CheckInOutDate(
            title: 'Check In',
            time: chckIn,
          ),
          Column(
            children: [
              Icon(
                Icons.watch_later_outlined,
                color: Colors.white,
                size: 60.sp,
              ),
              Text(
                date,
                style: AppTextStyles.font16WhiteRegular,
              )
            ],
          ),
          CheckInOutDate(
            title: 'Check Out',
            time: chckOut,
          ),
        ],
      ),
    );
  }
}
