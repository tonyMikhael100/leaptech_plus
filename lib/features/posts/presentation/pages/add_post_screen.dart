import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leaptech_plus/core/themes/app_colors.dart';
import 'package:leaptech_plus/core/themes/app_text_styles.dart';
import 'package:leaptech_plus/core/widgets/app_button.dart';
import 'package:leaptech_plus/core/widgets/app_text_field.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final TextEditingController _postController = TextEditingController();
  File? attachedImage;
  final ImagePicker picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        attachedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Post",
          style: AppTextStyles.font16WhiteBold,
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Post Text
            Text(
              "What's on your mind?",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: AppTextField(
                hintText: 'Write something....',
                controller: _postController,
                maxLines: 5,
              ),
            ),

            SizedBox(height: 16.h),

            // Attach Image
            Text(
              "Attach Image",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            GestureDetector(
              onTap: pickImage,
              child: Container(
                height: 180.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: attachedImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.file(
                          attachedImage!,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Center(
                        child: Text(
                          "Tap to attach an image",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
              ),
            ),

            SizedBox(height: 24.h),

            // Post Button
            AppButton(
              height: 50.h,
              buttonText: "Post",
              onPressed: () {
                // Handle post submission
              },
            ),
          ],
        ),
      ),
    );
  }
}
