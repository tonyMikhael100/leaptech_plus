import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:leaptech_plus/core/dummy/days_off_dummy.dart';
import 'package:leaptech_plus/core/themes/app_colors.dart';
import 'package:leaptech_plus/core/themes/app_text_styles.dart';
import 'package:leaptech_plus/core/utils/spacing.dart';
import 'package:leaptech_plus/core/widgets/app_button.dart';
import 'package:leaptech_plus/features/days_off/presentation/widgets/day_off_list_item.dart';
import 'package:leaptech_plus/features/days_off/presentation/widgets/days_off_main_card.dart';

class DaysOffScreen extends StatefulWidget {
  const DaysOffScreen({super.key});

  @override
  State<DaysOffScreen> createState() => _DaysOffScreenState();
}

class _DaysOffScreenState extends State<DaysOffScreen> {
  int selectedFilterIndex = 0;
  final List<String> filters = ["All", "Pending", "Approved"];

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TITLE
              Text(
                'Remaining Days Off',
                style: AppTextStyles.font20BlackSemiBold.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              verticalSpace(12),

              // MAIN CARD
              DaysOffMainCard(),
              verticalSpace(16),

              // REQUEST NEW DAY OFF BUTTON
              AppButton(
                height: 48.h,
                buttonText: "Request New Day Off",
                onPressed: () {
                  context.push('/requestDayOffScren');
                },
              ),
              verticalSpace(20),

              // FILTER BUTTONS
              Container(
                padding: EdgeInsets.all(6.w),
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.circular(14.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                child: Row(
                  children: List.generate(filters.length, (index) {
                    bool isSelected = index == selectedFilterIndex;
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: index != filters.length - 1 ? 6.w : 0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedFilterIndex = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.primaryColor
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(
                                  color:
                                      AppColors.primaryColor.withOpacity(0.5)),
                            ),
                            child: Center(
                              child: Text(
                                filters[index],
                                style: AppTextStyles.font14BlackMedium.copyWith(
                                  color: isSelected
                                      ? Colors.white
                                      : AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              verticalSpace(20),

              // LISTVIEW BUILDER
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: leaveItems.length,
                itemBuilder: (context, index) {
                  final item = leaveItems[index];
                  Color statusColor = item["status"] == "Approved"
                      ? Colors.greenAccent
                      : Colors.orangeAccent;

                  return DayOffLIstItem(item: item, statusColor: statusColor);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
