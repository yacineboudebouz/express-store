import 'dart:convert';

import 'package:express_shop/src/core/providers/local_storage_provider.dart';
import 'package:express_shop/src/core/providers/uri_provider.dart';
import 'package:express_shop/src/core/providers/user_provider.dart';
import 'package:express_shop/src/features/auth/Domain/user.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref: ref);
});

class AuthRepository {
  AuthRepository({required Ref ref}) : _ref = ref;
  final Ref _ref;
  Future registerUser(String email, String userName, String password) async {
    http.Response res = await http.post(Uri.parse("$uri/auth/register"),
        body: jsonEncode(
          {
            "username": userName,
            "password": password,
            "email": email,
          },
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        });
    if (res.statusCode == 400) {
      throw "Email already in use";
    }
    if (res.statusCode == 201) {
      throw "Account Created successfully";
    }
    if (res.statusCode == 500) {
      throw "Server problem";
    }
  }

  Future loginUser(String identity, String password) async {
    http.Response res = await http.post(Uri.parse("$uri/auth/login"),
        body: jsonEncode(
          {
            "identity": identity,
            "password": password,
          },
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        });
    if (res.statusCode == 200) {
      _ref
          .read(userStateProvider.notifier)
          .update((state) => AppUser.fromJson(res.body));
      _ref.read(localStorageProvider).storeToken(jsonDecode(res.body)["token"]);
      return;
    }
    if (res.statusCode == 401) {
      throw "Invalid email or password";
    }
    if (res.statusCode == 500) {
      throw "Server problem";
    }
  }

  Future getUserData() async {
    final token = _ref.read(localStorageProvider).getToken();

    if (token == null) {
      return;
    }
    http.Response res = await http.get(Uri.parse('$uri/auth/getuserdata'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token
        });

    if (res.statusCode == 200) {
      _ref
          .read(userStateProvider.notifier)
          .update((state) => AppUser.fromJson(res.body));
    }
    if (res.statusCode == 401) {
      return;
    }
  }

  Future logOut() async {
    await _ref.read(localStorageProvider).removeToken();
    _ref.read(userStateProvider.notifier).update((state) => null);
  }
}
