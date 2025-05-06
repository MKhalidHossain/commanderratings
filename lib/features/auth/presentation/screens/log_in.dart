import 'package:commanderratings/core/headers/header_for_auth_three_man.dart';
import 'package:commanderratings/core/utils/constants/app_colors.dart';
import 'package:commanderratings/features/add_commander/presentation/widgets/outlined_text_field_widget.dart';
import 'package:flutter/material.dart';

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
      body: Column(
        children: [
          HeaderForAuthThreeMan(text: 'LOG IN'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),

            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.context(context).contentBoxColor,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OutlinedTextFieldWidget(
                      name: 'Username or Email',
                      lebel: 'Enter eamil or username',
                      controller: emailContoller,

                      textInputType: TextInputType.text,
                      textFieldHeaderName: 'Username or Email',
                    ),
                    const SizedBox(height: 24),
                    OutlinedTextFieldWidget(
                      name: 'Password',
                      lebel: 'Enter valid password',
                      controller: passwordController,
                      textInputType: TextInputType.text,
                      textFieldHeaderName: 'password',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.red,
                          child: Checkbox(
                            value: isRemember,
                            onChanged: (bool? value) {
                              setState(() {
                                isRemember = value!;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Remember Me',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.context(context).textColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),

                    WideCustomButton(
                      text: 'Submit Commander',
                      onPressed: () {
                        if (emailContoller.text.isNotEmpty ||
                            passwordController.text.isNotEmpty) {
                          authenticaion = Authenticaion(
                            email: emailContoller.text,
                            password: passwordController.text,
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


class Authenticaion {
  final String email;
  final String password;
  Authenticaion({required this.email, required this.password});
}
