import 'package:commanderratings/core/headers/header_for_others_one_man.dart';
import 'package:flutter/material.dart';

import '../../../data/domain_or_model/post_model.dart';
import 'widgets/filter_buttons.dart';
import 'widgets/post_card.dart';

class AllBlogPost extends StatefulWidget {
  const AllBlogPost({super.key});

  @override
  State<AllBlogPost> createState() => _AllBlogPostState();
}

class _AllBlogPostState extends State<AllBlogPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            HeaderForOthers(text: 'All Posts'),
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
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.black,
      //   selectedItemColor: Colors.white,
      //   unselectedItemColor: Colors.grey,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      //   ],
      // ),
    );
  }
}
