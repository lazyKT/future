import 'package:uuid/uuid.dart';

class User {
  final String username;
  final String userEmail;
  final String userId;
  final DateTime createdAt;
  String avatar;
  DateTime updatedAt;
  bool isSocialAccount;
  final String? socialPlatform;

  User({
    required this.username,
    required this.userEmail,
    required this.avatar,
    this.socialPlatform
  }) : userId = (const Uuid()).v4(),
        createdAt = DateTime.now(),
        isSocialAccount = false,
        updatedAt = DateTime.now();

  // named constructor
  User.named({
    required this.userId,
    required this.username,
    required this.userEmail,
    required this.avatar,
    required this.createdAt,
    required this.updatedAt,
    required this.isSocialAccount,
    this.socialPlatform
  });

  factory User.fromJson(Map<String, dynamic> json) => User.named(
    username: json['username'],
    userEmail: json['userEmail'],
    userId: json['userId'],
    avatar: json['avatar'] | '',
    createdAt: DateTime.parse(json['createdAt']),
    updatedAt: DateTime.parse(json['updatedAt']),
    isSocialAccount: json['isSocialAccount'],
    socialPlatform: json['socialPlatform']
  );

  set setLastUpdated (DateTime lastUpdated) {
    updatedAt = lastUpdated;
  }
}