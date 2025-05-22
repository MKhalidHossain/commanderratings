import 'package:commanderratings/features/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/headers/header_for_auth_three_man.dart';
import '../../../../core/widgets/wide_custom_button.dart';
import '../../../../core/widgets/outlined_text_field_widget.dart';
import '../../../../helpers/custom_snackbar.dart';
import '../../domain/model/authentication_model.dart';

class LostPasswordScreen extends StatefulWidget {
  const LostPasswordScreen({super.key});

  @override
  State<LostPasswordScreen> createState() => _LostPasswordScreenState();
}

class _LostPasswordScreenState extends State<LostPasswordScreen> {
  late Authenticaion authenticaion;

  bool isRemember = false;

  late TextEditingController emailController;

  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        builder: (authController){
          return Scaffold(
            backgroundColor: Colors.black,
            body: Column(
              children: [
                HeaderForAuthThreeMan(text: 'LOST PASSWORD'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),

                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                            // lebel: 'Enter eamil or username',
                            controller: emailController,

                            textInputType: TextInputType.text,
                            textFieldHeaderName: 'Username or Email',
                          ),
                          const SizedBox(height: 24),
                          WideCustomButton(
                            text: 'RESET PASSWORD',
                            onPressed: (){
                              String email = emailController.text;
                              if(email.isEmpty){
                                showCustomSnackBar('email is required'.tr);
                              }else{
                                authController.resendOtp(email);
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
    );
  }
}
