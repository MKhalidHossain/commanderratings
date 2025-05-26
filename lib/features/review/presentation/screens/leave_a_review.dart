import 'package:commanderratings/core/ratting_a_to_z/ratting.dart';
import 'package:commanderratings/core/widgets/lebel_and_value_text.dart';
import 'package:commanderratings/core/widgets/normal_custom_button.dart';
import 'package:commanderratings/core/widgets/title_subtitle_text.dart';
import 'package:commanderratings/core/widgets/wide_custom_button.dart';
import 'package:commanderratings/features/review/controllers/review_controller.dart';
import 'package:commanderratings/features/review/presentation/widgets/text_field_for_take_review.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../helpers/custom_snackbar.dart';

class LeaveAReview extends StatefulWidget {
  final String commanderId;

  const LeaveAReview({super.key, required this.commanderId});

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
    return GetBuilder<ReviewController>(
        builder: (reviewController){
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
                    controller: descriptionController,
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
                  SizedBox(height: 30,),
                  WideCustomButton(text: 'Submit',
                      onPressed: (){
                      String title = titleController.text;
                      String description = descriptionController.text;
                      if(title.isEmpty){
                      showCustomSnackBar('email is required'.tr);
                      }
                      if(_userRating.isNaN){
                        showCustomSnackBar('email is required'.tr);
                      }else if(description.length<5){
                      showCustomSnackBar('minimum password length is 8');

                      }else{

                        print('Yonus Commander Id ${widget.commanderId}');
                      reviewController.createReview(
                        widget.commanderId,
                        _userRating,
                        title,
                        description
                      );
                      }
                      }
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}
