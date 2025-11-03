class Location {
  final String id;
  final String name;
  final String province;
  final String description;
  final String image;
  final List<String> specialties;
  final bool isFavorite;
  final String? status; // 'wishlist', 'planned', 'visited'
  final String? notes;

  Location({
    required this.id,
    required this.name,
    required this.province,
    required this.description,
    required this.image,
    required this.specialties,
    this.isFavorite = false,
    this.status,
    this.notes,
  });

  Location copyWith({
    String? id,
    String? name,
    String? province,
    String? description,
    String? image,
    List<String>? specialties,
    bool? isFavorite,
    String? status,
    String? notes,
  }) {
    return Location(
      id: id ?? this.id,
      name: name ?? this.name,
      province: province ?? this.province,
      description: description ?? this.description,
      image: image ?? this.image,
      specialties: specialties ?? this.specialties,
      isFavorite: isFavorite ?? this.isFavorite,
      status: status ?? this.status,
      notes: notes ?? this.notes,
    );
  }
}
