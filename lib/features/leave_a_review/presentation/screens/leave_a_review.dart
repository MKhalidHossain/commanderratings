import 'package:commanderratings/core/widgets/outlined_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeaveAReview extends StatefulWidget {
  LeaveAReview({super.key});

  @override
  State<LeaveAReview> createState() => _LeaveAReviewState();
}

class _LeaveAReviewState extends State<LeaveAReview> {
  late TextEditingController titleController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Leave a Review'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            OutlinedTextFieldWidget(
              controller: titleController,
              name: 'title',
              textInputType: TextInputType.text,
              textFieldHeaderName: 'Title',
            ),
          ],
        ),
      ),
    );
  }
}
