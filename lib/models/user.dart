

import 'package:random_users_app_with_api/models/user_dob.dart';
import 'package:random_users_app_with_api/models/user_image.dart';
import 'package:random_users_app_with_api/models/user_location.dart';
import 'package:random_users_app_with_api/models/user_name.dart';

class User {
  final String gender, email, phone, cell, nat;
  final UserName user;
  final UserDob dob;
  final UserLocation location;
  final UserPicture picture;

  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.user,
    required this.dob,
    required this.location,
    required this.picture,
  });

  factory User.fromMap(Map<String, dynamic> e) {
    final user = UserName.fromMap(e);
    final location = UserLocation.fromMap(e['location']);
    final dob = UserDob.fromMap(e['dob']);
    final picture = UserPicture.fromMap(e['picture']);

    return User(
      gender: e['gender'],
      email: e['email'],
      phone: e['phone'],
      cell: e['cell'],
      nat: e['nat'],
      user: user,
      dob: dob,
      location: location,
      picture: picture,
    );
  }

  String get fullName {
    return '${user.title} ${user.first} ${user.last}';
  }
}
