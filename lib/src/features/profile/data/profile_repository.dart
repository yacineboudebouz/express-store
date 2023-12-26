import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../../core/providers/uri_provider.dart';

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepository();
});

class ProfileRepository {
  Future<void> updateProfile(
      int id, String username, String email, String address) async {
    http.Response res = await http.post(
        Uri.parse(
          '$uri/auth/updateuser/$id',
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(
            {"email": email, "username": username, "address": address}));

    if (res.statusCode == 200) {
      throw "Updated successfully";
    }
    if (res.statusCode == 400) {
      throw "Email or username in use";
    }
    throw "Ethernal server error ! can't get books ";
  }
}
