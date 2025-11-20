import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leaptech_plus/core/utils/spacing.dart';
import 'package:leaptech_plus/features/posts/data/models/post_model.dart';
import 'package:leaptech_plus/features/posts/data/models/post_with_relation_model.dart';
import 'package:leaptech_plus/features/posts/presentation/pages/comment_bottom_sheet.dart.dart';

class PostItemFooter extends StatelessWidget {
  const PostItemFooter({super.key, required this.postWithRelations});

  final PostWithRelations postWithRelations;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // ❤️ Like button
        GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              Icon(
                Icons.favorite,
                color: Colors.grey,
              ),
              horizontalSpace(4),
              Text(
                postWithRelations.likes.length.toString(),
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
                child: CommentBottomSheet(
                  comments: postWithRelations.comments,
                ),
              ),
            );
          },
          child: Row(
            children: [
              const Icon(Icons.mode_comment_outlined, color: Colors.black54),
              horizontalSpace(4),
              Text(
                postWithRelations.comments.length.toString(),
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
