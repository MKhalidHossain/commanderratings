import 'package:commanderratings/features/auth/controllers/auth_controller.dart';
import 'package:commanderratings/features/auth/presentation/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app.dart';
import '../../../../core/headers/header_for_auth_three_man.dart';
import '../../../../core/widgets/wide_custom_button.dart';
import '../../../../helpers/custom_snackbar.dart';
import '../../domain/model/authentication_model.dart';
import '../widgets/auth_outlined_text_field_widget.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late Authenticaion authenticaion;

  bool isRemember = false;

  late TextEditingController emailController;
  late TextEditingController otpController;

  @override
  void initState() {
    emailController = TextEditingController();
    otpController = TextEditingController();
    super.initState();
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
                HeaderForAuthThreeMan(text: 'Otp'),
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
                            controller: emailController,

                            textInputType: TextInputType.text,
                            textFieldHeaderName: 'Email',
                          ),

                          const SizedBox(height: 24),

                          AuthOutlinedTextFieldWidget(
                            name: 'Password',
                            // lebel: 'Enter valid password',
                            controller: otpController,
                            textInputType: TextInputType.text,
                            textFieldHeaderName: 'Give Otp',
                          ),

                          const SizedBox(height: 30),

                          WideCustomButton(
                            text: 'Send OTP',
                            onPressed: () {
                              String email = emailController.text;
                              String otp = otpController.text;
                              if (email.isEmpty) {
                                showCustomSnackBar('email is required'.tr);
                              } else {
                                authController.otpVerification(otp, email);
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
          ),
        );
      },
    );
  }
}


// showDialog(
// context: context,
// builder: (context) {
// return AlertDialog(
// title: Text('Error'),
// content: Text('Please fill all the fields'),
// actions: [
// TextButton(
// child: Text('OK'),
// onPressed: () {
// Navigator.of(context).pop();
// },
// ),
// ],
// );
// },
// );