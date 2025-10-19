import 'package:cloud_firestore/cloud_firestore.dart';

class Favorite {
  final String id;
  final String userId;
  final String locationId;
  final DateTime addedDate;
  final String notes;
  final DateTime? plannedDate;
  final bool isVisited;
  final DateTime createdAt;
  final DateTime updatedAt;

  Favorite({
    required this.id,
    required this.userId,
    required this.locationId,
    required this.addedDate,
    required this.notes,
    this.plannedDate,
    required this.isVisited,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory constructor từ Firestore
  factory Favorite.fromFirestore(Map<String, dynamic> data) {
    return Favorite(
      id: data['id'] ?? '',
      userId: data['userId'] ?? '',
      locationId: data['locationId'] ?? '',
      addedDate: (data['addedDate'] as Timestamp?)?.toDate() ?? DateTime.now(),
      notes: data['notes'] ?? '',
      plannedDate: (data['plannedDate'] as Timestamp?)?.toDate(),
      isVisited: data['isVisited'] ?? false,
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      updatedAt: (data['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  // Convert to Map cho Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'userId': userId,
      'locationId': locationId,
      'addedDate': Timestamp.fromDate(addedDate),
      'notes': notes,
      'plannedDate':
          plannedDate != null ? Timestamp.fromDate(plannedDate!) : null,
      'isVisited': isVisited,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  // Copy with method
  Favorite copyWith({
    String? id,
    String? userId,
    String? locationId,
    DateTime? addedDate,
    String? notes,
    DateTime? plannedDate,
    bool? isVisited,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Favorite(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      locationId: locationId ?? this.locationId,
      addedDate: addedDate ?? this.addedDate,
      notes: notes ?? this.notes,
      plannedDate: plannedDate ?? this.plannedDate,
      isVisited: isVisited ?? this.isVisited,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
