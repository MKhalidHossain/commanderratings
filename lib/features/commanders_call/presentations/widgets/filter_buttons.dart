import 'package:commanderratings/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class FilterButtons extends StatefulWidget {
  final Function(List<String>) onSelectionChanged;

  const FilterButtons({super.key, required this.onSelectionChanged});

  @override
  State<FilterButtons> createState() => _FilterButtonsState();
}

class _FilterButtonsState extends State<FilterButtons> {
  final List<String> filters = [
    'Congressional & Senatorial Assistance',
    'Enlisted Perspective',
    'Inspector General & Military Equal Opportunity',
    'International & Coalition leadership',
    'Medication & Leadership',
    'Military Leadership',
    'Psychology of Leadership',
    'U.S. Air Force',
    'U.S. Coast Guard',
    'Military',
    'Veterans',
  ];

  List<String> selectedFilters = [];

  void _toggleFilter(String label) {
    setState(() {
      if (selectedFilters.contains(label)) {
        selectedFilters.remove(label);
      } else {
        selectedFilters.add(label);
      }
      widget.onSelectionChanged(selectedFilters);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (selectedFilters.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                Text(
                  'Active filters:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(width: 8),
                TextButton(
                  onPressed: () {
                    setState(() {
                      selectedFilters.clear();
                      widget.onSelectionChanged(selectedFilters);
                    });
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    minimumSize: Size(0, 0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text('Clear all', style: TextStyle(fontSize: 12)),
                ),
              ],
            ),
          ),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children:
              filters.map((filter) {
                final isSelected = selectedFilters.contains(filter);
                return ChoiceChip(
                  visualDensity: const VisualDensity(
                    horizontal: 0,
                    vertical: -4,
                  ),
                  label: Text(
                    filter,
                    style: TextStyle(color: Colors.white, fontSize: 11),
                  ),
                  selected: isSelected,
                  showCheckmark: false,
                  onSelected: (_) => _toggleFilter(filter),
                  selectedColor: Colors.red[400],
                  backgroundColor: Colors.grey[500],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(
                      color: AppColors.context(context).borderColor,
                      width: 1.0,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4.0,
                  ),
                  elevation: 0,
                  pressElevation: 0,
                );
              }).toList(),
        ),
      ],
    );
  }
}




// import 'package:commanderratings/core/utils/constants/app_colors.dart';
// import 'package:commanderratings/features/commanders_call/domain/model/get_all_category_blog_response_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../controllers/commanders_calls_controller.dart';

// class FilterButtons extends StatefulWidget {
//   final Function(List<String>) onSelectionChanged;

//   const FilterButtons({super.key, required this.onSelectionChanged});

//   @override
//   State<FilterButtons> createState() => _FilterButtonsState();
// }

// class _FilterButtonsState extends State<FilterButtons> {
//   late GetAllCategoryBlogResponseModel getAllCategoryBlogResponseModel;

//   @override
//   void initState() {
//     Get.find<CommandersCallsController>().getAllCommandersCall().then((_) {
//       final controller = Get.find<CommandersCallsController>();
//       if (controller.getAllCategoryBlogResponseModel != null &&
//           controller.getAllCategoryBlogResponseModel.data != null &&
//           controller.getAllCategoryBlogResponseModel.data!.blogs != null) {
//         setState(() {
//           getAllCategoryBlogResponseModel =
//               controller.getAllCategoryBlogResponseModel;
//         });
//       }
//     });
//     super.initState();
//   }

//   final List<String> filters = [
//     'Congressional & Senatorial Assistance',
//     'Enlisted Perspective',
//     'Inspector General & Military Equal Opportunity',
//     'International & Coalition leadership',
//     'Medication & Leadership',
//     'Military Leadership',
//     'Psychology of Leadership',
//     'U.S. Air Force',
//     'U.S. Coast Guard',
//     'Uncategorized',
//     'Veterans',
//   ];

//   List<String> selectedFilters = [];

//   void _toggleFilter(String label) {
//     setState(() {
//       if (selectedFilters.contains(label)) {
//         selectedFilters.remove(label);
//       } else {
//         selectedFilters.add(label);
//       }
//       widget.onSelectionChanged(selectedFilters);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<CommandersCallsController>(
//         builder:(commandersCallsController){
//           return !commandersCallsController.isLoading ?
//           Wrap(
//             spacing: 8.0,
//             runSpacing: 2.0,
//             children:
//             filters.map((filter) {   
//               final isSelected = selectedFilters.contains(filter);
//               return ChoiceChip(
//                 visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
//                 label: Text(
//                   filter,
//                   style: TextStyle(
//                     color: Colors.white,
//                     // isSelected
//                     //     ? AppColors.context(context).filterSelectedTextColor
//                     //     : AppColors.context(
//                     //       context,
//                     //     ).filterUnselectedTextColor,
//                     fontSize: 11,
//                   ),
//                 ),
//                 selected: isSelected,
//                 showCheckmark: false,
//                 onSelected: (_) => _toggleFilter(filter),
//                 selectedColor: Colors.red[400],
//                 backgroundColor: Colors.grey[500],
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(5),
//                   side: BorderSide(
//                     color: AppColors.context(context).borderColor,
//                     width: 1.0,
//                   ),
//                 ),
//                 padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4.0),
//                 elevation: 0,
//                 pressElevation: 0,
//               );
//             }).toList(),
//           ) : Center(
//             child: CircularProgressIndicator(),
//           );
//         } );
//   }
// }

// extension on List<Data> {
//   get blogs => null;
// }
