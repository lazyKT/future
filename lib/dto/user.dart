import 'package:uuid/uuid.dart';

class User {
  final String username;
  final String userEmail;
  final String userId;
  final DateTime createdAt;
  String avatar;
  DateTime updatedAt;

  User({
    required this.username,
    required this.userEmail,
    required this.avatar
  }) : userId = (const Uuid()).v4(),
        createdAt = DateTime.now(),
        updatedAt = DateTime.now();

  // named constructor
  User.named({
    required this.userId,
    required this.username,
    required this.userEmail,
    required this.avatar,
    required this.createdAt,
    required this.updatedAt
  });

  factory User.fromJson(Map<String, dynamic> json) => User.named(
    username: json['username'],
    userEmail: json['userEmail'],
    userId: json['userId'],
    avatar: json['avatar'] | '',
    createdAt: DateTime.parse(json['createdAt']),
    updatedAt: DateTime.parse(json['updatedAt'])
  );

  set setLastUpdated (DateTime lastUpdated) {
    updatedAt = lastUpdated;
  }
}