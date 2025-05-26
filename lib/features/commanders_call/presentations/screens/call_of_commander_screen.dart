
import 'package:commanderratings/features/commanders_call/controllers/commanders_calls_controller.dart';
import 'package:commanderratings/features/commanders_call/domain/model/get_one_blog_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/headers/header_for_others_one_man.dart';
import '../widgets/is_this_meo_office_effective_weiget.dart';


class CallOfCommanderScreen extends StatefulWidget {

  final String id;

  const CallOfCommanderScreen({super.key, required this.id});

  @override
  State<CallOfCommanderScreen> createState() =>
      _CallOfCommanderScreenState();
}

class _CallOfCommanderScreenState
    extends State<CallOfCommanderScreen> {



  late GetOneBlog getOneBlog;

  @override
  void initState() {
    Get.find<CommandersCallsController>().getACommandersCall(widget.id).then((_) {
      final controller = Get.find<CommandersCallsController>();
      if (controller.getOneBlog != null &&
          controller.getOneBlog.data != null &&
          controller.getOneBlog.data!.blog != null) {
        setState(() {
          getOneBlog =
              controller.getOneBlog;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {



    return GetBuilder<CommandersCallsController>(
        builder: (commandersCallsController){

          // print(getOneBlog.data!.blog!.title.toString());
          return !commandersCallsController.isLoading ?
          Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  HeaderForOthers(text: getOneBlog.data!.blog!.title!),
                  const SizedBox(height: 24),
                  IsThisMeoOfficeEffectiveWeiget(),
                ],
              ),
            ),
          ) : Center(
            child: CircularProgressIndicator(),
          );
        }
    );
  }
}
