import 'package:commanderratings/core/ratting_a_to_z/ratting.dart';
import 'package:commanderratings/core/widgets/lebel_and_value_text.dart';
import 'package:commanderratings/core/widgets/title_subtitle_text.dart';
import 'package:commanderratings/features/review/presentation/widgets/text_field_for_take_review.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeaveAReview extends StatefulWidget {
  LeaveAReview({super.key});

  @override
  State<LeaveAReview> createState() => _LeaveAReviewState();
}

class _LeaveAReviewState extends State<LeaveAReview> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  double _userRating = 0.0;

  void _handleRatingSelected(double rating) {
    setState(() {
      _userRating = rating;
    });
    // You can do additional logic here (e.g., save rating to backend)
    print("User selected rating: $_userRating");
  }

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TitleText(text: 'Leave a Review'),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldForTakeReview(
              hintText: 'title',
              controller: titleController,
            ),
            const SizedBox(height: 16),
            TextFieldForTakeReview(
              hintText: 'Description',
              controller: titleController,
              height: 100,
            ),
            const SizedBox(height: 32),
            LabelText(text: 'Select Rating'),
            const SizedBox(height: 8),

            TakeRating(onRatingSelected: _handleRatingSelected),
            const SizedBox(height: 20),
            Text(
              'Selected Rating: $_userRating',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
