import 'dart:io';

import 'package:uuid/uuid.dart';

class User {
  final String username;
  final String userEmail;
  final String userId;
  final DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.username,
    required this.userEmail,
    required userId,
    required this.createdAt,
    required this.updatedAt
  }) : userId = (const Uuid()).v4();

  factory User.fromJson(Map<String, dynamic> json) => User(
    username: json['username'],
    userEmail: json['userEmail'],
    userId: json['userId'],
    createdAt: DateTime.parse(json['createdAt']),
    updatedAt: DateTime.parse(json['updatedAt'])
  );

  set setLastUpdated (DateTime lastUpdated) {
    updatedAt = lastUpdated;
  }
}