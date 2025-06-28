import 'package:commanderratings/app.dart';
import 'package:commanderratings/core/headers/header_for_auth_three_man.dart';
import 'package:commanderratings/features/auth/controllers/auth_controller.dart';
import 'package:commanderratings/features/auth/domain/model/authentication_model.dart';
import 'package:commanderratings/features/auth/presentation/screens/lost_password.dart';
import 'package:commanderratings/features/auth/presentation/screens/sign_up.dart';
import 'package:commanderratings/features/auth/presentation/widgets/auth_outlined_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/wide_custom_button.dart';
import '../../../../helpers/custom_snackbar.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  late Authenticaion authenticaion;

  bool isRemember = false;

  late TextEditingController emailContoller;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailContoller = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }


  @override
  void dispose() {
    emailContoller.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (authController) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Column(
              children: [
                HeaderForAuthThreeMan(text: 'LOG IN'),
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
                            name: 'Username or Email',
                            //lebel: 'Enter eamil or username',
                            controller: emailContoller,

                            textInputType: TextInputType.text,
                            textFieldHeaderName: 'Username or Email',
                          ),
                          const SizedBox(height: 24),
                          AuthOutlinedTextFieldWidget(
                            name: 'Password',
                            isObsecure: true,
                            // lebel: 'Enter valid password',
                            controller: passwordController,
                            textInputType: TextInputType.text,
                            textFieldHeaderName: 'password',
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade500,
                                    width: 3,
                                  ),
                                  color: Colors.white,
                                ),
                                child: Checkbox(
                                  checkColor: Colors.white,
                                  activeColor: Colors.grey.shade500,
                                  value: isRemember,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isRemember = value!;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Remember Me',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0),

                          WideCustomButton(
                            text: 'LOG IN',
                            onPressed: () {
                              String email = emailContoller.text;
                              String password = passwordController.text;
                              if (email.isEmpty) {
                                showCustomSnackBar('email is required'.tr);
                              } else if (password.isEmpty) {
                                showCustomSnackBar('password_is_required'.tr);
                              } else if (password.length < 5) {
                                showCustomSnackBar(
                                  'minimum password length is 8',
                                );
                              } else {
                                authController.login(email, password);
                              }
                            },
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Get.to(LostPasswordScreen());
                                },
                                child: Text(
                                  'Lost your password?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
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
          ),
        );
      },
    );
  }
}
