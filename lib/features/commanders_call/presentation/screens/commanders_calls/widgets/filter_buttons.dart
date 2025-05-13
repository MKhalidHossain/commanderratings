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
    'Uncategorized',
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
    return Wrap(
      spacing: 8.0,
      runSpacing: 2.0,
      children:
          filters.map((filter) {
            final isSelected = selectedFilters.contains(filter);
            return ChoiceChip(
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              label: Text(
                filter,
                style: TextStyle(
                  color: Colors.white,
                  // isSelected
                  //     ? AppColors.context(context).filterSelectedTextColor
                  //     : AppColors.context(
                  //       context,
                  //     ).filterUnselectedTextColor,
                  fontSize: 11,
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
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4.0),
              elevation: 0,
              pressElevation: 0,
            );
          }).toList(),
    );
  }
}
