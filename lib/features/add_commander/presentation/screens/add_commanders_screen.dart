import 'package:commanderratings/core/utils/constants/app_colors.dart';
import 'package:commanderratings/core/widgets/normal_custom_button.dart';
import 'package:commanderratings/core/widgets/title_with_icon_prefix.dart';
import 'package:flutter/material.dart';

import '../widgets/add_a_new_commander_widgets.dart';

class AddCommandersScreen extends StatelessWidget {
  const AddCommandersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  //Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_outlined,
                  size: 30,
                  color: AppColors.context(context).iconColor,
                ),
              ),
              TitleWithIconPrefix(
                text: 'Commander',
                color: AppColors.context(context).textColor,
              ),
              NormalCustomButton(
                weight: 140,
                height: 40,
                fontSize: 12,
                text: 'Add Commander +',
                onPressed: () {},
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 10),

                const SizedBox(height: 20),
                AddANewCommanderWidgets(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
