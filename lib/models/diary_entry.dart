import 'package:cloud_firestore/cloud_firestore.dart';

class DiaryEntry {
  final String id;
  final String albumId;
  final String mediaType; // 'image' hoặc 'video'
  final String mediaUrl;
  final String caption;
  final DateTime takenDate;
  final GeoPoint? location;
  final DateTime createdAt;
  final DateTime updatedAt;

  DiaryEntry({
    required this.id,
    required this.albumId,
    required this.mediaType,
    required this.mediaUrl,
    required this.caption,
    required this.takenDate,
    this.location,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory constructor từ Firestore
  factory DiaryEntry.fromFirestore(Map<String, dynamic> data) {
    return DiaryEntry(
      id: data['id'] ?? '',
      albumId: data['albumId'] ?? '',
      mediaType: data['mediaType'] ?? '',
      mediaUrl: data['mediaUrl'] ?? '',
      caption: data['caption'] ?? '',
      takenDate: (data['takenDate'] as Timestamp?)?.toDate() ?? DateTime.now(),
      location: data['location'],
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      updatedAt: (data['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  // Convert to Map cho Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'albumId': albumId,
      'mediaType': mediaType,
      'mediaUrl': mediaUrl,
      'caption': caption,
      'takenDate': Timestamp.fromDate(takenDate),
      'location': location,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  // Copy with method
  DiaryEntry copyWith({
    String? id,
    String? albumId,
    String? mediaType,
    String? mediaUrl,
    String? caption,
    DateTime? takenDate,
    GeoPoint? location,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return DiaryEntry(
      id: id ?? this.id,
      albumId: albumId ?? this.albumId,
      mediaType: mediaType ?? this.mediaType,
      mediaUrl: mediaUrl ?? this.mediaUrl,
      caption: caption ?? this.caption,
      takenDate: takenDate ?? this.takenDate,
      location: location ?? this.location,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
