import 'package:flutter/material.dart';
import '../../domain/get_all_service_response_model.dart';
import 'buttion_for_sevice_branches.dart';
import 'customBoxContainer.dart';
import 'title_text_all_commanders.dart';

class ServiceMemberWidget extends StatefulWidget {

  final List<Services> services;
  final Function(Set<String>) onSelectionChanged;

  const ServiceMemberWidget({super.key, required this.onSelectionChanged, required this.services});

  @override
  State<ServiceMemberWidget> createState() => _ServiceMemberWidgetState();
}

class _ServiceMemberWidgetState extends State<ServiceMemberWidget> {
  final List<String> serviceBranchesFilters = [
    'Air Force',
    'Army',
    'Navy',
    'Marines',
    'all',
  ];

  Set<String> selectedServiceBranchesFilters = {};

  void _toggleFilter(String label) {
    setState(() {
      if (selectedServiceBranchesFilters.contains(label)) {
        // Deselect all — show all content
        selectedServiceBranchesFilters.clear();
        return;
      } else {
        // Select only this label
        selectedServiceBranchesFilters = {label};
      }

      // Notify parent of the current selection state
      widget.onSelectionChanged(selectedServiceBranchesFilters);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Customboxcontainer(
      children: [
        TitleTextAllCommanders(text: 'Service Members'),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children:
              serviceBranchesFilters.map((label) {
                final isSelected = selectedServiceBranchesFilters.contains(
                  label,
                );
                return ButtionForSeviceBranches(
                  fillColor: isSelected ? Colors.red[400]! : Colors.grey,
                  weight: (size.width - 100) * 0.224,
                  text: label,
                  fontSize: 12,
                  textColor: Colors.white,
                  onPressed: () => _toggleFilter(label),
                );
              }).toList(),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
