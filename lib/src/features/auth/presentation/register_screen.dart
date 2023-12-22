import 'package:express_shop/src/core/common/custom_button.dart';
import 'package:express_shop/src/core/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import '../../../core/common/gaps.dart';
import '../../../theme/pallete.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final usernameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: context.height * 0.9,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: context.width,
                            height: context.height * 0.05,
                          ),
                          const Text(
                            "Get Started",
                            style: TextStyle(
                                fontSize: 35, fontWeight: FontWeight.bold),
                          ),
                          h4,
                          const Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Please fill your info to create account",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                          ),
                          h2,
                          TextFormField(
                            controller: emailController,
                            validator: (value) {
                              return RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value!)
                                  ? null
                                  : "Please enter a valid email";
                            },
                            decoration: InputDecoration(
                                hintText: "Email",
                                fillColor: Colors.grey.withOpacity(0.3),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          h2,
                          TextFormField(
                            controller: usernameController,
                            validator: (value) {
                              if (value == "") {
                                return "Please provide username";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                hintText: "Username",
                                fillColor: Colors.grey.withOpacity(0.3),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          h2,
                          TextFormField(
                            controller: passwordController,
                            validator: (value) {
                              if (value != confirmPasswordController.text) {
                                return "Please enter the same password";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                hintText: "Password",
                                fillColor: Colors.grey.withOpacity(0.3),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          h2,
                          TextFormField(
                            controller: confirmPasswordController,
                            validator: (value) {
                              if (value != passwordController.text) {
                                return "Please enter the same password";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                hintText: "Confirm Password",
                                fillColor: Colors.grey.withOpacity(0.3),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          h2,
                          CustomButton(
                              child: const Text(
                                "Register",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  print("validated");
                                }
                              }),
                        ]),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                        onPressed: () {
                          Routemaster.of(context).push('/login');
                        },
                        child: const Text(
                          "Already have account ? Login",
                          style: TextStyle(color: Pallete.blackColor),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
