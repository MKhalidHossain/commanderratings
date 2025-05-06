import 'package:flutter/material.dart';
import '../../../../core/headers/header_for_auth_three_man.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/widgets/wide_custom_button.dart';
import '../../../add_commander/presentation/widgets/outlined_text_field_widget.dart';
import '../../core/domain_or_model/authentication_model.dart';

class LostPasswordScreen extends StatefulWidget {
  const LostPasswordScreen({super.key});

  @override
  State<LostPasswordScreen> createState() => _LostPasswordScreenState();
}

class _LostPasswordScreenState extends State<LostPasswordScreen> {
  late Authenticaion authenticaion;

  bool isRemember = false;

  late TextEditingController emailContoller;

  @override
  void initState() {
    emailContoller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      body: Column(
        children: [
          HeaderForAuthThreeMan(text: 'LOST PASSWORD'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),

            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.context(context).contentBoxColor,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8.0),
                    OutlinedTextFieldWidget(
                      name: 'Username or Email',
                      lebel: 'Enter eamil or username',
                      controller: emailContoller,

                      textInputType: TextInputType.text,
                      textFieldHeaderName: 'Username or Email',
                    ),
                    const SizedBox(height: 24),
                    WideCustomButton(
                      text: 'RESET PASSWORD',
                      onPressed: () {
                        if (emailContoller.text.isNotEmpty) {
                          authenticaion = Authenticaion(
                            email: emailContoller.text,                     
                            name: 'name',
                          );

                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Error'),
                                content: Text('${authenticaion.email} '),
                                actions: [
                                  TextButton(
                                    child: Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Error'),
                                content: Text('Please fill all the fields'),
                                actions: [
                                  TextButton(
                                    child: Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
