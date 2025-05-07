import 'package:commanderratings/app.dart';
import 'package:commanderratings/core/headers/header_for_auth_three_man.dart';
import 'package:commanderratings/core/utils/constants/app_colors.dart';
import 'package:commanderratings/features/add_commander/presentation/widgets/outlined_text_field_widget.dart';
import 'package:commanderratings/features/auth/core/domain_or_model/authentication_model.dart';
import 'package:commanderratings/features/auth/presentation/screens/lost_password.dart';
import 'package:commanderratings/features/auth/presentation/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/wide_custom_button.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
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
                    OutlinedTextFieldWidget(
                      name: 'Username or Email',
                      //lebel: 'Enter eamil or username',
                      controller: emailContoller,

                      textInputType: TextInputType.text,
                      textFieldHeaderName: 'Username or Email',
                    ),
                    const SizedBox(height: 24),
                    OutlinedTextFieldWidget(
                      name: 'Password',
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
                        if (emailContoller.text.isNotEmpty ||
                            passwordController.text.isNotEmpty) {
                          authenticaion = Authenticaion(
                            email: emailContoller.text,
                            password: passwordController.text,
                            name: 'name',
                          );

                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Error'),
                                content: Text(
                                  '${authenticaion.email} ${authenticaion.password}',
                                ),
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
    );
  }
}
