import 'package:commanderratings/core/headers/header_for_others_one_man.dart';
import 'package:flutter/material.dart';

import '../../widgets/expansion_pannel_list_faq.dart';

class FaqScreen extends StatelessWidget {
  final List<Map<String, String>> faqs = [
    {
      "id": "faq1",
      "question": "CAN I SAY ANYTHING I WANT IN THE COMMENTS SECTION?",
      "answer":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    },
    {
      "id": "faq2",
      "question":
          "MY COMMANDER BROKE THE LAW AND ITS SERIOUS. CAN I POST ABOUT THIS?",
      "answer":
          "Yes, and we encourage you to do so for accountability’s sake; however, claims of this sort will require that you provide some sort of substantiating documentation, and we will contact you if necessary about this documentation.  These documents will not be retained by Commander Ratings and will be deleted upon verifying the claims made.",
    },
    {
      "id": "faq3",
      "question": "WHY DO YOU NEED DOCUMENTATION FOR SERIOUS VIOLATIONS?",
      "answer":
          "Yes, and we encourage you to do so for accountability’s sake; however, claims of this sort will require that you provide some sort of substantiating documentation, and we will contact you if necessary about this documentation.  These documents will not be retained by Commander Ratings and will be deleted upon verifying the claims made.",
    },
    {
      "id": "faq4",
      "question":
          "WHAT IS THE DIFFERENCE BETWEEN A COMMANDER RATING AND A COMMANDER REVIEW?",
      "answer":
          "Yes, and we encourage you to do so for accountability’s sake; however, claims of this sort will require that you provide some sort of substantiating documentation, and we will contact you if necessary about this documentation.  These documents will not be retained by Commander Ratings and will be deleted upon verifying the claims made.",
    },
    {
      "id": "faq5",
      "question": "CAN I SAY ANYTHING I WANT IN THE COMMENTS SECTION?",
      "answer":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    },
    {
      "id": "faq6",
      "question":
          "MY COMMANDER BROKE THE LAW AND ITS SERIOUS. CAN I POST ABOUT THIS?",
      "answer":
          "Yes, and we encourage you to do so for accountability’s sake; however, claims of this sort will require that you provide some sort of substantiating documentation, and we will contact you if necessary about this documentation.  These documents will not be retained by Commander Ratings and will be deleted upon verifying the claims made.",
    },
    {
      "id": "faq7",
      "question": "WHY DO YOU NEED DOCUMENTATION FOR SERIOUS VIOLATIONS?",
      "answer":
          "Yes, and we encourage you to do so for accountability’s sake; however, claims of this sort will require that you provide some sort of substantiating documentation, and we will contact you if necessary about this documentation.  These documents will not be retained by Commander Ratings and will be deleted upon verifying the claims made.",
    },
    {
      "id": "faq8",
      "question":
          "WHAT IS THE DIFFERENCE BETWEEN A COMMANDER RATING AND A COMMANDER REVIEW?",
      "answer":
          "Yes, and we encourage you to do so for accountability’s sake; however, claims of this sort will require that you provide some sort of substantiating documentation, and we will contact you if necessary about this documentation.  These documents will not be retained by Commander Ratings and will be deleted upon verifying the claims made.",
    },
  ];
  FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderForOthers(text: 'FAQ'),
            const SizedBox(height: 20),
            ExpansionPannelListFaq(faqs: faqs),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
