import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String groupName;
  final List<String> members;
  final String projectInfo;
  final String course;
  final String year;
  final String email;
  final String phone;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.groupName,
    required this.members,
    required this.projectInfo,
    required this.course,
    required this.year,
    required this.email,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory constructor để tạo từ Firestore
  factory User.fromFirestore(Map<String, dynamic> data) {
    return User(
      id: data['id'] ?? '',
      groupName: data['groupName'] ?? '',
      members: List<String>.from(data['members'] ?? []),
      projectInfo: data['projectInfo'] ?? '',
      course: data['course'] ?? '',
      year: data['year'] ?? '',
      email: data['email'] ?? '',
      phone: data['phone'] ?? '',
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      updatedAt: (data['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  // Convert to Map để lưu vào Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'groupName': groupName,
      'members': members,
      'projectInfo': projectInfo,
      'course': course,
      'year': year,
      'email': email,
      'phone': phone,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  // Copy with method để update
  User copyWith({
    String? id,
    String? groupName,
    List<String>? members,
    String? projectInfo,
    String? course,
    String? year,
    String? email,
    String? phone,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      groupName: groupName ?? this.groupName,
      members: members ?? this.members,
      projectInfo: projectInfo ?? this.projectInfo,
      course: course ?? this.course,
      year: year ?? this.year,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
