import 'package:commanderratings/core/utils/constants/app_colors.dart';
import 'package:commanderratings/core/widgets/custom_dropdawon_field_widget.dart';
import 'package:flutter/material.dart';

class SearchAndRecentWidget extends StatefulWidget {
  final String commanderId;
  final Function(String) onSearchChanged; // Add callback for search changes

  const SearchAndRecentWidget({
    super.key, 
    required this.commanderId,
    required this.onSearchChanged,
  });

  @override
  State<SearchAndRecentWidget> createState() => _SearchAndRecentWidgetState();
}

class _SearchAndRecentWidgetState extends State<SearchAndRecentWidget> {
  final List<String> reviewfilter = [
    'Most Positive',
    'Most Negative',
    'Most Helpful',
  ];
  
  String? reviewfilterValue;
  final TextEditingController _searchController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    // Listen to search text changes
    _searchController.addListener(() {
      widget.onSearchChanged(_searchController.text);
    });
  }
  
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          width: double.infinity,
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Search reviews...',
              hintText: 'Type to search in reviews',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.context(context).borderColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.context(context).borderColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.context(context).borderColor,
                ),
              ),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        _searchController.clear();
                      },
                      icon: Icon(Icons.clear),
                    )
                  : Icon(Icons.search),
            ),
          ),
        ),
        const SizedBox(height: 8),
        CustomDropdownFieldWidget(
          hinttext: 'Recent',
          text: ' ',
          value: reviewfilterValue,
          items: reviewfilter,
          onChanged: (value) {
            setState(() {
              reviewfilterValue = value;
            });
          },
          validator: (value) =>
              value == null || value.isEmpty
                  ? 'Please select an option'
                  : null,
        ),
      ],
    );
  }
}





// import 'package:commanderratings/core/utils/constants/app_colors.dart';
// import 'package:commanderratings/core/widgets/custom_dropdawon_field_widget.dart';
// import 'package:flutter/material.dart';

// class SearchAndRecentWidget extends StatefulWidget {
//   final String commanderId;

//   const SearchAndRecentWidget({super.key, required this.commanderId});




//   @override
//   State<SearchAndRecentWidget> createState() => _SearchAndRecentWidgetState();
// }

// class _SearchAndRecentWidgetState extends State<SearchAndRecentWidget> {
//   final List<String> reviewfilter = [
//     'Most Positive',
//     'Most Negative',
//     'Most Helpful',
//   ];
//   String? reviewfilterValue;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           height: 40,
//           width: double.infinity,
//           child: TextField(
//             decoration: InputDecoration(
//               labelText: 'Search',
//               border: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: AppColors.context(context).borderColor,
//                 ),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: AppColors.context(context).borderColor,
//                 ),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: AppColors.context(context).borderColor,
//                 ),
//               ),
//               // disabledBorder: OutlineInputBorder(
//               //   borderSide: BorderSide(
//               //     color: AppColors.context(context).borderColor,
//               //   ),
//               // ),
//               // suffixIcon: IconButton(
//               //   onPressed: () {},
//               //   icon: Icon(Icons.search),
//               // ),
//             ),
//           ),
//         ),
//         CustomDropdownFieldWidget(
//           hinttext: 'Recent',
//           text: ' ',
//           value: reviewfilterValue,
//           items: reviewfilter,
//           onChanged: (value) {
//             reviewfilterValue = value;
//           },
//           validator:
//               (value) =>
//                   value == null || value.isEmpty
//                       ? 'Please select an option'
//                       : null,
//         ),
//       ],
//     );
//   }
// }
