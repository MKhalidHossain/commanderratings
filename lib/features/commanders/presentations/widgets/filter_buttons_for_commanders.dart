import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../domain/get_all_unit_response_model.dart';

class FilterButtonsForCommanders extends StatefulWidget {
  final List<Units> units;
  final Function(String) onSelectionChanged;
  
  const FilterButtonsForCommanders({
    super.key,
    required this.units,
    required this.onSelectionChanged,
  });

  @override
  State<FilterButtonsForCommanders> createState() => _FilterButtonsForCommandersState();
}

class _FilterButtonsForCommandersState extends State<FilterButtonsForCommanders> {
  late List<String> selectedFilters = [];
  late List<String> availableFilters;

  @override
  void initState() {
    super.initState();
    // Initialize available filters from units, skipping any null names
    availableFilters = widget.units
        .map((unit) => unit.name)
        .where((name) => name != null)
        .cast<String>()
        .toList();
  }

  void _toggleFilter(String label) {
    setState(() {
      if (selectedFilters.contains(label)) {
        selectedFilters.remove(label);
      } else {
        selectedFilters.add(label);
      }
      widget.onSelectionChanged(label); // Send a copy
    });
  }

  void _clearAllFilters() {
    setState(() {
      selectedFilters.clear();
      widget.onSelectionChanged('');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Clear all button (only shown when filters are active)
        if (selectedFilters.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: GestureDetector(
              onTap: _clearAllFilters,
              child: Text(
                'Clear all',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        
        // Filter chips
        Wrap(
          spacing: 8.0,
          runSpacing: 2.0,
          children: availableFilters.map((filter) {
            final isSelected = selectedFilters.contains(filter);
            return ChoiceChip(
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              label: Text(
                filter,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
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
                horizontal: 4.0,
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

// import 'package:flutter/material.dart';
// import '../../../../core/utils/constants/app_colors.dart';
// import '../../domain/get_all_unit_response_model.dart';

// class FilterButtonsForCommanders extends StatefulWidget {
//   final List<Units> units;
//   final Function(List<String>) onSelectionChanged;
//   const FilterButtonsForCommanders({
//     super.key,
//     required this.onSelectionChanged, required this.units,
//   });

//   @override
//   State<FilterButtonsForCommanders> createState() =>
//       _FilterButtonsForCommandersState();
// }

// class _FilterButtonsForCommandersState
//     extends State<FilterButtonsForCommanders> {
//   final List<String> filters =[];
  

//   List<String> selectedFilters = [];


  
//   void addDataToUnits(){
//     for(var d in widget.units){
//       filters.add(d.name!);
//     }
//   }



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
//   void initState() {
//     addDataToUnits();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       spacing: 8.0,
//       runSpacing: 2.0,
//       children:
//           filters.map((filter) {
//             final isSelected = selectedFilters.contains(filter);
//             return ChoiceChip(
//               visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
//               label: Text(
//                 filter,
//                 style: TextStyle(
//                   color: Colors.white,
//                   // isSelected
//                   //     ? AppColors.context(context).filterSelectedTextColor
//                   //     : AppColors.context(
//                   //       context,
//                   //     ).filterUnselectedTextColor,
//                   fontSize: 12,
//                 ),
//               ),
//               selected: isSelected,
//               showCheckmark: false,
//               onSelected: (_) => _toggleFilter(filter),
//               selectedColor: Colors.red[400],
//               backgroundColor: Colors.grey[500],
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(5),
//                 side: BorderSide(
//                   color: AppColors.context(context).borderColor,
//                   width: 1.0,
//                 ),
//               ),
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 4.0,
//                 vertical: 4.0,
//               ),
//               elevation: 0,
//               pressElevation: 0,
//             );
//           }).toList(),
//     );
//   }
// }
