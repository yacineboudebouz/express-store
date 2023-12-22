import 'package:express_shop/src/core/common/custom_button.dart';
import 'package:express_shop/src/core/common/gaps.dart';
import 'package:express_shop/src/core/extentions.dart';
import 'package:express_shop/src/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
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
                            "Please fill your info to login",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                        ),
                        h2,
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "username / email",
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
                              hintText: "password",
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
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {}),
                      ]),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                      onPressed: () {
                        Routemaster.of(context).push("/register");
                      },
                      child: const Text(
                        "Register",
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
