import 'package:commanderratings/core/utils/constants/app_colors.dart';
import 'package:commanderratings/core/widgets/custom_dropdawon_field_widget.dart';
import 'package:flutter/material.dart';

class SearchAndRecentWidget extends StatefulWidget {
  const SearchAndRecentWidget({super.key});

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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          width: double.infinity,
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Search',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.context(context).borderColor,
                ),
              ),
              // focusedBorder: OutlineInputBorder(
              //   borderSide: BorderSide(
              //     color: AppColors.context(context).borderColor,
              //   ),
              // ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.context(context).borderColor,
                ),
              ),
              // disabledBorder: OutlineInputBorder(
              //   borderSide: BorderSide(
              //     color: AppColors.context(context).borderColor,
              //   ),
              // ),
              // suffixIcon: IconButton(
              //   onPressed: () {},
              //   icon: Icon(Icons.search),
              // ),
            ),
          ),
        ),
        CustomDropdownFieldWidget(
          hinttext: 'Recent',
          text: ' ',
          value: reviewfilterValue,
          items: reviewfilter,
          onChanged: (value) {
            reviewfilterValue = value;
          },
          validator:
              (value) =>
                  value == null || value.isEmpty
                      ? 'Please select an option'
                      : null,
        ),
      ],
    );
  }
}
