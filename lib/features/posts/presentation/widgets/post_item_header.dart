import 'package:flutter/material.dart';
import 'package:leaptech_plus/core/themes/app_text_styles.dart';
import 'package:leaptech_plus/core/utils/spacing.dart';

class PostItemHeader extends StatelessWidget {
  const PostItemHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/person.png')),
        horizontalSpace(10),
        Text(
          'Tony mikhael',
          style: AppTextStyles.font14BlackMedium,
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_horiz,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
