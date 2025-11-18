import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:leaptech_plus/core/themes/app_text_styles.dart';
import 'package:leaptech_plus/core/utils/spacing.dart';
import 'package:leaptech_plus/core/widgets/app_button.dart';
import 'package:leaptech_plus/core/widgets/app_card.dart';
import 'package:leaptech_plus/features/login/data/models/user_model.dart';

class PorfileNameAndRoleCard extends StatelessWidget {
  const PorfileNameAndRoleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/person.png'),
          ),
          horizontalSpace(14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sabri najar',
                style: AppTextStyles.font16WhiteBold,
              ),
              Text(
                'Cto',
                style: AppTextStyles.font14WhiteMedium,
              ),
            ],
          ),
          //small button with icon to logout
          Spacer(),
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: Colors.redAccent,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.white,
                size: 20.sp,
              ),
              onPressed: () {
                final userBox = Hive.box<UserModel>('userBox');
                userBox.clear();
                context.go('/loginScreen');
              },
            ),
          ),
        ],
      ),
    );
  }
}
