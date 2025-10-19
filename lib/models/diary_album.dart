import 'package:cloud_firestore/cloud_firestore.dart';

class DiaryAlbum {
  final String id;
  final String userId;
  final String locationId;
  final String albumName;
  final DateTime createdDate;
  final List<String> entryIds; // Danh sách ID của DiaryEntry
  final String? coverImage;
  final DateTime createdAt;
  final DateTime updatedAt;

  DiaryAlbum({
    required this.id,
    required this.userId,
    required this.locationId,
    required this.albumName,
    required this.createdDate,
    required this.entryIds,
    this.coverImage,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory constructor từ Firestore
  factory DiaryAlbum.fromFirestore(Map<String, dynamic> data) {
    return DiaryAlbum(
      id: data['id'] ?? '',
      userId: data['userId'] ?? '',
      locationId: data['locationId'] ?? '',
      albumName: data['albumName'] ?? '',
      createdDate:
          (data['createdDate'] as Timestamp?)?.toDate() ?? DateTime.now(),
      entryIds: List<String>.from(data['entryIds'] ?? []),
      coverImage: data['coverImage'],
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
      'albumName': albumName,
      'createdDate': Timestamp.fromDate(createdDate),
      'entryIds': entryIds,
      'coverImage': coverImage,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  // Copy with method
  DiaryAlbum copyWith({
    String? id,
    String? userId,
    String? locationId,
    String? albumName,
    DateTime? createdDate,
    List<String>? entryIds,
    String? coverImage,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return DiaryAlbum(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      locationId: locationId ?? this.locationId,
      albumName: albumName ?? this.albumName,
      createdDate: createdDate ?? this.createdDate,
      entryIds: entryIds ?? this.entryIds,
      coverImage: coverImage ?? this.coverImage,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
