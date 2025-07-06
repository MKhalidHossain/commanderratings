import 'package:commanderratings/features/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app.dart';
import '../../../../core/headers/header_for_auth_three_man.dart';
import '../../../../core/widgets/wide_custom_button.dart';
import '../../../../helpers/custom_snackbar.dart';
import '../../domain/model/authentication_model.dart';
import '../widgets/auth_outlined_text_field_widget.dart';
import 'sign_up.dart';

class ResetPassword extends StatefulWidget {
  final String userEmail;

  const ResetPassword({super.key, required this.userEmail});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  late Authenticaion authenticaion;

  bool isRemember = false;

  late TextEditingController passwordController;
  late TextEditingController newpasswordController;

  @override
  void initState() {
    passwordController = TextEditingController();
    newpasswordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (authController) {
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
                        AuthOutlinedTextFieldWidget(
                          name: 'Enter new password',
                          //lebel: 'Enter eamil or username',
                          controller: passwordController,
                          isObsecure: true,
                          textInputType: TextInputType.text,
                          textFieldHeaderName: 'Enter new password',
                        ),
                        const SizedBox(height: 24),
                        AuthOutlinedTextFieldWidget(
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
                          onPressed: () {
                            String pass = passwordController.text;
                            String newPass = newpasswordController.text;
                            if (pass.isEmpty) {
                              showCustomSnackBar('Entur new password'.tr);
                            } else if (newPass.isEmpty) {
                              showCustomSnackBar('Enter password'.tr);
                            } else if (pass.length < 5) {
                              showCustomSnackBar(
                                'minimum password length is 6'.tr,
                              );
                            } else if (pass != newPass) {
                              showCustomSnackBar(
                                'password does not match , Please give same password'
                                    .tr,
                              );
                            } else {
                              authController.resetPassword(
                                widget.userEmail,
                                pass,
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
      },
    );
  }
}
