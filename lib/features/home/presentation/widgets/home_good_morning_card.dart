import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leaptech_plus/core/functions/get_greeting.dart';
import 'package:leaptech_plus/core/themes/app_text_styles.dart';
import 'package:leaptech_plus/core/widgets/app_card.dart';

class HomeGoodMorningCard extends StatelessWidget {
  const HomeGoodMorningCard({
    super.key,
    required this.name,
    required this.role,
    required this.image,
  });
  final String name;
  final String role;
  final String image;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      image: 'assets/images/home_intro.png',
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceEvenly, // <-- Center horizontally
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                getGreeting(),
                style: AppTextStyles.font28WhiteBold,
              ),
              Text(
                name,
                style: AppTextStyles.font16WhiteBold,
              ),
              Text(
                role,
                style: AppTextStyles.font14WhiteMedium,
              ),
            ],
          ),
          CircleAvatar(
            radius: 50.r,
            backgroundColor: Colors.transparent,
            backgroundImage: CachedNetworkImageProvider(
              image,
            ),
          ),
        ],
      ),
    );
  }
}
