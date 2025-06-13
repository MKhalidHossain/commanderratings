import 'package:commanderratings/features/commanders_call/controllers/commanders_calls_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/headers/header_for_others_one_man.dart';
import '../../domain/model/get_all_blog_service_model.dart';
import '../widgets/filter_buttons.dart';
import '../widgets/leadership_card_widget.dart';
import 'call_of_commander_screen.dart';

class CommandersCallScreen extends StatefulWidget {
  const CommandersCallScreen({super.key});

  @override
  State<CommandersCallScreen> createState() => _CommandersCallScreenState();
}

class _CommandersCallScreenState extends State<CommandersCallScreen> {
  late GetAllBlogResponseModel getAllBlogResponseModel;

  // Add a variable for categories
  List<String> categoryNames = [];
  bool isLoadingCategories = true;

  // Search and filter variables
  final TextEditingController _searchController = TextEditingController();
  List<Blogs> filteredBlogs = [];
  List<String> selectedCategories = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();

    // Fetch blogs
    Get.find<CommandersCallsController>().getAllCommandersCall().then((_) {
      final controller = Get.find<CommandersCallsController>();
      if (controller.getAllBlogResponseModel != null &&
          controller.getAllBlogResponseModel.data != null &&
          controller.getAllBlogResponseModel.data!.blogs != null) {
        setState(() {
          getAllBlogResponseModel = controller.getAllBlogResponseModel;
          filteredBlogs = getAllBlogResponseModel.data!.blogs!;
        });
      }
    });

    // Fetch categories
    fetchCategories();

    // Add listener for search text changes
    _searchController.addListener(_onSearchChanged);
  }

  // Method to fetch categories using your existing getAllCategoryBlogs method
  void fetchCategories() async {
    try {
      // Use your existing method to fetch categories
      await Get.find<CommandersCallsController>().getAllCategoryBlogs();

      final controller = Get.find<CommandersCallsController>();
      if (controller.getAllCategoryBlogResponseModel != null &&
          controller.getAllCategoryBlogResponseModel.data != null) {
        // Extract category names from the model
        List<String> names =
            controller.getAllCategoryBlogResponseModel.data!
                .map((category) => category.name ?? "")
                .where((name) => name.isNotEmpty)
                .toList();

        setState(() {
          categoryNames = names;
          isLoadingCategories = false;
        });
      } else {
        // Fallback to default if data is null
        setDefaultCategories();
      }
    } catch (e) {
      print('Error fetching categories: $e');
      setDefaultCategories();
    }
  }

  // Helper method to set default categories
  void setDefaultCategories() {
    setState(() {
      // categoryNames = [
      //   'Congressional & Senatorial Assistance',
      //   'Enlisted Perspective',
      //   'Inspector General & Military Equal Opportunity',
      //   'International & Coalition leadership',
      //   'Medication & Leadership',
      //   'Military Leadership',
      //   'Psychology of Leadership',
      //   'U.S. Air Force',
      //   'U.S. Coast Guard',
      //   'Military',
      //   'Veterans',
      // ];
      isLoadingCategories = false;
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  // Handle search text changes
  void _onSearchChanged() {
    setState(() {
      searchQuery = _searchController.text;
      _filterBlogs();
    });
  }

  // Handle category filter changes
  void _onCategoryFilterChanged(List<String> selectedFilters) {
    setState(() {
      selectedCategories = selectedFilters;
      _filterBlogs();
    });
  }

  // Filter blogs based on search query and selected categories
  void _filterBlogs() {
    if (getAllBlogResponseModel.data == null ||
        getAllBlogResponseModel.data!.blogs == null) {
      return;
    }

    List<Blogs> result = getAllBlogResponseModel.data!.blogs!;

    // Filter by search query if not empty
    if (searchQuery.isNotEmpty) {
      result =
          result.where((blog) {
            final titleMatch =
                blog.title != null &&
                blog.title!.toLowerCase().contains(searchQuery.toLowerCase());
            final descriptionMatch =
                blog.description != null &&
                blog.description!.toLowerCase().contains(
                  searchQuery.toLowerCase(),
                );
            return titleMatch || descriptionMatch;
          }).toList();
    }

    // Filter by selected categories if any
    if (selectedCategories.isNotEmpty) {
      // Note: This is a placeholder. You'll need to adjust this based on how
      // your blog categories are structured. If blogs have a category field,
      // you would filter based on that.
      // For now, I'm assuming the filter might match against title or description
      result =
          result.where((blog) {
            for (var category in selectedCategories) {
              if ((blog.title != null &&
                      blog.title!.toLowerCase().contains(
                        category.toLowerCase(),
                      )) ||
                  (blog.description != null &&
                      blog.description!.toLowerCase().contains(
                        category.toLowerCase(),
                      ))) {
                return true;
              }
            }
            return false;
          }).toList();
    }

    filteredBlogs = result;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommandersCallsController>(
      builder: (commandersCallsController) {
        return !commandersCallsController.isLoading
            ? Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    HeaderForOthers(text: 'Commanders Call', image: ''),
                    const SizedBox(height: 20),

                    // Filter buttons with dynamic categories
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 0,
                      ),
                      child:
                          isLoadingCategories
                              ? Center(child: CircularProgressIndicator())
                              : FilterButtons(
                                onSelectionChanged: _onCategoryFilterChanged,
                                categories:
                                    categoryNames, // Pass the dynamic categories
                              ),
                    ),

                    // Search results info
                    if (searchQuery.isNotEmpty || selectedCategories.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Text(
                              'Found ${filteredBlogs.length} results',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700],
                              ),
                            ),
                            Spacer(),
                            if (searchQuery.isNotEmpty ||
                                selectedCategories.isNotEmpty)
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    _searchController.clear();
                                    selectedCategories = [];
                                    _filterBlogs();
                                  });
                                },
                                child: Text('Clear filters'),
                              ),
                          ],
                        ),
                      ),

                    const SizedBox(height: 10),

                    // Blog list
                    filteredBlogs.isEmpty
                        ? Center(
                          child: Padding(
                            padding: const EdgeInsets.all(40.0),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.search_off,
                                  size: 64,
                                  color: Colors.grey[400],
                                ),
                                SizedBox(height: 16),
                                Text(
                                  'No blogs found matching your search',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey[600],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        )
                        : Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: List.generate(
                              filteredBlogs.length,
                              (index) => GestureDetector(
                                onTap: () {
                                  Get.to(
                                    CallOfCommanderScreen(
                                      id: filteredBlogs[index].sId!,
                                    ),
                                  );
                                },
                                child: LeadershipCardWidget(
                                  blog: filteredBlogs[index],
                                ),
                              ),
                            ),
                          ),
                        ),
                  ],
                ),
              ),
            )
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}



// import 'package:commanderratings/features/commanders_call/controllers/commanders_calls_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../core/headers/header_for_others_one_man.dart';
// import '../../domain/model/get_all_blog_service_model.dart';
// import '../widgets/filter_buttons.dart';
// import '../widgets/leadership_card_widget.dart';
// import 'call_of_commander_screen.dart';

// class CommandersCallScreen extends StatefulWidget {

//   const CommandersCallScreen({super.key});

//   @override
//   State<CommandersCallScreen> createState() => _CommandersCallScreenState();
// }

// class _CommandersCallScreenState extends State<CommandersCallScreen> {


//   late GetAllBlogResponseModel getAllBlogResponseModel;

//   @override
//   void initState() {
//     Get.find<CommandersCallsController>().getAllCommandersCall().then((_) {
//       final controller = Get.find<CommandersCallsController>();
//       if (controller.getAllBlogResponseModel != null &&
//           controller.getAllBlogResponseModel.data != null &&
//           controller.getAllBlogResponseModel.data!.blogs != null) {
//         setState(() {
//           getAllBlogResponseModel =
//               controller.getAllBlogResponseModel;
//         });
//       }
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {

//     return GetBuilder<CommandersCallsController>(

//         builder: (commandersCallsController){
//           return !commandersCallsController.isLoading ? Scaffold(
//             body: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   HeaderForOthers(text: 'Commanders Call', image: '',),
//                   const SizedBox(height: 10),
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: FilterButtons(
//                       onSelectionChanged: (selectedFilters) {
//                         print("Selected: $selectedFilters");
//                       },
//                     ),
//                   ), //
//                   // Horizontal filter button list
//                   const SizedBox(height: 10),

//                   Padding(

//                     padding: const EdgeInsets.all(20.0),

//                     child: Column(
//                       children: List.generate(
//                         getAllBlogResponseModel.data!.blogs!.length,
//                             (index) => GestureDetector(
//                           onTap: () {
//                             Get.to(CallOfCommanderScreen(id: getAllBlogResponseModel.data!.blogs![index].sId!,));
//                           },
//                           child: LeadershipCardWidget(blog: getAllBlogResponseModel.data!.blogs![index]),
//                         ),
//                       ),
//                     ),
//                   ),

//                 ],
//               ),
//             ),
//           ) :

//           Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//     );
//   }
// }
