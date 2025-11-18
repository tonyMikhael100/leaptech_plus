import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leaptech_plus/core/utils/spacing.dart';
import 'package:leaptech_plus/features/posts/presentation/pages/comment_bottom_sheet.dart.dart';

class PostItemFooter extends StatefulWidget {
  const PostItemFooter({super.key});

  @override
  State<PostItemFooter> createState() => _PostItemFooterState();
}

class _PostItemFooterState extends State<PostItemFooter> {
  bool isLiked = false;
  int likeCount = 42;
  int commentCount = 8;

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likeCount += isLiked ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // ❤️ Like button
        GestureDetector(
          onTap: toggleLike,
          child: Row(
            children: [
              AnimatedScale(
                scale: isLiked ? 1.3 : 1.0,
                duration: const Duration(milliseconds: 150),
                child: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? Colors.red : Colors.black54,
                ),
              ),
              horizontalSpace(4),
              Text(
                '$likeCount',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        horizontalSpace(20),

        // 💬 Comment button
        GestureDetector(
          onTap: () {
            // Handle comment tap
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (_) => SizedBox(
                height: MediaQuery.of(context).size.height * 0.75,
                child: const CommentBottomSheet(),
              ),
            );
          },
          child: Row(
            children: [
              const Icon(Icons.mode_comment_outlined, color: Colors.black54),
              horizontalSpace(4),
              Text(
                '$commentCount',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
