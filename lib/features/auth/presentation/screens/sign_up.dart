import 'package:commanderratings/features/auth/controllers/auth_controller.dart';
import 'package:commanderratings/features/auth/presentation/screens/log_in.dart';
import 'package:commanderratings/features/auth/presentation/screens/lost_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/headers/header_for_auth_three_man.dart';
import '../../../../core/widgets/wide_custom_button.dart';
import '../../../../core/widgets/outlined_text_field_widget.dart';
import '../../../../helpers/custom_snackbar.dart';
import '../../domain/model/authentication_model.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late Authenticaion authenticaion;
  bool isRemember = false;

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
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
                HeaderForAuthThreeMan(text: 'SIGN UP'),
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
                            name: 'name',
                            // lebel: 'Enter your username',
                            controller: nameController,
                            textInputType: TextInputType.text,
                            textFieldHeaderName: 'Username',
                          ),
                          const SizedBox(height: 20.0),
                          OutlinedTextFieldWidget(
                            name: 'Email',
                            // lebel: 'Enter your email.',
                            controller: emailController,

                            textInputType: TextInputType.text,
                            textFieldHeaderName: 'Email',
                          ),
                          const SizedBox(height: 20.0),
                          OutlinedTextFieldWidget(
                            name: 'Password',
                            //lebel: 'Enter a valid password',
                            controller: passwordController,
                            textInputType: TextInputType.text,
                            textFieldHeaderName: 'Password',
                          ),
                          const SizedBox(height: 24.0),
                          WideCustomButton(
                            text: 'SIGN UP',
                            onPressed: (){
                              String name = nameController.text;
                              String password = passwordController.text;
                              String email = emailController.text;

                              if(email.isEmpty){
                                showCustomSnackBar('email is required'.tr);
                              }else if(password.length<5){
                                showCustomSnackBar('minimum password length is 8'.tr);
                              }
                              else{
                                authController.register( name,  email,  password);
                              }
                            }
                          ),
                          const SizedBox(height: 5),
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
                        Get.to(LogIn());
                      },
                      child: Text(
                        'Already have an account! Log In',
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

// class Authenticaion {
//   //for Authenticaiton
//   final String name;
//   final String email;
//   final String password;
//   Authenticaion({
//     required this.name,
//     required this.email,
//     required this.password,
//   });
// }
