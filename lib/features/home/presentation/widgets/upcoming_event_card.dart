import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:leaptech_plus/core/themes/app_colors.dart';
import 'package:leaptech_plus/core/themes/app_text_styles.dart';
import 'package:leaptech_plus/core/utils/spacing.dart';
import 'package:leaptech_plus/features/home/data/models/event_model.dart';

class UpcomingEventCard extends StatelessWidget {
  const UpcomingEventCard({super.key, required this.event});

  final EventModel event;

  @override
  Widget build(BuildContext context) {
    final eventStart = event.eventTime.toLocal();
    final eventEnd =
        eventStart.add(Duration(minutes: (event.duration * 60).toInt()));
    final eventDate = DateFormat('dd').format(eventStart);
    final eventMonth = DateFormat('MMM').format(eventStart).toUpperCase();
    final startTime = DateFormat('hh:mm a').format(eventStart);
    final endTime = DateFormat('hh:mm a').format(eventEnd);
    final eventTime = "$startTime - $endTime";
    return GestureDetector(
      onTap: () => context.push('/eventDetailsScreen', extra: event),
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          gradient: LinearGradient(
            colors: [
              AppColors.secondaryColor.withOpacity(0.8),
              AppColors.primaryColor
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20.r),
            onTap: () => context.push('/eventDetailsScreen', extra: event),
            child: Padding(
              padding: EdgeInsets.all(14.w),
              child: Row(
                children: [
                  // Date Box
                  Container(
                    width: 60.w,
                    height: 60.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.2),
                          Colors.white.withOpacity(0.05)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          eventDate,
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          eventMonth,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.white.withOpacity(0.8),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 14.w),

                  // Details Column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event.name,
                          style: AppTextStyles.font16BlackSemiBold.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        verticalSpace(6),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 16.sp,
                              color: Colors.white70,
                            ),
                            horizontalSpace(6),
                            Text(
                              eventTime,
                              style: AppTextStyles.font14BlackMedium.copyWith(
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(4),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 16.sp,
                              color: Colors.white70,
                            ),
                            horizontalSpace(6),
                            Expanded(
                              child: Text(
                                event.location,
                                style: AppTextStyles.font14BlackMedium.copyWith(
                                  color: Colors.white70,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Arrow Icon
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18.sp,
                    color: Colors.white70,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
