import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AppUser {
  final int id;
  final String username;
  final String email;
  final String address;
  final String? token;
  final String profilePic;
  final bool isAdmin;
  AppUser(
      {required this.id,
      required this.username,
      required this.email,
      required this.address,
      this.token,
      required this.profilePic,
      required this.isAdmin});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'email': email,
      'address': address,
      'token': token,
      'profilePic': profilePic,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['UserID'] as int,
      username: map['Username'] as String,
      email: map['Email'] as String,
      address: map['Address'] as String,
      token: map['token'] != null ? map['token'] as String : null,
      profilePic: map['ProfilePictureURL'] as String,
      isAdmin: map['isAdmin'] == 1,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source) as Map<String, dynamic>);

  AppUser copyWith({
    int? id,
    String? username,
    String? email,
    String? address,
    String? token,
    String? profilePic,
  }) {
    return AppUser(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      address: address ?? this.address,
      token: token ?? this.token,
      profilePic: profilePic ?? this.profilePic,
      isAdmin: isAdmin,
    );
  }
}
