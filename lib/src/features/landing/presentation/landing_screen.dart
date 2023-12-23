import 'package:express_shop/src/core/common/custom_button.dart';
import 'package:express_shop/src/core/extentions.dart';
import 'package:express_shop/src/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LandingScreen extends ConsumerStatefulWidget {
  const LandingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LandingScreenState();
}

class _LandingScreenState extends ConsumerState<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: context.height * 0.6,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  child: SizedBox(
                    width: context.width,
                    height: context.height * 0.5,
                    child: Image.asset(
                      "assets/landing_bg.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    child: SizedBox(
                      height: context.height * 0.2,
                      width: context.height * 0.2,
                      child: Image.asset("assets/app_logo.png"),
                    ))
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Read more and stress less with our online book shopping app. Shop from anywhere you are and discover titles that you love. Happy reading!',
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
                child: const Text(
                  "Get Started",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  GoRouter.of(context).goNamed('login');
                }),
          ),
          TextButton(
              onPressed: () {
                GoRouter.of(context).goNamed("register");
              },
              child: const Text(
                "Register",
                style: TextStyle(color: Pallete.blackColor),
              ))
        ],
      ),
    );
  }
}
