import 'package:flutter/material.dart';
import 'package:leaptech_plus/core/themes/app_text_styles.dart';
import 'package:leaptech_plus/core/utils/spacing.dart';
import 'package:leaptech_plus/core/widgets/app_card.dart';

class PerformanceCard extends StatelessWidget {
  const PerformanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Performance Overview',
            style: AppTextStyles.font16WhiteRegular,
          ),
          Divider(),
          verticalSpace(16),
          _PerformanceRow(
            title: 'Projects Completed',
            value: '12',
            icon: Icons.work_outline,
            iconColor: Colors.blue,
          ),
          verticalSpace(14),
          _PerformanceRow(
            title: 'On-time Delivery',
            value: '92%',
            icon: Icons.timer_outlined,
            iconColor: Colors.green,
          ),
          verticalSpace(14),
          _PerformanceRow(
            title: 'Time Growth',
            value: '+18%',
            icon: Icons.trending_up_rounded,
            iconColor: Colors.purple,
          ),
        ],
      ),
    );
  }
}

class _PerformanceRow extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color iconColor;

  const _PerformanceRow({
    required this.title,
    required this.value,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            horizontalSpace(12),
            Text(title, style: AppTextStyles.font14WhiteMedium),
          ],
        ),
        Text(
          value,
          style: AppTextStyles.font16BlackSemiBold.copyWith(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
