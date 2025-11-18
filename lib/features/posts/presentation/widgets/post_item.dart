import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leaptech_plus/core/themes/app_text_styles.dart';
import 'package:leaptech_plus/core/utils/spacing.dart';
import 'package:leaptech_plus/features/posts/presentation/widgets/post_item_footer.dart';
import 'package:leaptech_plus/features/posts/presentation/widgets/post_item_header.dart';
import 'package:leaptech_plus/features/posts/presentation/widgets/post_item_image.dart';

class PostItem extends StatelessWidget {
  const PostItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.h),
      margin: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Post header
          const PostItemHeader(),

          Divider(),

          // Post text
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            style: AppTextStyles.font12BlackRegular,
          ),

          // Post image grid
          const PostItemImage(),
          Divider(),

          // Post footer
          PostItemFooter(),
        ],
      ),
    );
  }
}
