import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leaptech_plus/core/themes/app_colors.dart';
import 'package:leaptech_plus/core/themes/app_text_styles.dart';
import 'package:leaptech_plus/core/utils/spacing.dart';

class CommentBottomSheet extends StatefulWidget {
  const CommentBottomSheet({super.key});

  @override
  State<CommentBottomSheet> createState() => _CommentBottomSheetState();
}

class _CommentBottomSheetState extends State<CommentBottomSheet> {
  final TextEditingController _commentController = TextEditingController();

  // Each comment has a name and text
  final List<Map<String, String>> comments = [
    {
      "name": "Ali",
      "text":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    },
    {"name": "Sara", "text": "Great work!"},
    {"name": "Ahmed", "text": "Looks very clean 😍"},
    {"name": "Layla", "text": "Keep it up 💪"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Column(
        children: [
          // Drag indicator
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Container(
              width: 50.w,
              height: 5.h,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
          ),

          // Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Comments",
                  style: AppTextStyles.font18BlackBold,
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.black54),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),

          Divider(height: 1),

          // Comments list
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              itemCount: comments.length,
              separatorBuilder: (_, __) => SizedBox(height: 10.h),
              itemBuilder: (context, index) {
                final comment = comments[index];
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Avatar
                    CircleAvatar(
                      radius: 18.r,
                      backgroundColor: AppColors.primaryColor.withOpacity(0.2),
                      child: Icon(
                        Icons.person,
                        color: AppColors.primaryColor,
                        size: 20.sp,
                      ),
                    ),
                    horizontalSpace(10),
                    // Comment bubble
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              comment["name"] ?? "",
                              style: AppTextStyles.font14BlackMedium.copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              comment["text"] ?? "",
                              style: AppTextStyles.font14BlackMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          Divider(height: 1),

          // Input bar
          SafeArea(
            top: false,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Text field
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: TextField(
                        controller: _commentController,
                        decoration: const InputDecoration(
                          hintText: "Add a comment...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  // Send button
                  GestureDetector(
                    onTap: () {
                      if (_commentController.text.trim().isEmpty) return;
                      setState(() {
                        comments.insert(0, {
                          "name": "You",
                          "text": _commentController.text.trim(),
                        });
                        _commentController.clear();
                      });
                    },
                    child: CircleAvatar(
                      radius: 22.r,
                      backgroundColor: AppColors.primaryColor,
                      child: const Icon(Icons.send_rounded,
                          color: Colors.white, size: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
