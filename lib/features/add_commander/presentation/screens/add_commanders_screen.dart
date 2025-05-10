import 'package:commanderratings/core/utils/constants/app_colors.dart';
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
          leading: Icon(
            Icons.arrow_back_outlined,
            size: 30,
            color: AppColors.context(context).iconColor,
          ),
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          centerTitle: true,
          title: TitleWithIconPrefix(
            text: 'Commander',
            color: AppColors.context(context).textColor,
          ),
          actions: [SizedBox(width: 50)],
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
