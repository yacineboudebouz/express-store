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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                            onPressed: () {}),
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
    );
  }
}
