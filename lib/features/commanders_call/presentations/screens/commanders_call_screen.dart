import 'package:commanderratings/features/commanders_call/controllers/commanders_calls_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/headers/header_for_others_one_man.dart';
import '../../../commanders/domain/leadership_card_model.dart';
import '../../domain/model/get_all_blog_service_model.dart';
import '../widgets/filter_buttons.dart';
import '../widgets/leadership_card_widget.dart';
import 'call_of_commander_screen.dart';

class CommandersCallScreen extends StatefulWidget {

  const CommandersCallScreen({super.key});

  @override
  State<CommandersCallScreen> createState() => _CommandersCallScreenState();
}

class _CommandersCallScreenState extends State<CommandersCallScreen> {


  late GetAllBlogResponseModel getAllBlogResponseModel;

  @override
  void initState() {
    Get.find<CommandersCallsController>().getAllCommandersCall().then((_) {
      final controller = Get.find<CommandersCallsController>();
      if (controller.getAllBlogResponseModel != null &&
          controller.getAllBlogResponseModel.data != null &&
          controller.getAllBlogResponseModel.data!.blogs != null) {
        setState(() {
          getAllBlogResponseModel =
              controller.getAllBlogResponseModel;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return GetBuilder<CommandersCallsController>(

        builder: (commandersCallsController){
          return !commandersCallsController.isLoading ? Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  HeaderForOthers(text: 'Commanders Call'),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FilterButtons(
                      onSelectionChanged: (selectedFilters) {
                        print("Selected: $selectedFilters");
                      },
                    ),
                  ), //
                  // Horizontal filter button list
                  const SizedBox(height: 10),

                  Padding(

                    padding: const EdgeInsets.all(20.0),

                    child: Column(
                      children: List.generate(
                        getAllBlogResponseModel.data!.blogs!.length,
                            (index) => GestureDetector(
                          onTap: () {
                            Get.to(CallOfCommanderScreen(id: getAllBlogResponseModel.data!.blogs![index].sId!,));
                          },
                          child: LeadershipCardWidget(blog: getAllBlogResponseModel.data!.blogs![index]),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ) :

          Center(
            child: CircularProgressIndicator(),
          );
        }
    );
  }
}
