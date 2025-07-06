import 'package:commanderratings/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class FilterButtons extends StatefulWidget {
  final Function(List<String>) onSelectionChanged;
  final List<String>
  categories; // Add this parameter to accept dynamic categories

  const FilterButtons({
    super.key,
    required this.onSelectionChanged,
    required this.categories, // Make it required
  });

  @override
  State<FilterButtons> createState() => _FilterButtonsState();
}

class _FilterButtonsState extends State<FilterButtons> {
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
          Row(
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
                child: Text(
                  'Clear all',
                  style: TextStyle(fontSize: 16, color: Colors.red),
                ),
              ),
            ],
          ),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          // Use the dynamic categories from the widget parameter
          children:
              widget.categories.map((filter) {
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
