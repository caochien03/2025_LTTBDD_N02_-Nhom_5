import 'package:cloud_firestore/cloud_firestore.dart';

class Location {
  final String id;
  final String name; // "Vịnh Hạ Long"
  final String province; // "Quảng Ninh"
  final String description;
  final List<String> images;
  final List<String> specialties; // "Chả mực", "Cua biển"
  final List<String> attractions;
  final double rating;
  final String category;
  final GeoPoint coordinates;
  final DateTime createdAt;
  final DateTime updatedAt;

  Location({
    required this.id,
    required this.name,
    required this.province,
    required this.description,
    required this.images,
    required this.specialties,
    required this.attractions,
    required this.rating,
    required this.category,
    required this.coordinates,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory constructor từ Firestore
  factory Location.fromFirestore(Map<String, dynamic> data) {
    return Location(
      id: data['id'] ?? '',
      name: data['name'] ?? '',
      province: data['province'] ?? '',
      description: data['description'] ?? '',
      images: List<String>.from(data['images'] ?? []),
      specialties: List<String>.from(data['specialties'] ?? []),
      attractions: List<String>.from(data['attractions'] ?? []),
      rating: (data['rating'] ?? 0.0).toDouble(),
      category: data['category'] ?? '',
      coordinates: data['coordinates'] ?? const GeoPoint(0.0, 0.0),
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      updatedAt: (data['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  // Convert to Map cho Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'name': name,
      'province': province,
      'description': description,
      'images': images,
      'specialties': specialties,
      'attractions': attractions,
      'rating': rating,
      'category': category,
      'coordinates': coordinates,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  // Copy with method
  Location copyWith({
    String? id,
    String? name,
    String? province,
    String? description,
    List<String>? images,
    List<String>? specialties,
    List<String>? attractions,
    double? rating,
    String? category,
    GeoPoint? coordinates,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Location(
      id: id ?? this.id,
      name: name ?? this.name,
      province: province ?? this.province,
      description: description ?? this.description,
      images: images ?? this.images,
      specialties: specialties ?? this.specialties,
      attractions: attractions ?? this.attractions,
      rating: rating ?? this.rating,
      category: category ?? this.category,
      coordinates: coordinates ?? this.coordinates,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
