import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:leaptech_plus/core/themes/app_colors.dart';
import 'package:leaptech_plus/core/themes/app_text_styles.dart';
import 'package:leaptech_plus/core/widgets/app_button.dart';

class RequestDayOffScreen extends StatefulWidget {
  const RequestDayOffScreen({super.key});

  @override
  State<RequestDayOffScreen> createState() => _RequestDayOffScreenState();
}

class _RequestDayOffScreenState extends State<RequestDayOffScreen> {
  final List<String> leaveTypes = ["Sick", "Personal", "Annual"];
  int selectedLeaveIndex = 0;

  final TextEditingController descriptionController = TextEditingController();

  DateTime? fromDate;
  DateTime? toDate;

  File? attachedImage;
  final ImagePicker picker = ImagePicker();

  Future<void> pickDate({required bool isFrom}) async {
    DateTime now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 2),
    );
    if (picked != null) {
      setState(() {
        if (isFrom) {
          fromDate = picked;
          // If toDate is earlier than fromDate, reset it
          if (toDate != null && toDate!.isBefore(fromDate!)) {
            toDate = null;
          }
        } else {
          toDate = picked;
        }
      });
    }
  }

  Future<void> pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        attachedImage = File(image.path);
      });
    }
  }

  String formatDate(DateTime? date) {
    if (date == null) return "";
    return DateFormat('yyyy-MM-dd').format(date);
  }

  String calculateDuration() {
    if (fromDate != null && toDate != null) {
      int days = toDate!.difference(fromDate!).inDays + 1; // include both dates
      return "$days day${days > 1 ? 's' : ''}";
    }
    return "-";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Request Day Off",
          style: AppTextStyles.font16WhiteBold,
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Leave Type
            Text(
              "Leave Type",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(leaveTypes.length, (index) {
                bool isSelected = index == selectedLeaveIndex;
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedLeaveIndex = index;
                      });
                    },
                    child: Container(
                      height: 40.h,
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primaryColor
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Center(
                        child: Text(
                          leaveTypes[index],
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 16.h),
            // Description
            Text(
              "Description",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            TextField(
              controller: descriptionController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "Enter the reason for your day off",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),

            SizedBox(height: 16.h),

            // From & To Date
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => pickDate(isFrom: true),
                    child: Container(
                      height: 50.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Center(
                        child: Text(
                          fromDate != null
                              ? "From: ${formatDate(fromDate)}"
                              : "Select From Date",
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: GestureDetector(
                    onTap: () => pickDate(isFrom: false),
                    child: Container(
                      height: 50.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Center(
                        child: Text(
                          toDate != null
                              ? "To: ${formatDate(toDate)}"
                              : "Select To Date",
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 8.h),

            // Duration
            Text(
              "Duration: ${calculateDuration()}",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
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
                height: 120.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.grey[100],
                ),
                child: attachedImage != null
                    ? Image.file(attachedImage!, fit: BoxFit.cover)
                    : Center(
                        child: Text(
                          "Tap to attach an image",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
              ),
            ),

            SizedBox(height: 24.h),

            // Submit Button
            AppButton(
              buttonText: "Submit Request",
              height: 50.h,
              onPressed: () {
                // Handle submission logic
              },
            ),
          ],
        ),
      ),
    );
  }
}
