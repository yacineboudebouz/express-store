import 'package:express_shop/src/core/providers/user_provider.dart';
import 'package:express_shop/src/features/auth/Domain/user.dart';

import 'package:express_shop/src/features/profile/presentaion/profile_controller.dart';
import 'package:express_shop/src/theme/pallete.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final addressController = TextEditingController();
  late AppUser tempuser;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final user = ref.watch(userStateProvider);
      tempuser = user!;
      emailController.text = user.email;
      userNameController.text = user.username;
      addressController.text = user.address;
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(profileControllerProvider.select((state) => state),
        (_, state) {
      if (state.hasError) {
        showDialogSuccess(context, state.error.toString());
      }
    });
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.person_pin,
                size: 200,
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "username / email",
                        fillColor: Colors.grey.withOpacity(0.3),
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    controller: userNameController,
                    onChanged: (value) {
                      tempuser.copyWith(username: value);
                    },
                  )),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "username / email",
                        fillColor: Colors.grey.withOpacity(0.3),
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    controller: emailController,
                    onChanged: (value) {
                      tempuser.copyWith(email: value);
                    },
                  )),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "username / email",
                        fillColor: Colors.grey.withOpacity(0.3),
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    controller: addressController,
                    onChanged: (value) {
                      tempuser.copyWith(address: value);
                    },
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Pallete.blackTheme,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: const Size(150, 50)),
                    onPressed: () {
                      ref
                          .read(profileControllerProvider.notifier)
                          .updateProfile(
                              ref.watch(userStateProvider)!.id,
                              userNameController.text,
                              emailController.text,
                              addressController.text);
                    },
                    child: const Text(
                      "Save profile",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  OutlinedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        ref.read(profileControllerProvider.notifier).logOut();
                      },
                      child: const Text(
                        "Logout !",
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              )
            ],
          ),
        ));
  }
}
