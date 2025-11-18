import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:leaptech_plus/core/themes/app_colors.dart';
import 'package:leaptech_plus/core/themes/app_text_styles.dart';
import 'package:leaptech_plus/core/utils/spacing.dart';
import 'package:leaptech_plus/features/home/data/models/event_model.dart';
import 'package:leaptech_plus/features/home/presentation/widgets/evnet_details_app_bar.dart';

class EventDetailsScreen extends StatelessWidget {
  final EventModel event;

  const EventDetailsScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: CustomScrollView(
        slivers: [
          EventDetailsAppBar(
            eventName: event.name,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Quick Info Row
                    Row(
                      children: [
                        Expanded(
                          child: _buildQuickInfoCard(
                            icon: Icons.access_time_rounded,
                            label: "Duration",
                            value: "${event.duration} hours",
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(12),

                    // Time Section
                    _buildModernInfoSection(
                      icon: Icons.schedule_rounded,
                      title: "Time",
                      content:
                          "${DateFormat('hh:mm a').format(event.eventTime)} - "
                          "${DateFormat('hh:mm a').format(event.eventTime.add(Duration(minutes: (event.duration * 60).toInt())))}",
                      subtitle: DateFormat('EEEE, MMM dd, yyyy')
                          .format(event.eventTime),
                    ),
                    verticalSpace(16),

                    // Location Section
                    _buildModernInfoSection(
                      icon: Icons.location_on_rounded,
                      title: "Location",
                      content: event.location ?? "N/A",
                      hasMap: false,
                    ),
                    verticalSpace(16),

                    // Organizer Section
                    _buildModernInfoSection(
                      icon: Icons.person_rounded,
                      title: "Organizer",
                      content: event.organizerName ?? "N/A",
                    ),
                    verticalSpace(24),

                    // Description Section
                    Text(
                      "About Event",
                      style: AppTextStyles.font18BlackSemiBold,
                    ),
                    verticalSpace(12),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 10,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        event.about ?? "",
                        style: AppTextStyles.font14BlackMedium.copyWith(
                          height: 1.6,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                    verticalSpace(24),

                    // Share Button
                    _buildActionButton(
                      label: "Share Event",
                      icon: Icons.share_rounded,
                      isPrimary: true,
                      onTap: () => _shareEvent(event),
                    ),
                    verticalSpace(20),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  // Quick Info Card Widget
  Widget _buildQuickInfoCard({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: AppColors.primaryColor,
              size: 24.sp,
            ),
          ),
          verticalSpace(8),
          Text(
            value,
            style: AppTextStyles.font20BlackSemiBold,
          ),
          verticalSpace(4),
          Text(
            label,
            style: AppTextStyles.font12LightBlackWeight500,
          ),
        ],
      ),
    );
  }

  // Modern Info Section Widget
  Widget _buildModernInfoSection({
    required IconData icon,
    required String title,
    required String content,
    String? subtitle,
    bool hasMap = false,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  icon,
                  color: AppColors.primaryColor,
                  size: 24.sp,
                ),
              ),
              horizontalSpace(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.font12LightBlackWeight500,
                    ),
                    verticalSpace(4),
                    Text(
                      content,
                      style: AppTextStyles.font16BlackSemiBold,
                    ),
                    if (subtitle != null && subtitle.isNotEmpty) ...[
                      verticalSpace(2),
                      Text(
                        subtitle,
                        style: AppTextStyles.font12LightBlackWeight500
                            .copyWith(color: Colors.grey.shade600),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          if (hasMap) ...[
            verticalSpace(16),
            Container(
              height: 180.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 1,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.map_outlined,
                      size: 48.sp,
                      color: Colors.grey.shade400,
                    ),
                    verticalSpace(8),
                    Text(
                      "Map will be displayed here",
                      style: AppTextStyles.font12LightBlackWeight500.copyWith(
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  // Action Button Widget
  Widget _buildActionButton({
    required String label,
    required IconData icon,
    required bool isPrimary,
    VoidCallback? onTap,
  }) {
    return Container(
      height: 56.h,
      decoration: BoxDecoration(
        gradient: isPrimary
            ? LinearGradient(
                colors: [
                  AppColors.primaryColor,
                  AppColors.secondaryColor,
                ],
              )
            : null,
        color: isPrimary ? null : Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: isPrimary
            ? null
            : Border.all(
                color: AppColors.primaryColor,
                width: 2,
              ),
        boxShadow: [
          BoxShadow(
            color: (isPrimary ? AppColors.primaryColor : Colors.black)
                .withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16.r),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: isPrimary ? Colors.white : AppColors.primaryColor,
                  size: 20.sp,
                ),
                horizontalSpace(8),
                Text(
                  label,
                  style: AppTextStyles.font14BlackMedium.copyWith(
                    color: isPrimary ? Colors.white : AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Share Event Function
  void _shareEvent(EventModel event) {
    final startTime = DateFormat('hh:mm a').format(event.eventTime);
    final endTime = DateFormat('hh:mm a').format(
        event.eventTime.add(Duration(minutes: (event.duration * 60).toInt())));
    final eventTime =
        "$startTime - $endTime, ${DateFormat('EEEE, MMM dd, yyyy').format(event.eventTime)}";

    final message = """
Check out this event!
${event.name}
Time: $eventTime
Location: ${event.location}
Organizer: ${event.organizerName ?? 'N/A'}
""";

    Share.share(message);
  }
}
