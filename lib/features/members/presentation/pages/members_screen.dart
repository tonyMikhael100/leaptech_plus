import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leaptech_plus/core/themes/app_colors.dart';
import 'package:leaptech_plus/core/themes/app_text_styles.dart';
import 'package:leaptech_plus/core/utils/spacing.dart';
import 'package:leaptech_plus/core/widgets/app_button.dart';
import 'package:leaptech_plus/core/widgets/app_card.dart';

class MembersScreen extends StatefulWidget {
  const MembersScreen({super.key});

  @override
  State<MembersScreen> createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen> {
  final PageController _pageController = PageController();
  int selectedIndex = 0;

  void _onButtonTap(int index) {
    setState(() => selectedIndex = index);
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Card
        AppCard(
          child: Center(
            child: Text(
              'LeapTech',
              style: AppTextStyles.font16WhiteBold.copyWith(
                fontSize: 20.sp,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),

        verticalSpace(20),

        // Buttons Row
        Row(
          children: [
            Expanded(
              child: AppButton(
                buttonText: 'Members',
                height: 50.h,
                onPressed: () => _onButtonTap(0),
                textStyle: AppTextStyles.font14WhiteMedium.copyWith(
                  color: selectedIndex == 0
                      ? Colors.white
                      : AppColors.primaryColor,
                ),
                backgroundColor:
                    selectedIndex == 0 ? AppColors.primaryColor : Colors.white,
              ),
            ),
            horizontalSpace(12),
            Expanded(
              child: AppButton(
                buttonText: 'Departments',
                height: 50.h,
                onPressed: () => _onButtonTap(1),
                textStyle: AppTextStyles.font14BlackMedium.copyWith(
                  color: selectedIndex == 1
                      ? Colors.white
                      : AppColors.primaryColor,
                ),
                backgroundColor:
                    selectedIndex == 1 ? AppColors.primaryColor : Colors.white,
              ),
            ),
          ],
        ),

        verticalSpace(20),

        Expanded(
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            children: [
              // Members List
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Recent Members',
                      style: AppTextStyles.font14BlackMedium),
                  verticalSpace(10),
                  Expanded(
                    child: ListView.separated(
                      itemCount: 5,
                      separatorBuilder: (_, __) => verticalSpace(10),
                      itemBuilder: (context, index) {
                        return AppCard(
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20.r,
                                backgroundImage: AssetImage(
                                  'assets/images/person.png',
                                ),
                              ),
                              horizontalSpace(12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Sabri najar',
                                        style: AppTextStyles.font16WhiteBold),
                                    Text('Cto',
                                        style: AppTextStyles.font14WhiteMedium),
                                  ],
                                ),
                              ),
                              Icon(Icons.arrow_forward_ios_rounded,
                                  size: 16.sp, color: Colors.grey),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),

              // Departments List
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Departments', style: AppTextStyles.font14BlackMedium),
                  verticalSpace(10),
                  Expanded(
                    child: ListView.separated(
                      itemCount: 5,
                      separatorBuilder: (_, __) => verticalSpace(10),
                      itemBuilder: (context, index) {
                        return AppCard(
                          child: Row(
                            children: [
                              Expanded(
                                child: Text('Department ${index + 1}',
                                    style: AppTextStyles.font14WhiteMedium),
                              ),
                              Icon(Icons.arrow_forward_ios_rounded,
                                  size: 16.sp, color: Colors.grey),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
