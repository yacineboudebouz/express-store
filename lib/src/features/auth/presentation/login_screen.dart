import 'package:express_shop/src/core/common/custom_button.dart';
import 'package:express_shop/src/core/common/gaps.dart';
import 'package:express_shop/src/core/extentions.dart';
import 'package:express_shop/src/features/auth/presentation/auth_controller.dart';
import 'package:express_shop/src/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authControllerProvider);
    ref.listen<AsyncValue>(authControllerProvider.select((state) => state),
        (_, state) {
      if (state.hasError) {
        showDialogError(context, state.error.toString());
      }
    });
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
                  child: Form(
                    key: formKey,
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
                            controller: emailController,
                            validator: (value) {
                              if (value == "") {
                                return "Please enter email or username";
                              }
                              return null;
                            },
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
                            obscureText: isHidden,
                            controller: passwordController,
                            validator: (value) {
                              if (value == "") {
                                return "Please enter password";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isHidden = !isHidden;
                                      });
                                    },
                                    icon: const Icon(Icons.remove_red_eye)),
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
                              child: state.isLoading
                                  ? const CircularProgressIndicator()
                                  : const Text(
                                      "Login",
                                      style: TextStyle(color: Colors.white),
                                    ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  ref
                                      .read(authControllerProvider.notifier)
                                      .loginUser(emailController.text,
                                          passwordController.text);
                                }
                              }),
                        ]),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                      onPressed: () {
                        GoRouter.of(context).goNamed("register");
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
