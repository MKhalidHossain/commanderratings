
import 'package:commanderratings/features/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app.dart';
import '../../../../core/headers/header_for_auth_three_man.dart';
import '../../../../core/widgets/outlined_text_field_widget.dart';
import '../../../../core/widgets/wide_custom_button.dart';
import '../../../../helpers/custom_snackbar.dart';
import '../../domain/model/authentication_model.dart';
import 'sign_up.dart';
class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  late Authenticaion authenticaion;

  bool isRemember = false;

  late TextEditingController emailController;
  late TextEditingController newpasswordController;

  @override
  void initState() {
    emailController = TextEditingController();
    newpasswordController = TextEditingController();
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

                HeaderForAuthThreeMan(text: 'Reset Password'),
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
                            //lebel: 'Enter eamil or username',
                            controller: emailController,

                            textInputType: TextInputType.text,
                            textFieldHeaderName: 'Username or Email',
                          ),
                          const SizedBox(height: 24),
                          OutlinedTextFieldWidget(
                            name: 'Password',
                            // lebel: 'Enter valid password',
                            isObsecure: true,
                            controller: newpasswordController,
                            textInputType: TextInputType.text,
                            textFieldHeaderName: 'password',
                          ),
                          const SizedBox(height: 30),

                          WideCustomButton(
                            text: 'SUBMIT',
                            onPressed: (){
                              String email = emailController.text;
                              String password = newpasswordController.text;
                              if(email.isEmpty){
                                showCustomSnackBar('email is required'.tr);

                              }else if(password.isEmpty){
                                showCustomSnackBar('password_is_required'.tr);
                              }else if(password.length<5){
                                showCustomSnackBar('minimum password length is 8');

                              }else{
                                authController.resetPassword(email, password);
                              }
                            },
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.to(SignUp());
                      },
                      child: Text(
                        'Not have an account? SignUp!',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.to(MainScreen());
                      },
                      child: Text(
                        'SKIP',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          );
        }
    );
  }
}