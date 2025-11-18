import 'package:flutter/material.dart';
import 'package:leaptech_plus/core/themes/app_text_styles.dart';
import 'package:leaptech_plus/core/widgets/app_card.dart';
import 'package:leaptech_plus/features/posts/presentation/widgets/post_item.dart';

class PostsScreenBody extends StatelessWidget {
  const PostsScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppCard(
          child: Text(
            'What\'s new',
            style: AppTextStyles.font16WhiteBold,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return PostItem();
            },
          ),
        ),
      ],
    );
  }
}
