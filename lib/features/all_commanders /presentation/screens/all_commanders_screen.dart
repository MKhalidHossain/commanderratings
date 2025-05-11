import 'package:commanderratings/core/widgets/normal_custom_button.dart';
import 'package:commanderratings/core/widgets/title_with_icon_prefix.dart';
import 'package:commanderratings/features/add_commander/presentation/screens/add_commanders_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllCommandersScreen extends StatelessWidget {
  const AllCommandersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TitleWithIconPrefix(fontSize: 12, text: 'All commanders'),
              NormalCustomButton(
                text: 'Add Commmander +',
                fontSize: 12,
                height: 40,
                weight: 140,
                onPressed: () {
                  Get.to(() => AddCommandersScreen());
                },
              ),
            ],
          ),
        ),
        leadingWidth: 20,

        // actions: [
        //   NormalCustomButton(
        //     text: 'Add Commmander +',
        //     fontSize: 12,
        //     height: 40,
        //     weight: 140,
        //     onPressed: () {
        //       Get.to(() => AddCommandersScreen());
        //     },
        //   ),
        //   const SizedBox(width: 20),
        // ],
      ),
      body: Center(child: Text('Commanders Page')),
    );
  }
}
