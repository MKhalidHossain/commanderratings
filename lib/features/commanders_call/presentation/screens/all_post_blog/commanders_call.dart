import 'package:commanderratings/core/headers/header_for_others_one_man.dart';
import 'package:flutter/material.dart';

import '../../../data/domain_or_model/post_model.dart';
import 'widgets/filter_buttons.dart';
import 'widgets/post_card.dart';

class CommandersCall extends StatefulWidget {
  const CommandersCall({super.key});

  @override
  State<CommandersCall> createState() => _CommandersCallState();
}

class _CommandersCallState extends State<CommandersCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            HeaderForOthers(text: 'Commanders Call'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FilterButtons(
                onSelectionChanged: (selectedFilters) {
                  print("Selected: $selectedFilters");
                },
              ),
            ), // Horizontal filter button list
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: samplePosts.length,
                itemBuilder: (context, index) {
                  return PostCard(post: samplePosts[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
