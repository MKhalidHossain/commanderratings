import 'package:commanderratings/features/commanders_call/controllers/commanders_calls_controller.dart';
import 'package:commanderratings/features/commanders_call/domain/model/get_all_contact.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../widgets/contact_section_widget.dart';
import '../../../../../core/headers/header_for_others_one_man.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();


}


class _ContactUsState extends State<ContactUs> {
  late GetAllContactResponse getAllContactResponse;

  @override
  void initState() {
    Get.find<CommandersCallsController>().getAllContact().then((_){
      final controller = Get.find<CommandersCallsController>();
      if (controller.getAllContactResponse != null &&
          controller.getAllContactResponse.data != null &&
          controller.getAllContactResponse.data!.length != null) {
        setState(() {
          getAllContactResponse =
              controller.getAllContactResponse;
        });
      }
    });
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    print(getAllContactResponse.message.toString());
    print(getAllContactResponse.data!.first.firstName.toString());

    return GetBuilder<CommandersCallsController>(
        builder: (commandersCallsController){
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  HeaderForOthers(text: 'Contact Us'),
                  const SizedBox(height: 24),
                  ContactSection(),
                ],
              ),
            ),
          );
        }
    );
  }
}
