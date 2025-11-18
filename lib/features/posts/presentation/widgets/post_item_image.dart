import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostItemImage extends StatelessWidget {
  const PostItemImage({super.key});

// don't forget to handle depend on the response , if the post containt one image make it cross Axis count =1, else = 2
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true, // ✅ allows grid to size itself inside Column
      physics:
          const NeverScrollableScrollPhysics(), // ✅ prevent inner scroll conflict
      itemCount: 2,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1 == 2 ? 1 : 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
        childAspectRatio: 1.4, // keep images square
      ),
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Image.asset(
            'assets/images/post_sample.png',
            fit: BoxFit.contain,
          ),
        );
      },
    );
  }
}
