// import 'package:flutter/material.dart';

// class FilterButtons extends StatelessWidget {
//   const FilterButtons({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final filters = [
//       'All',
//       'Leadership',
//       'Mental Health',
//       'Veterans',
//       'Politics',
//       'Military',
//       'Coalition',
//       'Psychology',
//       'Congressional',
//     ];

//     // return Expanded(
//     //   child: Container(
//     //     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//     //     child: Column(
//     //       children:
//     //           filters
//     //               .map(
//     //                 (filter) => Container(
//     //                   margin: const EdgeInsets.only(right: 8),
//     //                   child: Chip(
//     //                     backgroundColor: Colors.red.shade800,
//     //                     label: Text(
//     //                       filter,
//     //                       style: const TextStyle(color: Colors.white),
//     //                     ),
//     //                   ),
//     //                 ),
//     //               )
//     //               .toList(),
//     //     ),
//     //   ),
//     // );
//     return Wrap(
//       spacing: 8.0,
//       runSpacing: 8.0,
//       children:
//           items.map((item) {
//             final isSelected = _selectedFilters[category]!.contains(item.label);

//             return ChoiceChip(
//               label: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   if (item.iconPath != null) ...[
//                     Image.asset(item.iconPath!, width: 20, height: 20),
//                     const SizedBox(width: 6),
//                   ],
//                   Text(
//                     item.label,
//                     style: TextStyle(
//                       color: isSelected ? Colors.white : Colors.green,
//                       fontSize: 11,
//                     ),
//                   ),
//                   if (item.isPro) ...[
//                     const SizedBox(width: 4),
//                     Image.asset('assets/flags/pro.png', width: 30, height: 30),
//                   ],
//                 ],
//               ),
//               selected: isSelected,
//               onSelected: (selected) => _toggleFilter(category, item.label),
//               selectedColor: Colors.green[600],
//               backgroundColor: Colors.white,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(30),
//                 side: const BorderSide(color: Colors.green, width: 1.0),
//               ),
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 12.0,
//                 vertical: 6.0,
//               ),
//               elevation: 0,
//               pressElevation: 0,
//             );
//           }).toList(),
//     );
//   }
// }

import 'package:flutter/material.dart';

class FilterButtons extends StatefulWidget {
  final Function(List<String>) onSelectionChanged;

  const FilterButtons({super.key, required this.onSelectionChanged});

  @override
  State<FilterButtons> createState() => _FilterButtonsState();
}

class _FilterButtonsState extends State<FilterButtons> {
  final List<String> filters = [
    'All',
    'Leadership',
    'Mental Health',
    'Veterans',
    'Politics',
    'Military',
    'Coalition',
    'Psychology',
    'Congressional',
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
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children:
          filters.map((filter) {
            final isSelected = selectedFilters.contains(filter);
            return ChoiceChip(
              label: Text(
                filter,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.green,
                  fontSize: 11,
                ),
              ),
              selected: isSelected,
              showCheckmark: false,
              onSelected: (_) => _toggleFilter(filter),
              // selectedColor: Colors.red[600],
              // backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: const BorderSide(color: Colors.green, width: 1.0),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 6.0,
              ),
              elevation: 0,
              pressElevation: 0,
            );
          }).toList(),
    );
  }
}
