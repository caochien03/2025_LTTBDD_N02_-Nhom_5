class DiaryEntry {
  final String id;
  final String locationId;
  final String locationName;
  final String date;
  final List<String> images;
  final String notes;

  DiaryEntry({
    required this.id,
    required this.locationId,
    required this.locationName,
    required this.date,
    required this.images,
    required this.notes,
  });
}
