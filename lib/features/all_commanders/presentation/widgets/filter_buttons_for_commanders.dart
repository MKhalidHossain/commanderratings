import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_colors.dart';

class FilterButtonsForCommanders extends StatefulWidget {
  final Function(List<String>) onSelectionChanged;
  const FilterButtonsForCommanders({
    super.key,
    required this.onSelectionChanged,
  });

  @override
  State<FilterButtonsForCommanders> createState() =>
      _FilterButtonsForCommandersState();
}

class _FilterButtonsForCommandersState
    extends State<FilterButtonsForCommanders> {
  final List<String> filters = [
    'Air Force',
    'Coast Guard',
    'Navy',
    'Army',
    'MARINES',
    'ACC',
    'AETC',
    'AFGSC',
    '11th Wing',
    'Airlift Wing',
    'Uncategorized',
    'Veterans',
    'National Guard',
    'Marine',
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
    );
  }
}
