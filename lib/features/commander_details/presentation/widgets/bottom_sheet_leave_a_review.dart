import 'package:commanderratings/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetLeaveAReview extends StatelessWidget {
  const BottomSheetLeaveAReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.context(context).contentBoxColor,
        automaticallyImplyLeading: false,
        title: Text('Leave a Review'),
        centerTitle: false,
        leadingWidth: 60,
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.close),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(width: double.infinity, color: Colors.red),
      ),
    );
  }
}
